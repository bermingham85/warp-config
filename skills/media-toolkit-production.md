# Media Toolkit Production Skill

## Purpose
Voice generation and audio mixing using ElevenLabs API v3 with intelligent timing optimization.

## Project Location
`C:\Users\bermi\Projects\media-toolkit`

## Trigger
Activate when ANY of these occur:
- User mentions voice generation, TTS, ElevenLabs, audio production
- Script with CHARACTER (emotion): dialogue format detected
- User references audio mixing, voice overlap, timing adjustment
- Keywords: voice, dialogue, accent, lipsync, audio mix, SFX

## Critical Requirements (ALL MUST BE ENFORCED)

### 1. Accent Persistence
**Every ElevenLabs API call must include accent descriptor:**
```javascript
text: "[Irish Midlands accent] Stay close, Jess."
```
Never omit accent - it ensures voice consistency.

### 2. Clip Reuse from History
**Before generating any clip:**
1. Check ElevenLabs History API
2. If matching text+voice exists → reuse it
3. Log: "♻️ Reusing from history: abc123def456"

### 3. Re-Timing Workflow
**Local timing adjustment - NO regeneration:**
```
[0] Ann: est=2.4s, actual=2.8s, diff=+0.4s → adjust downstream
[1] David: est=1.8s, actual=1.6s, diff=-0.2s → no change needed
```

### 4. Iterative Line Refinement
**User approval loop with natural language:**
```
User: "Line 2 more panicked"
→ Proposed: stability=0.3, style=0.8
→ Text: "[panicked, breathless] We need to move now!"
→ User approves
→ Archive: rework_v1 (original preserved)
```

### 5. Zero Voice Overlaps (PRIORITY 1)
Voices NEVER overlap unless intentionally marked:
```
⚠️  Found 3 timing conflicts - resolving...
✅ Resolved 3 conflicts
Validation: ✅ PASS
```

### 6. Background Music + SFX
- Intelligent placement with ducking under dialogue
- Suno song import with professional voiceover overlay

## Script Format
```
CHARACTER (emotion): dialogue text
[SFX: description, duration: 5s, volume: 0.8]
```

Example:
```
Ann (panicked): Stay close, Jess!
[SFX: explosion, duration: 4s, volume: 0.9]
David: We need to move now!
```

## Production Workflow (9 Steps)
```
[1/9] Load character database (Notion API)
[2/9] Parse script (dialogue + SFX)
[3/9] Generate timeline (intelligent timing)
[4/9] Detect overlaps (ZERO voice overlaps)
[5/9] Generate audio (v3 with history reuse)
[6/9] Optimize timing (actual durations)
[7/9] Mix audio (FFmpeg)
[8/9] Save metadata
[9/9] Archive assets
```

## Module Locations
| Module | Path |
|--------|------|
| Pipeline | src/production-pipeline.js |
| Asset Manager | src/asset-manager.js |
| Character DB | src/character-database.js |
| Script Parser | src/script-parser.js |
| Overlap Analyzer | src/overlap-analyzer.js |
| ElevenLabs Gen | src/elevenlabs-generator.js |
| Timing Optimizer | src/timing-optimizer.js |
| Audio Mixer | src/audio-mixer.js |
| Line Refinement | src/line-refinement.js |

## Archive Structure
```
audio-archive/
├── dialogue/
├── sfx/
├── music/
└── index.json
```

## Version Preservation
Both original and reworked versions preserved:
```json
{
  "abc123_original": {
    "text": "Stay close, Jess.",
    "version": "original"
  },
  "abc123_rework_v1": {
    "text": "[panicked, breathless] Stay close, Jess!",
    "version": "reworked",
    "user_direction": "more panicked"
  }
}
```

## Token Optimization
- ✅ Cache character database locally
- ✅ Check ElevenLabs History before generating
- ✅ Check local archive before generating
- ✅ Local timing adjustments (0 API calls)
- ✅ Reuse SFX where possible

## Success Criteria
- ✅ Zero voice overlaps (unless intentional)
- ✅ Natural timing with pauses between speakers
- ✅ SFX properly layered under dialogue
- ✅ < 10 ElevenLabs API calls for typical 20-line script
- ✅ Timing accuracy within 100ms
- ✅ Production-ready audio quality (eleven_v3)

## Environment Variables
```bash
ELEVENLABS_API_KEY=your-key
NOTION_API_KEY=your-key
NOTION_VOICE_DATABASE_ID=your-database-id
```
Note: Loaded from master env file `C:\Users\bermi\.env`

## DO NOT
- Generate audio without checking history first
- Omit accent descriptors from any API call
- Allow voice overlaps without explicit marking
- Regenerate clips for timing adjustments
- Skip the user approval loop for reworks

## DO
- Always include accent in text prompt
- Check history → archive → then generate if needed
- Use local timing optimization (zero API calls)
- Preserve both original and reworked versions
- Track and report token usage efficiency
