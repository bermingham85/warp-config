# SYNC LOCAL WITH GITHUB ON EVERY ACTION

## Rule
Local folders and GitHub repos must stay in sync. Check and sync whenever work is performed.

## Trigger - Sync Check Required When:
- Starting work on any project
- Before creating new files in a project folder
- After pushing changes
- When user mentions a project by name
- When switching between projects

## Sync Check Process
1. **Check local git status**:
   ```powershell
   git -C "<project_path>" status
   git -C "<project_path>" remote -v
   ```

2. **Check for unpushed commits**:
   ```powershell
   git -C "<project_path>" log origin/main..HEAD --oneline
   ```

3. **Check for remote changes**:
   ```powershell
   git -C "<project_path>" fetch
   git -C "<project_path>" log HEAD..origin/main --oneline
   ```

4. **If out of sync**:
   - Pull remote changes: `git pull`
   - Push local changes: `git push`
   - Resolve conflicts if any

## GitHub User Reference
```
GitHub user: bermingham85
```

## Anti-Pattern (FORBIDDEN)
- Working on stale local copies
- Assuming local is up to date without checking
- Multiple sessions creating divergent histories
- Not fetching before starting work

## NOT a Scheduled Task
This is NOT a cron job or timer. It triggers on ACTIONS:
- User asks about a project → sync check
- About to create files → sync check
- Finished making changes → push
