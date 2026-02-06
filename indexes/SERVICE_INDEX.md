# SERVICE INDEX

## Local Services

| Service | URL | Health Check | Purpose |
|---------|-----|--------------|---------|
| n8n | http://localhost:5678 | /healthz | Workflow automation |
| Memory Service | http://localhost:8765 | /api/memory | AI memory persistence |

## n8n Webhooks

| Webhook | Path | Method | Purpose |
|---------|------|--------|---------|
| AI Request | /webhook/ai-request | POST | Route to Claude API |
| Claude Bridge | /webhook/claude_bridge | POST | Claude integration |

## MCP Servers (via Warp)

| Server | ID | Purpose |
|--------|----|---------| 
| Memory | 4b59c321-1e58-47c0-982e-be0196f17e5d | Knowledge graph persistence |
| GitHub | 68886dfc-0f54-4261-b225-597516f7d12d | Repo management |
| Playwright | 3b09906c-9b2f-4175-9330-f8ade799ceeb | Browser automation |
| Notion | 0339f9ad-e774-4cb5-9253-3459ec0da6c2 | Documentation |
| Sequential Thinking | 1e0ffe4e-01a0-4ff6-afc2-0ce5377c8a6b | Reasoning |
| Context7 | 8e606f75-250f-48a5-9e6f-25344f9bfef2 | Documentation fetch |

## Network Storage

| Resource | Address | Access |
|----------|---------|--------|
| QNAP NAS | 192.168.50.246 | Browser only |
| Mapped Drives | Local drive letters | Direct access |

## Database

| DB | Host | Port | Database | Purpose |
|----|------|------|----------|---------|
| PostgreSQL (QNAP) | 192.168.50.246 | 5432 | conversation_memory | Memory storage |

## Credentials Reference

Credentials stored in:
- `.env.shared` in project roots
- n8n credential store (http://localhost:5678/settings/credentials)

DO NOT store actual credentials in this index.
