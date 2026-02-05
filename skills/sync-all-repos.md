# Sync All Repos

## When to Use
At session start, or when suspecting local folders are out of sync with GitHub.

## Parameters
- target_dir: Directory containing projects (default: `C:\Users\bermi\Projects`)

## Steps
1. List all directories with `.git` folder
2. For each, run `git fetch` and check status
3. Report any that are behind or have uncommitted changes
4. Optionally pull all that are behind

## Command
```powershell
Get-ChildItem -Path "C:\Users\bermi\Projects" -Directory | 
ForEach-Object {
    $gitDir = Join-Path $_.FullName ".git"
    if (Test-Path $gitDir) {
        Write-Host "Checking: $($_.Name)" -ForegroundColor Cyan
        git -C $_.FullName fetch --quiet 2>$null
        $status = git -C $_.FullName status --porcelain
        $behind = git -C $_.FullName rev-list --count HEAD..origin/main 2>$null
        if ($status) { Write-Host "  Has uncommitted changes" -ForegroundColor Yellow }
        if ($behind -gt 0) { Write-Host "  Behind by $behind commits" -ForegroundColor Yellow }
    }
}
```

## Output
List of repos with sync status, flagging any that need attention.
