# ARTIFACTS MUST BE PUSHED TO REPO

## Rule
Every artifact created or modified MUST be committed and pushed to the correct GitHub repository.

## Trigger
After ANY of these actions:
- Creating a new file
- Editing an existing file
- Creating a new folder structure
- Modifying configuration

## Required Steps
1. **Identify correct repo** for the artifact based on project context
2. **Stage changes**: `git add <files>`
3. **Commit with message**: Include `Co-Authored-By: Warp <agent@warp.dev>`
4. **Push to remote**: `git push`

## Repo Identification
- Check if file is inside an existing git repo: `git rev-parse --git-dir`
- If no repo exists, determine which repo it belongs to or create new one
- Never leave artifacts uncommitted

## Anti-Pattern (FORBIDDEN)
- Creating files without committing
- Making changes without pushing
- Leaving work only on local disk
- "I'll commit later" - NO, commit NOW

## Exception
Only skip push if user explicitly says "don't commit" or "local only"
