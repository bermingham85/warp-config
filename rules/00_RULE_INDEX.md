# RULE INDEX

Quick reference. Each rule does ONE thing.

## Core Workflow
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| IMPLEMENT_REQUIRED | User asks to build | Build first, don't suggest |
| HANDLE_INTERRUPTIONS | User sends new message | Queue it, don't stop current task |
| SKILL_EXTRACTION | Task >3 tool calls | Assess for reusable skill |
| SESSION_HANDOFF | Session ending | Commit, log, report |

## Version Control
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| ARTIFACTS_PUSHED | Work complete | Commit and push |
| COMMIT_FORMAT | Any commit | Proper message format |
| GITHUB_SOURCE_OF_TRUTH | Checking project | Check GitHub first |
| SYNC_LOCAL_WITH_GITHUB | Starting work | Pull before changes |

## Safety
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| CREDENTIAL_HANDLING | Secrets involved | Never echo |
| RISK_TIERING | Any change | Match scrutiny to risk |
| BEFORE_DESTRUCTIVE | Delete/overwrite | Backup first |
| RETRY_LIMITS | Action fails | Max 3 same, 5 total |
| TESTING_REQUIREMENTS | Code written | Tests for prod/money |

## Organization
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| DOCUMENT_CONTROL_FILING | Creating files | Correct folder |
| DEPENDENCY_MANAGEMENT | Installing packages | Verify first |
| CONSOLIDATION_DECISION | Might duplicate | Check for overlap |
| MONTHLY_REVIEW | First of month | Flag stale repos |

## Logging
| Rule | Trigger | One-Line Summary |
|------|---------|------------------|
| MEMORY_LOGGING | Session end | Log to Memory MCP |
| SELF_LEARNING | Task complete | Suggest detection/skill |
