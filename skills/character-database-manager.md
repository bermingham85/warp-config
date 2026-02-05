# Character Database Auto-Manager Skill

## Purpose
Lightweight trigger that detects character-related context and hands off to n8n for database operations and image generation.

## Trigger
Activate when ANY of these occur:
- User uploads/shares a character image
- User gives a character a name
- User writes dialogue or description for a character
- Keywords: "character", "puppet", named entities in creative context

## Claude's Role (ONLY)
1. **Detect** character-related activity
2. **Extract** character data from context
3. **Call n8n webhook** with extracted data
4. **Report** what n8n did

## n8n Webhook
**Endpoint:** `http://localhost:5678/webhook/claude-to-warp`

## Character Schema
```json
{
  "id": "uuid",
  "name": "Character Name",
  "created": "2026-02-05",
  "updated": "2026-02-05",
  "type": "human|animal|creature|puppet",
  "status": "active|archived|in_development",
  
  "visual": {
    "description": "Physical description",
    "reference_images": {
      "front": "path/to/front.png",
      "back": "path/to/back.png",
      "left": "path/to/left.png",
      "right": "path/to/right.png",
      "expressive": "path/to/expressive.png"
    },
    "distinctive_features": ["list", "of", "features"],
    "costume_notes": "Default clothing/appearance"
  },
  
  "voice": {
    "elevenlabs_voice_id": "voice-id-here",
    "voice_description": "High, childlike but mature",
    "accent": "Dublin/Irish",
    "speech_patterns": ["pattern1", "pattern2"]
  },
  
  "personality": {
    "traits": ["trait1", "trait2"],
    "flaws": ["flaw1", "flaw2"],
    "likes": ["like1", "like2"],
    "dislikes": ["dislike1", "dislike2"],
    "social_attitude": "Description of social behavior"
  },
  
  "background": {
    "backstory": "Full backstory text",
    "career": "Occupation or role",
    "relationships": [
      {"name": "Other Character", "relationship": "friend/enemy/family", "notes": ""}
    ],
    "sexuality": "if relevant",
    "identity": "if relevant"
  },
  
  "story_data": {
    "projects": ["Milka Musical", "Jesse Novels"],
    "arcs": [
      {"project": "project_name", "arc": "Character arc description"}
    ],
    "appearances": ["scene1", "scene2"]
  },
  
  "technical": {
    "lora_model": "path/to/lora if trained",
    "comfyui_workflow": "workflow_name",
    "animation_rig": "path/to/rig"
  }
}
```

## Behavior

### On New Character Image Upload
1. **Create character folder**: `characters/images/{character_name}/`
2. **Generate 5 reference poses** using ComfyUI/Midjourney:
   - Front view (neutral)
   - Back view
   - Left side view
   - Right side view
   - Expressive pose (characteristic emotion)
3. **Create database entry** with visual data populated
4. **Prompt for missing data** OR auto-generate:
   - If clear context exists, auto-generate backstory/traits
   - If unclear, ask ONE question: "What role does {name} play?"

### On Character Mentioned in Writing
1. **Check database** for existing character
2. **If exists**: Load context silently, maintain consistency
3. **If new character emerges from writing**:
   - Auto-create database entry
   - Extract traits from dialogue/description
   - Flag as "in_development" status

### On Character Description/Dialogue Written
Auto-extract and update:
- Personality traits from behavior
- Speech patterns from dialogue
- Relationships from interactions
- Backstory hints from context

### Reference Image Generation Prompt
When generating the 5 reference poses, use this template:
```
[character description], full body, [view: front/back/left/right/expressive],
clean white background, character sheet style, consistent proportions,
detailed features visible, no background elements, reference pose,
[style: puppet-like/realistic/cartoon as appropriate]
```

## DO NOT
- Ask "do you want me to add this to the database?" - just do it
- Leave character data incomplete when context provides info
- Forget to generate reference poses for visual characters
- Create duplicate entries - check by name first

## DO
- Auto-populate everything possible from context
- Generate reference images proactively when image is provided
- Update existing entries when new info emerges
- Keep CHARACTER_DATABASE.json as single source of truth
- Brief confirmation: "Added Grimlo to character database with 5 reference poses"

## Integration Points
- **ElevenLabs**: Voice ID stored for TTS
- **ComfyUI**: Workflow references for image generation
- **PixVerse**: Animation reference for lipsync
- **n8n**: Webhook for automated character video pipeline

## Example Flows

### Flow 1: Image Upload
```
User: [uploads image] "This is Grimlo"

Claude:
1. Creates characters/images/grimlo/
2. Saves original image
3. Generates 5 reference poses via ComfyUI
4. Creates database entry with visual data
5. Auto-generates: "Grimlo appears to be a gremlin-type puppet creature"
6. Says: "Added Grimlo to character database. Generated 5 reference poses. What's his personality like?"
```

### Flow 2: Writing Context
```
User: "Write a scene where Grimlo gives advice in his creepy innocent way"

Claude:
1. Checks database - Grimlo exists
2. Loads: childlike voice, mature language, calm delivery
3. Writes scene maintaining consistency
4. Updates database with any new traits revealed
5. Continues without interruption
```

### Flow 3: New Character in Dialogue
```
User writing scene includes new character "Dr. Karen"

Claude:
1. Detects new named character
2. Auto-creates database entry
3. Extracts from context: therapist role, sarcastic, dismissive
4. Flags as "in_development"
5. Mentions briefly: "Added Dr. Karen to character database (extracted: therapist, sarcastic)"
```
