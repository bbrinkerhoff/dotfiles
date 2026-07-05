# Source: https://docs.folivora.ai/docs/webview/shortcuts

- [
- [Custom Scriptable WebView
- Shortcuts from the Shortcuts App

# Shortcuts from the Shortcuts App

In the BTT webview you can easily run Shortcuts from the new Shortcuts App introduced with macOS Monterey.
A nice example Shortcut is available here: [https://community.folivora.ai/t/a-fully-customizable-shortcut-launcher-ui/24422


## Example:[​


The BTT webview provides a function called **runAppleShortcut** which takes an object as parameter.
That object has the properties *name* and *input*.

```
`runAppleShortcut({name: 'the name of the shortcut', input: 'some optional input for the shortcut'});
`
```


If you want to provide multiple files as input, please separate them with two semicolons. For example

```
`runAppleShortcut({name: 'multi-file-test', input: '~/Downloads/test1.png;;~/Downloads/test2.png'});
`
```


```
`<html>

<body>
<button id="testButton" onclick="runAppleShortcut({name: 'Some Nice Shortcut', input: 'optional input for the shortcut'})">Run Some Nice Shortcut</button>
</body>
</html>

`
```
[PreviousAppleScripts & Shell Scripts[NextWebView Lifecycle & Notifications

- [Example:Community

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
