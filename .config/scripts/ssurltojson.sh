#!/bin/sh
encoded=$(echo "$1" | sed 's|^ss://||; s|@.*$||')
decoded=$(echo "$encoded" | base64 -d)
addr=$(echo "$1" | awk 'match($0, /@[0-9.:]+/, a) { print substr(a[0], 2) }')

server="${addr%:*}"
server_port="${addr#*:}"
password="${decoded#*:}"
method="${decoded%:*}"
local_port="1080"

jq -n \
    --arg server "$server" \
    --argjson port "$server_port" \
    --arg password "$password" \
    --arg method "$method" \
    --argjson local_port "$local_port" \
    '{
    "inbounds": [{
      "port": $local_port,
      "protocol": "socks",
      "settings": { "udp": true }
    }],
    "outbounds": [{
      "protocol": "shadowsocks",
      "settings": {
        "servers": [{
          "address": $server,
          "port": $port,
          "password": $password,
          "method": $method
        }]
      }
    }]
  }'
