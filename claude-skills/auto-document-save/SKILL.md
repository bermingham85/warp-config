---
name: auto-document-save
description: Detects document creation and hands off to n8n for file operations. Trigger when creating prompts, templates, scripts, markdown, JSON, YAML, or when user says save this. Routes to webhook with metadata only - no direct file operations.
---

# Auto Document Save

## Instructions

When you detect that saveable content has been created:

1. **Detect Content Type** - Analyze the content for type indicators:
   - `midjourney`, `--ar`, `--v` → type: prompt, category: midjourney
   - `comfyui`, `workflow`, `nodes` → type: workflow, category: comfyui
   - `character`, `backstory`, `traits` → type: character, category: animation
   - `transaction`, `VAT`, `category` → type: financial, category: quickbooks
   - `elevenlabs`, `voice`, `SSML` → type: prompt, category: elevenlabs

2. **Generate Metadata** - Create payload with action, content, and metadata (type, category, suggested_name, tags, project)

3. **Call n8n Webhook** - POST to `http://localhost:5678/webhook/claude-to-warp`

4. **Confirm Briefly** - Report what n8n saved

## DO NOT
- Write files directly
- Decide exact file paths
- Update indexes manually
- Ask "should I save this?" - detect quality automatically

## DO
- Detect content type accurately
- Generate good metadata
- Call the webhook
- Report the result briefly

## Examples

User creates a Midjourney prompt → Detect type=prompt, category=midjourney → POST webhook → "Saved: prompts/midjourney/prompt_name.md"
