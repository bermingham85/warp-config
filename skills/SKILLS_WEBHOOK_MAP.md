# Skills → Webhook Mapping

## Architecture
```
[Context Trigger] → [Claude Skill] → [n8n Webhook] → [Automation]
                         ↓
                   Metadata only
                   (no file ops)
```

## Active Webhooks (n8n at localhost:5678)

| Webhook Path | Purpose | Workflow |
|-------------|---------|----------|
| `/webhook/claude-to-warp` | Main bridge - routes all Claude requests | Claude to Warp Bridge |
| `/webhook/transaction/categorize` | Financial transaction categorization | Transaction Categorizer |
| `/webhook/receipt/process` | Receipt OCR and processing | Receipt Processor |
| `/webhook/jesse-novel-trigger` | Novel generation pipeline | Jesse Novel Factory |
| `/webhook/liveportrait` | FAL LivePortrait animation | FAL LivePortrait |
| `/webhook/musetalk` | Video lip sync | MuseTalk |
| `/webhook/fal-video-lipsync` | FAL video + audio sync | FAL Video Lipsync |

## Skill → Webhook Mapping

### 1. Document Save
**Trigger:** Creating reusable content (prompts, templates, scripts)
**Webhook:** `POST /webhook/claude-to-warp`
```json
{
  "action": "save_document",
  "content": "<content>",
  "metadata": {
    "type": "prompt|script|workflow|documentation",
    "category": "midjourney|comfyui|elevenlabs|animation|financial",
    "suggested_name": "descriptive-name",
    "tags": ["tag1", "tag2"]
  }
}
```

### 2. Character Management
**Trigger:** Character image, name, or description
**Webhook:** `POST /webhook/claude-to-warp`
```json
{
  "action": "character_update",
  "character": {
    "name": "Character Name",
    "image_base64": "<if image uploaded>",
    "description": "extracted description",
    "traits": ["trait1", "trait2"],
    "voice_notes": "voice description if mentioned",
    "project": "Milka Musical|Grimlo|Jesse"
  },
  "operations": ["create_entry", "generate_poses", "update_traits"]
}
```

### 3. Transaction Categorization
**Trigger:** Financial data, receipts, bank statements
**Webhook:** `POST /webhook/transaction/categorize`
```json
{
  "transactions": [
    {
      "date": "2026-02-05",
      "description": "PAYMENT - Google Ireland",
      "amount": -2.99,
      "account": "Revolut Pro"
    }
  ],
  "source": "revolut|paypal|aib"
}
```

### 4. Receipt Processing
**Trigger:** Receipt image or document
**Webhook:** `POST /webhook/receipt/process`
```json
{
  "image_base64": "<receipt image>",
  "source": "wellybox|manual|email"
}
```

### 5. Novel/Story Content
**Trigger:** Jesse novels, story writing, chapter work
**Webhook:** `POST /webhook/jesse-novel-trigger`
```json
{
  "action": "continue_chapter|new_chapter|edit",
  "book": "book_number",
  "chapter": "chapter_number",
  "content": "<content if edit>",
  "instructions": "specific instructions"
}
```

### 6. Animation/Video
**Trigger:** Animation requests, lipsync, video generation
**Webhook:** `POST /webhook/liveportrait` or `/webhook/musetalk`
```json
{
  "character": "character_name",
  "audio_path": "path/to/audio.mp3",
  "image_path": "path/to/reference.png",
  "output_path": "path/to/output/"
}
```

## Claude's Responsibilities
1. **Detect** context that matches a skill trigger
2. **Extract** relevant data from conversation
3. **Format** payload according to webhook spec
4. **Call** the appropriate webhook
5. **Report** the result to user

## Claude Does NOT
- Write files directly
- Decide file paths
- Update databases
- Generate images
- Process media
- Execute shell commands for automation

## n8n Handles
- All file operations
- Database updates
- Image generation (via FAL, ComfyUI)
- Audio processing (via ElevenLabs)
- Video generation (via PixVerse, LivePortrait)
- Naming conventions
- Destination routing
- Index maintenance
- QNAP routing for large files

## Error Handling
If webhook fails:
1. Claude reports the error
2. Does NOT retry automatically
3. Suggests manual intervention or alternative

## Testing Webhooks
```powershell
# Test claude-to-warp bridge
$body = @{
  action = "test"
  message = "ping from skill"
} | ConvertTo-Json

Invoke-RestMethod -Uri "http://localhost:5678/webhook/claude-to-warp" -Method Post -Body $body -ContentType "application/json"
```
