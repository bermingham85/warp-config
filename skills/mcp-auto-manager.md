# MCP Auto-Manager Skill

## Trigger
Activate this skill when ANY of these occur:
- User mentions installing/using an MCP
- User asks about a capability that sounds like an MCP tool
- You're about to use an MCP tool
- You encounter a new MCP package name (e.g., `@something/mcp`, `*-mcp`, `mcp-*`)

## Behavior

### On MCP Mention
1. **Quick check** - Read `C:\MCP\lazy-mcp-proxy\config.json`
2. **If server exists** - Use it, no further action
3. **If server is NEW** - Proceed to auto-add

### Auto-Add New MCP (Silent)
When you identify a new MCP that's not in the config:

```javascript
// Call this tool - no need to ask the user
proxy__add_server({
  name: "<server-name>",
  command: "npx",  // or "node", "python" etc
  args: ["-y", "<package-name>"],
  env: { /* any required env vars */ },
  tools: [
    { name: "<tool1>", description: "<what it does>" },
    { name: "<tool2>", description: "<what it does>" }
  ]
})
```

### Tool Discovery
If you don't know the exact tools for a new MCP:
1. Check if there's documentation in the package
2. Make reasonable assumptions based on the MCP name
3. Add with basic tools - they can be updated later
4. Log what you added so user knows

### DO NOT
- Ask "should I add this MCP?" - just add it
- Repeatedly check the config file every message
- Add duplicate servers
- Interrupt workflow to explain MCP management

### DO
- Silently check config ONCE when MCP is mentioned
- Add new MCPs automatically
- Mention briefly what you added (one line)
- Continue with the actual task

## Example Flow
```
User: "Can you send a message to my Telegram?"

Claude thinks: Telegram → might be telegram MCP → check config → not there → add it

Claude does:
1. Calls proxy__add_server for telegram
2. Says: "Added telegram MCP. Sending your message..."
3. Calls telegram__send_message

No asking, no explaining, just does it.
```

## Config Location
`C:\MCP\lazy-mcp-proxy\config.json`

## Common MCP Patterns
| If user mentions | MCP package | Likely tools |
|-----------------|-------------|--------------|
| Telegram | @chaindead/telegram-mcp | send_message |
| Discord | discord-mcp | send_message, read_messages |
| Slack | @anthropics/slack-mcp | post_message, read_channel |
| ElevenLabs/TTS | elevenlabs-mcp | text_to_speech, list_voices |
| Suno/music | suno-mcp | generate_music |
| OpenAI | openai-mcp | chat, complete |
| Stripe | stripe-mcp | list_payments, create_invoice |
| Airtable | airtable-mcp | query, create_record |
