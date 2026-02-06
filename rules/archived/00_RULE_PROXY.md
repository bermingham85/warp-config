# RULE PROXY PATTERN

## How Rules Work (Token-Efficient)

**DO NOT load all rules every session.**

### Step 1: Read the Index
```
C:\Users\bermi\.warp\rules\00_RULE_INDEX.md
```
This is ~500 tokens and lists ALL rules with:
- Rule name
- Trigger condition
- One-line summary

### Step 2: Identify Relevant Rules
Based on the current task, identify which rules apply:
- File operation? → Check DOCUMENT_CONTROL_FILING
- Git commit? → Check COMMIT_FORMAT, NEVER_COMMIT_SECRETS
- Creating code? → Check CODE_REVIEW_BEFORE_EXECUTION
- Error occurred? → Check ERROR_HANDLING_PROCESS

### Step 3: Load Only Those Rules
Read the full rule file ONLY for rules that apply:
```
C:\Users\bermi\.warp\rules\{RULE_NAME}.md
```

### Token Comparison
| Approach | Tokens |
|----------|--------|
| Load all 48 rules | ~3000 |
| Index + 2-3 relevant rules | ~700 |
| **Savings** | **~77%** |

## Rule Categories (Quick Reference)

### Always Check (Every Session)
- SERVICES_BEFORE_TOKENS
- NO_AUTONOMOUS_EXECUTION

### Check on Code Changes
- CODE_REVIEW_BEFORE_EXECUTION
- NEVER_COMMIT_SECRETS
- COMMIT_FORMAT

### Check on Errors
- ERROR_HANDLING_PROCESS
- RETRY_LIMITS

### Check on File Operations
- DOCUMENT_CONTROL_FILING
- BEFORE_DESTRUCTIVE

### Check on Complex Decisions
- REFERENCE_GOVERNANCE_DOCS

## Implementation
This file IS the proxy. Read this first, then selectively load rules.
