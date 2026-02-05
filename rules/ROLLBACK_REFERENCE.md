# ROLLBACK REFERENCE

## Trigger
Need to undo an action.

## Git Rollbacks
```powershell
# Undo last commit, keep changes
git reset --soft HEAD~1

# Undo last commit, discard changes
git reset --hard HEAD~1

# Revert a pushed commit
git revert <commit-hash>

# Restore specific file
git checkout HEAD -- <file>
```

## n8n Rollbacks
```powershell
# Deactivate workflow
curl -X POST http://localhost:5678/api/v1/workflows/{id}/deactivate -H "X-N8N-API-KEY: $env:N8N_API_KEY"
```

## Database Rollbacks
```sql
-- Always wrap risky changes
BEGIN;
-- make changes
ROLLBACK;  -- or COMMIT if good
```

## File Rollbacks
```powershell
# Restore from backup
Copy-Item "backup\file.txt" "original\file.txt"
```
