# COMPLETE TO PRODUCTION

## Priority: CRITICAL

## Trigger
EVERY task, project, or request that involves building something.

## Rule
**NO project is complete until it is:**
1. ✅ **BUILT** - Code written, not just planned
2. ✅ **TESTED** - Verified working, not assumed
3. ✅ **DEPLOYED** - Running in target environment
4. ✅ **AUTOMATED** - Triggers/schedules active
5. ✅ **DOCUMENTED** - Usage instructions exist
6. ✅ **INTEGRATED** - Connected to other systems

## Forbidden Outputs
- ❌ "Here's a plan for..."
- ❌ "You could implement..."
- ❌ "This blueprint shows..."
- ❌ "The architecture would be..."
- ❌ "Next steps would be..."

## Required Outputs
- ✅ Working code that runs
- ✅ Deployed and accessible endpoint/service
- ✅ Automated workflow active
- ✅ Verification that it works

## Completion Checklist (MANDATORY)
Before marking ANY task complete:

```
[ ] Code exists and is syntactically valid
[ ] Code runs without errors
[ ] Endpoint/service is accessible
[ ] Automation is scheduled/triggered
[ ] Integration points are connected
[ ] Can demonstrate it working
```

## Decision Tree

```
START: User requests something to be built
  │
  ├─► Is it just an idea/question? 
  │     YES → Answer, then ask "Want me to build it?"
  │     NO ↓
  │
  ├─► Build the actual thing
  │     │
  │     ├─► Write the code
  │     ├─► Test it runs
  │     ├─► Deploy it
  │     ├─► Verify it works
  │     └─► Report: "Built and running at [location]"
  │
  └─► NEVER stop at planning/blueprinting
```

## Anti-Patterns to Reject

### Pattern 1: The Endless Plan
```
BAD: "Here's a 10-step implementation plan..."
GOOD: *executes step 1* *executes step 2* ... "Done. Running at localhost:8001"
```

### Pattern 2: The Architecture Astronaut
```
BAD: "The optimal architecture would involve microservices with..."
GOOD: *builds the thing* "Here's the working solution"
```

### Pattern 3: The Future Promise
```
BAD: "In the next session we can implement..."
GOOD: *implements now* "Implemented and tested"
```

### Pattern 4: The Handoff Dodge
```
BAD: "You'll need to manually configure..."
GOOD: *configures it* "Configured and verified"
```

## Enforcement

When catching yourself about to output a plan/blueprint:
1. STOP
2. Ask: "Can I just build this instead?"
3. If YES → Build it
4. If NO → State the specific blocker, then build what you can

## Escalation
If genuinely blocked:
1. State EXACTLY what is blocking (not vague)
2. Build everything that CAN be built
3. Provide ONE specific action for user to unblock
4. Continue immediately after unblock

## Examples

### ❌ WRONG
```
User: "Create a webhook that processes receipts"

AI: "Here's how you could build a receipt webhook:
1. Create an n8n workflow
2. Add a webhook trigger
3. Connect to OCR service
4. Store results in database

Would you like me to detail any of these steps?"
```

### ✅ RIGHT
```
User: "Create a webhook that processes receipts"

AI: *creates n8n workflow*
*configures webhook trigger*
*connects OCR*
*tests with sample receipt*

"Done. Webhook active at http://localhost:5678/webhook/receipt/process
Tested with sample - extracted vendor, amount, date successfully."
```

## Applies To
- Warp (execution)
- Claude (design review must demand implementation proof)
- n8n (workflows must be activated, not just created)
- All AI systems in this environment

## Verification Phrase
After completing any build task, state:
> "✅ LIVE: [what] running at [where]"

Not:
> "Ready for implementation" ❌
> "Blueprint complete" ❌
> "Plan finalized" ❌
