# Mail MCP

Cloudron packaging for Wh1isper's open-source `mcp-email-server` with a static bearer-token gateway in front of its Streamable HTTP transport.

The public MCP endpoint is `/mcp`. Every request to that endpoint must include `Authorization: Bearer <token>`. The health endpoint is `/healthz` and does not expose mailbox data.

The package defaults to no attachments and no allowed recipients. An empty recipient allowlist disables sending and recipient-bound draft saves upstream.
