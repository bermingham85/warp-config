# STARTUP LOAD CONTEXT

## Trigger
Beginning of any new conversation/session.

## Action
### 1. Read Master Resource Map
```
C:\Users\bermi\.warp\MASTER_RESOURCE_MAP.md
```
This tells you WHERE everything is. No searching needed.

### 2. Read Rule Proxy (NOT all rules)
```
C:\Users\bermi\.warp\rules\00_RULE_PROXY.md
```
This tells you HOW to load rules on-demand.

### 3. Read Status (lightweight)
```
C:\Users\bermi\.warp\STATUS_SNAPSHOT.md
```

### 3. Verify Services Running
```powershell
# Memory Service (port 8765)
Test-NetConnection -ComputerName localhost -Port 8765 -WarningAction SilentlyContinue
# If not running: Start-Process python -ArgumentList "-m","uvicorn","app.main:app","--port","8765" -WorkingDirectory "C:\Users\bermi\Projects\ai-governance\memory-service" -WindowStyle Hidden

# n8n (port 5678)
Invoke-RestMethod -Uri "http://localhost:5678/healthz" -TimeoutSec 5
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
