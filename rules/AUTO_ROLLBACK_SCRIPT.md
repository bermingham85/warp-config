# AUTO_ROLLBACK_SCRIPT

## Trigger
Any change to:
- Database schema or data
- Configuration files
- Infrastructure settings
- n8n workflow modifications

## Action
Before applying change, generate rollback command/script.

## Rollback Templates

### Database Schema
```sql
-- Change
ALTER TABLE users ADD COLUMN new_field VARCHAR(255);

-- Rollback
ALTER TABLE users DROP COLUMN new_field;
```

### Configuration
```powershell
# Before change, capture current state
$backup = Get-Content config.json
# Store in: _rollback/config_YYYYMMDD_HHMMSS.json
```

### Git Changes
```bash
# Rollback commit
git revert <commit-hash>

# Rollback to previous state
git reset --hard HEAD~1
```

### n8n Workflow
```
1. Export current workflow JSON before modification
2. Store in: _rollback/workflow_<id>_YYYYMMDD.json
3. Rollback: Import saved JSON via n8n API
```

## Storage
Save rollback scripts to: `C:\Users\bermi\Projects\_rollback\`

## Skip Conditions
- Read-only operations
- New file creation (rollback = delete)
- User explicitly waives rollback

## Category
safety, disaster_recovery
