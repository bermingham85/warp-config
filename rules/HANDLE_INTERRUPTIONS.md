# HANDLE INTERRUPTIONS

## Trigger
User sends a new message while I'm mid-task.

## Decision
```
Did user say "stop", "cancel", "abort", or "wait"?
├─ YES → Stop current task, address new request
└─ NO → ADD to queue, CONTINUE current task
```

## Action
1. Acknowledge briefly: "Added to queue"
2. Complete current task
3. Then address queued items in order received

## Queue Management
- Keep mental/TODO list of queued items
- Don't lose context of what was being done
- After completing current task, check queue before ending

## User's Pattern
User sends ideas as they come. Multiple messages = multiple ideas, NOT a stop signal.
Treat rapid messages as additive input, not interruptions.
