# NEVER_LOG_SECRETS

## Trigger
Any command output, log statement, or error message that may expose secrets.

## Action
Never display:
- API keys (even partially)
- Passwords
- Tokens
- Connection strings
- Private keys

## Patterns to Avoid
```
❌ echo $API_KEY
❌ Write-Host "Token: $token"
❌ console.log(credentials)
❌ print(f"Connecting with {password}")
```

## Safe Alternatives
```
✅ echo "API_KEY is set: $([bool]$API_KEY)"
✅ Write-Host "Token: [REDACTED]"
✅ console.log("Credentials loaded")
✅ print("Connecting with [credentials from env]")
```

## Skip Conditions
- Displaying that a secret EXISTS (not its value)
- Masked output (first 4 chars only)

## Category
security
