# PROJECT CONSOLIDATION

## Trigger
- Creating a new system that replaces an old one
- Noticing multiple repos doing similar things
- Monthly review (first session of each month)

## Consolidation Decision Tree
```
Is there an older project that does something similar?
├─ NO → Continue, no consolidation needed
└─ YES → Does the new project fully supersede the old?
    ├─ NO → Keep both, document relationship
    └─ YES → CONSOLIDATE (see steps below)
```

## Before Consolidating - Consult Claude
Create handoff to Claude Desktop:
```markdown
## Consolidation Review Request
Old project(s): {list with GitHub URLs}
New project: {URL}
Question: Should these be merged? What would be lost?
```

Wait for Claude's analysis before proceeding with destructive actions.

## Consolidation Steps
1. **Inventory old project**
   ```powershell
   # List all files
   Get-ChildItem -Recurse | Select-Object FullName
   # Check for unique content not in new project
   ```

2. **Extract anything unique**
   - Move unique code to new project
   - Move useful docs to new project or SYSTEM_DOCS
   - Save any useful prompts to MASTER_PROMPT_LIBRARY

3. **Update references**
   - Search codebase for references to old project
   - Update Memory MCP entities
   - Update any rules that reference old project

4. **Archive old project**
   ```powershell
   # On GitHub: Archive repo (don't delete immediately)
   gh repo archive bermingham85/{old-repo} --yes
   
   # Locally: Move to _archive
   Move-Item "C:\Users\bermi\Projects\{old}" "C:\Users\bermi\Projects\_archive\"
   ```

5. **Document the consolidation**
   - Add note to new project README
   - Update Memory MCP with consolidation record

## Monthly Cleanup Review
First session of month, run:
```powershell
# List repos by last update
gh repo list bermingham85 --limit 100 --json name,updatedAt | ConvertFrom-Json | Sort-Object updatedAt
```

Flag for review:
- Repos not updated in 90+ days
- Repos with similar names (potential duplicates)
- Repos with no README or empty

## What NOT to Delete
- Anything with external dependencies (other projects import it)
- Historical reference needed for compliance
- User explicitly says "keep this"

## Garbage Collection After Consolidation
```powershell
# Clean up archived local folders quarterly
Get-ChildItem "C:\Users\bermi\Projects\_archive" | 
  Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-90) } |
  ForEach-Object { Write-Host "Consider permanent deletion: $_" }
```
