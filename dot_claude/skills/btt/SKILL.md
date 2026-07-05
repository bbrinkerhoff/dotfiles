---
name: btt
description: >
  BetterTouchTool (BTT) expert assistant. Use this skill any time the user mentions BetterTouchTool,
  BTT, or any of its features: trackpad/magic mouse gestures, Touch Bar customization, Stream Deck
  configuration, keyboard shortcuts, hyper keys, floating menus, desktop widgets, window snapping,
  the notch bar, scripting BTT with AppleScript or JavaScript, URL triggers, named triggers,
  MIDI triggers, the BTT webserver, variables, CLI tools, plugins, presets, or anything related
  to automating a Mac using BetterTouchTool. Also trigger when the user asks how to do something
  on Mac that BTT could solve (gestures, hotkeys, window management, custom menus, launching apps
  from a custom launcher, clipboard management, text snippets). If the user says "BTT" at all,
  use this skill. Also use this skill when the user wants to connect BTT as an MCP server or
  control BTT programmatically from Claude Code. Use this skill for any Mac automation task
  that could benefit from BTT scripting, variables, or background computer use.
---

# BetterTouchTool Expert Assistant

BetterTouchTool (BTT) is a powerful macOS automation app. It is also connected as an MCP server
in this session, giving direct programmatic control over BTT and the Mac.

## Step 1: Check MCP availability (do this first)

Before answering any BTT question, check if the BTT MCP tools are available in this session.
Look for tools named run_javascript, list_btt_assistants, or get_variable_value in your available
tool list. If present:
- Prefer using the MCP directly over generating instructions for the user to follow manually
- The MCP lets you actually make changes, run scripts, and control BTT on the user's behalf

If MCP tools are NOT available, fall back to generating UI walkthrough instructions and code.

## Step 2: Optional session flow (when MCP is available)

For complex tasks, use assistant-session mode:
1. Call list_btt_assistants to see configured BTT AI assistants
2. Call activate_btt_assistant with the identifier
3. Call load_bettertouchtool_assistant_instructions and follow the returned instructions

For simple tasks you can skip activation and call tools directly.

---

## BTT MCP Tools Reference (43 tools available)

Most tools are "advertised up front" but require an activated assistant to actually execute.
The most reliably available ones without activation are the session management tools.

### Session management
- list_btt_assistants — list configured BTT AI assistants
- activate_btt_assistant — activate an assistant (gates most other tools)
- load_bettertouchtool_assistant_instructions — get active assistant instructions
- deactivate_btt_assistant / reset_btt_assistant_conversation

### Core automation (most useful after activation)
- run_javascript — PRIMARY BTT CONTROL TOOL. Executes JS via BTT's JavaScriptCore runtime.
  Use the ai object for BTT functions: ai.callBTT(...), ai.runAppleScript(...), etc.
  Always call search_function_library first to check if a similar function already exists.
- get_variable_value / set_variable_value — read/write BTT persistent variables
- compile_swift_plugin — compile and load a Swift plugin (shows user confirmation dialog first)

### Screenshots & screen reading
- screenshot / screenshot_window — take screenshots
- background_get_window_state — get window AX tree + screenshot without activating it

### Background computer use (no focus disruption — operates on apps without bringing them front)
- background_click — click in an app without activating it
- background_click_element — click AX element by index from background_get_window_state
- background_set_element_value — set a UI element value without activation
- background_send_shortcut — send keyboard shortcut to app by PID
- background_press_key — press a key in app by PID
- background_scroll — scroll in background app
- background_launch_app — launch app without bringing it to front
- background_check_permissions — verify background computer use permissions
- show_background_agent_cursor / hide_background_agent_cursor — fake cursor overlay

### Standard computer use
- computer_20250124 — computer use (Anthropic spec): screenshots, mouse, keyboard
- computer_use_preview — computer use (OpenAI Responses API spec)

### App menu bar
- retrieve_app_menubar_items — query an app's menu bar items and their state
- find_menubar_item — find a menu item by name, get its path
- trigger_menubar_item — trigger a menu item (prefers background shortcut when available)

### Memory & knowledge
- memory_save / memory_recall / memory_forget — BTT's persistent memory
- search_function_library — search previously generated JS functions (call before writing new code)
- get_execution_log — see recently executed JS functions

### Utilities
- sequential_thinking / think — structured reasoning tools
- file_write — write a file (creates dirs, overwrites existing, supports ~)
- web_fetch / web_search — fetch URLs or search DuckDuckGo
- render_interactive_content — render HTML/CSS/JS inline in chat
- provide_file_to_user — offer a file for download in chat

---

## Using run_javascript

This is the primary MCP tool for controlling BTT. It runs JS in BTT's JavaScriptCore runtime
(NOT a browser). Use the ai object for all BTT functions:

```javascript
// Trigger a named trigger
await ai.callBTT("trigger_named", { trigger_name: "myTrigger" });

// Set a variable
await ai.callBTT("set_persistent_string_variable", { variableName: "myVar", to: "hello" });

// Get a variable
let val = await ai.callBTT("get_string_variable", { variableName: "myVar" });

// Run AppleScript
let result = await ai.runAppleScript(`tell app "Finder" to get name of front window`);

// Paste text
await ai.callBTT("paste_text", { text: "Hello World" });

// Type text
await ai.callBTT("type_string", { string: "hello" });
```

Important: when building strings with backslashes (e.g. Swift or regex), use String.raw`...`
instead of regular backtick strings to preserve backslashes literally.

---

## Writing BTT JavaScript scripts (for use inside BTT actions, not MCP)

When generating scripts to run inside BTT triggers/actions, use this pattern:

```javascript
async function run() {
  // No ai. prefix needed inside BTT actions — functions are global
  let result = await callBTT("get_string_variable", { variableName: "myVar" });
  let output = await runShellScript("echo hello");
  let asResult = await runAppleScript(`tell app "Finder" to get name of front window`);
  await paste_text({ text: "formatted result", insert_by_pasting: true });
  return result;  // REQUIRED — scripts that don't return will hang
}
```

Key functions inside BTT actions: callBTT(), runShellScript(), runAppleScript(), runJXA(),
paste_text(). Load docs_scripting_java-script.md for the full API reference.

---

## Explaining BTT UI workflows

When walking the user through the BTT UI:

1. Open BetterTouchTool
2. In the left sidebar, select the trigger type (Trackpad, Keyboard, Stream Deck, etc.)
3. Check the app scope at top (All Apps or a specific app)
4. Click "+" to add a new trigger
5. Configure the trigger in the panel that appears
6. In the Actions area, click "+" to add an action
7. Choose the action type and configure its options

---

## Reference File Index

All reference docs are in references/docs/. Load 1-3 files relevant to the question.

### Getting started & configuration
- docs_intro.md — introduction and overview
- docs_getting-started_installation.md — install/uninstall
- docs_configuration_basic-overview.md — BTT UI overview
- docs_configuration_new-trigger.md — how to add a new trigger
- docs_configuration_global-vs-app-specific.md — global vs app-specific
- docs_configuration_presets.md — presets, importing/exporting
- docs_configuration_settings.md — BTT settings panel

### Actions
- docs_actions_overview.md — what actions are
- docs_actions_action-definitions.md — JSON reference for every action type (large)
- docs_actions_conditions.md — conditional actions (if/then logic)
- docs_actions_control-flow.md — control flow (delays, loops, branching)
- docs_actions_sending-shortcuts.md — send keyboard shortcuts as an action
- docs_actions_shortcuts-integration.md — macOS Shortcuts app integration
- docs_actions_clipboard-manager.md — clipboard manager actions
- docs_actions_paste-custom-text.md — paste text / text snippets
- docs_actions_text-transformer.md — transform text with regex/JS
- docs_actions_screenshots.md — screenshot actions
- docs_actions_scrolling-zooming-rotating.md — scroll/zoom/rotate actions
- docs_actions_custom-context-menu.md — custom context menus
- docs_actions_finder-context-menu.md — Finder context menu extension
- docs_actions_choose-from-list.md — show a pick-from-list dialog
- docs_actions_manage-menubar-items.md — manage menubar items

### Scripting (JavaScript / AppleScript / CLI)
- docs_scripting_overview.md — scripting overview
- docs_scripting_java-script.md — JavaScript scripting (recommended, full API)
- docs_scripting_apple-script.md — AppleScript scripting (all commands)
- docs_scripting_cli.md — CLI tool (btt command)
- docs_scripting_url-scheme.md — btt:// URL scheme
- docs_scripting_simple-format.md — simple scripting / return value format
- docs_scripting_variables.md — BTT variables (persistent, number, string)
- docs_scripting_webserver.md — BTT built-in webserver (HTTP API)
- docs_scripting_useful-scripts.md — useful script examples

### Keyboard shortcuts
- docs_keyboard-shortcuts_overview.md — keyboard shortcut triggers overview
- docs_keyboard-shortcuts_hyper-key.md — hyper key (Caps Lock -> Cmd+Ctrl+Option+Shift)
- docs_keyboard-shortcuts_key-sequences.md — key sequences (chord shortcuts)
- docs_keyboard-shortcuts_low-level-remap.md — low-level key remapping
- docs_keyboard-shortcuts_logitech-keyboards.md — Logitech keyboard support

### Trackpad & mouse
- docs_trackpad-mouse_magic-mouse-trackpad.md — Magic Trackpad / Magic Mouse gestures
- docs_trackpad-mouse_drawings.md — drawing gestures
- docs_normal-mouse_overview.md — regular mouse configuration
- docs_normal-mouse_assigning-actions.md — assign actions to mouse buttons
- docs_normal-mouse_scroll-modifiers.md — scroll modifiers
- docs_normal-mouse_logitech.md — Logitech mouse support
- docs_normal-mouse_logitech-javascript.md — Logitech JavaScript API (large)

### Floating menus & desktop widgets
- docs_floating-menus_overview.md — floating menus overview
- docs_floating-menus_basics.md — creating floating menus
- docs_floating-menus_item-types.md — item types (buttons, sliders, text, etc.)
- docs_floating-menus_showing-hiding.md — showing/hiding menus
- docs_floating-menus_scripting.md — scripting floating menus (JS API)
- docs_floating-menus_updating-properties.md — updating menu item properties dynamically
- docs_floating-menus_desktop-widgets.md — desktop widgets

### Window snapping
- docs_window-snapping_basic-setup.md — basic setup
- docs_window-snapping_advanced.md — advanced snap areas
- docs_window-snapping_snap-areas.md — custom snap areas
- docs_window-snapping_moving-resizing.md — keyboard-driven move/resize

### Touch Bar
- docs_touch-bar_basics.md — Touch Bar basics
- docs_touch-bar_widgets.md — Touch Bar widgets (large)
- docs_touch-bar_gestures.md — Touch Bar gestures

### Stream Deck
- docs_stream-deck_overview.md — Stream Deck overview
- docs_stream-deck_standard-button.md — standard button setup
- docs_stream-deck_script-widgets.md — script-driven widgets
- docs_stream-deck_groups.md — groups/pages
- docs_stream-deck_app-specific.md — app-specific Stream Deck layouts

### Launcher
- docs_launcher.md — BTT Launcher overview
- docs_launcher_items.md — launcher items
- docs_launcher_dynamic_content.md — dynamic content

### Other triggers
- docs_other-triggers_named-triggers.md — named triggers
- docs_other-triggers_url-triggers.md — URL-based triggers
- docs_other-triggers_text-selection.md — text selection triggers (large)
- docs_other-triggers_statusbar-items.md — status bar items

### Notch bar
- docs_notch-bar_overview.md — notch bar overview
- docs_notch-bar_setup.md — setup
- docs_notch-bar_customization.md — customization

### Plugins
- docs_plugins_overview.md — plugin overview
- docs_plugins_action.md — action plugins
- docs_plugins_trigger.md — trigger plugins
- docs_plugins_swift-source-plugins.md — Swift source plugins
- docs_plugins_floating-menu-widget.md — floating menu widget plugins
- docs_plugins_stream-deck.md — Stream Deck plugins

### JSON definitions
- docs_json_overview.md — JSON config overview
- docs_json_trigger-definitions.md — trigger JSON definitions (large)
- docs_json_examples.md — JSON examples
- docs_json_floating-menu.md — JSON for floating menus (large)

### Webview
- docs_webview_overview.md — custom webview overview
- docs_webview_javascript.md — webview JavaScript API (large)
- docs_webview_starter-template.md — starter HTML template

### AI Assistants & MCP
- docs_ai-assistants_overview.md — BTT AI assistant overview
- docs_ai-assistants_external-mcp-provider.md — BTT as MCP server for Claude Code
- docs_ai-assistants_mcp.md — using external MCP servers inside BTT
- docs_ai-assistants_skills.md — BTT AI skills
- docs_ai-assistants_tools.md — BTT AI tools

---

## Common gotchas

- Many MCP tools require an activated assistant to actually execute (they are gated)
- BTT variables are app-global — use descriptive names to avoid collisions
- JS scripts inside BTT actions MUST return a value — scripts that don't return will hang
- The BTT webserver must be enabled in BTT preferences before using the HTTP API
- Named triggers must be defined before they can be called from scripts
- App-specific triggers take priority over global — check scope when debugging
- Some features (Touch Bar) only work on MacBook Pros with physical Touch Bar hardware