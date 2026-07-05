# Source: https://docs.folivora.ai/docs/ai-assistants/api-keys

- [
- [AI Assistants
- API Keys And Models

# API Keys And Models


BetterTouchTool AI Assistants work with multiple model backends. You can use cloud APIs, compatible local servers, or command line tools.


## Supported Backends[​


- **OpenAI / OpenAI-compatible APIs**

- **OpenAI Responses-compatible APIs**

- **Anthropic / compatible APIs**

- **ChatGPT Codex subscription**

- **Claude Code CLI**

- **Codex CLI**

- **OpenCode CLI**

- **Apple Foundation Models** on supported macOS versions

- **Local OpenAI-compatible servers**, such as LM Studio or Ollama

- **Aggregator services**, such as OpenRouter or other compatible providers


## Setup[​


- Create an API key or sign in using the provider's normal setup flow.

- In the assistant configuration, choose the matching API type.

- Paste the key or configure the local command/server URL.

- Pick a model that supports the features you want to use.

- Set a spending limit with the provider when using paid cloud APIs.


For local OpenAI-compatible servers, common URLs are:

```
`LM Studio: http://127.0.0.1:1234/v1/chat/completions
Ollama:    http://localhost:11434/v1/chat/completions
`
```


## Choosing A Model[​


Use a strong cloud model for automation, BTT configuration changes, plugin creation, and computer use. Smaller or local models are often fine for summarizing text, rewriting selected text, and simple chat.


Tool use quality matters more than raw chat quality for automation assistants. If an assistant seems to ignore tools, choose a model with better tool-calling support or reduce the number of active skills.


## Privacy[​


BTT sends assistant messages, enabled context, tool results, and attachments directly to the selected provider. Keep sensitive context and powerful skills disabled unless they are needed for the current assistant.[PreviousGetting Started[NextSkills

- [Supported Backends
- [Setup
- [Choosing A Model
- [PrivacyCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
