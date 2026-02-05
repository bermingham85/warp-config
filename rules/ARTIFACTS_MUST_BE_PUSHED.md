# COMMIT AND PUSH ALL WORK

## Trigger
After completing a logical unit of work (not after every single file).

## What's a "Logical Unit"?
- Finished implementing a feature
- Created a complete rule or skill
- Fixed a bug
- Completed user's request

## Action Sequence
```powershell
# 1. Check if in a git repo
git rev-parse --git-dir

# 2. If not in repo, check parent or init
git init  # or clone existing

# 3. Stage all changes
git add .

# 4. Commit with context
git commit -m "<what changed>

<why it changed - one line>

Co-Authored-By: Warp <agent@warp.dev>"

# 5. Push
git push
```

## Repo Decision Tree
- File in `C:\Users\bermi\.warp\` → push to warp-config repo
- File in `C:\Users\bermi\Projects\{name}\` → push to {name} repo
- File in `C:\Users\bermi\Projects\_scripts\` → push to warp-config or create scripts repo
- New project → create GitHub repo first, then push

## Skip Commit When
- User says "don't commit" or "local only"
- Work is incomplete and user hasn't finished directing
