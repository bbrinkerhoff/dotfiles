# Source: https://docs.folivora.ai/docs/normal-mouse/assigning-actions

- [
- [Normal Mouse & Logitech
- Assigning Actions to Buttons

# Assigning actions to your mouse


BetterTouchTool allows to completely customize your mouse, you can assign actions to various mouse related functionality:


## Assign Actions To Mouse Buttons[​


First select the "Normal Mouse" trigger type, then press the + button and then record the specific mouse button by clicking the grey area:


Sorry, your browser doesn't support embedded videos, but don't worry, you can
[download it
and watch it with your favorite video player!


### Simple Mouse Button => Action Assignment[​


In this example Button 4 would always trigger Mission Control when clicked

![alt text](/assets/images/802_normal_mice_assigning_actions2026-01-30T14:33:46.137Z-c885eebb36644c962d8ee572ee284a67.png)


### Mouse Button + Modifier Key => Action Assignment[​


In this example button 8 would only trigger the "Capture Screenshot to Clipboard" action if shift and cmd are pressed while clicking the button:

![alt text](/assets/images/802_normal_mice_assigning_actions2026-01-30T14:36:16.674Z-c285f10b2ac0df4ad7a3227787599972.png)


### Mouse Button + Drag Up/Down/Left/Right Gestures[​


While BetterTouchTool also offers a sophisticated mouse gesture system (see [Drawings / Mouse Gestures) it now also supports easy to set up drag up/down/left/right gestures for any pressed mouse button. To use these simple drag gestures, add your mouse button like described above, then click the "Add Action For Trigger Category" button, then choose one of the drag gestures:

![alt text](/assets/images/802_normal_mice_assigning_actions2026-01-30T15:54:25.819Z-cc2f7dd3f1a61106d11aea98f431bb77.png)


#### Discrete And Continuous Drag Gestures[​


There are discrete drag gestures and continuous ones. **Usually you will want to use the discrete ones** as the continuous versions trigger for every pixel the mouse is dragged. The continuous ones are mostly suited for usage in scripts, they make the following variables available:


- BTTDragValue (also BTTDragUpValue, BTTDragDownValue, BTTDragLeftValue and BTTDragRightValue if you need them separated)

- BTTDragDeltaX

- BTTDragDeltaY

- BTTDragButtonNumber


![action trigger categories](/media/802_normal_mice_assigning_actions2026-01-30T15:54:33.554Z.png)


#### Using Drag Gestures to Simulate macOS Trackpad Gestures[​


You can assign the following predefined actions to continuous drag gestures to simulate various macOS trackpad gestures.


- Start Smooth Scrolling (Simulate Trackpad Like Scrolling)

- Start Smooth Space Switching (Simulate Fluid Trackpad Space Switching)

- Start Smooth Zoom (Simulate Trackpad Zoom, e.g. in Preview)

- Start Smooth Rotate (Simulate Trackpad Rotate, e.g. in Preview)


It is enough to assign them to one direction per axis, for example assigning the "Start Smooth Space Switching" action to a drag left gesture, will also allow you to drag to the right for switching spaces.


### Click + Release Actions[​


You can configure different actions for mouse click and mouse release. This can often be helpful - for example you can hold down a key while pressing a mouse button, and release the key when releasing the mouse button. Or you can use the "Start Smooth Scrolling" action when pressing a mouse button and use the "Stop Smooth Scrolling" action when releasing it:


![alt text](/assets/images/802_normal_mice_assigning_actions2026-01-30T16:23:48.348Z-9aa4a9645fd9ac68100e24bee4a535e7.png)


### Short + Long Press[​


Your mouse buttons can also trigger different functionality depending on whether you perform a short or a long press. To configure this, the easiest way is to use the action trigger categories that have been introduced with BetterTouchTool 6.100:


- Actions Executed On Long Hold Down

- Actions Executed On Click Release

- Actions Executed On Click Release After Long Hold


![alt text](/assets/images/802_normal_mice_assigning_actions2026-01-30T16:09:29.527Z-faf457a7e31cb25f323a98e1fbb24853.png)


### Multi Button Combinations[​


You can trigger actions when multiple buttons are pressed simultaneously. This also works with button + scroll up/down/left/right:

![alt text](/assets/images/802_normal_mice_assigning_actions2026-02-10T12:39:43.778Z-ebdb5ee28e11454f1be3926da9f5efa6.png)


![alt text](/assets/images/802_normal_mice_assigning_actions2026-02-10T12:39:50.584Z-24b3a90ddbc4c62fd803c3e5ee7e6a8d.png)


### Action Ring & Other Fancy Menus[​


If you want to replicate the Action Ring, you can easily do that using BetterTouchTool's floating menus.


Here is an example preset that shows such a menu when the middle mouse button / scroll wheel is pressed:


[https://folivora.ai/releases/action_ring_example.bttpreset


![alt text](/assets/images/4000_logitech2026-02-10T12:32:06.271Z-8f883806fa18fc2697407eb5eed92bc8.png)


![alt text](/assets/images/4000_logitech2026-02-10T12:32:28.165Z-9c2dc355b6ca08f79333436448187ffa.png)


![alt text](/assets/images/4000_logitech2026-02-10T12:32:53.656Z-b8624f7a69eec8e24dd559c72e90fd0b.png)
[PreviousNormal Mouse & Logitech[NextLogitech Mouse Support

- [Assign Actions To Mouse Buttons

- [Simple Mouse Button => Action Assignment
- [Mouse Button + Modifier Key => Action Assignment
- [Mouse Button + Drag Up/Down/Left/Right Gestures
- [Click + Release Actions
- [Short + Long Press
- [Multi Button Combinations
- [Action Ring & Other Fancy MenusCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
