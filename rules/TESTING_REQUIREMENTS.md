# TESTING REQUIREMENTS

## Decision Tree
```
Is this production code that handles data/money/auth?
├─ YES → Tests REQUIRED before commit
└─ NO → Is this a script that will run repeatedly?
    ├─ YES → Tests RECOMMENDED (at least manual verification)
    └─ NO → Is this a one-off or exploration?
        ├─ YES → No tests needed
        └─ NO → Use judgment
```

## Tests REQUIRED For
- Authentication/authorization logic
- Payment or financial calculations
- Data transformations that feed other systems
- APIs that external systems call
- Anything with "if this breaks, we lose money/data"

## Tests RECOMMENDED For
- Utility scripts used more than once
- Parsers and formatters
- Integrations with external APIs

## No Tests Needed For
- Documentation
- Configuration files
- One-time migration scripts
- Exploratory code that will be rewritten

## How to Test
1. **Check existing test setup**
   ```powershell
   # Look for test config
   ls *test* pytest.ini jest.config.* 
   ```

2. **Run existing tests first**
   ```powershell
   # Node
   npm test
   # Python
   pytest
   python -m pytest
   ```

3. **Add test for new code**
   - Same folder: `test_{filename}.py` or `{filename}.test.js`
   - Test folder: `tests/test_{filename}.py`

## Minimum Viable Test
If full tests aren't practical, at minimum:
```python
# Smoke test - does it run without error?
if __name__ == "__main__":
    result = main_function(sample_input)
    assert result is not None
    print("Smoke test passed")
```
