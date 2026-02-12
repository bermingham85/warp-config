---
name: prompt-library-manager
description: Auto-saves and recalls reusable prompts. Trigger when detailed prompts are created (over 100 words), user asks to create/template prompts, or prompts for AI tools like Midjourney, ComfyUI, ElevenLabs, Suno are generated.
---

# Prompt Library Manager

## Instructions

### On Prompt Creation
1. Detect if prompt is reusable (specific structure, contains variables, >100 words, for specific AI tool)
2. If reusable: Generate unique ID, extract variables as {{variable_name}}, determine category, save to library
3. If one-off: Do not save, just use it

### On Prompt Request
1. Search PROMPT_INDEX.json by category, tag, or description similarity
2. If match found: Load prompt, increment usage_count, present with variables filled in
3. Say: "Using saved prompt: {name}"

## Categories
midjourney, comfyui, elevenlabs, suno, character, writing, automation, system

## Auto-Recall Triggers
- "character reference" → prompts/midjourney/character-refs
- "voice prompt" → prompts/elevenlabs/
- "animation prompt" → prompts/comfyui/animation/

## DO NOT
- Save generic or trivial prompts
- Ask "should I save this?" - determine quality automatically
- Create duplicate prompts - check index first

## DO
- Save any well-structured, reusable prompt automatically
- Search library before creating new prompts
- Track usage to identify most valuable prompts
