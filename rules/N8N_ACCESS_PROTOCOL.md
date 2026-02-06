# n8n Access Protocol

**CRITICAL**: Never use these approaches for n8n:
- ❌ REST API (`/api/v1/...`, `/rest/...`) - Always returns unauthorized
- ❌ Playwright browser automation - Unnecessary overhead
- ❌ Direct database access - Not available
- ❌ curl/Invoke-RestMethod to API endpoints - WILL FAIL

**CORRECT approaches (in order of preference)**:
1. ✅ **n8n CLI tool**: `n8n health`, `n8n test`, `n8n trigger <webhook>`
2. ✅ **Webhooks** at `http://localhost:5678/webhook/...`
3. ✅ **MCP servers** if n8n-mcp is configured

## Available Webhooks (localhost:5678)
| Endpoint | Purpose |
|----------|---------|
| `/webhook/claude-to-warp` | Main bridge - routes all Claude requests |
| `/webhook/transaction/categorize` | Financial transaction categorization |
| `/webhook/receipt/process` | Receipt OCR and processing |
| `/webhook/jesse-novel-trigger` | Novel generation pipeline |
| `/webhook/liveportrait` | FAL LivePortrait animation |
| `/webhook/musetalk` | Video lip sync |
| `/webhook/fal-video-lipsync` | FAL video + audio sync |

## n8n CLI Tool (PREFERRED)
Installed at: `C:\Users\bermi\.warp\bin\n8n.ps1`

```powershell
# Check n8n health
n8n health

# Test all webhooks
n8n test

# Trigger a specific webhook
n8n trigger /webhook/transaction/categorize

# List available workflows
n8n list
```

**ALWAYS use `n8n test` before attempting webhook calls.**

## Checking Credentials
Credentials can't be listed via API. Instead:
1. Test a workflow that uses the credential
2. Check if relevant webhooks respond
3. Look at n8n workflow files in `bermech-n8n-workflows` repo

## Reference
- Full webhook spec: `.warp/skills/SKILLS_WEBHOOK_MAP.md`
- Skills README: `.warp/skills/README.md`

## n8n MCP Server
The preferred method is using `n8n-mcp` MCP server:
```bash
npx n8n-mcp
```

Config exists at: `C:\Users\bermi\Projects\ai-governance\n8n-mcp-config.json`

**If n8n MCP is NOT in the available MCP list**, it needs to be added to Warp's MCP configuration before it can be used.

---
Created: 2026-02-06
Reason: Repeated failed attempts using wrong access methods
