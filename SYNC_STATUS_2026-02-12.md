# CROSS-PLATFORM SYNC STATUS
**Generated:** 2026-02-12T17:15Z
**By:** Warp (liaising with Claude via GitHub/Memory)

---

## 🔄 SYNC STATUS

### GitHub ↔ Local Sync
| Repo | Local | GitHub | Status |
|------|-------|--------|--------|
| warp-config | ✅ Current | 96c0d52 | SYNCED |
| ai-governance | ✅ Current | ARCHIVED → autonomous-empire | REDIRECT |
| autonomous-empire | ✅ Current | ae7e899 | SYNCED |
| system-docs | ✅ Current | 20046de | SYNCED |

### Knowledge Gaps Found
| Source | Has Info | Missing In |
|--------|----------|------------|
| SYSTEM_DOCS | Skills auto-generation structure | Memory MCP (empty) |
| autonomous-empire | GLOBAL_AI_RULES v1.1 | Warp rules (partial) |
| Claude sessions | Platform/Global rules hierarchy | Not documented |

---

## 📋 PENDING TASKS BY PLATFORM

### CLAUDE (Design/Review)
1. **Google Sheets Orchestrator Setup** - Manual UI task
   - Files ready at: `orchestrator/apps_script_orchestrator.js`
   
2. **Jesse Repos Consolidation Design**
   - Consolidate: jesse-messy, jesse-messe, jesse-novel-factory, jesse-chapter-factory
   - Design unified structure
   
3. **Skills Auto-Generation System** - USER REQUESTED
   - Define: Global Rules → Platform Rules → Project Rules hierarchy
   - Create auto-skill detection/creation workflow
   - Document in autonomous-empire

4. **Memory MCP Population**
   - Current: EMPTY
   - Needs: Skills, rules, project inventory, task patterns

### WARP (Execution)
1. ✅ wn8n CLI - DONE
2. ✅ N8N_ACCESS_PROTOCOL rule - DONE
3. ⏳ Sync Memory MCP with current state
4. ⏳ Enforce governance scripts setup (from ENFORCEMENT_SETUP.md)

### N8N (Automation)
| Workflow | Status | Webhook |
|----------|--------|---------|
| Claude Bridge | ✅ Active | `/webhook/claude-to-warp` |
| Transaction Categorizer | ✅ Active | `/webhook/transaction/categorize` |
| Task Dispatcher | ⚠️ MCP only | API bug - manual activation needed |

### EMERGENT AI ⚠️ URGENT
**1000 tokens expiring in 3 days!**

Recommended usage:
1. UI/UX design tasks (Error Classification C from RULE 16)
2. Visual asset generation
3. Creative brainstorming for Jesse consolidation

### CHATGPT API
- Status: Available via MCP (chatgpt-mcp)
- Current usage: Minimal
- Recommended: Use for second-opinion code review

### GOOGLE API  
- Sheets Orchestrator: PENDING Claude setup
- Drive: Available but underutilized

---

## 🎯 SKILLS AUTO-GENERATION (User Priority)

### Current Structure (from Claude)
```
GLOBAL RULES (all platforms)
└── PLATFORM RULES (Warp/Claude/n8n specific)
    └── PROJECT RULES (per-repo)
```

### Implementation Status
| Component | Location | Status |
|-----------|----------|--------|
| Global Rules | autonomous-empire/03-GOVERNANCE/GLOBAL_AI_RULES.md | ✅ EXISTS |
| Warp Rules | .warp/rules/ (59 files) | ✅ EXISTS |
| Claude Rules | Not centralized | ❌ MISSING |
| Skill Templates | .warp/skills/SKILL_CREATION_TEMPLATE.md | ✅ EXISTS |
| Auto-Detection | Not implemented | ❌ MISSING |

### NEEDED FROM CLAUDE
1. Define Claude Platform Rules file
2. Design auto-skill detection triggers
3. Create skill promotion workflow (project → platform → global)
4. Integration with n8n for automated skill creation

---

## 📊 RESOURCE UTILIZATION

| Platform | Tokens/Day | Efficiency |
|----------|------------|------------|
| Claude Pro | ~50k | ⚠️ Heavy conversation overhead |
| Warp | ~30k | ✅ Efficient - execution focused |
| Emergent | 0/1000 | ❌ WASTED - use immediately |
| ChatGPT | ~5k | ✅ Minimal |

### Token Optimization Required
- Route design to Claude API (not chat)
- Route execution to Warp
- Route UI/creative to Emergent
- Use Memory MCP to reduce context rebuild

---

## ✅ ACTIONS FOR THIS SESSION

1. [x] Pull all repos to sync
2. [x] Read governance docs from autonomous-empire
3. [x] Identify handover tasks
4. [ ] Populate Memory MCP with current state
5. [ ] Create handover to Claude for:
   - Skills auto-generation design
   - Platform rules structure
   - Emergent AI task allocation

---

## 📝 HANDOVER TO CLAUDE

```
HANDOVER: Warp → Claude
Date: 2026-02-12T17:15Z
Priority: HIGH

CONTEXT:
- User wants skills auto-generation system
- User defines: Global Rules → Platform Rules → Project Rules
- 1000 Emergent tokens expiring in 3 days

REQUESTS:
1. Design Claude Platform Rules (equivalent to .warp/rules/)
2. Design auto-skill detection system
3. Allocate 1000 Emergent tokens to appropriate tasks
4. Document platform rules hierarchy in autonomous-empire

REFERENCE:
- Global Rules: autonomous-empire/03-GOVERNANCE/GLOBAL_AI_RULES.md
- Warp Rules: C:\Users\bermi\.warp\rules\ (59 files)
- Skill Template: .warp/skills/SKILL_CREATION_TEMPLATE.md
```

---
*Sync completed by Warp*
*Co-Authored-By: Warp <agent@warp.dev>*
