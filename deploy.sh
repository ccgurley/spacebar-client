#!/bin/sh

if [[ -n "${SERVER_API}" ]]; then
  find /usr/share/nginx/html/ -name *.js -exec sed -i "s|https://api.old.server.spacebar.chat/api|${SERVER_API}|g" {} \;
fi

if [[ -n "${SERVER_CDN}" ]]; then
  find /usr/share/nginx/html/ -name *.js -exec sed -i "s|https://cdn.old.server.spacebar.chat|${SERVER_CDN}|g" {} \;
fi

if [[ -n "${SERVER_GATEWAY}" ]]; then
  find /usr/share/nginx/html/ -name *.js -exec sed -i "s|wss://gateway.old.server.spacebar.chat|${SERVER_GATEWAY}|g" {} \;
fi

if [[ -f "/var/run/nginx.pid" ]]; then
  /usr/sbin/nginx -s reload
fi
