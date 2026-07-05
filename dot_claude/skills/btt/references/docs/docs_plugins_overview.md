# Source: https://docs.folivora.ai/docs/plugins/overview

- [
- Plugins
- Plugin Overview

# Plugins


BetterTouchTool's plugin system lets you extend its functionality with custom native code. Plugins can add new widgets to the Touch Bar, Stream Deck, or floating menus, define custom actions, or create entirely new trigger types that monitor system events.


## Plugin Types[​


BetterTouchTool supports six types of plugins:


|  | Plugin Type | What It Does | Where It Appears in BTT |
|  | [Touch Bar | Renders custom widgets on the Touch Bar | Touch Bar widget selector |
|  | [Stream Deck | Renders custom widgets on Stream Deck buttons | Stream Deck widget selector |
|  | [Floating Menu Widget | Embeds interactive views in floating menus | Floating menu item type picker |
|  | [Action | Defines reusable custom actions | Custom Plugin Actions in action selector |
|  | [Trigger | Monitors events and fires triggers | Other Triggers > Trigger Plugins |
|  | [Launcher | Returns custom results, commands, and native surfaces inside the Launcher | Launcher > Launcher Plugins section |


There is also a no-code option: [JSON Action Plugins let you package reusable action sequences as a single JSON file with configurable form fields - no compilation required.


## Two Development Approaches[​


### 1. Swift Source Plugins (Recommended for most use cases)[​


Write a single `.swift` file and drop it onto the BetterTouchTool window. BTT compiles and loads it automatically. No Xcode project needed.


- Requires Xcode Command Line Tools (`xcode-select --install`)

- Supports all six plugin types

- BTT auto-detects edits and offers to recompile

- See [Swift Source Plugins for details


### 2. Xcode Bundle Plugins[​


For complex plugins with multiple source files, resources, or third-party dependencies, create a full Xcode project that builds a plugin bundle.


- Full control over project structure

- Can include assets, frameworks, and multiple classes

- Requires notarization for distribution to other users

- See [Xcode Bundle Plugins & Distribution for details


## Quick Comparison[​


|  | Feature | Swift Source Plugin | Xcode Bundle Plugin | JSON Action Plugin |
|  | **Setup** | Text editor only | Xcode project | Text editor only |
|  | **Code required** | Single `.swift` file | Swift or Objective-C | No code (JSON only) |
|  | **Plugin types** | All 6 types | All 6 types | Action only |
|  | **Multiple files** | No | Yes | No |
|  | **Third-party deps** | No | Yes | No |
|  | **Distribution** | Share `.swift` file | Must be notarized | Share `.bttjsonplugin` file |
|  | **Auto-recompile** | Yes | No (rebuild in Xcode) | Auto-reloads on change |


## Installing Plugins[​


All plugin types can be installed in these ways:


- **Drag and drop** a plugin file onto the BTT preferences window

- **Copy** to either `~/Library/Application Support/BetterTouchTool/Plugins/` or `/Library/Application Support/BetterTouchTool/Plugins/`

- **Double-click** a plugin bundle to install it


Plugins are managed through the BTT Plugin Manager, accessible from the BTT menu bar.


## BTT Variables[​


All plugin types can read and write BTT variables through their delegate:

```
`// Set a variable (accessible as {variable_name} throughout BTT)
delegate?.setVariable("my_var", value: "hello")

// Read a variable
let value = delegate?.getVariable("my_var")
`
```


## Configuration Forms[​


All plugin types support custom configuration forms that appear in the BTT sidebar. This lets users customize plugin behavior without editing code. See the [Configuration Forms Reference for available field types and properties.


## Source Code & Examples[​


The full plugin source code, Xcode project templates, and sample plugins are available on GitHub:


[https://github.com/folivoraAI/BetterTouchToolPlugins


For launcher-specific behavior from a user's point of view, see [Launcher Plugins. For authoring launcher plugins, see [Launcher Plugins.


If you have questions about creating plugins, reach out via [andreas@folivora.ai or post on the [community forum.[PreviousLeap Motion[NextSwift Source Plugins

- [Plugin Types
- [Two Development Approaches

- [1. Swift Source Plugins (Recommended for most use cases)
- [2. Xcode Bundle Plugins
- [Quick Comparison
- [Installing Plugins
- [BTT Variables
- [Configuration Forms
- [Source Code & ExamplesCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
