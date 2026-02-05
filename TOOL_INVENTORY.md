# TOOL INVENTORY
**Last Updated**: 2026-02-05

## Warp Built-in Tools
| Tool | Purpose |
|------|---------|
| `read_files` | Read file contents |
| `create_file` | Create new files |
| `edit_files` | Edit existing files |
| `run_shell_command` | Execute PowerShell/shell |
| `grep` | Search file contents |
| `file_glob` | Find files by pattern |
| `codebase_semantic_search` | Semantic code search |
| `web_search` | Internet search |
| `create_plan` | Create implementation plans |
| `create_todo_list` | Track task progress |

## MCP Servers (via Warp)
| Server | Purpose | Key Tools |
|--------|---------|-----------|
| Memory | Persistent memory | create_entities, add_observations, search_nodes |
| GitHub | Repo management | search_repositories, create_repository, list_commits |
| Playwright | Browser automation | navigate, click, screenshot |
| Notion | Docs/databases | search, create_page, query_database |
| Sequential Thinking | Reasoning | think_step_by_step |
| Context7 | Documentation | fetch_docs |

## CLI Tools Available
| Tool | Purpose |
|------|---------|
| `git` | Version control |
| `gh` | GitHub CLI |
| `python` | Python scripts |
| `node/npm` | Node.js |
| `curl` | HTTP requests |
| `docker` | Containers (limited) |

## Custom Skills
| Skill | Location | Purpose |
|-------|----------|---------|
| sync-all-repos | `.warp/skills/sync-all-repos.md` | Sync all local repos with GitHub |

## APIs Available (via .env.shared)
- GitHub PAT
- n8n API Key
- (Check .env.shared for others - don't display values)

## Adding New Tools
When a new tool/MCP is discovered:
1. Add entry to this file
2. Commit to warp-config repo
3. Update Memory MCP with tool entity

---
*This file is the source of truth for available tools*
