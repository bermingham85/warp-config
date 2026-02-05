# RULE INDEX

Quick reference. Load full rule only when needed.

## Action Rules
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| IMPLEMENT_REQUIRED | User asks to build | Build first, don't suggest |
| ARTIFACTS_PUSHED | Work complete | Commit and push to correct repo |
| SKILL_EXTRACTION | Task >3 tool calls | Assess for reusable skill |
| SESSION_HANDOFF | Session ending | Save to Memory, commit, report |

## Safety Rules
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| CREDENTIAL_HANDLING | Secrets involved | Never echo, use env vars |
| RISK_TIERING | Any change | Match scrutiny to risk level |
| ERROR_RECOVERY | Failure occurs | Stop, assess, log, fix or rollback |
| TESTING_REQUIREMENTS | Code written | Tests required for prod/money/auth |

## Organization Rules
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| GITHUB_SOURCE_OF_TRUTH | Checking project state | Always check GitHub before claiming empty |
| SYNC_LOCAL_WITH_GITHUB | Starting work | Pull before creating files |
| DOCUMENT_CONTROL_FILING | Creating files | Use correct folder per type |
| DEPENDENCY_MANAGEMENT | Installing packages | Verify before install, pin versions |

## Audit Rules
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| AUDIT_TRAIL | Any significant action | Log to commit and Memory |

## Improvement Rules
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| SELF_LEARNING | After fixing/completing anything | Auto-suggest detection rules or skills |
| PROJECT_CONSOLIDATION | New system replaces old | Merge repos, delete superseded docs |

## Load Order
For new sessions, load in this order if context allows:
1. 00_RULE_INDEX (this file)
2. IMPLEMENT_REQUIRED
3. GITHUB_SOURCE_OF_TRUTH
4. SESSION_HANDOFF

Other rules: load on-demand when relevant trigger occurs.
