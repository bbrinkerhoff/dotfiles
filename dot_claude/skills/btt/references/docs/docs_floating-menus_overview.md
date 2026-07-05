# Source: https://docs.folivora.ai/docs/floating-menus/overview

- [
- Floating Menu & Desktop Widgets

# Floating Menus / Widgets


Floating menus / widgets are one of the coolest features I have ever added to BetterTouchTool. They have been an idea I have been thinking / working on for quite a while. My first experiments have been based on webviews, which unfortunately came with some disadvantages so I moved away from that approach again. Now since macOS 13 SwiftUI has become pretty powerful and I was able to implement the floating menus using that technology.


Use [https://community.folivora.ai/c/floatingmenus/18 for any Floating Menu related questions


Features:


- Completely customizable menus

- Dynamically positioned by attaching to windows, screen positions, mouse position and many more

- Resize on hover

- Fix to your desktop, float on top, or behave like normal windows.

- Capable of running scripts & completely scriptable

- Different types of menu items (standard, webviews, sliders, text fields, submenus)

- Keyboard Navigable


Things I'm still working on, coming soon:


- Rendering the floating menus on your iPhone/iPad via an upcoming new version of BTT Remote

- Various Widgets (e.g Weather, Dock, Clipboard)


You can also create your own [native Swift plugin widgets to embed custom views into floating menus.


The floating menus will also be the base for the new BTT Remote for iOS. (So you can show them on your iPad/iPhone and control your Mac). In the future the existing Notch Bar and the Stream Deck implementation in BTT will also migrate to be specialized versions of Floating Menus.


Some examples:


A circular menu that shows up on three finger swipe up or long pressing right-mouse.

![Circular Menu](/assets/images/image-2-9b66a4f5aa6dcb5530547f9939e04824.jpg)

Tutorial here: [https://community.folivora.ai/t/tutorial-circular-floating-menu-that-can-be-shown-by-long-right-click-or-gesture/39847


A menu that pops up when hovering the Notch and allows you to drop image files to convert them to png:
[https://share.folivora.ai/sP/5cd6c1c8-6ea0-44e7-8e2e-9d114884cee5

![Notch Menu](/assets/images/notch_menu-0d70838189739c788e1f92bbffed447a.webp)


A menu that expands on hover and is attached to the focused window.
[https://share.folivora.ai/sP/99bcf777-fa14-470c-8c57-e2a520557106

![Browser](/assets/images/attached-e442da7f966ac2bd238c00c61219dc7f.webp)


A simple browser implemented as a floating menu:
[https://share.folivora.ai/sP/f2b8dd5d-6c4e-4c18-913b-109349f44450

![Browser](/assets/images/browser-bdf7fac9b7ec1e91e7356ca8952a477a.webp)


Using three finger swipe to show a menu at the mouse cursor position, then hide automatically when releasing the fingers from the trackpad:
[https://share.folivora.ai/sP/82bddaab-c0eb-406a-9bb0-37bf10495998

![Three Finger Swipe](/assets/images/onhover-df370e21f5a8e30178a55ea712ee2373.webp)


Basic scripting and a submenu:
[https://share.folivora.ai/sP/9be891ab-c2d6-489e-9b46-15725e26c23d

![Scripts](/assets/images/scriptex-ce383cf8f0364c15d4d61d68c364b4e7.webp)


A Google Translate Menu which is placed on the Desktop:
[https://share.folivora.ai/sP/6d4d596e-0208-4c42-aedd-f479188b588b

![Desktop](/assets/images/desktop-530dad8e256bed00245ef164dfd1393a.webp)
[PreviousBTT Mobile[NextBasicsCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
