# TASK_TIERS

**Purpose:** Match process overhead to task complexity

## Tier Definitions

### TIER 1: QUICK (< 15 minutes, single file)
**Process:** None — just execute
- Single file edit
- Simple command
- Quick lookup
- Known fix

**DO NOT:** Create TODO list, formal plan, Claude review

### TIER 2: STANDARD (< 1 hour, multi-file)
**Process:** TODO list + basic commit
- Multiple file edits
- Script creation
- Multi-step known scope

**DO NOT:** Formal WARP.md, Claude review unless stuck

### TIER 3: COMPLEX (> 1 hour, multi-repo, unknown scope)
**Process:** Full governance
- Claude review for design
- WARP.md handoff document
- TODO list for execution
- Compliance check after

**REQUIRED:** Multi-system changes, architecture decisions, new integrations

## Auto-Classification Hints

| Indicator | Likely Tier |
|-----------|-------------|
| "quickly", "just", "simple" | TIER 1 |
| "create a script", "update these files" | TIER 2 |
| "build a system", "design", "integrate" | TIER 3 |
| Single file mentioned | TIER 1 |
| 2-5 files mentioned | TIER 2 |
| "across projects", "multi-repo" | TIER 3 |

## Override

User can always override: "This is complex, use full process" or "Keep it simple"
