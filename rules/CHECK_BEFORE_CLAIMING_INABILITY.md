# CHECK BEFORE CLAIMING INABILITY

## Trigger
About to say "I cannot", "I don't have access to", or "there is no".

## STOP - Check These First
1. **Memory MCP** - `search_nodes` for the capability mentioned
2. **GitHub repos** - `gh repo list bermingham85 | grep {keyword}`
3. **Local Projects** - `Get-ChildItem C:\Users\bermi\Projects -Filter "*{keyword}*"`
4. **TOOL_INVENTORY.md** - Review available tools

## Decision Tree
```
Did any check return results?
├─ YES → Follow up on what was found
│        - Read the project/file
│        - Check if it needs to be started/configured
│        - Implement it
└─ NO → Only then claim limitation
         - But offer to BUILD the capability
```

## Example Failure (2026-02-05)
**Bad**: "I cannot access previous conversations"
**Should have done**:
1. Searched Memory MCP → Found warp-memory-mcp
2. Checked projects → Found ai-governance/memory-service
3. Started the service
4. Connected to conversation history

## Related Rules
- GITHUB_SOURCE_OF_TRUTH
- IMPLEMENTATION_REQUIRED
- SELF_LEARNING

---
**Created**: 2026-02-05 due to self-learning failure
**Co-Authored-By: Warp <agent@warp.dev>**
