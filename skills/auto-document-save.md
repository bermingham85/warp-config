# Auto Document Save Skill

## Purpose
Lightweight trigger that detects document creation and hands off to n8n for actual file operations.

## Trigger
Activate when ANY of these occur:
- You create substantial content (markdown, JSON, YAML, code)
- You generate a reusable prompt or template
- User says "save this" or discusses saving content

## Claude's Role (ONLY)
1. **Detect** that saveable content was created
2. **Generate metadata** about the content
3. **Call n8n webhook** with content + metadata
4. **Confirm briefly** after webhook responds

## n8n Webhook
**Endpoint:** `http://localhost:5678/webhook/claude-to-warp`

**Payload Format:**
```json
{
  "action": "save_document",
  "content": "<the actual content>",
  "metadata": {
    "type": "prompt|character|workflow|script|documentation",
    "category": "midjourney|comfyui|animation|financial|etc",
    "suggested_name": "descriptive-name",
    "tags": ["tag1", "tag2"],
    "project": "project-name-if-applicable"
  }
}
```

## Content Type Detection
| Keywords in Content | Type | Category |
|---------------------|------|----------|
| midjourney, --ar, --v | prompt | midjourney |
| comfyui, workflow, nodes | workflow | comfyui |
| character, backstory, traits | character | animation |
| transaction, VAT, category | financial | quickbooks |
| elevenlabs, voice, SSML | prompt | elevenlabs |

## Behavior

### On Document Creation
```
1. Content created
2. Detect type from keywords/context
3. Generate metadata payload
4. POST to http://localhost:5678/webhook/claude-to-warp
5. n8n handles: naming, destination, file write, indexing
6. Confirm: "Saved via n8n: [filename]"
```

## DO NOT (Claude)
- Write files directly
- Decide exact file paths
- Update indexes manually
- Do any file system operations

## DO (Claude)
- Detect content type accurately
- Generate good metadata
- Call the webhook
- Report the result

## n8n Workflow Handles
- Filename generation (pattern: `{category}_{name}_{YYYYMMDD}.{ext}`)
- Destination routing (prompts/, characters/, workflows/, etc.)
- Index updates (PROMPT_INDEX.json, CHARACTER_DATABASE.json)
- QNAP routing for large files
- Deduplication checks

## Example Flow
```
User: "Create a prompt for character reference images"

Claude:
1. Creates prompt content
2. Detects: type=prompt, category=midjourney
3. Calls webhook:
   POST http://localhost:5678/webhook/claude-to-warp
   {
     "action": "save_document",
     "content": "[prompt text]",
     "metadata": {
       "type": "prompt",
       "category": "midjourney", 
       "suggested_name": "character-reference-poses",
       "tags": ["character", "reference", "poses"]
     }
   }
4. n8n responds: {"status": "saved", "path": "prompts/midjourney/prompt_character-reference-poses_20260205.md"}
5. Claude says: "Here's your prompt. Saved: prompts/midjourney/prompt_character-reference-poses_20260205.md"
```
