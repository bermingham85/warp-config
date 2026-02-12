# Claude Skills

Custom skills for Claude Desktop/API in Anthropic's SKILL.md format.

## Skills Included

| Skill | Description |
|-------|-------------|
| `auto-document-save` | Auto-save documents via n8n webhook |
| `character-database-manager` | Character tracking + reference pose generation |
| `prompt-library-manager` | Reusable prompt indexing and recall |
| `transaction-categorization` | Irish VAT + QuickBooks categorization |
| `world-building-auto-detail` | Auto-generate backstory and character arcs |
| `media-toolkit-production` | ElevenLabs v3 voice generation |
| `n8n-workflow-manager` | n8n API workflow management |

## Format

Each skill follows Anthropic's SKILL.md format:
```yaml
---
name: skill-name
description: Brief description (max 1024 chars)
---

# Skill Name

## Instructions
[Clear guidance for Claude]

## DO NOT
- Things to avoid

## DO
- Things to do
```

## Requirements

- `name`: Max 64 chars, lowercase/hyphens only, no reserved words
- `description`: Max 1024 chars, non-empty
- Total upload size: < 8MB

## Upload

### Via Python Script
```powershell
# Install anthropic package
pip install anthropic

# Ensure ANTHROPIC_API_KEY in C:\Users\bermi\.env

# Upload all skills
python upload_skills.py

# Upload single skill
python upload_skills.py auto-document-save
```

### Via API
```bash
curl -X POST "https://api.anthropic.com/v1/skills" \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -H "anthropic-beta: skills-2025-10-02" \
  -F "display_title=Auto Document Save" \
  -F "files[]=@auto-document-save/SKILL.md"
```

## Using Skills

After upload, use in API calls:
```python
response = client.beta.messages.create(
    model="claude-opus-4-6",
    betas=["skills-2025-10-02"],
    container={
        "skills": [
            {"type": "custom", "skill_id": "skill_xxx", "version": "latest"}
        ]
    },
    messages=[{"role": "user", "content": "..."}]
)
```

## Maintenance

- Skills mirror Warp skills in `..\.warp\skills\`
- Update both when making changes
- Push to GitHub after updates

## Related

- Warp skills: `C:\Users\bermi\.warp\skills\`
- Memory MCP: Skills also stored as entities
- GitHub: `bermingham85/warp-config`
