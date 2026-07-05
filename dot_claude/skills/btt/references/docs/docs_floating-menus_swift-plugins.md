# Source: https://docs.folivora.ai/docs/floating-menus/swift-plugins

- [
- [Floating Menu & Desktop Widgets
- Custom Swift Plugin Widgets

# Custom Swift Plugin Widgets for Floating Menus
Moved to Plugins Section

The full plugin documentation has been consolidated into a dedicated **Plugins** section. Please see:


- **[Floating Menu Widget Plugins** - full protocol reference, SwiftUI support, custom action categories, configuration forms

- **[Swift Source Plugins** - how to create simple `.swift` file plugins (no Xcode required)

- **[Plugin Overview** - overview of all plugin types and development approaches


BetterTouchTool allows you to create custom native Swift widgets that can be embedded into floating menus. Plugin widgets appear as a dedicated item type when configuring a floating menu and are rendered natively with full access to macOS APIs.


For a quick start, create a `.swift` file and drop it onto the BTT preferences window:

```
`// BTT-Plugin-Name: Hello Widget
// BTT-Plugin-Type: FloatingMenuWidget
// BTT-Plugin-Icon: hand.wave.fill

import Cocoa

class HelloWidget: NSObject, BTTFloatingMenuWidgetInterface {
    weak var delegate: (any BTTFloatingMenuWidgetDelegate)?

    static func widgetName() -> String { "Hello Widget" }
    static func widgetDescription() -> String { "A simple greeting widget" }
    static func widgetIcon() -> String { "hand.wave.fill" }

    func makeWidgetView() -> NSView {
        let label = NSTextField(labelWithString: "Hello from BTT!")
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .white
        return label
    }

    func widgetDidAppear() {}
    func widgetWillDisappear() {}
}
`
```


See the [Floating Menu Widget Plugins page for the complete documentation.[PreviousKeyboard Shortcuts for Floating Menus[NextNormal Mouse & LogitechCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
