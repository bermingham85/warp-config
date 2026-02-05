# MEMORY LOGGING

## Trigger
End of any session with significant work.

## What to Log
```
call Memory.add_observations({
  entity: "{Project or Session_Log}",
  observations: [
    "Date: {today}",
    "What was done: {brief}",
    "What's pending: {if any}",
    "Key files: {paths}"
  ]
})
```

## Skip When
- Quick Q&A only
- No files changed
- User says "no need to save"
