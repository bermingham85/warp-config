#!/usr/bin/env python3
"""
Upload Claude Skills to Anthropic API

Usage:
    python upload_skills.py [skill_name]
    
    If skill_name is provided, uploads only that skill.
    If no argument, uploads all skills in the claude-skills directory.

Requirements:
    pip install anthropic
    
Environment:
    ANTHROPIC_API_KEY must be set (loads from master .env file)
"""

import os
import sys
from pathlib import Path

# Load env from master file
env_path = Path.home() / ".env"
if env_path.exists():
    with open(env_path) as f:
        for line in f:
            if "=" in line and not line.startswith("#"):
                key, value = line.strip().split("=", 1)
                os.environ.setdefault(key, value)

try:
    import anthropic
    from anthropic.lib import files_from_dir
except ImportError:
    print("Error: anthropic package not installed")
    print("Run: pip install anthropic")
    sys.exit(1)


SKILLS_DIR = Path(__file__).parent
BETA_VERSION = "skills-2025-10-02"


def upload_skill(skill_dir: Path) -> dict:
    """Upload a single skill directory to Anthropic."""
    skill_md = skill_dir / "SKILL.md"
    
    if not skill_md.exists():
        print(f"  ⚠️  Skipping {skill_dir.name}: No SKILL.md found")
        return None
    
    # Read skill name from YAML frontmatter
    with open(skill_md) as f:
        content = f.read()
    
    # Extract name from frontmatter
    lines = content.split("\n")
    skill_name = skill_dir.name
    for line in lines:
        if line.startswith("name:"):
            skill_name = line.split(":", 1)[1].strip()
            break
    
    print(f"  📦 Uploading: {skill_name}")
    
    client = anthropic.Anthropic()
    
    try:
        skill = client.beta.skills.create(
            display_title=skill_name.replace("-", " ").title(),
            files=files_from_dir(str(skill_dir)),
            betas=[BETA_VERSION]
        )
        print(f"  ✅ Created: {skill.id}")
        return {
            "name": skill_name,
            "id": skill.id,
            "version": getattr(skill, 'latest_version', 'v1')
        }
    except Exception as e:
        print(f"  ❌ Error: {e}")
        return None


def main():
    print("🚀 Claude Skills Uploader\n")
    
    if not os.environ.get("ANTHROPIC_API_KEY"):
        print("❌ ANTHROPIC_API_KEY not set")
        print("   Add it to your master .env file")
        sys.exit(1)
    
    # Get skill directories
    skill_dirs = [d for d in SKILLS_DIR.iterdir() if d.is_dir() and (d / "SKILL.md").exists()]
    
    if len(sys.argv) > 1:
        # Upload specific skill
        skill_name = sys.argv[1]
        skill_dir = SKILLS_DIR / skill_name
        if not skill_dir.exists():
            print(f"❌ Skill not found: {skill_name}")
            sys.exit(1)
        skill_dirs = [skill_dir]
    
    print(f"Found {len(skill_dirs)} skills to upload\n")
    
    results = []
    for skill_dir in skill_dirs:
        result = upload_skill(skill_dir)
        if result:
            results.append(result)
        print()
    
    # Summary
    print("=" * 40)
    print(f"✅ Uploaded: {len(results)}/{len(skill_dirs)} skills")
    print()
    
    if results:
        print("Skill IDs (save these for API calls):")
        for r in results:
            print(f"  {r['name']}: {r['id']}")
        
        # Save to index file
        index_file = SKILLS_DIR / "SKILLS_INDEX.json"
        import json
        with open(index_file, "w") as f:
            json.dump({
                "uploaded": results,
                "beta_version": BETA_VERSION,
                "count": len(results)
            }, f, indent=2)
        print(f"\n📝 Saved to {index_file}")


if __name__ == "__main__":
    main()
