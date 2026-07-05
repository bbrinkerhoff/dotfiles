# Source: https://docs.folivora.ai/docs/stream-deck/hold-to-show

- [
- [Stream Deck
- Hold to Show More

# Changing / Showing buttons while holding other buttons


This documentation uses the following example preset to explain some of the features.
[Example Preset Direct Link


## Setup[​


Using conditional activation groups you can show / hide Stream Deck Buttons based on other button's states.
Conditional activation groups are an advanced feature in BTT. You can create a new CAG by pressing the + button on the bottom left in the BetterTouchTool setup window.
If a CAG fulfils all of its defined conditions, it will activate the items configured for it. It basically works like the app specific setups in BTT, but the items are not bound to an active app but to conditions.


When setting up a new Conditional Activation Group BetterTouchTool now offers a new "currentlyPressedStreamDeckButtonIdentifiers" condition, which contains all the identifiers of the Stream Deck buttons that are currently pressed.
Using the "contains" rule, you can check whether the currently pressed buttons include a specific identifier.

![](/media/streamdeck_cag_2.png)


The identifier of a button can be set on the very top of the configuration:

![](/media/streamdeck_cag.png)


In this example the button that "activates" the Conditional Activation Group is set to trigger on "key up" and cancel its default actions if another action is executed while the button is pressed. This allows to use the button to show other buttons while being held down - but also keep the button's action working on key up.[PreviousKey Repeat[NextBind to Device

- [SetupCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
