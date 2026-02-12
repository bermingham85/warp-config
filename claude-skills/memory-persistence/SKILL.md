---
name: memory-persistence
description: Saves significant learnings and system changes to Memory MCP at session end, creating entities, observations, and relations.
---

# Memory Persistence

## Trigger
- End of significant work session
- Major system changes completed
- New patterns or learnings discovered

## Action
1. Call Memory MCP create_entities for new systems/scripts/patterns
2. Call Memory MCP add_observations to update existing entities
3. Call Memory MCP create_relations to link entities

## Entity Types
- **Script**: Automation scripts with location, schedule, function
- **System**: Pipelines, workflows, integrations
- **Pattern**: Reusable approaches and routing rules
- **Project**: Code repositories
- **Rule**: Governance rules

## Key Entities to Update
- warp-config - Rule count, session outcomes
- Memory_System_Status - Integration status
- Any new scripts/systems created

## Skip When
- Minor edits only
- No new learnings
- Session explicitly marked as temporary
