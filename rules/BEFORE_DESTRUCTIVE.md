# BEFORE DESTRUCTIVE ACTIONS

## Trigger
About to delete files, drop tables, force push, or overwrite data.

## Required Steps
1. State what will be affected
2. Create backup or note rollback command
3. Get user confirmation for HIGH risk actions

## Rollback Commands
```powershell
# Git - undo commit
git reset --soft HEAD~1

# Git - restore file
git checkout HEAD -- <file>

# File - restore from backup
Copy-Item backup\file.txt original\file.txt
```

## Skip Confirmation When
- LOW risk per RISK_TIERING rule
- User already said "just do it"
