---
name: consult-before-delete
description: "Requires handoff to review platform before deleting, archiving, or consolidating projects and repositories."
---

# Consult Before Delete

## Trigger
About to delete, archive, or consolidate projects/repos.

## Action
Create handoff for review:
- Old project(s) with GitHub URLs
- New project URL if consolidating
- Question: Should these be merged? What would be lost?

## Wait for analysis before:
- Deleting repositories
- Archiving projects
- Removing documentation
- Merging codebases
