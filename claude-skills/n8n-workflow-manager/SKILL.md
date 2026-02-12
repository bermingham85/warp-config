---
name: n8n-workflow-manager
description: Manages n8n workflow upload and configuration via API. Trigger when uploading workflows to n8n, workflow import fails with 400 errors, or managing webhooks. Includes critical payload format fixes.
---

# n8n Workflow Manager

## Instructions

### n8n Instance
- URL: http://localhost:5678
- Container: n8n-local
- API key labels: warp, claude, MCP Server API Key

### API Key Retrieval
```powershell
docker cp n8n-local:/home/node/.n8n/database.sqlite "$env:TEMP\n8n_db.sqlite"
sqlite3 "$env:TEMP\n8n_db.sqlite" "SELECT apiKey FROM user_api_keys WHERE label='warp';"
```

### Upload Workflow (CRITICAL FORMAT)
```powershell
$clean = @{
    name = $wf.name
    nodes = $wf.nodes
    connections = $wf.connections
    settings = if ($wf.settings) { $wf.settings } else { @{ executionOrder = "v1" } }
} | ConvertTo-Json -Depth 100 -Compress
```

MUST include `settings` with `executionOrder: "v1"` or 400 error occurs.

### Common 400 Error Fixes
- Missing settings object → Add `settings: { executionOrder: "v1" }`
- Insufficient JSON depth → Use `-Depth 100`
- Wrong method → Most webhooks need POST not GET

### Webhook Registration Bug
After container restart, webhooks don't auto-register:
1. Use `/webhook-test/{path}` (click Execute in UI first)
2. Toggle workflow off/on in UI
3. Or use Playwright MCP to automate UI toggle

### Active Webhooks
- `/webhook/claude-to-warp` - Main bridge
- `/webhook/transaction/categorize` - Financial
- `/webhook/receipt/process` - Receipt OCR
- `/webhook/jesse-novel-trigger` - Novel generation
- `/webhook/liveportrait` - FAL animation
- `/webhook/musetalk` - Video lip sync

## DO NOT
- Upload without settings.executionOrder
- Use insufficient JSON depth
- Forget to activate workflow after upload

## DO
- Always include settings object
- Use -Depth 100 for serialization
- Verify webhook registration after upload
