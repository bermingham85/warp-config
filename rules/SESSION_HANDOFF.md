# SESSION HANDOFF

## Trigger
User says "done", "thanks", "bye", conversation goes idle, or task is complete.

## Handoff Sequence
1. **Commit pending work**
   ```powershell
   # For each modified repo
   git add . && git commit -m "Session work" && git push
   ```

2. **Update Memory MCP**
   ```
   call Memory.add_observations({
     entity: "Session_Log",
     observations: [
       "Date: {today}",
       "Projects touched: {list}",
       "Completed: {what got done}",
       "Incomplete: {what's left}",
       "Next action: {specific next step}"
     ]
   })
   ```

3. **Report to user** (brief)
   - What was done
   - What's pending (if any)
   - Where files are saved

## Handoff to Claude Desktop
When user will continue in Claude, include:
```markdown
## Handoff Context
- Project: {name}
- Repo: {github url}
- Last commit: {hash}
- Next task: {specific action}
- Key files: {paths}
```

## Skip Handoff When
- Quick Q&A with no file changes
- User explicitly says "no need to save"
