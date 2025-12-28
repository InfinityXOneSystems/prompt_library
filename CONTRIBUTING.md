# Contributing to Prompt Library

Thank you for your interest in contributing to the Prompt Library! This document provides guidelines for adding new prompts.

## How to Contribute

### Adding a New Prompt

1. **Choose the appropriate category** - Select the category folder that best fits your prompt
2. **Create a new markdown file** - Name it descriptively using kebab-case (e.g., `email-response-generator.md`)
3. **Follow the template format** - Use the standard prompt template structure
4. **Submit a pull request** - Include a clear description of your prompt

### Prompt Template

Use this template for all new prompts:

```markdown
# [Prompt Title]

## Description

[Brief description of what the prompt does and when to use it]

## Prompt

[The actual prompt template]

Use [PLACEHOLDERS] for variable content that users should customize.

## Usage

[Step-by-step instructions on how to use this prompt effectively]

## Variables

| Variable | Description | Example |
|----------|-------------|---------|
| [VARIABLE_NAME] | What this variable represents | Example value |

## Example

### Input
[Example of filled-in prompt]

### Output
[Example of expected output]

## Tags

`tag1` `tag2` `tag3`
```

## Guidelines

### Best Practices

- **Be specific** - Clear, detailed prompts yield better results
- **Include examples** - Help users understand expected inputs and outputs
- **Use placeholders consistently** - Use `[PLACEHOLDER_NAME]` format
- **Add relevant tags** - Help others discover your prompt

### Quality Standards

- Prompts should be tested and verified to work effectively
- Include proper formatting and structure
- Avoid duplicate prompts - check existing prompts first
- Keep language professional and inclusive

### Naming Conventions

- Use lowercase kebab-case for file names: `my-prompt-name.md`
- Use descriptive, action-oriented names
- Avoid abbreviations unless commonly understood

## Categories

If your prompt doesn't fit existing categories, you may propose a new category by opening an issue first.

## Questions?

If you have questions about contributing, please open an issue for discussion.
