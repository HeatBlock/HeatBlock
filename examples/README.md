# HeatBlock API Examples

This directory contains practical examples showing how to use the HeatBlock API in different programming languages and environments.

## 📁 Available Examples

### 🟢 Node.js Example (`node-example.js`)
A simple Node.js script demonstrating how to check server status using the built-in `https` module.

**Usage:**
```bash
node node-example.js [server-address]
```

**Example:**
```bash
node node-example.js hypixel.net
```

**Features:**
- Uses only built-in Node.js modules
- Displays formatted server information
- Shows online player list when available
- Handles errors gracefully

### 🐍 Python Example (`python-example.py`)
A comprehensive Python script that checks both Java and Bedrock servers.

**Requirements:**
```bash
pip install requests
```

**Usage:**
```bash
python python-example.py [server-address]
```

**Example:**
```bash
python python-example.py play.cubecraft.net
```

**Features:**
- Checks both Java and Bedrock servers
- Detailed error handling
- Formatted output with emojis
- Timestamp logging

### 🌐 Web Example (`web-example.html`)
A complete web interface demonstrating frontend integration with the HeatBlock API.

**Usage:**
Simply open the HTML file in a web browser, or serve it from a web server.

**Features:**
- Interactive web interface
- Real-time server checking
- Support for both Java and Bedrock
- Displays server icons
- Responsive design
- CORS-enabled API calls

### 🔧 Bash Example (`bash-example.sh`)
A shell script for system administrators and automation.

**Usage:**
```bash
./bash-example.sh [server-address] [edition]
```

**Examples:**
```bash
./bash-example.sh hypixel.net java
./bash-example.sh play.cubecraft.net bedrock
./bash-example.sh mc.server.com both
```

**Features:**
- Pure bash implementation
- JSON parsing without external tools
- Server icon downloading
- Colored output
- Error handling
- Multiple edition support

## 🚀 Quick Start

1. **Choose your preferred language/environment**
2. **Install any required dependencies**
3. **Run the example with a server address**
4. **Modify the code for your specific needs**

## 📋 Common Use Cases

### Monitoring Scripts
Use these examples as a base for server monitoring scripts that can:
- Check server status periodically
- Send alerts when servers go offline
- Log server statistics over time
- Generate uptime reports

### Discord Bots
Integrate server status checking into Discord bots:
```javascript
// In your Discord bot
const response = await fetch('https://heatblock.esb.is-a.dev/api/status/hypixel.net');
const data = await response.json();
await message.channel.send(`Server has ${data.players.online} players online!`);
```

### Website Integration
Add server status to your website:
```html
<div id="server-status"></div>
<script>
  fetch('https://heatblock.esb.is-a.dev/api/status/yourserver.com')
    .then(r => r.json())
    .then(data => {
      document.getElementById('server-status').innerHTML = 
        `Players: ${data.players.online}/${data.players.max}`;
    });
</script>
```

### Mobile Apps
Use the API in mobile applications for on-the-go server monitoring.

## 🔗 API Endpoints Reference

| Endpoint | Description | Example |
|----------|-------------|---------|
| `/api/status/{server}` | Java server status | `/api/status/hypixel.net` |
| `/api/status/bedrock/{server}` | Bedrock server status | `/api/status/bedrock/play.cubecraft.net:19132` |
| `/api/png/{server}` | Server icon (Java only) | `/api/png/hypixel.net` |

## 🌍 Available Instances

Use any of these hosted instances in your examples:
- `https://heatblock.esb.is-a.dev` (Primary)
- `https://sg.heatblock.esb.is-a.dev` (Singapore)
- `https://us.heatblock.esb.is-a.dev` (USA)
- `https://in.heatblock.esb.is-a.dev` (India)
- `https://de.heatblock.esb.is-a.dev` (Germany)

## 🤝 Contributing

Feel free to contribute additional examples in other languages or for specific use cases!

**Ideas for new examples:**
- C# / .NET
- PHP
- Ruby
- Go
- Rust
- PowerShell
- Mobile app examples (React Native, Flutter)
- Discord.js bot integration
- Telegram bot integration