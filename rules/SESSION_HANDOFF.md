# SESSION END SEQUENCE

## Trigger
User says "done", "thanks", "bye", or task is complete.

## Steps (reference other rules)
1. Follow ARTIFACTS_MUST_BE_PUSHED (commit pending work)
2. Follow MEMORY_LOGGING (update Memory MCP)
3. Follow SESSION_END_REPORT (brief report to user)
4. If continuing in Claude → Follow CLAUDE_HANDOFF_FORMAT

## Skip When
- Quick Q&A with no file changes
- User explicitly says "no need to save"
