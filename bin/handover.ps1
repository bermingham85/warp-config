#!/usr/bin/env pwsh
# Handover CLI Tool
# Manages AI agent handover templates and processes

param(
    [Parameter(Position = 0)]
    [string]$Command,
    
    [Parameter(Position = 1)]
    [string]$Name,
    
    [string]$Template,
    [switch]$List,
    [switch]$Help
)

$HANDOVER_DIR = "$HOME\.warp\handovers"
$TEMPLATE_DIR = "$HOME\.warp\prompts"

function Show-Help {
    Write-Host @"
Handover CLI - AI Agent Task Handover Management

USAGE:
    handover <command> [options]

COMMANDS:
    tp, template    Create handover from template
    ls, list        List all handovers
    new             Create new handover manually
    view <name>     View a handover file
    rm <name>       Remove a handover file
    templates       List available templates
    
OPTIONS:
    -Template <name>    Specify template to use
    -Name <name>        Name for the handover
    -Help              Show this help message

EXAMPLES:
    handover tp -Template review -Name "code_review"
    handover list
    handover view code_review
    handover templates
    
"@
}

function Get-Handovers {
    if (Test-Path $HANDOVER_DIR) {
        Get-ChildItem -Path $HANDOVER_DIR -Filter "*.md" | ForEach-Object {
            [PSCustomObject]@{
                Name = $_.BaseName
                Modified = $_.LastWriteTime
                Size = $_.Length
            }
        } | Format-Table -AutoSize
    } else {
        Write-Host "No handovers found in $HANDOVER_DIR"
    }
}

function Get-Templates {
    if (Test-Path $TEMPLATE_DIR) {
        Write-Host "`nAvailable Templates:" -ForegroundColor Cyan
        Get-ChildItem -Path $TEMPLATE_DIR -Filter "*.md" | ForEach-Object {
            Write-Host "  - $($_.BaseName)" -ForegroundColor Green
        }
    } else {
        Write-Host "Template directory not found: $TEMPLATE_DIR" -ForegroundColor Yellow
        Write-Host "Creating template directory..." -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $TEMPLATE_DIR -Force | Out-Null
    }
}

function New-HandoverFromTemplate {
    param(
        [string]$TemplateName,
        [string]$HandoverName
    )
    
    if (-not $TemplateName) {
        Write-Host "Error: Template name required. Use -Template <name>" -ForegroundColor Red
        Get-Templates
        return
    }
    
    $templatePath = Join-Path $TEMPLATE_DIR "$TemplateName.md"
    
    if (-not (Test-Path $templatePath)) {
        Write-Host "Error: Template '$TemplateName' not found at $templatePath" -ForegroundColor Red
        Get-Templates
        return
    }
    
    if (-not $HandoverName) {
        $HandoverName = "$TemplateName`_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    }
    
    $handoverPath = Join-Path $HANDOVER_DIR "$HandoverName.md"
    
    # Create handover directory if it doesn't exist
    if (-not (Test-Path $HANDOVER_DIR)) {
        New-Item -ItemType Directory -Path $HANDOVER_DIR -Force | Out-Null
    }
    
    # Copy template to handover
    Copy-Item -Path $templatePath -Destination $handoverPath
    
    # Add metadata
    $content = Get-Content -Path $handoverPath -Raw
    $metadata = @"
---
Created: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
Template: $TemplateName
Status: Pending
---

"@
    
    Set-Content -Path $handoverPath -Value ($metadata + $content)
    
    Write-Host "`nHandover created successfully!" -ForegroundColor Green
    Write-Host "  File: $handoverPath" -ForegroundColor Cyan
    Write-Host "`nOpening in default editor..." -ForegroundColor Yellow
    
    Start-Process $handoverPath
}

function New-Handover {
    param([string]$HandoverName)
    
    if (-not $HandoverName) {
        $HandoverName = "HANDOVER_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    }
    
    $handoverPath = Join-Path $HANDOVER_DIR "$HandoverName.md"
    
    if (-not (Test-Path $HANDOVER_DIR)) {
        New-Item -ItemType Directory -Path $HANDOVER_DIR -Force | Out-Null
    }
    
    $template = @"
---
Created: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
From: Claude
To: Warp
Status: Pending
---

# Handover: $HandoverName

## Context
[Describe the context and background]

## Task
[Describe what needs to be done]

## Artifacts
- File/Path references
- Related documentation

## Success Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Notes
[Any additional information]

---
Co-Authored-By: Warp <agent@warp.dev>
"@
    
    Set-Content -Path $handoverPath -Value $template
    
    Write-Host "`nHandover created: $handoverPath" -ForegroundColor Green
    Start-Process $handoverPath
}

function Show-Handover {
    param([string]$HandoverName)
    
    $handoverPath = Join-Path $HANDOVER_DIR "$HandoverName.md"
    
    if (Test-Path $handoverPath) {
        Get-Content -Path $handoverPath | Write-Host
    } else {
        Write-Host "Handover not found: $HandoverName" -ForegroundColor Red
    }
}

function Remove-Handover {
    param([string]$HandoverName)
    
    $handoverPath = Join-Path $HANDOVER_DIR "$HandoverName.md"
    
    if (Test-Path $handoverPath) {
        Remove-Item -Path $handoverPath -Confirm
        Write-Host "Handover removed: $HandoverName" -ForegroundColor Green
    } else {
        Write-Host "Handover not found: $HandoverName" -ForegroundColor Red
    }
}

# Main command processing
switch ($Command) {
    { $_ -in "tp", "template" } {
        New-HandoverFromTemplate -TemplateName $Template -HandoverName $Name
    }
    { $_ -in "ls", "list" } {
        Get-Handovers
    }
    "new" {
        New-Handover -HandoverName $Name
    }
    "view" {
        Show-Handover -HandoverName $Name
    }
    "rm" {
        Remove-Handover -HandoverName $Name
    }
    "templates" {
        Get-Templates
    }
    default {
        if ($Help -or -not $Command) {
            Show-Help
        } else {
            Write-Host "Unknown command: $Command" -ForegroundColor Red
            Write-Host "Use 'handover -Help' for usage information" -ForegroundColor Yellow
        }
    }
}
