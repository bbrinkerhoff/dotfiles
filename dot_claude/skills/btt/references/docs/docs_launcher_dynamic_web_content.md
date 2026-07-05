# Source: https://docs.folivora.ai/docs/launcher/dynamic_web_content

- [
- [Launcher
- Integrated Dynamic Web Content

# Integrated Dynamic Web Content

The Launcher supports to include arbitrary [Floating Menus. Floating Menus support including web view items. This makes for a very powerful combination.


Here is a simple example that passes the Launcher prompt to a dictionary website:


Sorry, your browser doesn't support embedded videos, but don't worry, you can
[download it
and watch it with your favorite video player!


## Configuration Steps[​


Sorry, your browser doesn't support embedded videos, but don't worry, you can
[download it
and watch it with your favorite video player!


# Step 0: Use Floating Menu Template


Best start with the "Launcher Webview Template". It contains a working floating menu that loads google.com with your launcher's prompt. You can modify that to fit your use case.


![Template](/assets/images/integrated_web_content2026-05-04T09:20:27.634Z-8b9bb481f8ed699176c0d25c472916e8.png)


# Step 1: Define A Floating Menu


For the Floating Menu best set the availability  to "Only Embedded":

![Only Embedded](/assets/images/integrated_web_content2026-05-04T09:19:01.430Z-77d22c2dad956feffc4e6873889443cd.png)


# Step 2: Set a Launcher Keyword:


A Launcher Keyword allows you to type e.g. "g hello world" into the launcher to search Google for "hello world":

![Keyword](/assets/images/integrated_web_content2026-05-04T09:21:42.237Z-fb7315ae65309e499b7259387ce1ec3e.png)


# Step 3: Configure The Web View


Configure the web view to load a URL with the launcher's prompt as URL parameter. The variable BTTLauncherPromptInputWithoutKeyword contains the entered prompt without the keyword, so for example "g hello world" would store "hello world" in that variable.


Use that variable in any URL like this (in curly braces):

```
`https://www.google.com/search?q={BTTLauncherPromptInputWithoutKeyword}
`
```


![Webview](/assets/images/integrated_web_content2026-05-04T09:22:34.888Z-f537b9a069109c3d4a2194f89864873a.png)
[PreviousInclude Existing BTT Triggers[NextWindow Snapping

- [Configuration StepsCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
