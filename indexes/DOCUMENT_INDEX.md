# DOCUMENT INDEX

## Governance Documents

| Document | Path | Purpose |
|----------|------|---------|
| Global AI Rules | `ai-governance\GLOBAL_AI_RULES.md` | Rules 12-16, role separation |
| Handover Protocol | `ai-governance\HANDOVER_PROTOCOL.md` | Claude→Warp handover format |
| Enforcement Status | `ai-governance\ENFORCEMENT_STATUS.md` | What's active |
| Error Log | `ai-governance\ERROR_LOG.md` | Error history |

## Warp Configuration

| Document | Path | Purpose |
|----------|------|---------|
| Rule Index | `.warp\rules\00_RULE_INDEX.md` | All rules listed |
| Rule Proxy | `.warp\rules\00_RULE_PROXY.md` | How to load rules |
| Status Snapshot | `.warp\STATUS_SNAPSHOT.md` | Current status |
| Task Tracker | `.warp\MASTER_TASK_TRACKER.md` | All projects status |
| Tool Inventory | `.warp\TOOL_INVENTORY.md` | Available tools |

## Scripts

| Script | Path | Purpose |
|--------|------|---------|
| Memory Builder | `_scripts\warp_memory_builder.py` | Build memory from history |
| Backtracker | `_scripts\backtrack_conversations.py` | Find incomplete tasks |
| Token Saver | `.warp\token_saver.py` | Token efficiency |

## Key Configs

| Config | Path | Purpose |
|--------|------|---------|
| Claude Desktop Config | `jesse-messy\raw_export\claude_desktop_config_complete.json` | MCP setup |
| Lazy MCP Proxy | `C:\MCP\lazy-mcp-proxy\config.json` | MCP proxy config |

## Output Locations

| Output | Path | Purpose |
|--------|------|---------|
| Memory Builder Results | `_memory_builder_output\` | Scan results |
| Generated Rules | `_memory_builder_output\generated_rules\` | Auto-generated rules |
| Gap Analysis | `_memory_builder_output\gap_analysis_report.md` | What's missing |
| Conflict Report | `_memory_builder_output\conflict_report.json` | Rule conflicts |

## Prompt Library

| Category | Path |
|----------|------|
| Root | `MASTER_PROMPT_LIBRARY\` |
| Assessment Prompts | `MASTER_PROMPT_LIBRARY\assessment\` |
| Automation Prompts | `MASTER_PROMPT_LIBRARY\automation\` |
