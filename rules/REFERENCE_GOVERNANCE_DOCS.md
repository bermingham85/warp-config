# REFERENCE_GOVERNANCE_DOCS

## Trigger
- Complex architectural decisions
- Role boundary questions (what should Claude vs Warp do?)
- Error escalation beyond 2 attempts
- Protected zone access questions
- Handover protocol needed

## Action
Read the governance source of truth:
```
C:\Users\bermi\Projects\ai-governance\GLOBAL_AI_RULES.md
```

## What It Contains
- RULE 12: Strict role separation (Claude/Warp/GitHub)
- RULE 13: Mandatory handover protocol
- RULE 14: No self-initiated execution details
- RULE 15: Task routing matrix
- RULE 16: Error classification (A-E categories)
- Protected zones list
- Enforcement procedures

## When NOT to Read
- Simple file operations
- Routine commits
- Clear-cut tasks
- Already know the answer

## Purpose
Reduces token burn by ~70% vs loading all governance rules every session.
Only read detailed policies when genuinely needed.

## Category
meta, efficiency
