---
name: task-router
description: "Classifies tasks and routes them to the correct platform - Claude for design/review, Warp for execution, n8n for automation, or scripts for zero-token operations."
---

# Task Router

## Quick Classification (< 50 tokens)
Before proceeding with any task, classify:

### → ROUTE TO CLAUDE (Design/Review)
- Architecture decisions, system design
- Planning multi-step unknown scope
- Trade-off analysis, pros/cons evaluation
- Root cause analysis
- Code review, audit, compliance check
- Strategy recommendations

**Keywords:** "how should", "best approach", "design", "plan", "review", "why is", "evaluate"

### → STAY IN WARP (Execution)
- File operations (create, edit, read, delete)
- Shell commands, scripts
- Git operations (commit, push, pull)
- Known fixes with clear steps
- Single-step clear scope tasks

**Keywords:** "create", "run", "fix this", "commit", "install", "update", "search", "execute"

### → ROUTE TO SCRIPT (Zero Token)
- Index updates → python scripts
- Scheduled tasks → Windows Task Scheduler
- Batch file operations → PowerShell script

### → ROUTE TO n8n (Automation)
- Webhook triggers
- Scheduled workflows
- Multi-system integration
