# Source: https://docs.folivora.ai/docs/menubar/status-items

- [
- Menubar
- Manage Menubar Status Items

# Manage Menubar Status Items using BTT.


Starting with BetterTouchTool 4.615 you can manage your menubar's status items via BTT.


**Note:** This feature is **work in progress**. Please post feature requests, bug reports or questions on [https://community.folivora.ai.


The main discussion for this feature is happening here:
[https://community.folivora.ai/t/bartender-controversy-tutorial-on-how-to-manage-menubar-status-items-via-btt/37429


There are four base features that make this possible:


- The predefined action "Move Menu Bar Status Item To New Position"

- The predefined action "Hide Menu Bar Icons Left Of Specific Icon"

- A "Menubar Status Item" Widget that can be placed in a [Floating Menu

- The predefined action "Search Menu Bar Status Items"


Here is **a ready to use preset** that shows how these features work together:
[Example Preset Download


![status_item_bar](/assets/images/statusitembar-2957335c5125f52d3e21f2c9cce5ec1d.png)


## Configuring the Status Item Bar[​


By default this preset shows a floating bar with all of your menubar status items when you move your mouse to the top right edge of your screen. This bar is configured in the "Custom Floating Menus" section in BTT:


![status_item_bar](/assets/images/statusitembar2-248c519e352d435cb801701fd6bced5f.png)


You can change the appearance of the whole bar or of individual items. You can also hide items from the bar (press cmd+d to hide the selected item)

![status_item_bar](/assets/images/statusitembar3-630c02dff2f3d863d3139eff2025f285.png)


## Configuring Which Status Items To Hide From The BTT bar[​


Hiding items you don't want to have constantly visible is done via the predefined action "Hide Menu Bar Icons Left Of Specific Icon". This action can be assigned to any trigger in BTT, for example you could assign it to a keyboard shortcut.


The preset shared above assigns this action to a [custom menubar status item and configures the action to hide any item left of that item itself.
Once you import the preset an item with this symbol will appear in your menubar: ❮
When clicking this item, it will hide any item that is positioned left of it.


Of course you can cmd+drag this item to the position you want and thereby influence which items in your menubar will be hidden.

![custom_status_bar_item](/assets/images/custommenuitem-64219bd732451b1a6a4d94b095fc8bda.png)


## Configuring Which Status Items To Hide From The Real Menu Bar[​


You can drag items above the "always hidden" section in the BTT UI, then they will always be hidden from the main menubar. (watch the short video above)


## Quick Access For Menu Bar Status Items Via Predefined Action "Search Menu Bar Status Items"[​


![Search Menubar Status Items 1](/assets/images/search_menubar_status_items_setup-276232b9481e75c4edf1cb23a6a7e16b.png)


![Search Menu Bar Status Items 2](/assets/images/search_menubar_status_items_popup-3ff26abeb3d519045e81bc9e118d9f89.png)
[PreviousUseful Script Examples[NextCustom Scriptable WebView

- [Configuring the Status Item Bar
- [Configuring Which Status Items To Hide From The BTT bar
- [Configuring Which Status Items To Hide From The Real Menu Bar
- [Quick Access For Menu Bar Status Items Via Predefined Action "Search Menu Bar Status Items"Community

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
