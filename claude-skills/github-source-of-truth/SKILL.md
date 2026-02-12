---
name: github-source-of-truth
description: Mandates checking GitHub before claiming any project or feature doesn't exist. GitHub is authoritative over local folder state.
---

# GitHub is Source of Truth

## Mandatory Check Before Any "Not Implemented" Claim

**BEFORE** claiming any project, feature, or work doesn't exist:

1. **Check GitHub FIRST**
   - GitHub user: bermingham85
   - Search repos with user filter
   - Check recent commits
   - Check issues/PRs for context

2. **Sync Local Folders**
   - If GitHub has content but local is empty/outdated: git pull or git clone
   - Local folders may be stale - GitHub is authoritative

3. **Check Related Repos**
   - Projects may be split across multiple repos

## Anti-Pattern (FORBIDDEN)
- "This project is empty" without checking GitHub
- "Nothing has been implemented" without verifying remote
- Assuming local folder state = actual project state

## When Local ≠ GitHub
- Always trust GitHub over local
- Sync before making any claims about project status
