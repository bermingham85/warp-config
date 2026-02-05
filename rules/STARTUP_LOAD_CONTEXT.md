# STARTUP LOAD CONTEXT

## Trigger
Beginning of any new conversation/session.

## Action
Read these files (lightweight, not full scan):
```
C:\Users\bermi\.warp\STATUS_SNAPSHOT.md
```

## What This Provides
- Quick stats (rules, skills, projects count)
- Priority queue (what to work on next)
- Recently completed work
- Key file locations

## What This Does NOT Do
- Full repo scan
- Re-run backtrack
- Search all conversations

## After Loading
Check if user's first message relates to:
- A priority queue item → address it
- Something new → proceed normally, queue management applies

## File Locations Reference
- Tracker: `MASTER_TASK_TRACKER.md` - Full project list
- Tools: `TOOL_INVENTORY.md` - Available tools
- Snapshot: `STATUS_SNAPSHOT.md` - This lightweight summary
