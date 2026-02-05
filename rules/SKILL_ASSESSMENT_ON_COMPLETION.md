# SKILL EXTRACTION

## Trigger
After completing any task that took more than 3 tool calls.

## Quick Decision
```
Will this exact task happen again?
├─ NO → Done, no skill needed
└─ YES → Could inputs change while steps stay same?
    ├─ NO → Create a saved command/snippet, not a skill
    └─ YES → CREATE A SKILL
```

## Skill Creation Steps
1. **Name it**: `{verb}-{noun}.md` (e.g., `sync-repo.md`, `create-rule.md`)
2. **Write it**:
   ```markdown
   # {Skill Name}
   ## When to Use
   {One sentence trigger condition}
   ## Parameters
   - param1: {description}
   ## Steps
   1. {concrete action}
   2. {concrete action}
   ## Output
   {What user gets when done}
   ```
3. **Save it**: `C:\Users\bermi\.warp\skills\{name}.md`
4. **Log it**: Add to Memory MCP with entity type "Skill"

## Skill Goes to n8n If
- Runs on schedule (not on-demand)
- Needs to run when Warp isn't open
- Involves webhook triggers from external systems

## Skip Skill Creation When
- Task was one-off troubleshooting
- Task was answering a question
- Steps were entirely user-specific (no generalization possible)
