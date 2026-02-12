---
name: memory-logging
description: "At end of significant sessions, log to Memory MCP with date, what was done, pending items, and key files."
---

# Memory Logging

## Trigger
End of any session with significant work.

## What to Log
- Date
- What was done (brief)
- What's pending (if any)
- Key files (paths)

Use Memory MCP add_observations for existing entities or create_entities for new systems.

## Skip When
- Quick Q&A only
- No files changed
- User says no need to save
