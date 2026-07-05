# Source: https://docs.folivora.ai/docs/ai-assistants/memory

- [
- [AI Assistants
- Persistent Memory

# Persistent Memory


Persistent memory lets an assistant remember useful information across conversations. Memories are stored locally on your Mac and can be searched later by the assistant when memory tools are enabled.


## What To Save[​


Good memories are stable and useful:


- preferences

- recurring goals

- decisions

- facts about your setup

- important project notes

- todos you want the assistant to remember


Avoid saving temporary observations, passwords, API keys, or private information that should not be sent back to an AI provider in future conversations.


## How It Works[​


When a skill grants memory access, the assistant can:


- save a memory

- recall relevant memories

- forget old or wrong memories


BTT can also add a compact memory bulletin to the assistant's context so it starts with the most relevant remembered information.


## Storage[​


Memories are stored in a local SQLite database:

```
`~/Library/Application Support/BetterTouchTool/AI/Memory/memory.db
`
```


Even though the database is local, recalled memories become part of the assistant request and may be sent to the selected AI provider.[PreviousExtended Thinking[NextInitial Screenshot Or Message

- [What To Save
- [How It Works
- [StorageCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
