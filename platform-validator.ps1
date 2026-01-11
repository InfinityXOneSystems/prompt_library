# Define parameters for the script
param(
    [ValidateSet("validate","patch","heal","full")]
    [string]$Mode = "full"
)

# Enforce strict mode for better error checking
Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"

# Define base directories and file paths
$ROOT = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $ROOT

$STATE_DIR      = "$ROOT\.infinity"
$REPORT_DIR     = "$STATE_DIR\reports"
$QUARANTINE_DIR = "$STATE_DIR\quarantine"
$LOG_FILE       = "$STATE_DIR\validator.log"
$TIMESTAMP      = Get-Date -Format "yyyyMMdd-HHmmss"

# Create necessary directories if they don't exist
New-Item -ItemType Directory -Force $STATE_DIR      | Out-Null
New-Item -ItemType Directory -Force $REPORT_DIR     | Out-Null
New-Item -ItemType Directory -Force $QUARANTINE_DIR | Out-Null

# Initialize result object to store validation and cleanup outcomes
$RESULT = @{
    meta = @{
        platform  = "Infinity XOS"
        validator = "Infinity Platform Validator v1"
        mode      = $Mode
        timestamp = $TIMESTAMP
        root      = $ROOT
    }
    python_errors = @()
    patched       = @()
    healed        = @()
}

# Get all Python files recursively once for efficiency
$pythonFiles = Get-ChildItem -Recurse -Filter *.py

# Validate Python files by attempting to compile them
$pythonFiles | ForEach-Object {
    $out = cmd /c "python -m py_compile `"$($_.FullName)`"" 2>&1
    if ($LASTEXITCODE -ne 0) {
        $RESULT.python_errors += @{ file=$_.FullName; error=($out -join "`n") }
        if ($Mode -in @("heal","full")) {
            Move-Item $_.FullName "$QUARANTINE_DIR\$($_.Name)" -Force
            $RESULT.healed += "Quarantined: $($_.FullName)"
        }
    }
}

# Patch Python files with health endpoints if they use FastAPI
if ($Mode -in @("patch","full")) {
    $pythonFiles | ForEach-Object {
        $c = Get-Content $_.FullName -Raw
        if ($c -match "FastAPI" -and $c -notmatch "/health") {
@"
@app.get("/health")
def health(): return {"status":"ok"}
@app.get("/ready")
def ready(): return {"ready":True}
"@ | Add-Content $_.FullName
            $RESULT.patched += "Patched health endpoints: $($_.FullName)"
        }
    }
}

# Ensure necessary directories exist for services and GitHub workflows
if ($Mode -in @("heal","full")) {
    "services","services/agents","services/memory",".github",".github/workflows" |
      ForEach-Object {
        if (!(Test-Path $_)) {
            New-Item -ItemType Directory -Force $_ | Out-Null
            $RESULT.healed += "Created dir: $_"
        }
      }
}

# Output the result to a JSON report file
$RESULT | ConvertTo-Json -Depth 12 |
  Out-File "$REPORT_DIR\report-$TIMESTAMP.json" -Encoding utf8
