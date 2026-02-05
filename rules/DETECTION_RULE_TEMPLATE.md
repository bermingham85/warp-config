# DETECTION RULE TEMPLATE

## Trigger
Need to create a rule that catches problems early.

## Template
```markdown
# DETECT: {Problem Name}

## Trigger
{When to run this check}

## Check Command
```powershell
{Command that detects the problem}
```

## Symptoms
- {What indicates the problem exists}

## Resolution
- {What to do when detected}
```

## Save To
`C:\Users\bermi\.warp\rules\DETECT_{problem_name}.md`

## Example
Problem: Local repos out of sync with GitHub
→ Creates: DETECT_REPO_SYNC.md
