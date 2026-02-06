# GOVERNANCE QUICK REFERENCE

**One-page summary of GLOBAL_AI_RULES.md (Rules 12-16)**

Full document: `ai-governance/GLOBAL_AI_RULES.md`

## RULE 12: Role Separation

| Role | Does | Does NOT |
|------|------|----------|
| **Claude** | Design, review, audit, create WARP.md | Execute commands, modify files, git commits |
| **Warp** | Execute plans, run scripts, git commits | Redesign architecture, invent processes |
| **GitHub** | Store source of truth, version control | Nothing bypasses it |

## RULE 13: Handover Protocol

```
1. DESIGN (Claude) → Creates WARP.md
2. HANDOVER → "HANDOVER TO WARP" + steps
3. EXECUTE (Warp) → Follows steps exactly
```

## RULE 14: No Self-Initiated Execution

Design AI must NOT:
- Run commands
- Modify files
- Make commits
- "Just run this quickly"

## RULE 15: Task Routing

| Task Type | Route To |
|-----------|----------|
| Architecture, design, review | Claude |
| File ops, scripts, git | Warp |
| Governance updates | GitHub |

## RULE 16: Error Handling

1. DETECT → 2. CLASSIFY → 3. ROUTE → 4. RESOLVE

**Max 2 attempts per error.** Then escalate.

## Protected Zones (Never Access)

- `C:\Users\bermi\Pictures\`
- Personal files, Fillmore/Filmora projects
- Video rendering directories

## Co-Author Attribution

All commits: `Co-Authored-By: Warp <agent@warp.dev>`
