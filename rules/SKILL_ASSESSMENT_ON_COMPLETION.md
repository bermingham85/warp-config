# SKILL ASSESSMENT ON ARTIFACT COMPLETION

## Rule
After completing ANY artifact, assess whether it can become a reusable skill or automation.

## Trigger
Immediately after:
- Completing a script
- Finishing a workflow
- Creating a reusable pattern
- Solving a problem that may recur

## Assessment Questions
1. **Is this repeatable?** Will this task happen again?
2. **Can it be parameterized?** Can inputs vary while process stays same?
3. **Is it complex enough?** Worth automating (>3 steps)?
4. **Who benefits?** Warp, Claude, n8n, or manual trigger?

## If YES to Assessment → Create Skill

### For Warp Skills
Location: `C:\Users\bermi\.warp\skills\`
Format:
```markdown
# Skill Name
## Purpose
## Trigger
## Steps
## Parameters
## Output
```

### For Claude Skills
Location: `C:\Users\bermi\Projects\claude-skills-library\`
Push to: https://github.com/bermingham85/claude-skills-library

### For n8n Automation
- Create webhook workflow at localhost:5678
- Document in skill file with webhook URL
- Add to SKILLS_WEBHOOK_MAP.md

## Skill Categories
- File operations
- API integrations
- Data transformations
- Code generation patterns
- Analysis workflows
- Deployment procedures

## After Creating Skill
1. Add to appropriate skill library
2. Update SKILLS_WEBHOOK_MAP.md if webhook-based
3. Commit and push
4. Add to Memory MCP for discovery

## Anti-Pattern (FORBIDDEN)
- Completing work without considering reusability
- Solving same problem twice manually
- "I'll make it a skill later" - NO, assess NOW
