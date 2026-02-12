---
name: character-database-manager
description: Detects character-related activity and manages character database. Trigger when user uploads character images, names characters, writes dialogue, or mentions character/puppet. Auto-generates 5 reference poses and extracts traits from context.
---

# Character Database Manager

## Instructions

### On New Character Image Upload
1. Create character folder
2. Generate 5 reference poses via ComfyUI (front, back, left, right, expressive)
3. Create database entry with visual data
4. Auto-generate backstory if context exists

### On Character Mentioned in Writing
1. Check database for existing character
2. If exists: Load context silently, maintain consistency
3. If new: Auto-create entry with extracted traits, flag as "in_development"

### On Character Dialogue Written
Auto-extract and update: personality traits, speech patterns, relationships, backstory hints

## n8n Webhook
POST to `http://localhost:5678/webhook/claude-to-warp` with action: character_update

## DO NOT
- Ask "do you want me to add this?" - just do it
- Leave character data incomplete when context provides info
- Create duplicate entries - check by name first

## DO
- Auto-populate everything from context
- Generate reference images proactively
- Brief confirmation: "Added [name] to character database"
