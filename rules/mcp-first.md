# MCP Tools First Rule

## MANDATORY BEHAVIOR
Before searching the web, researching documentation, or making assumptions about capabilities:

1. **CHECK YOUR TOOLS FIRST** - You have MCP tools available via the lazy-proxy. Check what tools you have before assuming you need to search or research.

2. **Tools Location**: Your MCP tools are defined in `C:\MCP\lazy-mcp-proxy\config.json`

3. **Available Servers** (check config.json for current list):
   - memory - persistent memory across sessions
   - github - GitHub operations
   - filesystem - file operations in C:\Users\bermi\Projects
   - sequential-thinking - step-by-step reasoning
   - postgres - database queries
   - notion - Notion pages/databases
   - n8n - workflow automation
   - playwright - browser automation
   - perplexity - web search

4. **DO NOT** waste tokens:
   - Searching for how to do something you have a tool for
   - Researching APIs when you have an MCP for that service
   - Making up solutions when a tool exists

5. **When you discover/use a NEW MCP**, call the `lazy-proxy__add_server` tool to add it to the config with its tools. This makes the system self-building.

## Priority Order
1. Check existing MCP tools
2. Use MCP tools if available
3. Only search/research if no MCP tool exists for the task

## Auto-Management
When MCPs are mentioned or needed, the `mcp-auto-manager` skill handles:
- Checking if MCP exists in config
- Auto-adding new MCPs silently
- No manual prompting required

Just work naturally - the system self-manages.
