# Source: https://docs.folivora.ai/docs/notch-bar/customization

- [
- [Notch Bar (Deprecated)
- Notch Bar Customization

# BetterTouchTool Notch Bar Customization


## Standard Customization[​


Every item or widget you put onto the Notch Bar does offer the option to add extra CSS styles or classes to it (scroll to the very bottom of the UI/Colors section). This is the easiest way to achieve customization.

![notchbar-customization](/assets/images/notchbar_css-2149ce081560e00b3a35afdcce2d478d.jpg)


## HTML Widgets[​


BetterTouchTool allows you to add completely custom HTML, CSS and JavaScript widgets.
These widgets can contain any HTML/CSS/JS that is supported by the latest Safari.


To trigger the actions assigned to the custom HTML widget in BTT, use the triggerAssignedActions function like this:

```
`<div onclick="triggerAssignedActions(event.target)">Something</div>
`
```


![notchbar-html-widget](/assets/images/notchbar_custom_widget-83ff72186918ef3adb12a2e4409600b9.png)


## Full Customization[​


The BTT Notch Bar is **completely** customizable because it is based on HTML5. All templates are located in ~/Library/Application Support/BetterTouchTool/NotchBar


You can use any function available to the BTT floating webview, see


- [Floating HTML Menu


However these files can change when upgrading to a newer BTT version (BTT will ask what to do when a new version contains changes). In general it's best to just edit the two user files which will not be changed on BTT updates:


BTTNotchBarUser.css
BTTNotchBarUser.js


In case you need to include custom Notch Bar layouts in your presets, you can also move them to ~/Library/Application Support/BetterTouchTool/PresetBundles/YOURPRESETFOLDER, then they will be exported when you export your preset.


![notchbar](/assets/images/notchbar_fullscreen-7528a8b77dfdfb7bd1a0fb1bdc42b1be.png)
[PreviousNotch Bar Placement

- [Standard Customization
- [HTML Widgets
- [Full CustomizationCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
