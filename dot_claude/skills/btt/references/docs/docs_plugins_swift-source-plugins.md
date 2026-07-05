# Source: https://docs.folivora.ai/docs/plugins/swift-source-plugins

- [
- Plugins
- Swift Source Plugins

# Swift Source Plugins


The simplest way to create a BetterTouchTool plugin. Write a single `.swift` file, drop it into the Plugins folder, and BTT compiles and loads it automatically - no Xcode project required.


## Requirements[​


- Xcode Command Line Tools must be installed: `xcode-select --install`


## How It Works[​


- Create a `.swift` file containing your plugin class

- Drop it onto the BTT preferences window, or copy it to either `~/Library/Application Support/BetterTouchTool/Plugins/` or `/Library/Application Support/BetterTouchTool/Plugins/`

- BTT detects the file and asks: *"Compile & Load?"*

- On approval, BTT compiles it with `swiftc` into a plugin bundle

- The plugin becomes available immediately


If you edit the `.swift` file, BTT detects the change and offers to recompile. Deleting the `.swift` file automatically removes the compiled bundle.


## Metadata Comments[​


Add optional metadata comments at the top of your file to configure the plugin:

```
`// BTT-Plugin-Name: My Widget
// BTT-Plugin-Identifier: com.myname.mywidget
// BTT-Plugin-Type: FloatingMenuWidget
// BTT-Plugin-Icon: star.fill
`
```


|  | Comment | Description | Default if omitted |
|  | `BTT-Plugin-Name` | Display name in BTT | Filename without extension |
|  | `BTT-Plugin-Identifier` | Unique reverse-domain identifier | `com.btt.swift.<filename>` |
|  | `BTT-Plugin-Type` | Plugin type | Inferred from protocol conformance |
|  | `BTT-Plugin-Icon` | SF Symbol name for the icon | None |


Supported `BTT-Plugin-Type` values: `FloatingMenuWidget`, `Action`, `StreamDeck`, `TouchBar`, `Trigger`, `Launcher`


## Protocols and Bridging Header[​


All plugin protocols are defined in `BTTSwiftPluginHeader.h`, shipped inside the BTT app bundle. The bridging header is automatically provided during compilation - you don't need to import it manually. Just conform to the protocol and BTT handles the rest.


## Examples by Plugin Type[​


### Floating Menu Widget[​

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

    static func widgetMinWidth() -> CGFloat { 200 }
    static func widgetMinHeight() -> CGFloat { 80 }

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


See [Floating Menu Widget Plugins for the full protocol reference, SwiftUI support, and custom action categories.


### Stream Deck[​

```
`// BTT-Plugin-Name: Counter
// BTT-Plugin-Type: StreamDeck
// BTT-Plugin-Icon: number.circle.fill

import Cocoa

class Counter: NSObject, BTTStreamDeckPluginInterface {
    weak var delegate: (any BTTStreamDeckPluginDelegate)?
    private var count = 0

    static func configurationFormItems() -> BTTPluginFormItem? { nil }

    func widgetTitleStrings() -> [String]? {
        return ["\(count)"]
    }

    func buttonDown(_ identifier: String) -> Bool {
        count += 1
        delegate?.requestUpdate(self)
        return false // return true to cancel assigned BTT actions
    }

    func buttonUp(_ identifier: String) -> Bool {
        return false
    }
}
`
```


See [Stream Deck Plugins for the full protocol reference and all rendering options.


### Touch Bar[​

```
`// BTT-Plugin-Name: Clock Text
// BTT-Plugin-Type: TouchBar
// BTT-Plugin-Icon: clock

import Cocoa

class ClockText: NSObject, BTTPluginInterface {
    weak var delegate: (any BTTTouchBarPluginDelegate)?

    static func configurationFormItems() -> BTTPluginFormItem? { nil }

    func touchBarTitleString() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: Date())
    }
}
`
```


See [Touch Bar Plugins for the full protocol reference and all rendering options.


### Action[​

```
`// BTT-Plugin-Name: Show Greeting
// BTT-Plugin-Type: Action
// BTT-Plugin-Icon: bubble.left.fill

import Cocoa

class ShowGreeting: NSObject, BTTActionPluginInterface {
    weak var delegate: (any BTTActionPluginDelegate)?

    static func configurationFormItems() -> BTTPluginFormItem? { nil }

    func executeAction(
        withConfiguration config: [String: Any]?,
        completionBlock: @escaping (Any?) -> Void
    ) {
        let alert = NSAlert()
        alert.messageText = "Hello from a BTT Action Plugin!"
        alert.runModal()
        completionBlock("done")
    }
}
`
```


See [Action Plugins for the full protocol reference.


### Trigger[​

```
`// BTT-Plugin-Name: Clipboard Change
// BTT-Plugin-Type: Trigger
// BTT-Plugin-Icon: doc.on.clipboard

import Cocoa

class ClipboardChangeTrigger: NSObject, BTTTriggerPluginInterface {
    weak var delegate: (any BTTTriggerPluginDelegate)?
    private var timer: Timer?
    private var lastChangeCount = NSPasteboard.general.changeCount

    static func triggerName() -> String { "Clipboard Change" }
    static func triggerDescription() -> String { "Fires when clipboard content changes" }
    static func triggerIcon() -> String { "doc.on.clipboard" }
    static func configurationFormItems() -> BTTPluginFormItem? { nil }
    func didReceiveNewConfigurationValues(_ config: [String: Any]?) {}

    func startObserving() {
        lastChangeCount = NSPasteboard.general.changeCount
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self else { return }
            let current = NSPasteboard.general.changeCount
            if current != self.lastChangeCount {
                self.lastChangeCount = current
                let content = NSPasteboard.general.string(forType: .string) ?? ""
                self.delegate?.triggerFired(self, withContext: ["clipboardContent": content])
            }
        }
    }

    func stopObserving() {
        timer?.invalidate()
        timer = nil
    }
}
`
```


See [Trigger Plugins for the full protocol reference, lifecycle management, and more examples.


### Launcher[​

```
`// BTT-Plugin-Name: Demo Launcher Plugin
// BTT-Plugin-Type: Launcher
// BTT-Plugin-Icon: sparkles.rectangle.stack

import AppKit
import SwiftUI

class DemoLauncherPlugin: NSObject, BTTLauncherPluginInterface {
    weak var delegate: (any BTTLauncherPluginDelegate)?

    static func launcherPluginName() -> String { "Demo Launcher Plugin" }
    static func launcherPluginDescription() -> String { "Shows custom launcher results" }
    static func launcherPluginIcon() -> String { "sparkles.rectangle.stack" }

    func launcherResults(for context: BTTLauncherPluginContext) -> [BTTLauncherPluginResult]? {
        let result = BTTLauncherPluginResult()
        result.itemIdentifier = "demo-root"
        result.title = "Launcher Plugin Demo"
        result.subtitle = "Returned by a native launcher plugin"
        result.systemImageName = "sparkles.rectangle.stack"
        result.surfaceIdentifier = "demo-surface"
        return [result]
    }

    func launcherSurface(
        forItemIdentifier itemIdentifier: String,
        surfaceIdentifier: String?,
        context: BTTLauncherPluginContext
    ) -> (any BTTLauncherPluginSurfaceInterface)? {
        DemoLauncherSurface()
    }
}

final class DemoLauncherSurface: NSObject, BTTLauncherPluginSurfaceInterface {
    func makeLauncherSurfaceView() -> NSView {
        NSHostingView(rootView: DemoLauncherSurfaceView())
    }
}

struct DemoLauncherSurfaceView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Hello from a launcher surface", systemImage: "sparkles.rectangle.stack")
                .font(.title3.weight(.semibold))

            Text("This view is rendered with SwiftUI and hosted inside the BetterTouchTool Launcher.")
                .foregroundStyle(.secondary)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}
`
```


See [Launcher Plugins for the full protocol reference, commands, launcher surfaces, context values, and Xcode bundle setup.


## BTT Variable Access[​


All plugin types have access to BTT variables through their delegate:

```
`// Set a variable (accessible as {variable_name} throughout BTT)
delegate?.setVariable("my_var", value: "hello")

// Read a variable
let value = delegate?.getVariable("my_var")
`
```


## Adding Configuration Forms[​


Any Swift source plugin can include user-configurable settings by implementing `configurationFormItems()`:

```
`static func configurationFormItems() -> BTTPluginFormItem? {
    let group = BTTPluginFormItem()
    group.formFieldType = BTTFormTypeFormGroup

    let textField = BTTPluginFormItem()
    textField.formFieldType = BTTFormTypeTextField
    textField.formLabel1 = "Label Text"
    textField.formFieldID = "labelText"
    textField.defaultValue = "Hello!"

    group.formOptions = [textField]
    return group
}

func didReceiveNewConfigurationValues(_ configurationValues: [String: Any]?) {
    // Values arrive with a "plugin_var_" prefix on the formFieldID
    if let text = configurationValues?["plugin_var_labelText"] as? String {
        labelText = text
    }
}
`
```


Use plain field IDs in `configurationFormItems()`, for example `labelText`; BTT applies the `plugin_var_` prefix when saving and delivering configuration values. For trigger plugins, configuration is saved per configured BTT trigger instance and is delivered before `startObserving()` runs.


See the [Configuration Forms Reference for all available field types.[PreviousPlugin Overview[NextTouch Bar Plugins

- [Requirements
- [How It Works
- [Metadata Comments
- [Protocols and Bridging Header
- [Examples by Plugin Type

- [Floating Menu Widget
- [Stream Deck
- [Touch Bar
- [Action
- [Trigger
- [Launcher
- [BTT Variable Access
- [Adding Configuration FormsCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
