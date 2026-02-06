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

## Services

| Service | URL | Port |
|---------|-----|------|
| **n8n** | http://localhost:5678 | 5678 |
| **Memory Service** | http://localhost:8765 | 8765 |
| **QNAP NAS** | 192.168.50.246 (browser only) | - |

## Sub-Indexes (Load When Needed)

| Index | Path | Use When |
|-------|------|----------|
| Projects | `.warp/indexes/PROJECT_INDEX.md` | Finding a project |
| Services | `.warp/indexes/SERVICE_INDEX.md` | API/endpoint details |
| Documents | `.warp/indexes/DOCUMENT_INDEX.md` | Finding docs/configs |
| Workflows | `.warp/indexes/WORKFLOW_INDEX.md` | n8n workflow lookup |

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
