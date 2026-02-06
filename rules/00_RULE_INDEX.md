# RULE INDEX

Quick reference. Each rule does ONE thing.

## Core Workflow
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| STARTUP_LOAD_CONTEXT | Session begins | Read STATUS_SNAPSHOT.md |
| IMPLEMENT_REQUIRED | User asks to build | Build first, don't suggest |
| HANDLE_INTERRUPTIONS | User sends new message | Queue it, don't stop |
| UPDATE_TRACKER | Work complete | Update tracker files |
| SESSION_HANDOFF | Session ending | Orchestrates end sequence |
| SESSION_END_REPORT | After commits done | Brief summary to user |
| CLAUDE_HANDOFF_FORMAT | Continuing in Claude | Handoff context format |

## Version Control
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| ARTIFACTS_PUSHED | Work complete | Commit and push |
| COMMIT_FORMAT | Any commit | Proper message format |
| GITHUB_SOURCE_OF_TRUTH | Checking project | Check GitHub first |
| SYNC_LOCAL_WITH_GITHUB | Starting work | Pull before changes |

## Safety
|| Rule | Trigger | One-Line Summary |
||------|---------|------------------|
|| CODE_REVIEW_BEFORE_EXECUTION | Code created/modified | Review as senior dev before running |
|| CHECK_BEFORE_CLAIMING_INABILITY | About to say "I cannot" | Search existing resources first |
| CREDENTIAL_HANDLING | Secrets involved | Never echo |
| RISK_TIERING | Any change | Match scrutiny to risk |
| BEFORE_DESTRUCTIVE | Delete/overwrite | Backup first |
| RETRY_LIMITS | Action fails | Max 3 same, 5 total |
| ERROR_HANDLING_PROCESS | Error occurs | Stop, assess, log, route, fix |
| ROLLBACK_REFERENCE | Need to undo | Commands for git/n8n/db |
| TESTING_REQUIREMENTS | Code written | Tests for prod/money |

## Organization
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| DOCUMENT_CONTROL_FILING | Creating files | Correct folder |
| DEPENDENCY_MANAGEMENT | Installing packages | Verify first |
| CONSOLIDATION_DECISION | Might duplicate | Check for overlap |
| CONSOLIDATION_PROCESS | Decided to consolidate | 5-step merge process |
| CONSULT_CLAUDE_BEFORE_DELETE | About to delete/archive | Get Claude review first |
| NEVER_DELETE | About to delete | Check dependencies first |
| MONTHLY_REVIEW | First of month | Flag stale repos |

## Logging
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| MEMORY_LOGGING | Session end | Log to Memory MCP |
| LOG_SIGNIFICANT_ACTIONS | Major changes | Note what/why/undo |
| PR_EVIDENCE_FORMAT | Creating PR | Evidence sections |

## Self-Learning (Assessment → Template)
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| SELF_LEARNING | Task complete | Which template to use? |
| SKILL_ASSESSMENT | Task >3 calls | Should create skill? |
| DETECTION_RULE_TEMPLATE | Problem fixed | Template for detect rules |
| SKILL_CREATION_TEMPLATE | Skill needed | Template for skills |
| INDEX_ENTRY_CREATION | Hard to find | Template for Memory index |
