# ERROR RECOVERY AND ROLLBACK

## Rule
Design for failure. Every action should be reversible or have a recovery path.

## Before Destructive Actions
1. **Confirm scope** - What exactly will be affected?
2. **Create backup** - Copy/snapshot before deletion
3. **Document state** - Note current state before change
4. **Have rollback ready** - Know the undo command

## Rollback Commands Reference
```powershell
# Git - undo last commit (keep changes)
git reset --soft HEAD~1

# Git - undo last commit (discard changes)
git reset --hard HEAD~1

# Git - revert a pushed commit
git revert <commit-hash>

# File - restore from git
git checkout HEAD -- <file>

# n8n - deactivate workflow
curl -X POST http://localhost:5678/api/v1/workflows/{id}/deactivate

# Database - always wrap in transaction
BEGIN; [changes] ROLLBACK; -- or COMMIT;
```

## When Errors Occur
1. **Stop** - Don't compound the problem
2. **Assess** - What exactly failed?
3. **Log** - Record the error in Memory MCP
4. **Route** - Is this fixable here or needs escalation?
5. **Fix or Rollback** - Apply correction or revert

## Retry Limits
- Max 3 attempts for same approach
- After 3 failures, try different approach
- After 5 total failures, stop and report to user

## Anti-Pattern (FORBIDDEN)
- Deleting without backup
- Multiple retries without changing approach
- Hiding errors or silent failures
- "It worked on my machine" without verification
