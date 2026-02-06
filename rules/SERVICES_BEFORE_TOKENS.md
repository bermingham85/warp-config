# SERVICES_BEFORE_TOKENS

## Trigger
Any task that could be handled by an external tool, API, MCP, or automation service.

## Action
**STOP** before generating AI output. Check if a service can do it instead:

### Routing Priority
1. **File Operations** → `filesystem_mcp` or shell commands (NOT AI describing files)
2. **Database Queries** → Direct PostgreSQL/SQL (NOT AI writing query results)
3. **Web Scraping** → `Playwright MCP` (NOT AI guessing content)
4. **Calculations** → Python/calculator (NOT AI computing)
5. **Git Operations** → `git` CLI or `GitHub MCP` (NOT AI simulating)
6. **Memory/Context** → `Memory MCP` (NOT AI remembering)
7. **n8n Workflows** → Trigger webhook (NOT AI replicating logic)
8. **Document Search** → `Notion MCP` or grep (NOT AI searching mentally)
9. **API Calls** → Direct HTTP via curl/webhook (NOT AI pretending to call)

### Decision Flow
```
Task Received
    ↓
Can a tool/service do this directly?
    ├─ YES → Route to service, return result
    └─ NO → Is AI reasoning actually needed?
            ├─ YES → Proceed with AI (log token use)
            └─ NO → Find or create the right service
```

## Anti-Patterns (Token Waste)
| Wasteful | Efficient |
|----------|-----------|
| AI reads file and summarizes | `read_files` tool returns content |
| AI "searches" codebase from memory | `grep` or `codebase_semantic_search` |
| AI calculates dates/numbers | Python one-liner |
| AI formats JSON | `jq` command |
| AI checks git status | `git status` command |

## Skip Conditions
- Task genuinely requires reasoning/analysis/creativity
- No service exists and creating one costs more than token use
- User explicitly requests AI processing

## Category
efficiency, token_management
