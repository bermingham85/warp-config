# CONSOLIDATION PROCESS

## Trigger
Decision made to consolidate (per CONSOLIDATION_DECISION rule).

## Steps
1. **Inventory old project**
   ```powershell
   Get-ChildItem -Recurse | Select-Object FullName
   ```

2. **Extract unique content**
   - Move unique code to new project
   - Move useful docs to SYSTEM_DOCS
   - Save prompts to MASTER_PROMPT_LIBRARY

3. **Update references**
   - Search codebase for references to old project
   - Update Memory MCP entities
   - Update any rules that reference old project

4. **Archive old project**
   ```powershell
   # GitHub: Archive repo
   gh repo archive bermingham85/{old-repo} --yes
   
   # Local: Move to _archive
   Move-Item "C:\Users\bermi\Projects\{old}" "C:\Users\bermi\Projects\_archive\"
   ```

5. **Document**
   - Add note to new project README
   - Update Memory MCP with consolidation record
