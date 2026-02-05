# RISK TIERING FOR CHANGES

## Rule
Not all changes deserve the same friction. Apply appropriate scrutiny based on risk level.

## Risk Tiers

### LOW RISK → Fast Path
- Documentation updates
- README changes
- Test-only changes
- Non-production config
- Comments and formatting

**Process:** Commit and push immediately. No extended review needed.

### MEDIUM RISK → Standard Path
- Typical feature code
- Bug fixes
- Refactoring existing code
- Adding dependencies

**Process:** Run tests, lint, commit with good message, push.

### HIGH RISK → Careful Path
- Authentication/authorization code
- Database migrations
- Payment/financial logic
- API keys or credentials handling
- Deployment configurations
- Deleting files or data

**Process:** 
1. Verify twice before executing
2. Create backup/rollback plan
3. Test in isolation first
4. Document what changed and why
5. User confirmation before destructive actions

## Anti-Pattern (FORBIDDEN)
- Treating all changes as high-risk (slows everything down)
- Treating high-risk changes as low-risk (causes incidents)
- Blindly approving destructive commands
