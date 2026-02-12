---
name: risk-tiering
description: "Applies appropriate scrutiny based on risk level - fast path for docs, standard for features, careful path for auth/db/payments."
---

# Risk Tiering for Changes

## Rule
Not all changes deserve the same friction. Apply appropriate scrutiny based on risk level.

## Risk Tiers

### LOW RISK - Fast Path
- Documentation updates
- README changes
- Test-only changes
- Non-production config
- Comments and formatting

Process: Commit and push immediately. No extended review needed.

### MEDIUM RISK - Standard Path
- Typical feature code
- Bug fixes
- Refactoring existing code
- Adding dependencies

Process: Run tests, lint, commit with good message, push.

### HIGH RISK - Careful Path
- Authentication/authorization code
- Database migrations
- Payment/financial logic
- API keys or credentials handling
- Deployment configurations
- Deleting files or data

Process: Verify twice, create backup/rollback plan, test in isolation, document changes, user confirmation before destructive actions.
