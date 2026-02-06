# CODE_REVIEW_BEFORE_EXECUTION

## Trigger
Any code artifact is created or significantly modified (scripts, functions, workflows, configs).

## Action Sequence
1. **STOP** - Do not execute newly created code immediately
2. **Review as Senior Developer** - Evaluate the code against:
   - Syntax correctness (compile/lint check)
   - Logic flow and edge cases
   - Error handling completeness
   - Security implications
   - Idempotency (safe to re-run?)
   - Resource cleanup
   - Existing patterns in the codebase
3. **Check Against Existing Work**
   - Does similar functionality already exist?
   - Does this conflict with existing rules/skills?
   - Is this duplicating effort?
4. **Industry Best Practices**
   - Follows language/framework conventions
   - Proper separation of concerns
   - Appropriate logging/observability
   - Graceful degradation
5. **Document Issues** - List all findings before proceeding
6. **Fix Critical Issues** - Address blockers before any execution
7. **Only Then Execute** - With user awareness of any remaining concerns

## Review Checklist
```
[ ] Syntax valid (py_compile, tsc, eslint, etc.)
[ ] No hardcoded secrets or paths that should be configurable
[ ] Error handling for all external calls (files, APIs, network)
[ ] Checkpoint/resume capability for long operations
[ ] Rollback path if something goes wrong
[ ] Doesn't duplicate existing functionality
[ ] Conflicts checked against existing rules
[ ] Follows existing codebase patterns
```

## Skip Conditions
- Trivial one-liner commands (ls, git status, etc.)
- Reading files or status checks
- User explicitly requests immediate execution

## Failure Mode
If review is skipped and code fails:
1. Log the failure
2. Note that review was bypassed
3. Add to lessons learned

## Category
workflow, quality_assurance

## Notes
Enforces separation: Claude/design reviews, Warp executes.
Prevents wasted tokens on broken code iterations.
