# NEVER DELETE

## Trigger
About to delete anything.

## Check First - Don't Delete If:
- Other projects import/depend on it
- Needed for historical/compliance reference
- User explicitly said "keep this"
- Contains credentials or secrets (redact first)
- Is the only copy (no backup exists)

## When Uncertain
Ask user before deleting.

## Garbage Collection
Only delete from `_archive` after 90+ days:
```powershell
Get-ChildItem "C:\Users\bermi\Projects\_archive" | 
  Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-90) }
```
