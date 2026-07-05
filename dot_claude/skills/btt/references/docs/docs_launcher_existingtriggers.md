# Source: https://docs.folivora.ai/docs/launcher/existingtriggers

- [
- [Launcher
- Include Existing BTT Triggers

# Include Existing BetterTouchTool Triggers In The Launcher


Every trigger (AND every group!) in BTT can be included in the Launcher. To do that, select the trigger and scroll down to the bottom of its configuration sidebar. There you'll see the "Launcher Config"


![alt text](/assets/images/use_existing_triggers2026-04-29T18:21:23.094Z-1e695a9f00a4c8f4400abb89c3b72cea.png)


![alt text](/assets/images/use_existing_triggers2026-04-29T18:22:55.486Z-203c9ae8deea9530419d82d2a764149d.png)


# Filtering Options


By default configured BetterTouchTool triggers are set to "Don't Include In Launcher". To include it in the Launcher choose one of these options:


- 


**Show In Launcher (Filter With Prompt)**
The trigger will always show at the Launcher while no prompt / search is entered. If something is entered, it will only show if the search matches the defined title.


- 


**Only Show If Keyword Matches**
The trigger will now show by default at the top level. It will however show up if the entered search / prompt matches the assigned keyword


- 


**Only Show If Prompt Matches**
The trigger will now show by default at the top level. It will however show up if the entered search / prompt matches the defined title.


- 


**Only Show If Prompt Matches Or Nothing Else Matches**
The trigger will now show by default at the top level. It will however show up if the entered search / prompt matches the assigned keyword OR if search / prompt text is entered but doesn't match anything else.


- 


**Show In Launcher (Ignore Prompt, Always Show)**
The trigger will always show regardless of whether the prompt is empty or not and regardless of whether the prompt matches any part of the launcher config.


# Dynamic Behavior Based On The Prompt Input


Once a configured trigger is called from the launcher it has these three variables available:


- `BTTLauncherPrompt` — the full current prompt text.

- `BTTLauncherPromptKeyword` — the first whitespace-separated word of the prompt

- `BTTLauncherPromptInputWithoutKeyword` — the remainder of the prompt after the first word.


So for example you might want to open a URL with Google Chrome. You could assign the keyword "gc" to a trigger and make it "Only Show If Keyword Matches". Now when you'd type "gc [https://apple.com" the url will be available via variable BTTLauncherPromptInputWithoutKeyword


![alt text](/assets/images/use_existing_triggers2026-04-29T19:06:00.333Z-9e5c0e3b26547821773c1d7862497176.png)


![alt text](/assets/images/use_existing_triggers2026-04-29T19:06:27.097Z-bda8071f22e22877f0e2bedbe106b59e.png)


Of course these variables can be used with lots of BTT's actions, [in conditions, or with the various [scripting options in BTT.[PreviousDynamically Generated Content[NextIntegrated Dynamic Web ContentCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
