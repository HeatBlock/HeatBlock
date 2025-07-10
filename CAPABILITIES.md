# HeatBlock Repository Capabilities

## What is HeatBlock?

HeatBlock is a powerful Minecraft server status checker that provides both a web interface and RESTful API for checking the status of Minecraft Java Edition and Bedrock Edition servers in real-time.

## What You Can Do With This Repository

### 1. 🌐 Use the Web Interface

**Access Methods:**
- Visit any hosted instance (see README.md for list)
- Run locally at `http://localhost:3000`

**Features:**
- Clean, intuitive user interface
- Real-time server status checking
- Support for both Java and Bedrock editions
- Dark/Light theme toggle
- Responsive design for mobile devices

**How to Use:**
1. Enter a Minecraft server IP address
2. Select Java or Bedrock edition
3. Click "Get Status" to view:
   - Server online/offline status
   - Player count (online/max)
   - Server description/MOTD
   - Server version
   - Latency/ping
   - Server icon (Java edition only)

### 2. 🔌 Integrate with the REST API

**Available Endpoints:**

#### Java Edition Server Status
```bash
GET /api/status/{serverAddress}
```
**Example:**
```bash
curl https://heatblock.esb.is-a.dev/api/status/hypixel.net
```

**Response:**
```json
{
  "success": true,
  "version": {
    "name": "1.19.4",
    "protocol": 762
  },
  "players": {
    "max": 200000,
    "online": 45678,
    "list": []
  },
  "description": "§aHypixel Network §c[1.8-1.19]",
  "description_clean": "Hypixel Network [1.8-1.19]",
  "latency": 45,
  "favicon": "data:image/png;base64,..."
}
```

#### Bedrock Edition Server Status
```bash
GET /api/status/bedrock/{serverAddress}
```
**Example:**
```bash
curl https://heatblock.esb.is-a.dev/api/status/bedrock/play.cubecraft.net:19132
```

#### Server Icon Extraction (Java Only)
```bash
GET /api/png/{serverAddress}
```
Returns the server's favicon as a PNG image.

### 3. 🏠 Self-Host Your Own Instance

**Quick Start:**
```bash
# Clone the repository
git clone https://github.com/HeatBlock/HeatBlock.git
cd HeatBlock

# Install dependencies
npm install

# Start the server
npm start
```

**Environment Variables:**
- `PORT` - Port to run the server on (default: 3000)

### 4. ☁️ Deploy to Cloud Platforms

#### Vercel Deployment
The repository includes `vercel.json` configuration:
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel
```

#### Netlify Deployment
The repository includes `netlify.toml` configuration:
```bash
# Connect your repository to Netlify
# Push to trigger deployment
```

#### Other Platforms
- **Railway**: Direct GitHub integration
- **Render**: Web service deployment
- **Heroku**: Standard Node.js app deployment
- **DigitalOcean App Platform**: GitHub integration

### 5. 🛠️ Development and Customization

**Project Structure:**
```
├── index.js              # Main server application
├── package.json          # Dependencies and scripts
├── public/               # Static web assets
│   ├── index.html        # Main web interface
│   ├── api-docs.html     # API documentation
│   ├── style.css         # Styling
│   └── script.js         # Client-side JavaScript
├── statusPageTemplate.js # Dynamic status page generator
├── serverless-handler.js # Serverless function wrapper
├── vercel.json          # Vercel deployment config
└── netlify.toml         # Netlify deployment config
```

**Key Components:**
- **Java Edition Pinger**: Implements Minecraft protocol for server status
- **Bedrock Edition Pinger**: UDP-based Bedrock server communication
- **SRV Record Resolution**: Automatic DNS SRV record lookup
- **CORS Support**: Cross-origin requests enabled
- **Error Handling**: Comprehensive error codes and messages

### 6. 📊 Use Cases and Applications

#### For Server Administrators
- Monitor server uptime and status
- Display server information on websites
- Create server status widgets
- Build monitoring dashboards

#### For Developers
- Integrate Minecraft server status into applications
- Build Discord bots with server status commands
- Create server listing websites
- Develop mobile apps for server monitoring

#### For Players
- Check if servers are online before connecting
- View player counts and server information
- Bookmark favorite servers for quick status checks

### 7. 🔧 API Integration Examples

#### JavaScript/Node.js
```javascript
const response = await fetch('https://heatblock.esb.is-a.dev/api/status/hypixel.net');
const data = await response.json();

if (data.success) {
  console.log(`Server: ${data.players.online}/${data.players.max} players`);
} else {
  console.log(`Error: ${data.error.message}`);
}
```

#### Python
```python
import requests

response = requests.get('https://heatblock.esb.is-a.dev/api/status/hypixel.net')
data = response.json()

if data['success']:
    print(f"Server: {data['players']['online']}/{data['players']['max']} players")
else:
    print(f"Error: {data['error']['message']}")
```

#### PHP
```php
$response = file_get_contents('https://heatblock.esb.is-a.dev/api/status/hypixel.net');
$data = json_decode($response, true);

if ($data['success']) {
    echo "Server: " . $data['players']['online'] . "/" . $data['players']['max'] . " players";
} else {
    echo "Error: " . $data['error']['message'];
}
```

### 8. 🚀 Advanced Features

#### Server Icon Display
```html
<img src="https://heatblock.esb.is-a.dev/api/png/hypixel.net" alt="Server Icon">
```

#### Direct Status Page URLs
- Java: `https://heatblock.esb.is-a.dev/{serverAddress}`
- Bedrock: `https://heatblock.esb.is-a.dev/bedrock/{serverAddress}`

#### CORS Support
The API supports cross-origin requests, making it suitable for:
- Browser-based applications
- Frontend frameworks (React, Vue, Angular)
- Static site generators

### 9. 🔍 Error Handling

The API provides detailed error codes:
- `timeout` - Connection timeout
- `invalid_domain` - DNS resolution failed
- `connection_refused` - Server refused connection
- `offline` - Server appears offline
- `no_favicon` - Server has no favicon (icon endpoint only)

### 10. 🌍 Global Availability

Multiple hosted instances are available worldwide:
- Singapore (Railway)
- USA (Huggingface)
- India (Vercel)
- Germany (Render)
- France (Self-hosted)

This ensures low latency and high availability for users globally.

## Getting Started

1. **For quick testing**: Use any hosted instance directly
2. **For development**: Clone and run locally with `npm start`
3. **For production**: Deploy to your preferred cloud platform
4. **For integration**: Use the REST API endpoints in your applications

## Support and Documentation

- Full API documentation available at `/api/docs` endpoint
- GitHub repository: [HeatBlock/HeatBlock](https://github.com/HeatBlock/HeatBlock)
- MIT License - free for commercial and personal use