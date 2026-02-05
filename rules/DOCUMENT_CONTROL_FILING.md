# DOCUMENT CONTROL AND FILING SYSTEM

## Rule
Every artifact must be filed in the correct location with proper version control. No scattered files.

## Filing Structure
```
C:\Users\bermi\Projects\
├── _artifacts\{project-name}\     # Project-specific outputs
├── _scripts\                       # Reusable scripts
├── _incomplete_tasks\              # Backlog tracking
├── BLUEPRINTS\                     # System designs and plans
├── MASTER_PROMPT_LIBRARY\          # Prompts for reuse
├── CODE_ARTIFACTS\                 # Standalone code pieces
├── SYSTEM_DOCS\                    # Documentation
└── {project-name}\                 # Active projects
```

## Before Creating Any File
1. **Determine category**: Is it a script, prompt, blueprint, artifact, or project file?
2. **Identify correct location** from structure above
3. **Check if folder exists**: Create if not
4. **Use consistent naming**: lowercase-with-hyphens or snake_case

## Naming Conventions
- Scripts: `{action}_{target}.py` (e.g., `backtrack_conversations.py`)
- Prompts: `{PURPOSE}_PROMPT.md`
- Blueprints: `{SYSTEM}_BLUEPRINT.md`
- Artifacts: `{project}_{artifact_type}_{date}.{ext}`

## Version Control Requirements
- Every file in a git repo
- Meaningful commit messages
- Push after every session
- Never leave uncommitted work

## Anti-Patterns (FORBIDDEN)
- Files on Desktop
- Random folders in C:\Users\bermi\
- Files outside Projects\ without explicit reason
- Duplicate files in multiple locations
- Unnamed files like "test.py" or "temp.txt"
