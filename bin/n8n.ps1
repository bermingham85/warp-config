#!/usr/bin/env pwsh
<#
.SYNOPSIS
    n8n automation helper for Warp - bypasses broken API, uses webhooks
.DESCRIPTION
    Provides reliable n8n interaction without depending on flaky REST API.
    Uses webhooks for workflow triggers and local file-based workflow management.
.EXAMPLE
    n8n health          # Check n8n status
    n8n test            # Test webhook connectivity  
    n8n trigger <path>  # Trigger a webhook
    n8n list            # List local workflow files
    n8n import <file>   # Queue workflow for import
#>

param(
    [Parameter(Position=0)]
    [ValidateSet('health', 'test', 'trigger', 'list', 'import', 'help')]
    [string]$Command = 'help',
    
    [Parameter(Position=1)]
    [string]$Argument
)

$N8N_URL = "http://localhost:5678"
$WORKFLOWS_PATH = "C:\Users\bermi\Projects\bermech-n8n-workflows"
$IMPORT_QUEUE = "C:\Users\bermi\.warp\n8n_import_queue.json"

function Write-Status($msg, $color = "White") {
    Write-Host $msg -ForegroundColor $color
}

function Test-N8nHealth {
    try {
        $response = Invoke-RestMethod -Uri "$N8N_URL/healthz" -TimeoutSec 5
        if ($response.status -eq "ok") {
            Write-Status "✅ n8n is healthy at $N8N_URL" "Green"
            return $true
        }
    } catch {
        Write-Status "❌ n8n not responding at $N8N_URL" "Red"
        Write-Status "   Start n8n or check the URL" "Gray"
        return $false
    }
    return $false
}

function Test-Webhook {
    $webhooks = @(
        "/webhook/claude-to-warp",
        "/webhook/transaction/categorize",
        "/webhook-test/claude-to-warp"
    )
    
    Write-Status "`n🔍 Testing webhooks..." "Cyan"
    
    foreach ($wh in $webhooks) {
        try {
            $body = @{ action = "ping"; source = "warp-n8n-helper" } | ConvertTo-Json
            $response = Invoke-RestMethod -Uri "$N8N_URL$wh" -Method Post -Body $body -ContentType "application/json" -TimeoutSec 5 -ErrorAction Stop
            Write-Status "  ✅ $wh - ACTIVE" "Green"
        } catch {
            $statusCode = $_.Exception.Response.StatusCode.value__
            if ($statusCode -eq 404) {
                Write-Status "  ⚠️  $wh - NOT REGISTERED (workflow inactive)" "Yellow"
            } else {
                Write-Status "  ❌ $wh - ERROR: $statusCode" "Red"
            }
        }
    }
    
    Write-Status "`n📝 To activate webhooks:" "Cyan"
    Write-Status "   1. Open $N8N_URL in browser" "White"
    Write-Status "   2. Import workflows from $WORKFLOWS_PATH" "White"
    Write-Status "   3. Toggle workflows to ACTIVE" "White"
}

function Invoke-Webhook {
    param([string]$Path)
    
    if (-not $Path) {
        Write-Status "❌ Webhook path required" "Red"
        Write-Status "   Example: n8n trigger /webhook/claude-to-warp" "Gray"
        return
    }
    
    if (-not $Path.StartsWith("/")) { $Path = "/$Path" }
    
    $body = @{
        action = "trigger"
        source = "warp-cli"
        timestamp = (Get-Date -Format "o")
    } | ConvertTo-Json
    
    try {
        $response = Invoke-RestMethod -Uri "$N8N_URL$Path" -Method Post -Body $body -ContentType "application/json" -TimeoutSec 30
        Write-Status "✅ Webhook triggered successfully" "Green"
        $response | ConvertTo-Json -Depth 5
    } catch {
        Write-Status "❌ Webhook failed: $($_.Exception.Message)" "Red"
    }
}

function Get-LocalWorkflows {
    if (-not (Test-Path $WORKFLOWS_PATH)) {
        Write-Status "❌ Workflows path not found: $WORKFLOWS_PATH" "Red"
        return
    }
    
    Write-Status "`n📂 Local workflow files:" "Cyan"
    Get-ChildItem $WORKFLOWS_PATH -Filter "*.json" | ForEach-Object {
        $name = $_.BaseName -replace "^[a-zA-Z0-9]{16}-", ""
        Write-Status "  • $name" "White"
    }
    Write-Status "`n  Total: $((Get-ChildItem $WORKFLOWS_PATH -Filter '*.json').Count) workflows" "Gray"
}

function Add-ToImportQueue {
    param([string]$File)
    
    if (-not $File) {
        Write-Status "❌ File path required" "Red"
        return
    }
    
    $fullPath = if ([System.IO.Path]::IsPathRooted($File)) { $File } else { Join-Path $WORKFLOWS_PATH $File }
    
    if (-not (Test-Path $fullPath)) {
        Write-Status "❌ File not found: $fullPath" "Red"
        return
    }
    
    $queue = @()
    if (Test-Path $IMPORT_QUEUE) {
        $queue = Get-Content $IMPORT_QUEUE | ConvertFrom-Json
    }
    
    $queue += @{
        file = $fullPath
        queued = (Get-Date -Format "o")
        status = "pending"
    }
    
    $queue | ConvertTo-Json -Depth 3 | Set-Content $IMPORT_QUEUE
    Write-Status "✅ Added to import queue: $File" "Green"
    Write-Status "   Open n8n UI to complete import" "Gray"
}

function Show-Help {
    Write-Status @"

n8n Helper for Warp
==================

COMMANDS:
  health          Check if n8n is running
  test            Test webhook connectivity
  trigger <path>  Trigger a webhook (e.g., /webhook/claude-to-warp)
  list            List local workflow files
  import <file>   Queue a workflow for import
  help            Show this help

EXAMPLES:
  n8n health
  n8n test
  n8n trigger /webhook/transaction/categorize
  n8n list
  n8n import transaction_categoriser_webhook.json

NOTES:
  - n8n REST API is unreliable; this tool uses webhooks
  - Workflows must be activated in n8n UI for webhooks to work
  - Workflow files: $WORKFLOWS_PATH

"@ "Cyan"
}

# Main
switch ($Command) {
    'health'  { Test-N8nHealth }
    'test'    { if (Test-N8nHealth) { Test-Webhook } }
    'trigger' { if (Test-N8nHealth) { Invoke-Webhook -Path $Argument } }
    'list'    { Get-LocalWorkflows }
    'import'  { Add-ToImportQueue -File $Argument }
    'help'    { Show-Help }
    default   { Show-Help }
}
