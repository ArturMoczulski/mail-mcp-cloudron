# Mail MCP for Cloudron

This package runs `Wh1isper/mcp-email-server` behind an nginx bearer-token gateway.

## Required environment

- `MCP_BEARER_TOKEN`: exactly 64 hexadecimal characters.
- `MCP_EMAIL_SERVER_EMAIL_ADDRESS`: mailbox address.
- `MCP_EMAIL_SERVER_PASSWORD`: mailbox password.
- `MCP_EMAIL_SERVER_IMAP_HOST`: IMAP hostname.

## Recommended Cloudron mailbox settings

```text
MCP_EMAIL_SERVER_ACCOUNT_NAME=assistant
MCP_EMAIL_SERVER_FULL_NAME=Artur's AI Assistant
MCP_EMAIL_SERVER_EMAIL_ADDRESS=arturs.ai.assistant@elev8d.io
MCP_EMAIL_SERVER_USER_NAME=arturs.ai.assistant@elev8d.io
MCP_EMAIL_SERVER_IMAP_HOST=my.elev8d.io
MCP_EMAIL_SERVER_IMAP_PORT=993
MCP_EMAIL_SERVER_IMAP_SSL=true
MCP_EMAIL_SERVER_IMAP_START_SSL=false
MCP_EMAIL_SERVER_IMAP_VERIFY_SSL=true
MCP_EMAIL_SERVER_SMTP_HOST=my.elev8d.io
MCP_EMAIL_SERVER_SMTP_PORT=587
MCP_EMAIL_SERVER_SMTP_SSL=false
MCP_EMAIL_SERVER_SMTP_START_SSL=true
MCP_EMAIL_SERVER_SMTP_VERIFY_SSL=true
MCP_EMAIL_SERVER_ENABLE_ATTACHMENT_DOWNLOAD=false
MCP_EMAIL_SERVER_ENABLE_ATTACHMENT_CONTENT=false
MCP_EMAIL_SERVER_ALLOWED_RECIPIENTS=
MCP_EMAIL_SERVER_LOG_LEVEL=INFO
```

An empty `MCP_EMAIL_SERVER_ALLOWED_RECIPIENTS` disables sending and recipient-bound draft saves. Add exact addresses or carefully reviewed glob patterns later.

## Endpoint

```text
https://mail-mcp.elev8d.io/mcp
```

Use static bearer authentication with the generated token. Do not put the token in source control or chat messages.
