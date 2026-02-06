# SUGGEST_RULE

**Purpose:** Capture reusable patterns as rule suggestions for Claude review

## When to Suggest a Rule

Suggest a new rule when you observe:
- A pattern repeated 3+ times in conversations
- A workflow that could be standardized
- An error prevention technique
- A security or compliance requirement
- A process optimization

## How to Suggest

```powershell
python C:\Users\bermi\Projects\_scripts\rule_suggester.py add --name "RULE_NAME" --content "Description of when and what"
```

**Example:**
```powershell
python C:\Users\bermi\Projects\_scripts\rule_suggester.py add --name "VALIDATE_JSON_BEFORE_COMMIT" --content "Before committing any JSON file, validate syntax with: python -m json.tool < file.json. Prevents broken configs in repo."
```

## Review Workflow

1. **Accumulate:** Suggestions queue in `pending_rules.json`
2. **Review batch:** When 5+ pending, or weekly:
   ```powershell
   python C:\Users\bermi\Projects\_scripts\rule_suggester.py export
   ```
3. **Claude reviews:** Use Sequential Thinking or copy to Claude
4. **Implement approved:**
   ```powershell
   python C:\Users\bermi\Projects\_scripts\rule_suggester.py approve --id 1 --id 3
   ```
5. **Reject others:**
   ```powershell
   python C:\Users\bermi\Projects\_scripts\rule_suggester.py reject --id 2 --reason "Too specific"
   ```
6. **Update index:**
   ```powershell
   python C:\Users\bermi\Projects\_scripts\index_updater.py
   ```

## Quick Commands

```powershell
# List pending
python C:\Users\bermi\Projects\_scripts\rule_suggester.py list

# List all with status
python C:\Users\bermi\Projects\_scripts\rule_suggester.py list --status pending

# Archive reviewed (cleanup)
python C:\Users\bermi\Projects\_scripts\rule_suggester.py clear
```

## Do NOT Suggest

- One-off fixes (not reusable)
- User preferences (belongs in personal config)
- Project-specific rules (belongs in project WARP.md)
- Obvious best practices already in GLOBAL_AI_RULES.md
