---
name: startup-load-context
description: "Loads essential context at session start - master resource map, rule proxy, status snapshot, index health check, and service verification."
---

# Startup Load Context

## Trigger
Beginning of any new conversation/session.

## Action
### 1. Read Master Resource Map
```
C:\Users\bermi\.warp\MASTER_RESOURCE_MAP.md
```
This tells you WHERE everything is.

### 2. Read Rule Proxy (NOT all rules)
```
C:\Users\bermi\.warp\rules\00_RULE_PROXY.md
```
This tells you HOW to load rules on-demand.

### 3. Read Status (lightweight)
```
C:\Users\bermi\.warp\STATUS_SNAPSHOT.md
```

### 4. Check Index Health
Check if indexes are stale (>7 days) and warn if needed.

### 5. Verify Services Running
- Memory Service (port 8765)
- n8n (port 5678)

## What This Provides
- Quick stats (rules, skills, projects count)
- Priority queue (what to work on next)
- Key file locations
