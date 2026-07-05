# Source: https://docs.folivora.ai/docs/trackpad-mouse/drawings

- [
- Trackpad & Mouse
- Drawings / Mouse Gestures

# Custom Drawing Gestures / Mouse Gestures


## Adding New Gestures[​


- Click the "Add New Drawing" button in the Drawings tab

- Draw your gesture in the white drawing area

- To improve recognition reliability add some variations of the same gesture by clicking the button and drawing it again.


**Advanced:**


- You can choose the required certainty to trigger a gesture. The default is 0.7, I do not recommend values higher than 0.85.

- If your gesture should not depend on direction (e.g. a circle which can be drawn clockwise or counter-clockwise), check the checkbox on the bottom right


## Using the Gestures[​


- **By default BetterTouchTool has "Right-Click-To-Draw" active**. This can be disabled in the settings.

- There are some dedicated trackpad gestures called "2/3/4 Finger Drawing". These are great if you use a Trackpad.

- On Magic Mouse the best gestures to start drawing recognition are "1 / 2 / 3 Finger Touch Top"

- You can also use any other trigger in BetterTouchTool to start & stop drawing recognition.


- The predefined action you have to assign in order to start drawing is called **"Start Recording Mouse Gesture"** and is located in **"BTT Related Actions"**


- BTT will try to recognize your drawing after you remove your finger from the trackpad or Magic Mouse, or after releasing the mouse button


## Using Specific Mouse Buttons For Drawing Gestures[​


If you want to use some specific button on your mouse to perform drawing gestures, configure it like this (versions < 6.100):


- Record the mouse button you want to use and assign the "Start Recording Drawing / Mouse Gesture" action:

![step1](/assets/images/drawings_mouse_gesture_record-c7f8e926f62f50798d8d29ec82f8f03f.png)


Make sure the option "Allow Mouse Movements While Button Is Pressed" is enabled:

![alt text](/assets/images/drawings_gesture_recognition-66699be0f807a2cfc66aaf377aa39b8e.png)


- 


If you are using a custom button, you can disable the default "right-click-drawing" in the BTT settings:

![alt text](/assets/images/drawings_gesture_config-a19e77e44b28dd203d7e69f18285027f.png)


- 


If you want to trigger an additional action when short-pressing your new gesture button, duplicate your existing button but change it to trigger on mouse-up and set a maximum hold time:

![alt text](/assets/images/drawings_gesture_actions-09886db979b816665d89b93efc07efe3.png)

Then assign the "Stop Recording Drawing" action followed by any other actions you want to trigger on short press.


**Starting with BTT 6.100 you can also use the easier action trigger categories:**

![alt text](/assets/images/701_drawings2026-01-30T16:32:43.494Z-2f09b3f1b720a6d708bda0fd3556987c.png)


## Scopes[​


Starting with BetterTouchTool 6.034 Mouse Gestures support "Scopes". This can be very powerful - it allows to use the same gesture (e.g. a line) to execute different actions, depending on how the drawing was started. For example if you have a mouse with multiple extra buttons, these buttons could be used to do different things with the same mouse gesture.


You can add a scope to a mouse gesture here:

![alt text](/assets/images/drawings_mouse_gesture_start-007ef585ed337bc55f55d8f599c175c7.png)


Then in the trigger you use for starting your drawing you can specify it via the "Start Recording Mouse Gesture" action:

![alt text](/assets/images/drawings_mouse_gesture_stop-ff5016fc5d5bc0570261acda6b092785.png)


Afterwards that button will only trigger mouse gestures that have the specified scope.


## Andreas, Which gestures are you using to start drawing recognition?[​


- On the Magic Mouse I like to use "Three finger click" or "Two Finger Touch Top"

- On the trackpad I like to use the dedicated drawing gestures "2/3/4 Finger Drawing" but using Three Finger Tap, Click or Two Finger Tip Taps also works great.


**However** this does not mean those are the best suited gestures, just my favorites. You can use any gesture you want to start drawing recognition.
You can also use keyboard shortcuts or normal mouse buttons to start drawing recognition!


## Tips & Tricks[​


- Gestures resembling cursive letters usually work pretty well

- Here are some gestures that worked well for me, but there are many many more ;-)


## Some Drawing settings are available in the Advanced Settings:[​


![key sequences](/assets/images/advanced_drawings_settings-fe08b5b480797b239342088f1bb7ce4f.png)


***BTT's drawing gesture recognition is based on the $1 Unistroke Recognizer implementation by Chris Miles. For more information see [[https://github.com/chrismiles/CMUnistrokeGestureRecognizer***[PreviousMagic Mouse & Trackpad Triggers[NextBTT Mobile

- [Adding New Gestures
- [Using the Gestures
- [Using Specific Mouse Buttons For Drawing Gestures
- [Scopes
- [Andreas, Which gestures are you using to start drawing recognition?
- [Tips & Tricks
- [Some Drawing settings are available in the Advanced Settings:Community

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
