# NEVER_COMMIT_SECRETS

## Trigger
Any git commit, push, or file creation that may contain sensitive data.

## Action
Before committing, verify NO secrets are included:
- API keys
- Passwords
- Tokens
- Private keys
- Connection strings with credentials

## Verification
```powershell
# Check staged files for common secret patterns
git diff --cached | Select-String -Pattern "(api[_-]?key|password|secret|token|sk-|pk_)" -CaseSensitive:$false
```

## If Secrets Found
1. Remove from staged files
2. Add to `.gitignore`
3. Use environment variables instead
4. Reference `.env.shared` or secrets manager

## Skip Conditions
- File is `.env.example` with placeholder values
- Documentation showing format (not real values)

## Category
security
