#!/usr/bin/env python3
"""
Python example showing how to use the HeatBlock API
Usage: python python-example.py [server-address]
"""

import sys
import requests
import json
from datetime import datetime

def check_server(server_address):
    """Check a Minecraft server's status using HeatBlock API"""
    api_url = f"https://heatblock.esb.is-a.dev/api/status/{server_address}"
    
    print(f"Checking server: {server_address}")
    print(f"API URL: {api_url}\n")
    
    try:
        response = requests.get(api_url, timeout=10)
        response.raise_for_status()
        
        server_info = response.json()
        
        if server_info['success']:
            print('✅ Server is ONLINE')
            print(f"📊 Players: {server_info['players']['online']}/{server_info['players']['max']}")
            print(f"🏷️  Version: {server_info['version']['name']}")
            print(f"📡 Latency: {server_info['latency']}ms")
            print(f"📝 Description: {server_info['description_clean']}")
            
            if server_info['players']['list']:
                print('\n👥 Online Players:')
                for player in server_info['players']['list']:
                    print(f"   - {player['name']}")
        else:
            print('❌ Server is OFFLINE')
            print(f"🚫 Error: {server_info['error']['message']} ({server_info['error']['code']})")
            
    except requests.exceptions.RequestException as e:
        print(f"❌ Request failed: {e}")
    except json.JSONDecodeError as e:
        print(f"❌ Failed to parse response: {e}")
    except KeyError as e:
        print(f"❌ Unexpected response format: {e}")

def check_bedrock_server(server_address):
    """Check a Bedrock server's status using HeatBlock API"""
    api_url = f"https://heatblock.esb.is-a.dev/api/status/bedrock/{server_address}"
    
    print(f"Checking Bedrock server: {server_address}")
    print(f"API URL: {api_url}\n")
    
    try:
        response = requests.get(api_url, timeout=10)
        response.raise_for_status()
        
        server_info = response.json()
        
        if server_info['success']:
            print('✅ Bedrock Server is ONLINE')
            print(f"📊 Players: {server_info['playersOnline']}/{server_info['playersMax']}")
            print(f"🏷️  Version: {server_info['version']}")
            print(f"📡 Latency: {server_info['latency']}ms")
            print(f"📝 MOTD: {server_info['motd_clean']}")
            print(f"🌍 Level: {server_info['levelName']}")
            print(f"🎮 Game Mode: {server_info['gamemode']}")
        else:
            print('❌ Bedrock Server is OFFLINE')
            print(f"🚫 Error: {server_info['error']['message']} ({server_info['error']['code']})")
            
    except requests.exceptions.RequestException as e:
        print(f"❌ Request failed: {e}")
    except json.JSONDecodeError as e:
        print(f"❌ Failed to parse response: {e}")
    except KeyError as e:
        print(f"❌ Unexpected response format: {e}")

def main():
    if len(sys.argv) < 2:
        server_address = 'hypixel.net'
    else:
        server_address = sys.argv[1]
    
    print(f"🕐 Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("=" * 50)
    
    # Check Java server
    check_server(server_address)
    
    print("\n" + "=" * 50)
    print("Bedrock Server Check:")
    print("=" * 50)
    
    # Check Bedrock server (append default port if not specified)
    bedrock_address = server_address if ':' in server_address else f"{server_address}:19132"
    check_bedrock_server(bedrock_address)

if __name__ == "__main__":
    main()