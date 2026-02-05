# Prompt Library Auto-Manager Skill

## Trigger
Activate AUTOMATICALLY when ANY of these occur:
- A detailed prompt is created (>100 words with specific instructions)
- User asks to "create a prompt" or "write a prompt"
- You generate a prompt for: Midjourney, ComfyUI, ElevenLabs, Suno, or any AI tool
- User says "save this prompt" or "template this"
- A prompt is reused or referenced from previous conversation

## Prompt Library Location
- Index: `C:\Users\bermi\prompts\PROMPT_INDEX.json`
- Prompts by category:
  - `C:\Users\bermi\prompts\midjourney\`
  - `C:\Users\bermi\prompts\comfyui\`
  - `C:\Users\bermi\prompts\elevenlabs\`
  - `C:\Users\bermi\prompts\suno\`
  - `C:\Users\bermi\prompts\character\`
  - `C:\Users\bermi\prompts\writing\`
  - `C:\Users\bermi\prompts\automation\`
  - `C:\Users\bermi\prompts\system\`

## Prompt Index Schema
```json
{
  "prompts": [
    {
      "id": "uuid",
      "name": "Human-readable name",
      "category": "midjourney|comfyui|elevenlabs|suno|character|writing|automation|system",
      "subcategory": "optional subcategory",
      "path": "relative/path/to/prompt.md",
      "description": "What this prompt does",
      "tags": ["tag1", "tag2"],
      "variables": ["{{character_name}}", "{{style}}"],
      "created": "2026-02-05",
      "updated": "2026-02-05",
      "usage_count": 0,
      "last_used": null,
      "quality_rating": null,
      "related_prompts": ["uuid1", "uuid2"]
    }
  ]
}
```

## Prompt File Format
Save prompts as markdown with metadata header:
```markdown
---
id: uuid-here
name: Character Reference Poses
category: midjourney
tags: [character, reference, poses]
variables: [character_name, character_description]
---

# Character Reference Poses

## Purpose
Generate consistent 5-view character reference sheets.

## Prompt Template
{{character_description}}, full body, {{view}}, clean white background, 
character sheet style, consistent proportions, detailed features visible,
no background elements, reference pose, puppet-style illustration

## Variables
- `{{character_description}}`: Physical description of character
- `{{view}}`: front | back | left | right | expressive

## Usage Notes
Run 5 times with different view values for complete reference set.

## Example Output
[Link or description of expected output]
```

## Behavior

### On Prompt Creation
1. **Detect if prompt is reusable**:
   - Has specific structure/format
   - Contains variables or placeholders
   - Is >100 words with clear instructions
   - Is for a specific AI tool (MJ, ComfyUI, etc.)

2. **If reusable**:
   - Generate unique ID
   - Extract variables (anything that would change per use)
   - Determine category from context/tool
   - Save to appropriate folder
   - Update PROMPT_INDEX.json
   - Confirm: "Saved to prompt library: prompts/midjourney/character-refs.md"

3. **If one-off**: Do not save, just use it

### On Prompt Request
When user needs a prompt and context matches existing:
1. **Search PROMPT_INDEX.json** by:
   - Category match
   - Tag match
   - Description similarity
2. **If match found**:
   - Load prompt from file
   - Increment usage_count
   - Update last_used
   - Present with variables filled in
   - Say: "Using saved prompt: {name}"

### Variable Detection
Auto-detect variables in prompts:
- `{{variable_name}}` - explicit
- `[placeholder]` - convert to `{{placeholder}}`
- Repeated specific values that might change

## Auto-Recall Triggers
When these phrases appear, search library first:
- "character reference" → prompts/midjourney/character-refs
- "voice prompt" → prompts/elevenlabs/
- "animation prompt" → prompts/comfyui/animation/
- "Grimlo script" → prompts/character/grimlo-voice.md
- "product description" → prompts/writing/product-copy.md

## DO NOT
- Save generic or trivial prompts
- Ask "should I save this?" - determine quality automatically
- Create duplicate prompts - check index first
- Forget to update usage statistics

## DO
- Save any well-structured, reusable prompt automatically
- Search library before creating new prompts
- Maintain consistent variable syntax `{{var}}`
- Track usage to identify most valuable prompts
- Brief confirmation when saving/using

## Quality Scoring
After prompt use, if output is good:
- Auto-increment quality_rating
- Link successful outputs to prompt

## Example Flow
```
User: "I need a Midjourney prompt for generating Grimlo in different outfits"

Claude:
1. Searches library for "grimlo" + "midjourney"
2. Finds prompts/midjourney/grimlo-base.md
3. Says: "Using saved Grimlo base prompt. What outfit?"
4. Fills variables and presents prompt
5. Updates usage_count
```

```
User creates detailed prompt for ElevenLabs voice direction

Claude:
1. Detects: detailed, structured, has variables, for specific tool
2. Saves to prompts/elevenlabs/voice-direction-template.md
3. Updates index
4. Says: "Saved to prompt library: voice-direction-template"
```
