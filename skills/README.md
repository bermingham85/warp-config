# Claude Skills System

## Architecture: Claude → n8n Handoff
```
[Context Trigger] → [Claude Skill] → [n8n Webhook] → [Automation]
                         ↓
                   Metadata only
                   (no file ops)
```

**Key Principle:** Claude detects and describes, n8n executes.

## What Claude Does
1. Detect context that matches a skill trigger
2. Extract relevant data from conversation
3. Format payload according to webhook spec
4. Call the appropriate n8n webhook
5. Report the result to user

## What Claude Does NOT Do
- Write files directly
- Decide exact file paths
- Update databases
- Generate images
- Process media
- Execute shell commands for automation

## What n8n Handles
- All file operations
- Database updates (CHARACTER_DATABASE.json, PROMPT_INDEX.json)
- Image generation (via FAL, ComfyUI)
- Audio processing (via ElevenLabs)
- Video generation (via PixVerse, LivePortrait)
- Naming conventions
- Destination routing
- Index maintenance
- QNAP routing for large files

## Active Webhooks (n8n at localhost:5678)

| Webhook | Purpose |
|---------|--------|
| `/webhook/claude-to-warp` | Main bridge - routes all Claude requests |
| `/webhook/transaction/categorize` | Financial transaction categorization |
| `/webhook/receipt/process` | Receipt OCR and processing |
| `/webhook/jesse-novel-trigger` | Novel generation pipeline |
| `/webhook/liveportrait` | FAL LivePortrait animation |
| `/webhook/musetalk` | Video lip sync |

## Skills Overview

### 1. auto-document-save.md
**Trigger**: Creating reusable content
**Webhook**: `POST /webhook/claude-to-warp` with `action: save_document`

### 2. character-database-manager.md
**Trigger**: Character image, name, or description
**Webhook**: `POST /webhook/claude-to-warp` with `action: character_update`

### 3. prompt-library-manager.md
**Trigger**: Creating or requesting prompts
**Webhook**: `POST /webhook/claude-to-warp` with `action: save_document` (type: prompt)

### 4. transaction-categorization.md
**Trigger**: Financial data, receipts
**Webhook**: `POST /webhook/transaction/categorize`

### 5. mcp-auto-manager.md
**Trigger**: MCP tool mentions
**Action**: Adds to MCP proxy config (local operation)

## Key Principles

1. **Claude Detects, n8n Executes**: Strict role separation per ai-governance rules
2. **Lightweight Skills**: Skills are triggers + metadata, not executors
3. **Webhook Payloads**: All automation via HTTP POST to n8n
4. **No File Operations in Claude**: All file ops delegated to n8n
5. **Brief Confirmations**: Report what n8n did, don't duplicate work

## Directory Structure
```
C:\Users\bermi\
├── .warp\skills\          # Skill definitions
├── prompts\               # Prompt library
│   ├── PROMPT_INDEX.json
│   ├── midjourney\
│   ├── comfyui\
│   ├── elevenlabs\
│   └── ...
├── Projects\
│   ├── animation-agent\
│   │   ├── characters\
│   │   │   ├── CHARACTER_DATABASE.json
│   │   │   ├── images\
│   │   │   └── poses\
│   │   └── milka\
│   │       └── STORY_BIBLE.json
│   ├── quickbooks-mark2\
│   │   └── rules\
│   │       └── VENDOR_RULES.json
│   └── ...
└── AI_Outputs\            # General AI output storage
```

## Usage

Skills activate automatically. Examples:

**Character Work**:
> "Write a scene with Dr. Karen being sarcastic"
→ Loads Dr. Karen from database, maintains consistency, updates with new traits

**Prompt Creation**:
> "Create a Midjourney prompt for Grimlo in a winter outfit"
→ Checks library, uses existing Grimlo base if found, saves new prompt

**Financial Data**:
> "Categorize this Revolut statement"
→ Auto-applies rules, flags unknown vendors, generates QuickBooks-ready output

**Document Creation**:
> "Create a template for character voice direction"
→ Saves to prompts/elevenlabs/, updates index

## Maintenance

- **Add vendor rules**: Edit `VENDOR_RULES.json`
- **Add characters**: Will be auto-added on first mention
- **Add prompts**: Will be auto-saved when created
- **Update story bibles**: Auto-updated during creative work

## Version
Created: 2026-02-05
Skills: 7 active
