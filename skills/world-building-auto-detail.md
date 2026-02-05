# World Building Auto-Detail Skill

## Trigger
Activate AUTOMATICALLY when ANY of these occur:
- User starts writing about a character without full context
- A new named character appears in creative writing
- User describes a scene/setting without established lore
- Keywords: "backstory", "arc", "motivation", "history", "origin"
- User references Jesse novels, Milka musical, Grimlo's World, or other established projects

## Project Databases
- Jesse Novels: `C:\Users\bermi\Projects\jesse-messy\STORY_BIBLE.json`
- Milka Musical: `C:\Users\bermi\Projects\animation-agent\milka\STORY_BIBLE.json`
- Grimlo's World: `C:\Users\bermi\Projects\gremlos-world-puppet\WORLD_BIBLE.json`
- General: `C:\Users\bermi\Projects\animation-agent\WORLD_DATABASE.json`

## Story Bible Schema
```json
{
  "project_name": "Milka: The Broadway Sensation",
  "created": "2026-02-05",
  "updated": "2026-02-05",
  
  "setting": {
    "primary_location": "Dublin, Ireland",
    "time_period": "Contemporary",
    "world_rules": ["Celestial beings can influence but not control", "..."],
    "locations": [
      {
        "name": "Location Name",
        "description": "Description",
        "significance": "Why it matters",
        "scenes_set_here": ["scene1", "scene2"]
      }
    ]
  },
  
  "themes": ["found family", "grief", "LGBTQ+ identity", "divine comedy"],
  
  "characters": {
    "main": ["Tulio", "Milka", "Nana", "Roopa"],
    "supporting": ["Mateus", "Dr. Karen", "God"],
    "character_refs": "link to CHARACTER_DATABASE.json"
  },
  
  "plot": {
    "acts": [
      {
        "act_number": 1,
        "summary": "Act summary",
        "scenes": [
          {
            "scene_number": 1,
            "title": "Scene title",
            "summary": "What happens",
            "characters_present": ["Tulio", "Mateus"],
            "location": "Tulio's apartment",
            "songs": ["Song Name"],
            "arc_developments": {
              "Tulio": "Resists change, clings to routine"
            }
          }
        ]
      }
    ]
  },
  
  "arcs": [
    {
      "character": "Tulio",
      "arc_type": "transformation",
      "start_state": "Isolated, emotionally closed",
      "end_state": "Open to love, connected",
      "key_moments": ["Adopts Milka", "Loses Milka", "Finds closure"]
    }
  ],
  
  "rules_and_lore": {
    "celestial_rules": ["Can spend divine favours", "Cannot directly control humans"],
    "cultural_notes": ["Brazilian-Irish fusion", "Dublin gay scene"]
  },
  
  "musical_elements": {
    "songs": [
      {
        "title": "Song Title",
        "act": 1,
        "scene": 3,
        "type": "solo|duet|ensemble",
        "singer": "Character Name",
        "purpose": "Emotional function in story",
        "style": "Gospel/Broadway fusion"
      }
    ]
  }
}
```

## Behavior

### On Character Writing Without Context
When user writes about a character:
1. **Check databases** for existing character/project
2. **If exists**: Load full context silently, ensure consistency
3. **If new**: Auto-generate the following WITHOUT ASKING:
   - Backstory (2-3 paragraphs based on apparent role)
   - 3-5 personality traits
   - 1-2 character flaws
   - Potential arc direction
   - Relationships to existing characters

### On Scene Writing
When user writes a scene:
1. **Check story bible** for established scenes
2. **Auto-add if new**:
   - Scene summary
   - Location details
   - Character presence
   - Arc developments
3. **Maintain continuity** with established scenes

### Auto-Detail Generation Rules
When generating backstory/details:
- Match established tone (Irish humor, LGBTQ+ themes, absurdist comedy)
- Reference existing characters where logical
- Create hooks for future development
- Keep it brief but substantive

### Example Auto-Generations

**New Character Detected: "Dr. Karen"**
```
Auto-generated backstory:
Dr. Karen is a burnt-out therapist running the LGBTQ+ support group Tulio 
reluctantly joins. Once a passionate advocate, years of underfunding and 
impossible caseloads have left her sharp-tongued and cynical. She hides 
genuine care beneath layers of sarcasm, and her threatening-to-quit routine 
has become a running joke the group secretly relies on.

Traits: Sarcastic, secretly caring, exhausted, dramatic
Flaws: Defensive, uses humor to deflect
Potential arc: Rediscovers purpose through the group's chaos
```

**New Scene Detected**
```
Scene added to story bible:
- Title: "Therapy Group Chaos"
- Act: 1, Scene: 5
- Location: Community center therapy room
- Characters: Tulio, Dr. Karen, group members, Milka
- Summary: Tulio attends his first LGBTQ+ support group session with Milka
- Arc development: Tulio begins to open up despite resistance
```

## Proactive Detailing
When writing creatively, PROACTIVELY:
- Suggest character motivations if unclear
- Note timeline inconsistencies
- Flag when new info contradicts established canon
- Offer to expand on introduced elements

## DO NOT
- Wait to be asked for backstory - generate it
- Contradict established story bible without flagging
- Create details that don't fit established tone
- Over-explain or info-dump in creative flow

## DO
- Auto-generate rich details that enhance the world
- Update story bibles in real-time as writing progresses
- Maintain consistency across all projects
- Brief notification: "Added Dr. Karen backstory to Milka story bible"
- Continue creative flow uninterrupted

## Cross-Project Awareness
- Characters may appear across projects
- Maintain separate but linked story bibles
- Note when a character could appear elsewhere
- Suggest crossover potential when relevant

## Integration with Other Skills
- **Character Database**: Link generated details to character entries
- **Prompt Library**: Use established character prompts for consistency
- **Auto-Save**: All story bible updates auto-saved
