# Desktop Application Launcher Pattern

## Rule: Auto-Start/Stop Server Pattern for Desktop Shortcuts

When creating desktop shortcuts or launcher buttons for web-based applications that require a backend server:

### Default Behavior
**ALWAYS implement auto-start/stop pattern** where:
1. Clicking the desktop icon/button starts the backend server automatically
2. The server starts in the background (hidden window)
3. Wait for server to be ready (health check)
4. Launch the frontend UI (browser/electron/PWA)
5. Monitor the UI process
6. When user closes the UI window (clicks X), automatically shut down the backend server
7. Clean up all related processes

### Implementation Pattern
Use a launcher script (PowerShell/Bash) that:
- Checks if server is already running (avoid duplicates)
- Starts server process in background
- Polls health endpoint until ready
- Launches UI application
- Waits for UI process to exit
- Stops server process on cleanup

### Exceptions - When NOT to Auto-Stop Server
Do NOT implement auto-stop behavior when:

1. **Shared Services**: Server is used by multiple applications or users simultaneously
2. **Data Loss Risk**: Stopping server would cause:
   - Loss of unsaved data
   - Interruption of ongoing background jobs/processing
   - Corruption of database transactions
   - Loss of queued tasks
3. **Always-On Services**: Server is designed to run continuously:
   - System daemons
   - Production services
   - Monitoring/logging services
   - Database servers
4. **Multi-Instance UI**: Application supports multiple UI windows/tabs connecting to same server
5. **Long-Running Operations**: Server handles operations that continue after UI closes

### When Exceptions Apply
- Document why auto-stop is disabled in launcher comments
- Provide alternative shutdown mechanism (stop script, system tray icon, admin tool)
- Warn user that server continues running after UI closes
- Consider implementing graceful shutdown checks (pending operations, open connections)

### Example Exceptions
- ❌ n8n workflow automation (ongoing workflows, scheduled tasks)
- ❌ Database servers (MySQL, PostgreSQL, MongoDB)
- ❌ Development servers during active debugging
- ✅ Single-user web apps (Scene Director, personal dashboards)
- ✅ Electron apps with embedded servers
- ✅ Desktop PWAs with dedicated backend

### Reference Implementation
See: `C:\Users\bermi\Projects\scene-director\launch_scene_director.ps1`

This pattern improves user experience by eliminating manual server management while preventing resource waste from abandoned server processes.
