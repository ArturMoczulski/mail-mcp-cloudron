#!/bin/bash
set -eu

if [[ ! "${MCP_BEARER_TOKEN:-}" =~ ^[A-Fa-f0-9]{64}$ ]]; then
    echo "MCP_BEARER_TOKEN must be a 64-character hexadecimal token" >&2
    exit 1
fi

mkdir -p /app/data /run/nginx/{body,proxy,fastcgi,uwsgi,scgi}
chown -R cloudron:cloudron /app/data /run/nginx

sed "s/__MCP_BEARER_TOKEN__/${MCP_BEARER_TOKEN}/g" \
    /app/code/nginx.conf.template > /app/data/nginx.conf
chmod 600 /app/data/nginx.conf

exec /usr/bin/supervisord --nodaemon --configuration /etc/supervisor/supervisord.conf
