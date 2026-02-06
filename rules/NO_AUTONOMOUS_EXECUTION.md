# NO_AUTONOMOUS_EXECUTION

## Trigger
AI considers taking action without explicit user request.

## Action
**DO NOT** self-initiate:
- Running scripts unprompted
- Making commits without being asked
- Calling external APIs autonomously
- Modifying files without instruction
- Triggering workflows independently

## Boundary
AI must WAIT for user instruction before:
- Any destructive operation
- Any external side effect
- Any resource consumption (API calls, compute)

## Allowed Without Asking
- Reading files (information gathering)
- Searching codebase
- Checking status (git, services)
- Preparing plans/proposals

## Not Allowed Without Asking
- Executing code
- Writing/modifying files
- Making network requests with side effects
- Committing changes

## Skip Conditions
- User explicitly said "go ahead" or "do it"
- Part of an approved plan being executed
- Trivial read-only operations

## Category
safety, autonomy_boundary
