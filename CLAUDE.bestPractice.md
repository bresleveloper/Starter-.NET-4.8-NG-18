# CLAUDE.md

## Working Style Preferences

From the project owner's instructions:

1. **Work slow and minimalist** — strive for 1-line code changes where possible
2. **Understand exactly** what is wanted, keep it minimal
3. **Ask clarification questions** about tasks if needed
4. **Do not overthink or overcomplicate**
5. **Write a plan** to a `tasks/` folder before coding, and audit it before implementing
6. **Strive for Red/Green TDD**
7. After any correction from the user, update `tasks/lessons.md` with the pattern
8. Enter plan mode for any non-trivial task (3+ steps or architectural decisions)
9. Use subagents to keep main context clean; one task per subagent

### When Modifying Existing Code

- Match existing interfaces — new data source, same output shape = zero downstream changes
- Preserve side effects — identify what else depends on the code being replaced
- Isolate new logic — helper methods keep the main flow readable


## general notes
- seems that AI prefer to use python , so unless stated otherwise, use python for any backend and API
- for frontend always strive for HTML5/CSS5/JS using lastest ESS


## Workflow Orchestration

### 1. Plan Node Default
- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions)
- If something goes sideways, STOP and re-plan immediately - don't keep pushing
- Use plan mode for verification steps, not just building
- Write detailed specs upfront to reduce ambiguity

### 2. Subagent Strategy
- Use subagents liberally to keep main context window clean
- Offload research, exploration, and parallel analysis to subagents
- For complex problems, throw more compute at it via subagents
- One task per subagent for focused execution

### 3. Self-Improvement Loop
- After ANY correction from the user: update `tasks/lessons.md` with the pattern
- Write rules for yourself that prevent the same mistake
- Ruthlessly iterate on these lessons until mistake rate drops
- Review lessons at session start for relevant project

### 4. Verification Before Done
- Never mark a task complete without proving it works
- Diff behavior between main and your changes when relevant
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, demonstrate correctness

### 5. Demand Elegance (Balanced)
- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution"
- Skip this for simple, obvious fixes - don't over-engineer
- Challenge your own work before presenting it

### 6. Autonomous Bug Fixing
- When given a bug report: just fix it. Don't ask for hand-holding
- Point at logs, errors, failing tests - then resolve them
- Zero context switching required from the user
- Go fix failing CI tests without being told how

## Task Management

1. **Plan First**: Write plan to `tasks/todo.md` with checkable items
2. **Verify Plan**: Check in before starting implementation
3. **Track Progress**: Mark items complete as you go
4. **Explain Changes**: High-level summary at each step
5. **Document Results**: Add review section to `tasks/todo.md`
6. **Capture Lessons**: Update `tasks/lessons.md` after corrections

## Core Principles

- **Simplicity First**: Make every change as simple as possible. Impact minimal code.
- **No Laziness**: Find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: Changes should only touch what's necessary. Avoid introducing bugs.


