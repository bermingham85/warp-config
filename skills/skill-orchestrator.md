# Skill Orchestrator

## Purpose
This skill coordinates all other skills, ensuring the right skill activates at the right time without conflicts or redundancy.

## Skill Registry
| Skill | Trigger Keywords | Priority |
|-------|-----------------|----------|
| auto-document-save | create, save, file, markdown, json, yaml | 1 |
| character-database-manager | character, puppet, name, image upload | 2 |
| prompt-library-manager | prompt, template, midjourney, comfyui | 3 |
| world-building-auto-detail | backstory, arc, scene, writing | 4 |
| transaction-categorization | transaction, expense, VAT, QuickBooks | 5 |
| mcp-auto-manager | MCP, tool, integration | 6 |

## Activation Logic

### Context Analysis (Run Every Message)
1. Scan user message for trigger keywords
2. Check conversation context for active projects
3. Determine which skills are relevant
4. Activate in priority order (higher priority = runs first)

### Multi-Skill Coordination
When multiple skills could apply:
1. Run highest priority skill first
2. Pass outputs to lower priority skills if relevant
3. Consolidate confirmations (don't spam user)

Example:
```
User: "Here's Grimlo's new costume design" [image]

Activated skills:
1. character-database-manager (image upload → character)
2. auto-document-save (save image to proper location)
3. prompt-library-manager (if generating prompt for image)

Coordinated response:
"Updated Grimlo in character database. Saved costume design to characters/images/grimlo/costume_casual_20260205.png. Generating reference poses..."
```

## Proactive Detection

### Always-On Monitors
These checks run silently every interaction:

**Content Creation Monitor**
- Detects when substantial content is created
- Routes to auto-document-save
- Triggers prompt-library-manager if prompt detected

**Character Monitor**
- Watches for named entities in creative context
- Triggers character-database-manager
- Links to world-building-auto-detail

**Financial Monitor**
- Detects money/transaction references
- Activates transaction-categorization
- Applies account rules

### Context Persistence
Track active context across messages:
```json
{
  "active_project": "Milka Musical",
  "active_characters": ["Tulio", "Grimlo"],
  "recent_files_created": [],
  "pending_saves": [],
  "skill_states": {
    "character-database-manager": {"last_character": "Grimlo"},
    "prompt-library-manager": {"last_prompt_id": "uuid"}
  }
}
```

## Skill Chain Examples

### Creative Writing Session
```
1. User starts writing dialogue
2. world-building-auto-detail activates
   → Loads story bible, maintains consistency
3. character-database-manager activates
   → Checks character exists, loads traits
4. New character mentioned
   → character-database-manager creates entry
   → world-building-auto-detail generates backstory
5. Session ends with script
   → auto-document-save stores to project folder
```

### Image Generation Session
```
1. User requests character image
2. prompt-library-manager checks for existing prompt
3. character-database-manager loads character details
4. Prompt generated using character data
5. prompt-library-manager saves if new/improved
6. Image generated
7. auto-document-save stores to character folder
8. character-database-manager updates reference images
```

### Financial Processing Session
```
1. User shares bank statement
2. transaction-categorization parses data
3. Rules applied, new vendors flagged
4. auto-document-save stores categorized output
5. New rules generated and saved
```

## DO NOT
- Activate conflicting skills simultaneously
- Overwhelm user with multiple confirmations
- Run heavy skills unnecessarily
- Forget context between messages

## DO
- Consolidate skill outputs into single response
- Maintain context across conversation
- Prioritize based on user's apparent intent
- Run silently unless confirmation needed

## Emergency Override
If skills conflict or cause errors:
1. Pause all skill automation
2. Report issue to user
3. Ask for guidance
4. Resume with adjusted priority

## Skill Loading
On conversation start, load all skill files from:
`C:\Users\bermi\.warp\skills\*.md`

Parse triggers and integrate into response logic.
