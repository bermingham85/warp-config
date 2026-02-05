# AUDIT TRAIL FOR AI ACTIONS

## Rule
Maintain traceability for AI-assisted changes. Know what was done, when, and why.

## What Gets Logged

### Commit Messages
Every commit includes:
- What changed (brief)
- Why it changed (context)
- `Co-Authored-By: Warp <agent@warp.dev>`

### Memory MCP Updates
At session end, log to Memory:
- Projects touched
- Key decisions made
- Incomplete items for next session
- Any errors encountered and how resolved

### Significant Actions
Document in commit or Memory when:
- Creating new repositories
- Deleting files or data
- Modifying credentials or config
- Installing dependencies
- Changing deployment settings

## Evidence Format for PRs
When creating PRs, include:
```
## Changes
- [list what changed]

## Verification
- [ ] Tests pass
- [ ] Linted
- [ ] Reviewed diff

## Risk Level
[LOW/MEDIUM/HIGH]

## Rollback Plan
[How to undo if needed]
```

## Why This Matters
- Enables debugging when things break
- Provides accountability
- Helps resume work across sessions
- Supports compliance requirements
