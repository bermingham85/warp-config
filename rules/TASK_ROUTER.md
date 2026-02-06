# TASK_ROUTER

**Priority:** Execute before any task

## Quick Classification (< 50 tokens)

Before proceeding with any task, classify:

### → ROUTE TO CLAUDE (Design/Review)
- Architecture decisions, system design
- Planning multi-step unknown scope
- Trade-off analysis, pros/cons evaluation
- Root cause analysis ("why is this happening")
- Code review, audit, compliance check
- Strategy, approach recommendations

**Keywords:** "how should", "best approach", "design", "plan", "review", "why is", "evaluate", "what's the best way"

### → STAY IN WARP (Execution)
- File operations (create, edit, read, delete)
- Shell commands, scripts
- Git operations (commit, push, pull)
- Known fixes with clear steps
- Single-step clear scope tasks
- Package installation, updates

**Keywords:** "create", "run", "fix this", "commit", "install", "update", "search", "read", "execute"

### → ROUTE TO SCRIPT (Zero Token)
- Index updates → `python index_updater.py`
- Scheduled tasks → Windows Task Scheduler
- Batch file operations → PowerShell script
- Data transformation → Python script

### → ROUTE TO n8n (Automation)
- Webhook triggers
- Scheduled workflows
- Multi-system integration
- API orchestration

## Action

| Classification | Action |
|----------------|--------|
| DESIGN | Say: "This is a design task. Routing to Claude recommended. Prepare handoff?" |
| EXECUTION | Proceed directly |
| SCRIPT | Run appropriate script, no LLM tokens |
| n8n | Trigger workflow or suggest creation |
| UNCLEAR | Ask: "Is this planning/design or execution?" |

## Handoff Format

When routing to Claude, provide:
```
TASK: [one sentence]
CONTEXT: [relevant files, current state]
CONSTRAINTS: [rules, limitations]
EXPECTED OUTPUT: [WARP.md with execution steps]
```
