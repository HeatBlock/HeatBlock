#!/usr/bin/env node

/**
 * Simple Node.js example showing how to use the HeatBlock API
 * Usage: node node-example.js [server-address]
 */

const https = require('https');

const serverAddress = process.argv[2] || 'hypixel.net';
const apiUrl = `https://heatblock.esb.is-a.dev/api/status/${serverAddress}`;

console.log(`Checking server: ${serverAddress}`);
console.log(`API URL: ${apiUrl}\n`);

https.get(apiUrl, (res) => {
  let data = '';
  
  res.on('data', (chunk) => {
    data += chunk;
  });
  
  res.on('end', () => {
    try {
      const serverInfo = JSON.parse(data);
      
      if (serverInfo.success) {
        console.log('✅ Server is ONLINE');
        console.log(`📊 Players: ${serverInfo.players.online}/${serverInfo.players.max}`);
        console.log(`🏷️  Version: ${serverInfo.version.name}`);
        console.log(`📡 Latency: ${serverInfo.latency}ms`);
        console.log(`📝 Description: ${serverInfo.description_clean}`);
        
        if (serverInfo.players.list && serverInfo.players.list.length > 0) {
          console.log('\n👥 Online Players:');
          serverInfo.players.list.forEach(player => {
            console.log(`   - ${player.name}`);
          });
        }
      } else {
        console.log('❌ Server is OFFLINE');
        console.log(`🚫 Error: ${serverInfo.error.message} (${serverInfo.error.code})`);
      }
    } catch (error) {
      console.error('❌ Failed to parse response:', error.message);
    }
  });
}).on('error', (error) => {
  console.error('❌ Request failed:', error.message);
});