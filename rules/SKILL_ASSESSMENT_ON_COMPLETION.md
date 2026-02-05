# SKILL ASSESSMENT

## Trigger
After completing any task that took more than 3 tool calls.

## Decision Tree
```
Will this exact task happen again?
├─ NO → Done, no skill needed
└─ YES → Could inputs change while steps stay same?
    ├─ NO → Save as snippet, not full skill
    └─ YES → Follow SKILL_CREATION_TEMPLATE
```

## Skill Goes to n8n Instead If
- Runs on schedule (not on-demand)
- Needs to run when Warp isn't open
- Involves webhook triggers

## Skip When
- One-off troubleshooting
- Answering a question
- User-specific (no generalization possible)
