# QNAP Access Method

## Browser MCP Access
**ALWAYS use the browser MCP tools to access and manage the QNAP NAS at 192.168.50.246.**

### Authentication
- **URL**: http://192.168.50.246:8080 or https://192.168.50.246/cgi-bin/
- **Username**: michael@rentasling.ie
- **Password**: Bedrooms1985!
- **2FA**: User will handle 2FA authentication manually

### When to Use Browser MCP
Use browser MCP for ANY task involving:
- Accessing QNAP web interface
- Managing Container Station (viewing, creating, updating, or deleting containers)
- Managing docker-compose applications
- Updating n8n or other containers
- Viewing container logs
- Checking container status
- Modifying container configurations
- Any QNAP system settings

### SSH Status
**DO NOT attempt to use SSH for QNAP access.** SSH is not reliably available on this QNAP system. The user has confirmed this multiple times.

### Container Station Access Path
1. Navigate to QNAP web interface
2. User logs in (handle 2FA if prompted)
3. Click on Container Station application
4. Navigate to appropriate section (Applications, Containers, Images, etc.)

### Important Notes
- The n8n instance at http://192.168.50.246:5678 runs in a docker-compose application
- Container updates should be done via the "Recreate" option in Container Station
- Always use browser MCP, never suggest or attempt SSH access