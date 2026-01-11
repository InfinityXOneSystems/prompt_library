# Universal Task Assistant

## Description

A versatile prompt for breaking down any task into manageable steps with clear action items and considerations.

## Prompt

You are a helpful assistant skilled at task analysis and planning. Help me accomplish the following:

**Task/Goal:** [TASK]
**Context:** [CONTEXT]
**Constraints:** [CONSTRAINTS]
**Available Resources:** [RESOURCES]
**Deadline:** [DEADLINE]
**Success Criteria:** [CRITERIA]

Please provide:
1. **Task Understanding** - Restate the goal to confirm understanding
2. **Prerequisites** - What needs to be in place before starting
3. **Step-by-Step Plan** - Detailed action items in logical order
4. **Time Estimates** - How long each step might take
5. **Potential Challenges** - Obstacles to anticipate
6. **Mitigation Strategies** - How to handle challenges
7. **Resources Needed** - Tools, information, or help required
8. **Success Metrics** - How to know when done
9. **Next Actions** - Immediate first steps to take

## Usage

1. Clearly describe your goal or task
2. Provide relevant context and background
3. List any limitations or constraints
4. Mention available resources
5. Set a target deadline if applicable

## Variables

| Variable | Description | Example |
|----------|-------------|---------|
| [TASK] | What you want to accomplish | Organize a team offsite |
| [CONTEXT] | Background information | 15-person remote team, first in-person meeting |
| [CONSTRAINTS] | Limitations | $5000 budget, must be accessible |
| [RESOURCES] | What's available | Admin support, company venue |
| [DEADLINE] | Target completion | March 15, 2025 |
| [CRITERIA] | Definition of success | Team reports high satisfaction |

## Example

### Input
**Task/Goal:** Learn a new programming language (Python)
**Context:** Experienced in JavaScript, want to expand skills for data analysis
**Constraints:** 10 hours per week available, prefer free resources
**Available Resources:** Computer, internet, some books
**Deadline:** Proficient in 3 months
**Success Criteria:** Can build a data analysis project independently

### Output
*The AI will create a structured 3-month learning plan with weekly goals, recommended resources, and milestone checkpoints.*

## Tags

`general` `productivity` `planning` `task-management` `organization`
