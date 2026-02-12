---
name: credential-handling
description: "Never expose secrets in output. Use environment variables, reference .env files without reading contents aloud, recommend rotation if exposed."
---

# Credential Handling

## Trigger
Any command or file involving API keys, passwords, tokens, or secrets.

## Never Do
- Echo/print secret values
- Put secrets in commit messages
- Hardcode secrets in files
- Display secrets in output to user

## Always Do
- Use environment variables
- Reference .env files, never read their contents aloud
- Use secret managers when available

## When User Provides a Secret
If user pastes a key or token:
1. Do NOT repeat it back
2. Say: I see you've provided a key. I'll use it without displaying it.
3. Store in variable, use in command, never echo

## If Secret Accidentally Exposed
1. Tell user immediately
2. Recommend rotating the credential
3. Check git history - may need git filter-branch or BFG
