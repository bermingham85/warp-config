# DEPENDENCY MANAGEMENT

## Trigger
Installing, updating, or removing packages in any project.

## Before Adding Dependencies
1. **Check if already installed**
   ```powershell
   # Node
   npm list {package} 
   # Python
   pip show {package}
   ```

2. **Check if actually needed** - Can stdlib do this?

3. **Verify package is legitimate** - Known publisher, recent updates, not typosquatted

## Installation Commands
```powershell
# Node - save to package.json
npm install {package} --save

# Python - with version pinning
pip install {package}
pip freeze > requirements.txt  # Update lockfile

# Python with uv (if available)
uv pip install {package}
```

## After Installation
1. Verify it works: `import {package}` or `require('{package}')`
2. Update lockfile if applicable
3. Commit: `git add package*.json requirements.txt && git commit -m "Add {package} dependency"`

## Version Pinning
- Production code: Pin exact versions (`==1.2.3`)
- Development: Allow minor updates (`^1.2.0` or `~=1.2`)

## Removing Dependencies
```powershell
# Node
npm uninstall {package}

# Python - manual removal from requirements.txt then
pip install -r requirements.txt
```

## Red Flags - Don't Install
- Package with <100 weekly downloads
- No updates in 2+ years
- Name very similar to popular package (typosquatting)
- Requests unusual permissions
