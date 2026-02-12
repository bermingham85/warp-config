---
name: artifacts-push
description: "After completing logical unit of work, commit with context and push. Never leave uncommitted work."
---

# Commit and Push All Work

## Trigger
After completing a logical unit of work.

## What's a Logical Unit?
- Finished implementing a feature
- Created a complete rule or skill
- Fixed a bug
- Completed user's request

## Action Sequence
1. Check if in a git repo
2. Stage all changes
3. Commit with context and co-author line
4. Push

## Skip Commit When
- User says don't commit or local only
- Work is incomplete
