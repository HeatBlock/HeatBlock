[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/HeatBlock/HeatBlock/blob/main/LICENSE)
![Version](https://img.shields.io/badge/version-1.0.0-green.svg)
![Node.js](https://img.shields.io/badge/node.js-16+-brightgreen.svg)

A powerful and easy-to-use Minecraft server status checker with both API and UI interfaces. HeatBlock allows you to quickly check the status, player count, and other vital information of any Minecraft server.

## 🚀 What Can You Do With HeatBlock?

- **🌐 Web Interface**: Clean UI for manual server status checking
- **🔌 REST API**: Integrate server status into your applications  
- **☁️ Easy Deployment**: Multiple platform support (Vercel, Netlify, Railway, etc.)
- **🏠 Self-Hosting**: Run your own instance anywhere
- **📱 Mobile Friendly**: Responsive design for all devices
- **🌍 Global CDN**: Multiple hosted instances worldwide

## Features

- ✅ Real-time server status checking (Java & Bedrock)
- ✅ Clean and intuitive user interface
- ✅ RESTful API with CORS support
- ✅ Player count and server information
- ✅ Server icon/favicon extraction (Java)
- ✅ Latency/ping measurement
- ✅ Dark/Light theme support
- ✅ SRV record resolution
- ✅ Easy self-hosting capabilities
- ✅ Multiple hosted versions available worldwide
- ✅ Serverless function support
- ✅ Mobile-responsive design

## Hosted Versions

Here are the publicly available instances:

| Location | URL | Provider |
|----------|-----|----------|
| Singapore | [sg.heatblock.esb.is-a.dev](https://sg.heatblock.esb.is-a.dev) | Railway |
| USA | [us.heatblock.esb.is-a.dev](https://us.heatblock.esb.is-a.dev) | Huggingface |
| India | [in.heatblock.esb.is-a.dev](https://in.heatblock.esb.is-a.dev) | Vercel |
| Germany | [de.heatblock.esb.is-a.dev](https://de.heatblock.esb.is-a.dev) | Render |
| France | [heatblock.skyexplorewt.xyz](https://heatblock.skyexplorewt.xyz) | Self-hosted by [@SkyExploreWasTaken](https://github.com/SkyExploreWasTaken) |

## Self-Hosting

```bash
# Clone the repository
git clone https://github.com/HeatBlock/HeatBlock.git

# Navigate to the project directory
cd heatblock

# Install dependencies
npm i

# Start the server
npm start
```

The server will start running on `http://localhost:3000` (or your configured port).

## 🔌 API Usage

### Quick Examples

**Check a Java server:**
```bash
curl https://heatblock.esb.is-a.dev/api/status/hypixel.net
```

**Check a Bedrock server:**
```bash
curl https://heatblock.esb.is-a.dev/api/status/bedrock/play.cubecraft.net:19132
```

**Get server icon:**
```bash
curl https://heatblock.esb.is-a.dev/api/png/hypixel.net -o server-icon.png
```

### Integration Examples

**JavaScript:**
```javascript
const response = await fetch('https://heatblock.esb.is-a.dev/api/status/hypixel.net');
const data = await response.json();
console.log(`Players: ${data.players.online}/${data.players.max}`);
```

**Python:**
```python
import requests
response = requests.get('https://heatblock.esb.is-a.dev/api/status/hypixel.net')
data = response.json()
print(f"Players: {data['players']['online']}/{data['players']['max']}")
```

## 🌐 Deployment Options

### Vercel
```bash
npm i -g vercel
vercel
```

### Netlify
Connect your GitHub repository to Netlify for automatic deployments.

### Railway
1. Connect GitHub repository
2. Deploy automatically

### Docker
```bash
docker build -t heatblock .
docker run -p 3000:3000 heatblock
```

### API Documentation

Complete API documentation is available at `/api/docs` endpoint after starting the server, or visit any hosted instance's API docs.

**Available Endpoints:**
- `GET /api/status/{server}` - Java server status
- `GET /api/status/bedrock/{server}` - Bedrock server status  
- `GET /api/png/{server}` - Server icon (Java only)

### UI Interface

Visit the root URL to access the web interface. Simply enter a Minecraft server IP to check its status.

**Direct Status Pages:**
- Java: `/{serverAddress}`
- Bedrock: `/bedrock/{serverAddress}`

## 📖 Full Documentation

For comprehensive documentation about all capabilities, see [CAPABILITIES.md](./CAPABILITIES.md).

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


