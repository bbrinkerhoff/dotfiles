# Source: https://docs.folivora.ai/docs/actions/finder-context-menu

- [
- [Actions
- Extending Finder Context Menu

# Extending the Finder Context Menu


Starting with BetterTouchTool v4.560 you can extend the Finder context menu with custom menu items. For example this allows you to add "New File Here" items.


‼️ **Important** you need to enable the BetterTouchTool Finder Extension in System Settings => Extensions => Added Extensions ‼️


Here is an example preset that shows how to configure a custom context menu, which when triggered creates a new file in the current folder:
[https://share.folivora.ai/sP/f6b2c92e-c621-4dae-b050-8bbb172b2cd5


![newfolder](/assets/images/new_folder-6d814a024018b6c7086ec141685e000d.png)


The setup is done in the "Automations & Named & Other Triggers" section in BTT by adding a "Custom Finder Context Menu Items" trigger and assigning the "Configure Custom Context Menu Items" action.

![finder1](/assets/images/finder_context_1-94282dcae6f26f0fd1d0dd034f188d79.png)


When the context menu item is triggered, BTT will make these variables available that can be used e.g. in terminal commands or scripts:


- **BTTFinderContextMenuTargetPath** (the path of the current folder)

- **BTTFinderContextMenuSelectedItemPaths** (the paths of the selected items, separated by ;; )

- **BTTFinderContextMenuTriggeredUUID** (the UUID of the context menu item in BTT)


For example with the "Run Terminal Command" action in BTT you can create a new file like this:

```
`touch "{BTTFinderContextMenuTargetPath/newfile.txt}"
`
```


![finder2](/assets/images/finder_context_2-6a50a6b320a7dafa64ecfe214d388388.png)
[PreviousShow List To Choose From[NextManage Menu Bar Status ItemsCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
