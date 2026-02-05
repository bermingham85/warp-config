# MANDATORY IMPLEMENTATION RULE

## Core Principle
**Ideas without implementation are worthless. Every blueprint MUST result in working code.**

## Rules

### 1. No Idea-Only Responses
- When user discusses a project concept, IMMEDIATELY begin implementation
- Do NOT create planning documents unless explicitly requested
- Do NOT suggest "we could do X" - instead DO X

### 2. Blueprint = Immediate Action
- Any blueprint or plan created MUST be executed in the same session
- If a plan exists, execute it - do not discuss it further
- Mark each step complete as you go

### 3. Memory Persistence
- At end of EVERY session involving project work:
  - Save project state to Memory MCP
  - Save incomplete tasks to Memory MCP
  - Save decisions made to Memory MCP
- At START of sessions, check Memory MCP for pending work

### 4. Document Control
- All created artifacts go to: `C:\Users\bermi\Projects\_artifacts\{project-name}\`
- All prompts go to: `C:\Users\bermi\Projects\MASTER_PROMPT_LIBRARY\`
- All blueprints go to: `C:\Users\bermi\Projects\BLUEPRINTS\`
- Never scatter files randomly on C: drive

### 5. Completion Tracking
- Before ending any session, verify:
  - [ ] Code compiles/runs
  - [ ] Tests pass (if applicable)
  - [ ] Changes committed (if user requested)
  - [ ] Memory updated with session summary
  - [ ] Incomplete items logged for next session

### 6. Anti-Patterns (FORBIDDEN)
- "Here's how you could..." → Just do it
- "One approach would be..." → Implement the best approach
- Creating docs about what to build → Build it
- Suggesting without acting → Act

## Enforcement
If you catch yourself planning without implementing, STOP and execute immediately.
