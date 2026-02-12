---
name: session-handoff
description: "Manages end-of-session cleanup - commits pending work, updates Memory MCP, generates session report, and creates Claude handoff if continuing."
---

# Session Handoff

## Trigger
User says "done", "thanks", "bye", or task is complete.

## Steps
1. Follow ARTIFACTS_MUST_BE_PUSHED (commit pending work)
2. Follow MEMORY_LOGGING (update Memory MCP)
3. Follow SESSION_END_REPORT (brief report to user)
4. If continuing in Claude → Follow CLAUDE_HANDOFF_FORMAT

## Skip When
- Quick Q&A with no file changes
- User explicitly says "no need to save"
