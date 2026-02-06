# SECRETS_POLICY

**Merged from:** NEVER_COMMIT_SECRETS.md, NEVER_LOG_SECRETS.md

## Core Rules

### 1. Never Commit Secrets
- No API keys, tokens, passwords in version control
- No credentials in code, configs, or documentation
- Use environment variables or secret managers
- Check `.env` files are in `.gitignore`

### 2. Never Log Secrets
- No secrets in console output, logs, or debug messages
- No secrets in error messages or stack traces
- Mask sensitive values when displaying (e.g., `sk-...xxxx`)
- Never echo secrets to verify they're set

## Safe Patterns

```powershell
# GOOD: Store secret in variable, use variable
$API_KEY = (Get-Secret -Name "MyApiKey")
api-call --key $API_KEY

# BAD: Inline secret
api-call --key "sk-abc123..."

# BAD: Echo to verify
echo $API_KEY
```

## Detection Triggers

If you see these patterns, STOP:
- Hardcoded strings starting with `sk-`, `api_`, `token_`
- `.env` files being committed
- `echo`, `Write-Host`, `print` with secret variables
- Credentials in commit messages

## Action on Violation

1. STOP the operation
2. Remove secret from history if committed (`git filter-branch` or BFG)
3. Rotate the compromised credential immediately
4. Document incident in ERROR_LOG.md
