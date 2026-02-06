# RULE LOADER

**Merged from:** 00_RULE_INDEX.md, 00_RULE_PROXY.md

## How to Load Rules

**DO NOT load all rules at startup.** Load on-demand:

1. Read this file first (tells you WHAT rules exist)
2. Identify which rules apply to current task
3. Load ONLY those specific rules

## Rule Categories

### Core (Always Active)
- `TASK_ROUTER.md` - Route tasks to best service
- `TASK_TIERS.md` - Quick/Standard/Complex process
- `STARTUP_LOAD_CONTEXT.md` - Session initialization

### Security
- `SECRETS_POLICY.md` - Never commit/log secrets
- `PROTECTED_ZONES.md` - Off-limits directories

### Process
- `AUTO_UPDATE_INDEXES.md` - Keep indexes current
- `GOVERNANCE_QUICK_REF.md` - Rules 12-16 summary

### Governance (Reference Only)
Full governance rules in: `ai-governance/GLOBAL_AI_RULES.md`

## Quick Lookup

| Task Type | Load These Rules |
|-----------|------------------|
| Any task | TASK_ROUTER, TASK_TIERS |
| File operations | SECRETS_POLICY, PROTECTED_ZONES |
| Multi-repo work | GOVERNANCE_QUICK_REF |
| New project | AUTO_UPDATE_INDEXES |
| Session start | STARTUP_LOAD_CONTEXT |

## Token Efficiency

Loading pattern:
- This file: ~200 tokens
- Per rule loaded: ~100-300 tokens
- Full rule set: ~3,000 tokens (AVOID)

**Target:** Stay under 500 tokens for rules per task.
