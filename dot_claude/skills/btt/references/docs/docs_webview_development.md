# Source: https://docs.folivora.ai/docs/webview/development

- [
- [Custom Scriptable WebView
- Development Hints

# Development Hints

## Development Hints[​


Some useful tips & tricks that make working with the web view easier.


1.) **Use an external HTML file.** Best solution is to place it in the preset's data folder and reference it using BTT_PRESET_PATH/thenameofthefile.html. You can use your favorite editor (I recommend Visual Studio Code) to edit the file.

![mcc](/assets/images/webview_preset_folder-ddbf9832de7cfd2137168ce83c793c2e.png)


2.) **Disable caching while developing.** You probably want the webview to automatically reload when hiding / closing it. To achieve this, enable the "DO NOT keep active in background" option.

![webview_background](/assets/images/webviewactivebackground-09610070c6d9259ef2263bbf81ffbc63.png)


3.) **Use the debugger / inspector.** You can right-click any BTT webview and choose "Inspect Element" to open the webview inspector. This can be a bit slow though. If you want faster debugging enable Safari's developer mode, then you can also access the BTT webviews through the Safari Develop menu:


![safaridebug](/assets/images/safaridebug-1d73ff4ed9b269bee7e177a38ac2bd92.png)
[PreviousStarter Template[NextStream Deck

- [Development HintsCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
