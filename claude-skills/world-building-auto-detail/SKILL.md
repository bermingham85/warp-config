---
name: world-building-auto-detail
description: Auto-generates backstory, traits, and arcs for characters and scenes. Trigger when writing about characters without context, new named characters appear, scenes lack established lore, or keywords backstory, arc, motivation are used.
---

# World Building Auto-Detail

## Instructions

### On Character Writing Without Context
1. Check databases (jesse-messy, animation-agent/milka, gremlos-world-puppet)
2. If exists: Load full context silently, ensure consistency
3. If new: Auto-generate WITHOUT ASKING:
   - Backstory (2-3 paragraphs)
   - 3-5 personality traits
   - 1-2 character flaws
   - Potential arc direction
   - Relationships to existing characters

### On Scene Writing
1. Check story bible for established scenes
2. Auto-add if new: Scene summary, location details, character presence, arc developments
3. Maintain continuity with established scenes

### Auto-Detail Generation Rules
- Match established tone (Irish humor, LGBTQ+ themes, absurdist comedy)
- Reference existing characters where logical
- Create hooks for future development
- Keep it brief but substantive

## Projects
- Jesse Novels: jesse-messy/STORY_BIBLE.json
- Milka Musical: animation-agent/milka/STORY_BIBLE.json
- Grimlo's World: gremlos-world-puppet/WORLD_BIBLE.json

## DO NOT
- Wait to be asked for backstory - generate it
- Contradict established story bible without flagging
- Over-explain or info-dump in creative flow

## DO
- Auto-generate rich details that enhance the world
- Update story bibles in real-time
- Brief notification: "Added [character] backstory to story bible"
