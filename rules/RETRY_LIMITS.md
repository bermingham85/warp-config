# RETRY LIMITS

## Trigger
A command or action fails.

## Limits
- Same approach: max 3 attempts
- Different approaches: max 5 total attempts
- After limits exceeded: STOP and report to user

## On Failure
1. Log what failed
2. Try different approach (not same command again)
3. If still failing, ask user for guidance

## Never Do
- Infinite retry loops
- Same command 10 times hoping it works
- Silent failures
