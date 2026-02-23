//rename file to `.mcp.json` and put in claude code folder or copy content to claude desktop

//also ALWAYS demand claude to always use `{{ JSON.stringify($json.articles).replace(/"/g, '\\"') }}`

{
  "mcpServers": {
    "n8n-mcp": {
      "command": "cmd",
      "args": ["/c", "npx", "n8n-mcp"],
      "env": {
        "MCP_MODE": "stdio",
        "LOG_LEVEL": "error",
        "DISABLE_CONSOLE_OUTPUT": "true",
        "N8N_API_URL": "your n8n cloud link",
        "N8N_API_KEY": "you n8n api key"
      }
    },
    "n8n-workflows Docs": {
      "command": "cmd",
      "args": [
        "/c",
        "npx",
        "mcp-remote",
        "https://gitmcp.io/Zie619/n8n-workflows"
      ]
    },
    "Context7": {
      "command": "cmd",
      "args": ["/c", "npx", "-y", "@upstash/context7-mcp"]
    }
  }
}
