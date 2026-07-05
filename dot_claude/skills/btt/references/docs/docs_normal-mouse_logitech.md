# Source: https://docs.folivora.ai/docs/normal-mouse/logitech

- [
- [Normal Mouse & Logitech
- Logitech Mouse Support

# Logitech Mouse Support


Current versions of BetterTouchTool natively support Logitech Mice (by implementing parts of Logitech's HID++ 2.0 protocol - [https://github.com/Logitech/cpg-docs/tree/master/hidpp20)


Huge thanks to the many testers! Now most of the Logitech mice and [keyboards are supported directly in BetterTouchTool without the need for any other mouse driver/software! Here are some of the mice/keyboards that have been tested successfully: MX Master 3, MX Master 3S, MX Master 4, MX Master 3S For Mac, MX Anywhere 3, MX Anywhere 3S, MX Vertical, MX Ergo Precision, M720, G402, All G502 variants (Proteus Core, Proteus Spectrum, HERO, HERO Wireless, X, X PLUS, X Wireless), G903 / G903 HERO. Others might also work fine!


**Note** This is supposed to be a full alternative/replacement to the Logitech apps like Logitech Options+ or G-Hub. Actually BTT won't work correctly while any of these are installed.


## Setup[​


Go to the "Normal Mouse" section in BetterTouchTool and add a "Logitech Mouse Configuration" item there:

![Logitech Mouse Configuration](/assets/images/logitech_mouse_mx_master_config-7bf893845d57f9ae201113afc4985210.png)


Then select the correct mouse and experiment with the best settings for your use case.


If you want to remap the mouse buttons make sure to check the "Make All Buttons Available For Remapping in BTT" option.


## Example Preset: MX Master[​


Here is an example preset for MX Master (3, 3S, 4) mice that you can import and adapt to your needs. It shows some advanced configuration, you might not need all of it.


[https://folivora.ai/releases/mx_master_example2.bttpreset


![alt text](/assets/images/4000_logitech2026-01-31T13:57:50.362Z-25abdf905f7624cb796e3ec041d61ee4.png)


## Example Preset: MX Vertical[​


Here is an example preset for MX Vertical mice that you can import and adapt to your needs. It shows some advanced configuration, you might not need all of it.


[https://folivora.ai/releases/MX_Vertical_Preset.bttpreset


![alt text](/assets/images/4000_logitech2026-01-31T13:59:14.590Z-c46d76e47cbf5624a8338cc30e27f148.jpeg)


## Example Preset: MX Anywhere 3 / MX Anywhere 3S[​


[https://folivora.ai/releases/MXAnywhere3or3s.bttpreset


![alt text](/assets/images/4000_logitech2026-02-10T11:02:37.272Z-c8f1b841061716b36344e0d103d1085a.png)


## Remapping Buttons[​


After you have added the Logitech Mouse Configuration, your mouse buttons should be recognized and you can configure them like described in [Assigning Actions To Normal Mice


![alt text](/assets/images/logitech_mouse_buttons_overview-bfdba7124c1e54474dcf7611f2d29ef3.png)


Hover the click recognition area with your mouse, then press the button you want to use:

![alt text](/assets/images/logitech_mouse_scroll_settings-941d4a0b70f08bbcfe6de3e1ceca4649.png)


Afterwards you can assign any action sequence to that button:

![alt text](/assets/images/logitech_mouse_button_config-f865990db3bf08137b1c7b4402782cef.png)


![alt text](/assets/images/logitech_mouse_gestures-a3249504a3c3f1444c3437ebec1092f4.png)


## Smooth Scrolling[​


BetterTouchTool supports smooth scrolling for any mouse, not just Logitech mice. To enable it add a [Smooth Scroll Modifier


## Configure Tilt Wheel Buttons To Scroll[​


BTT will record your tilt wheel left / right direction as button presses. If you want to use that for scrolling you need to assign the predefined action "Start Smooth Scrolling" on button press and "Stop Smooth Scrolling" on button RELEASE. Positive speed values will scroll right, negative left.


## Trackpad Like Gestures (Zooming, Rotating, Space Switching)[​


Trackpad like gestures can also be configured via scroll modifiers: [Scroll Modifier


## Action Ring & Other Fancy Menus[​


If you want to replicate the Action Ring, you can easily do that using BetterTouchTool's floating menus.


Here is an example preset that shows such a menu when the middle mouse button / scroll wheel is pressed:


[https://folivora.ai/releases/action_ring_example.bttpreset


![alt text](/assets/images/4000_logitech2026-02-10T12:32:06.271Z-8f883806fa18fc2697407eb5eed92bc8.png)


![alt text](/assets/images/4000_logitech2026-02-10T12:32:28.165Z-9c2dc355b6ca08f79333436448187ffa.png)


![alt text](/assets/images/4000_logitech2026-02-10T12:32:53.656Z-b8624f7a69eec8e24dd559c72e90fd0b.png)


### Bugs, Feature Requests & Discussion:[​


Please come to [https://community.folivora.ai/t/support-for-logitech-mx-master-mice/37397/78 and report any non-working mouse. I have mostly tested with MX Master and some G-series mice, but it is quite likely I have not covered all combinations.[PreviousAssigning Actions to Buttons[NextLogitech JavaScript

- [Setup
- [Example Preset: MX Master
- [Example Preset: MX Vertical
- [Example Preset: MX Anywhere 3 / MX Anywhere 3S
- [Remapping Buttons
- [Smooth Scrolling
- [Configure Tilt Wheel Buttons To Scroll
- [Trackpad Like Gestures (Zooming, Rotating, Space Switching)
- [Action Ring & Other Fancy Menus

- [Bugs, Feature Requests & Discussion:Community

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
