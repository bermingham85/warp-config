# Upload n8n Workflows

## When to Use
When uploading workflows to n8n via API, or when n8n workflow import fails with 400 errors.

## Parameters
- workflow_path: Path to JSON workflow file(s)
- n8n_url: n8n instance URL (default: http://localhost:5678)

## Steps
1. Get API key from n8n database (not .env files - user uses Windows Credential Manager pattern)
2. Read workflow JSON file
3. Build clean payload with required settings object
4. POST to n8n API
5. Handle errors by checking JSON serialization depth

## API Key Retrieval
```powershell
# Copy database and query (sqlite3 not in container)
docker cp n8n-local:/home/node/.n8n/database.sqlite "$env:TEMP\n8n_db.sqlite"
sqlite3 "$env:TEMP\n8n_db.sqlite" "SELECT apiKey FROM user_api_keys WHERE label='warp';"
```

## Upload Command
```powershell
$apiKey = "YOUR_API_KEY"
$headers = @{ "X-N8N-API-KEY" = $apiKey; "Content-Type" = "application/json" }

$wf = Get-Content "path/to/workflow.json" -Raw | ConvertFrom-Json

# CRITICAL: Must include settings with executionOrder
$clean = @{
    name = $wf.name
    nodes = $wf.nodes
    connections = $wf.connections
    settings = if ($wf.settings) { $wf.settings } else { @{ executionOrder = "v1" } }
} | ConvertTo-Json -Depth 100 -Compress

Invoke-RestMethod -Uri "http://localhost:5678/api/v1/workflows" -Headers $headers -Method POST -Body $clean
```

## Common Issues
- **400 Bad Request**: Missing settings object or insufficient JSON depth
- **Fix**: Always include `settings = @{ executionOrder = "v1" }` and use `-Depth 100`

## Webhook Registration Bug
After container restart, webhooks don't auto-register. Solutions:
1. Use `/webhook-test/{path}` (requires clicking Execute in UI first)
2. Toggle workflow off/on in UI
3. Use Playwright MCP to automate UI toggle

## n8n Instance Details
- URL: http://localhost:5678
- Container: n8n-local
- Data volume: n8n_data
- API key labels: warp, claude, MCP Server API Key

## Output
Workflow imported with new ID, ready for credential configuration.
