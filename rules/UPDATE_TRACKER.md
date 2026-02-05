# UPDATE TRACKER

## Trigger
After completing any significant work (per SESSION_HANDOFF rule).

## Action
1. Update `MASTER_TASK_TRACKER.md`:
   - Find project row
   - Update Status column
   - Update Last Updated date
   - Add notes if needed

2. Update `STATUS_SNAPSHOT.md`:
   - Update "Last Updated" timestamp
   - Add to "Recently Completed" list
   - Update "Quick Stats" if counts changed
   - Update "Priority Queue" if item completed

3. If new tool/skill discovered:
   - Update `TOOL_INVENTORY.md`

## Status Values
- `IDEA` → `BLUEPRINT` → `IN_PROGRESS` → `IMPLEMENTED` → `PUSHED` → `TESTED`
- `ARCHIVED` for abandoned work

## Commit After Update
```powershell
cd C:\Users\bermi\.warp
git add STATUS_SNAPSHOT.md MASTER_TASK_TRACKER.md TOOL_INVENTORY.md
git commit -m "Update tracker: {what was done}

Co-Authored-By: Warp <agent@warp.dev>"
git push
```

## Skip When
- Quick Q&A with no project work
- User says "don't track this"
