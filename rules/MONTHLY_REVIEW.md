# MONTHLY REVIEW

## Trigger
First session of each month.

## Review Command
```powershell
gh repo list bermingham85 --limit 100 --json name,updatedAt | 
  ConvertFrom-Json | 
  Sort-Object updatedAt |
  Select-Object -First 20
```

## Flag For Review
- Not updated in 90+ days
- Similar names (potential duplicates)
- No README

## Action
Report findings to user. Don't auto-delete without approval.
