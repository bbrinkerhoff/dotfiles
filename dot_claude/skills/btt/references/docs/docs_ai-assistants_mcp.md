# Source: https://docs.folivora.ai/docs/ai-assistants/mcp

- [
- [AI Assistants
- External MCP Servers

# External MCP Servers


BetterTouchTool assistants can use external MCP servers as additional tool providers. This is useful when a feature is better provided by another app, command line tool, local service, or project-specific MCP server.


## Configuration[​


The main BTT MCP client configuration file is:

```
`~/Library/Application Support/BetterTouchTool/AI/btt-mcp-config.json
`
```


You can edit it directly or through BTT's UI.


Example:

```
`{
  "mcpServers": {
    "shell": {
      "command": "uvx",
      "args": ["mcp-shell-server"],
      "env": {
        "ALLOW_COMMANDS": "say,ls,cat,pwd,grep,wc,find"
      }
    }
  }
}
`
```


After adding a server, expose its tools through a skill or through the assistant's advanced tool configuration. Prefer creating a small custom skill for MCP tools you use often.


## Other Supported Locations[​


BTT can also read MCP configuration from:

```
`~/.config/btt/mcp/.mcp.json
~/.btt/mcp/.mcp.json
/Library/Application Support/BetterTouchTool/AI/
`
```


Pick one location and keep it consistent.


## BTT As An MCP Server[​


If you want Codex, Claude Code, or another external MCP client to use your configured BTT assistants, see [BTT as MCP Provider.[PreviousInitial Screenshot Or Message[NextBTT As MCP Provider

- [Configuration
- [Other Supported Locations
- [BTT As An MCP ServerCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
