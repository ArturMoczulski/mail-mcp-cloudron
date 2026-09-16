FROM cloudron/base:5.1.0@sha256:1c0666c9abe9e2090d33686826d4e97769b799124573118d41e0d7485135748e

ARG MCP_EMAIL_SERVER_VERSION=1.6.2

RUN mkdir -p /app/code /app/data /run/nginx \
    && python3 -m venv /app/code/venv \
    && /app/code/venv/bin/pip install --no-cache-dir "mcp-email-server==${MCP_EMAIL_SERVER_VERSION}"

COPY nginx.conf.template /app/code/nginx.conf.template
COPY supervisor-mail-mcp.conf /etc/supervisor/conf.d/mail-mcp.conf
COPY supervisor-nginx.conf /etc/supervisor/conf.d/nginx.conf
COPY start.sh /app/code/start.sh

RUN chmod +x /app/code/start.sh \
    && ln -sf /run/supervisord.log /var/log/supervisor/supervisord.log

WORKDIR /app/code
CMD ["/app/code/start.sh"]
