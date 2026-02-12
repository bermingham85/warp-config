---
name: context-token-tracker
description: Tracks token usage in conversations, warns at 70% capacity, auto-triggers handover at 80% threshold with conversation summary and continuation prompts.
---

# Context Token Tracker

## Protocol
- **Context Limit:** 128,000 tokens
- **Estimation:** 4 characters ≈ 1 token
- **Handover Threshold:** 102,400 tokens (80%)

## Automatic Monitoring
Track cumulative token usage across conversation:
- Input tokens + output tokens per exchange
- Running total maintained internally
- Progress indicator when >50% utilized

## Auto-Handover Sequence
When 80% threshold reached:
1. Generate Summary (objectives, decisions, progress)
2. Extract Context (tasks, technical details, questions)
3. Create Handover Ticket
4. Provide Transition Prompt

## Status Reporting
Include in responses when >70% capacity:
```
[Token Status: ~X/128K used (Y%)]
```

Alert at 75%:
```
⚠️ Context window at 75% capacity - handover will auto-trigger at 80%
```
