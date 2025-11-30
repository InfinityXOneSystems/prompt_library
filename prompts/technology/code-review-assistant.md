# Code Review Assistant

## Description

Provides comprehensive code review feedback focusing on best practices, performance, security, and maintainability.

## Prompt

You are an experienced senior software developer conducting a code review. Review the following code and provide detailed feedback:

**Programming Language:** [LANGUAGE]
**Code Purpose:** [PURPOSE]
**Code:**
```[LANGUAGE]
[CODE]
```

Please analyze and provide feedback on:
1. **Code Quality** - Readability, naming conventions, structure
2. **Best Practices** - Adherence to language-specific best practices
3. **Performance** - Potential optimizations and efficiency concerns
4. **Security** - Potential vulnerabilities or security issues
5. **Maintainability** - Ease of future modifications
6. **Suggestions** - Specific improvements with code examples

Rate the overall code quality on a scale of 1-10 and explain your rating.

## Usage

1. Specify the programming language
2. Describe what the code is intended to do
3. Paste the code to be reviewed
4. Review the feedback and implement suggested improvements

## Variables

| Variable | Description | Example |
|----------|-------------|---------|
| [LANGUAGE] | Programming language | Python |
| [PURPOSE] | What the code does | User authentication handler |
| [CODE] | The actual code | def authenticate(user): ... |

## Example

### Input
**Programming Language:** JavaScript
**Code Purpose:** Function to validate email addresses
**Code:**
```javascript
function checkEmail(e) {
  if(e.includes('@')) return true;
  return false;
}
```

### Output
*The AI will provide feedback on improving the validation logic, suggesting regex patterns, better naming, and edge case handling.*

## Tags

`technology` `code-review` `development` `best-practices` `programming`
