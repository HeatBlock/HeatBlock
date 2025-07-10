#!/bin/bash

# HeatBlock API Bash Example
# Usage: ./bash-example.sh [server-address] [edition]
# Edition: java (default) or bedrock

set -e

# Configuration
SERVER="${1:-hypixel.net}"
EDITION="${2:-java}"
API_BASE="https://heatblock.esb.is-a.dev/api"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to check Java server
check_java_server() {
    local server=$1
    local url="${API_BASE}/status/${server}"
    
    print_status $BLUE "Checking Java server: $server"
    print_status $BLUE "API URL: $url"
    echo
    
    # Make API request
    local response=$(curl -s -w "\n%{http_code}" "$url")
    local http_code=$(echo "$response" | tail -n1)
    local json_response=$(echo "$response" | head -n -1)
    
    if [ "$http_code" != "200" ]; then
        print_status $RED "❌ HTTP Error: $http_code"
        return 1
    fi
    
    # Parse JSON response using basic tools
    local success=$(echo "$json_response" | grep -o '"success":[^,}]*' | cut -d: -f2 | tr -d ' "')
    
    if [ "$success" = "true" ]; then
        print_status $GREEN "✅ Server is ONLINE"
        
        # Extract information using grep and cut
        local players_online=$(echo "$json_response" | grep -o '"online":[0-9]*' | cut -d: -f2)
        local players_max=$(echo "$json_response" | grep -o '"max":[0-9]*' | cut -d: -f2)
        local version=$(echo "$json_response" | grep -o '"name":"[^"]*"' | cut -d: -f2 | tr -d '"')
        local latency=$(echo "$json_response" | grep -o '"latency":[0-9]*' | cut -d: -f2)
        local description=$(echo "$json_response" | grep -o '"description_clean":"[^"]*"' | cut -d: -f2 | tr -d '"')
        
        echo "📊 Players: $players_online/$players_max"
        echo "🏷️  Version: $version"
        echo "📡 Latency: ${latency}ms"
        echo "📝 Description: $description"
    else
        print_status $RED "❌ Server is OFFLINE"
        local error_message=$(echo "$json_response" | grep -o '"message":"[^"]*"' | cut -d: -f2 | tr -d '"')
        local error_code=$(echo "$json_response" | grep -o '"code":"[^"]*"' | cut -d: -f2 | tr -d '"')
        echo "🚫 Error: $error_message ($error_code)"
    fi
}

# Function to check Bedrock server
check_bedrock_server() {
    local server=$1
    local url="${API_BASE}/status/bedrock/${server}"
    
    print_status $BLUE "Checking Bedrock server: $server"
    print_status $BLUE "API URL: $url"
    echo
    
    # Make API request
    local response=$(curl -s -w "\n%{http_code}" "$url")
    local http_code=$(echo "$response" | tail -n1)
    local json_response=$(echo "$response" | head -n -1)
    
    if [ "$http_code" != "200" ]; then
        print_status $RED "❌ HTTP Error: $http_code"
        return 1
    fi
    
    # Parse JSON response
    local success=$(echo "$json_response" | grep -o '"success":[^,}]*' | cut -d: -f2 | tr -d ' "')
    
    if [ "$success" = "true" ]; then
        print_status $GREEN "✅ Bedrock Server is ONLINE"
        
        # Extract information
        local players_online=$(echo "$json_response" | grep -o '"playersOnline":[0-9]*' | cut -d: -f2)
        local players_max=$(echo "$json_response" | grep -o '"playersMax":[0-9]*' | cut -d: -f2)
        local version=$(echo "$json_response" | grep -o '"version":"[^"]*"' | cut -d: -f2 | tr -d '"')
        local latency=$(echo "$json_response" | grep -o '"latency":[0-9]*' | cut -d: -f2)
        local motd=$(echo "$json_response" | grep -o '"motd_clean":"[^"]*"' | cut -d: -f2 | tr -d '"')
        local level=$(echo "$json_response" | grep -o '"levelName":"[^"]*"' | cut -d: -f2 | tr -d '"')
        local gamemode=$(echo "$json_response" | grep -o '"gamemode":"[^"]*"' | cut -d: -f2 | tr -d '"')
        
        echo "📊 Players: $players_online/$players_max"
        echo "🏷️  Version: $version"
        echo "📡 Latency: ${latency}ms"
        echo "📝 MOTD: $motd"
        echo "🌍 Level: $level"
        echo "🎮 Game Mode: $gamemode"
    else
        print_status $RED "❌ Bedrock Server is OFFLINE"
        local error_message=$(echo "$json_response" | grep -o '"message":"[^"]*"' | cut -d: -f2 | tr -d '"')
        local error_code=$(echo "$json_response" | grep -o '"code":"[^"]*"' | cut -d: -f2 | tr -d '"')
        echo "🚫 Error: $error_message ($error_code)"
    fi
}

# Function to download server icon
download_icon() {
    local server=$1
    local url="${API_BASE}/png/${server}"
    local filename="${server//[^a-zA-Z0-9._-]/_}-icon.png"
    
    print_status $BLUE "Downloading server icon for: $server"
    
    if curl -s -f "$url" -o "$filename"; then
        print_status $GREEN "✅ Icon saved as: $filename"
    else
        print_status $YELLOW "⚠️  No icon available or server offline"
    fi
}

# Main execution
echo "🔥 HeatBlock API Bash Example"
echo "🕐 Timestamp: $(date)"
echo "================================"

# Check if curl is available
if ! command -v curl &> /dev/null; then
    print_status $RED "❌ curl is required but not installed."
    exit 1
fi

case "$EDITION" in
    java)
        check_java_server "$SERVER"
        echo
        download_icon "$SERVER"
        ;;
    bedrock)
        check_bedrock_server "$SERVER"
        ;;
    both)
        check_java_server "$SERVER"
        echo
        echo "================================"
        echo
        check_bedrock_server "$SERVER"
        ;;
    *)
        print_status $RED "❌ Invalid edition: $EDITION"
        echo "Usage: $0 [server-address] [java|bedrock|both]"
        exit 1
        ;;
esac

echo
print_status $BLUE "Script completed successfully!"