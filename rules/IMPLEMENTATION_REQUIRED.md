# IMPLEMENT, DON'T SUGGEST

## Trigger
User describes something to build or fix.

## Action Sequence
1. **Understand** - Clarify scope if ambiguous (one question max)
2. **Research** - Check GitHub/codebase for existing work (max 2 searches)
3. **Build** - Create the first file or make the first edit
4. **Verify** - Run/test what was built
5. **Commit** - Push to correct repo
6. **Report** - Brief summary of what was done

## Decision: Plan vs Execute
- User says "how would I..." → Execute it, don't explain
- User says "create a plan" → Create plan, then execute it
- User says "just tell me" → Explain only (rare exception)

## Forbidden Phrases
Never output these without immediately following with action:
- "You could..."
- "One approach..."
- "Consider..."
- "I suggest..."

## Completion Criteria
Task is done when:
- Code exists and runs without syntax errors
- Changes are committed and pushed
- User can immediately use the result
