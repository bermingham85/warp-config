# CREDENTIAL HANDLING

## Trigger
Any command or file involving API keys, passwords, tokens, or secrets.

## Rules

### Never Do
- Echo/print secret values
- Put secrets in commit messages
- Hardcode secrets in files
- Display secrets in output to user

### Always Do
- Use environment variables: `$env:API_KEY` or `$API_KEY`
- Reference `.env` files, never read their contents aloud
- Use secret managers when available

## Safe Patterns
```powershell
# GOOD - Reference without exposing
$headers = @{ "Authorization" = "Bearer $env:GITHUB_PAT" }

# GOOD - Load from file, don't display
$envContent = Get-Content .env.shared | Where-Object { $_ -match "^[^#]" }

# BAD - Never do this
echo $env:API_KEY
Write-Host "Your key is: $secret"
```

## When User Provides a Secret
If user pastes `sk-abc123...` or similar:
1. Do NOT repeat it back
2. Say "I see you've provided a key. I'll use it without displaying it."
3. Store in variable, use in command, never echo

## Credential Locations
- Primary: `C:\Users\bermi\Projects\.env.shared`
- Check but don't read: `.env`, `.env.local`, `secrets.json`

## If Secret Accidentally Exposed
1. Tell user immediately
2. Recommend rotating the credential
3. Check git history - may need `git filter-branch` or BFG
