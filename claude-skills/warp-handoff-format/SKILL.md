---
name: warp-handoff-format
description: "Provides standardized handoff format when work continues in Claude Desktop, including project context, last commit, and next task."
---

# Claude Handoff Format

## Trigger
User will continue work in Claude Desktop.

## Format
```markdown
## Handoff Context
- Project: {name}
- Repo: {github url}
- Last commit: {hash}
- Next task: {specific action}
- Key files: {paths}
```

## Include When
- User mentions continuing in Claude
- Complex task needs design review
- Consulting Claude before destructive actions
