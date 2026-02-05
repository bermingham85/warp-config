# SELF-LEARNING SYSTEM

## Trigger
After fixing any bug, solving any problem, or completing any task.

## Quick Assessment
```
Did this task involve:
├─ Fixing something that broke? → Consider DETECTION rule
├─ Doing something repetitive? → Consider AUTOMATION skill
├─ Finding something hard to find? → Consider INDEXING rule
└─ None of above → No action needed
```

## If Problem Was Fixed → Create Detection Rule
Ask: "How could I have caught this BEFORE it became a problem?"

Template for detection rule:
```markdown
# DETECT: {Problem Name}

## Symptoms
- {What indicated the problem}

## Check Command
```powershell
{Command that would have detected this}
```

## When to Run
- {Trigger: on commit? on session start? on specific action?}

## Resolution
- {What to do when detected}
```

Save to: `C:\Users\bermi\.warp\rules\DETECT_{problem_name}.md`

## If Task Was Repetitive → Create Automation Skill
Ask: "Will I do this exact task again with different inputs?"

If YES → Create skill per SKILL_EXTRACTION rule

## If Information Was Hard to Find → Create Index Entry
Add to Memory MCP:
```
call Memory.add_observations({
  entity: "{Project or System name}",
  observations: [
    "Key file: {path}",
    "How to find: {search term or location}",
    "Related to: {other entities}"
  ]
})
```

## Self-Assessment Prompt
At task completion, briefly answer:
1. What broke or was missing?
2. Could a rule have prevented this?
3. Could a skill automate this next time?

If answer to 2 or 3 is YES → create it NOW, not later.
