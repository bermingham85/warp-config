# MASTER RESOURCE MAP

**Read this FIRST. No searching needed.**

## Quick Paths (Most Used)

| What | Path |
|------|------|
| **Warp Config** | `C:\Users\bermi\.warp\` |
| **Rules** | `C:\Users\bermi\.warp\rules\` |
| **Skills** | `C:\Users\bermi\.warp\skills\` |
| **Projects Root** | `C:\Users\bermi\Projects\` |
| **Governance** | `C:\Users\bermi\Projects\ai-governance\` |
| **Global Rules Doc** | `C:\Users\bermi\Projects\ai-governance\GLOBAL_AI_RULES.md` |
| **Prompt Library** | `C:\Users\bermi\Projects\MASTER_PROMPT_LIBRARY\` |
| **Scripts** | `C:\Users\bermi\Projects\_scripts\` |

## Services & Endpoints

| Service | URL | Port | Purpose |
|---------|-----|------|--------|
| **n8n** | http://localhost:5678 | 5678 | Workflow automation |
| **Memory Service** | http://localhost:8765 | 8765 | AI memory persistence |
| **QNAP NAS** | 192.168.50.246 | - | Network storage (browser only) |
| **PostgreSQL** | 192.168.50.246:5432 | 5432 | conversation_memory DB |

### MCP Servers
| Server | ID | Purpose |
|--------|----|---------|
| Memory | 4b59c321-1e58-47c0-982e-be0196f17e5d | Knowledge graph |
| GitHub | 68886dfc-0f54-4261-b225-597516f7d12d | Repo management |
| Playwright | 3b09906c-9b2f-4175-9330-f8ade799ceeb | Browser automation |
| Notion | 0339f9ad-e774-4cb5-9253-3459ec0da6c2 | Documentation |
| Sequential Thinking | 1e0ffe4e-01a0-4ff6-afc2-0ce5377c8a6b | Claude reasoning |
| Context7 | 8e606f75-250f-48a5-9e6f-25344f9bfef2 | Doc fetch |

### n8n Webhooks
| Webhook | Path | Purpose |
|---------|------|---------|
| AI Request | /webhook/ai-request | Route to Claude API |
| Claude Bridge | /webhook/claude_bridge | Claude integration |

## Key Documents

| Document | Path | Purpose |
|----------|------|---------|
| Global AI Rules | `ai-governance/GLOBAL_AI_RULES.md` | Rules 12-16, role separation |
| Handover Protocol | `ai-governance/HANDOVER_PROTOCOL.md` | Claude→Warp format |
| Automation Template | `ai-governance/prompts/WARP_AUTOMATION_BUILD.md` | Build handoffs |
| Memory Builder | `_scripts/warp_memory_builder.py` | Scan conversations |
| Index Updater | `_scripts/index_updater.py` | Auto-update indexes |
| Backtracker | `_scripts/backtrack_conversations.py` | Find incomplete tasks |

## Sub-Indexes (Load When Needed)

| Index | Path | Use When |
|-------|------|----------|
| Projects | `.warp/indexes/PROJECT_INDEX.md` | Finding a project |
| Rules | `.warp/rules/00_RULE_INDEX.md` | Finding a rule |

## GitHub

| Item | URL |
|------|-----|
| **User** | bermingham85 |
| **Warp Config Repo** | https://github.com/bermingham85/warp-config |
| **Governance Repo** | https://github.com/bermingham85/ai-governance |

## Key Files in .warp/

| File | Purpose |
|------|---------|
| `STATUS_SNAPSHOT.md` | Current status, priority queue |
| `MASTER_TASK_TRACKER.md` | All projects and their status |
| `TOOL_INVENTORY.md` | Available tools and MCPs |
| `rules/00_RULE_PROXY.md` | How to load rules efficiently |
| `rules/00_RULE_INDEX.md` | All rules listed |

## Memory Builder Output

| Item | Path |
|------|------|
| Scan results | `C:\Users\bermi\Projects\_memory_builder_output\` |
| Gap analysis | `_memory_builder_output\gap_analysis_report.md` |
| Conflict report | `_memory_builder_output\conflict_report.json` |

## DO NOT SEARCH FOR

These paths are fixed. Just use them directly:
- Projects → `C:\Users\bermi\Projects\{project-name}`
- Rules → `.warp\rules\{RULE_NAME}.md`
- Skills → `.warp\skills\{skill-name}.md`
