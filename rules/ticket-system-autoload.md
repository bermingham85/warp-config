# Inter-Platform Communication System - Auto-Load

At the START of every conversation:

1. **Load the ticket system:**
   ```powershell
   Import-Module "C:\Users\bermi\Projects\SYSTEM_DOCS\ticket-system\TicketHelper.psm1" -Force
   ```

2. **Check for pending tickets addressed to Warp:**
   ```powershell
   Get-TicketsForWarp
   ```

3. **If tickets exist**, process them before addressing the user's query.

## Cross-Platform Communication

When you need to communicate with another platform:

- **To Claude (design/review)**: `New-Ticket -To "claude-api" -Message "your request"`
- **To n8n (automation)**: Use existing webhooks
- **To Claude Desktop (file ops)**: `New-Ticket -To "claude-desktop" -Message "your request"`

## Role Separation

- **Warp** = Execution only. Do NOT design systems.
- **Claude** = Design, review, audit. Request via ticket.
- **Always** check for pending tickets before starting new work.

## User Override

The user can jump in at any time. User instructions take precedence over ticket processing.

## Ticket Location

`C:\Users\bermi\Projects\SYSTEM_DOCS\ticket-system\tickets\`
