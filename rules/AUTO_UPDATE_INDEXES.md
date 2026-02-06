# AUTO_UPDATE_INDEXES

**Trigger:** After creating a new project, rule, service, or document

## When to Update

Run `python C:\Users\bermi\Projects\_scripts\index_updater.py` when:

1. **New project created** in `C:\Users\bermi\Projects\`
2. **New rule created** in `.warp/rules/`
3. **Major document added** to any governance or config location
4. **After any session** that created multiple new resources

## Quick Commands

```powershell
# Full update (projects + rules)
python C:\Users\bermi\Projects\_scripts\index_updater.py

# Projects only
python C:\Users\bermi\Projects\_scripts\index_updater.py projects

# Rules only
python C:\Users\bermi\Projects\_scripts\index_updater.py rules
```

## Automatic Triggers

This rule instructs Warp to run the index updater after:
- Creating a new folder in Projects
- Creating a new .md file in .warp/rules/
- Session end if new resources were added

## What Gets Updated

- `PROJECT_INDEX.md` - All projects with categories and status
- `00_RULE_INDEX.md` - All rules grouped by type
- `.last_update` - Timestamp for tracking

## Compliance

Per SERVICES_BEFORE_TOKENS rule, this automation runs a script (no token burn) rather than manually rebuilding indexes.
