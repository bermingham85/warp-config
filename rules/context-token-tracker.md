# RULE: Context Window Token Management

**Rule ID:** `context-token-tracker`  
**Priority:** HIGH  
**Scope:** ALL_CONVERSATIONS

## Token Tracking Protocol

- **Warp Context Limit:** 128,000 tokens
- **Estimation Formula:** 4 characters ≈ 1 token
- **Handover Threshold:** 102,400 tokens (80%)

## Automatic Monitoring

Track cumulative token usage across conversation:
- Input tokens + output tokens per exchange
- Running total maintained internally
- Progress indicator when >50% utilized

## Auto-Handover Sequence

When 80% threshold reached:

1. **Generate Summary**
   - Conversation objectives
   - Key decisions made
   - Current state/progress

2. **Extract Context**
   - Active tasks and dependencies
   - Important technical details
   - Open questions

3. **Create Handover Ticket**
   - Type: `context_handover`
   - Use: `New-ContextHandover` function from TicketHelper.psm1
   - Include all packaged information

4. **Provide Transition Prompt**
   - Pre-formatted prompt for new session
   - Ensures continuity

## Status Reporting

Include in responses when >70% capacity:
```
[Token Status: ~X/128K used (Y%)]
```

Alert format when approaching limit:
```
⚠️ Context window at 75% capacity - handover will auto-trigger at 80%
```

## PowerShell Functions Available

```powershell
# Estimate current token usage
Estimate-TokenUsage -Text $conversationText -ContextType 'Warp'

# Generate handover when needed
New-ContextHandover -ConversationSummary "..." -PendingTasks @("...") -CriticalContext @{} -TokenUsage $usage
```
