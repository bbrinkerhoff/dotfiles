# Source: https://docs.folivora.ai/docs/floating-menus/showing-hiding

- [
- [Floating Menu & Desktop Widgets
- Showing and Hiding

# Showing and Hiding Floating Menus


To make Floating Menus actually useful it's often necessary to only show and position them on demand. In general you can use any trigger BTT provides to show/hide a Floating Menu.
The following actions can be used for this:


- Show Floating Menu

- Hide Floating Menu

- Toggle Floating Menu Hidden / Shown.


Additionally you could also use modifier based visibility that would only show a menu while specific modifiers are pressed (or not pressed) or you can have Floating Menus that only show up in specific applications.


## Positioning[​


Before thinking about how you'd want to show your menu, you should decide where it should be positioned. This needs to be configured on the menu before showing it.
For example, often you'll want to show a menu at your mouse location, these settings would achieve that:

![alt text](/assets/images/floating_menu_position_settings-e17d928a75b6817f833d456e8fce266e.png)


## Choosing Whether A Floating Menu Is Visible On Launch Or Toggle By Action[​


If you plan to show/hide the menu via a trigger (e.g. a keyboard shortcut) make sure to set the menu visibility to be "Toggled Via Action"


![alt text](/assets/images/floating_menu_visibility_toggle_action-df741e92100a8ad0b3bef25e7c22e75a.png)


## Using a Keyboard Shortcut to Show/Hide the Floating Menu[​


Using a keyboard shortcut is probably the easiest way to show/hide a floating menu.
The absolute simplest setup would look like this - you have a shortcut that shows the menu when pressed, and hides it again if you press it again:

![alt text](/assets/images/floating_menu_toggle_shortcut-0a8d417c4000d4d0ca454c629f7b8893.png)


There are also more complex / useful setups possible using keyboard shortcuts. For example you might want to show a menu while holding a specific keyboard shortcut and hide it when releasing the keyboard shortcut.
To achieve this you'd need to split up the keyboard shortcut in two.


Assign the "Show Floating Menu" action to the standard shortcut. Then create an additional shortcut and set it to trigger "On Key Up" and assign the "Hide Floating Menu" action to that.

![alt text](/assets/images/floating_menu_trigger_on_key_up-0fdc13c8bfa23d5c04f8e4a4e5d733bf.png)


![alt text](/assets/images/floating_menu_hide_on_key_up-e6f509ba059976cda0375db64ed4236e.png)


For the "Hide Floating Menu" action it is often also convenient to enable the "Trigger Hovered Item When Menu Is Being Hidden" option.


## Using a Trackpad Gesture to Show/Hide the Floating Menu[​


Using a Trackpad Gesture to Show/Hide a Floating Menu is quite similar to using a keyboard shortcut.


You can set up a simple gesture that shows and hides a menu like this:

![alt text](/assets/images/trackpad_gesture_toggle_floating_menu-23494492d448ef61318944f46016c697.png)


Or you can do a more complex setup where you'd show a Floating Menu when the gesture is triggered and hide the menu when all fingers are removed from the trackpad. This can be achieved by using the "On Touch Release" action trigger category:

![alt text](/assets/images/trackpad_on_touch_release_hide_menu-8b42d1945aa97e2a840fc3cd49d5cdeb.png)


## Showing a Floating Menu in Specific Apps Only[​


To show a menu only in one specific application, you'd add that app to your app list in BTT, and add the menu to that app specifically:


![alt text](/assets/images/floating_menu_app_specific_setup-47fa2248cc56ddc026526f43cd90e739.png)


To make a menu show up in a group of apps or for specific windows or on specific websites, you can create a [conditional activation group and assign it to that


## Showing a Floating Menu While Holding Modifier Keys[​


To only show a menu if specific modifier keys are pressed, use this configuration option in the menu's settings:

![alt text](/assets/images/floating_menu_modifier_visibility-0e9163d9856314874f8c930f3706c35f.png)
[PreviousBasics[NextItem Types

- [Positioning
- [Choosing Whether A Floating Menu Is Visible On Launch Or Toggle By Action
- [Using a Keyboard Shortcut to Show/Hide the Floating Menu
- [Using a Trackpad Gesture to Show/Hide the Floating Menu
- [Showing a Floating Menu in Specific Apps Only
- [Showing a Floating Menu While Holding Modifier KeysCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
