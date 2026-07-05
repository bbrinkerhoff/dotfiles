### --- Version 2.0.6
- OPEN ISSUES: [GitHub](https://github.com/RaiMan/SikuliX1/issues?q=is%3Aopen+is%3Aissue+milestone%3A2.0.6)
- OPEN ISSUES: [Launchpad Bugs](https://bugs.launchpad.net/sikuli/+bugs?field.searchtext=&field.status%3Alist=NEW&field.status%3Alist=INPROGRESS&assignee_option=any&field.assignee=&field.bug_reporter=&field.bug_commenter=&field.subscriber=&field.structural_subscriber=&field.tag=&field.tags_combinator=ANY&field.has_cve.used=&field.omit_dupes.used=&field.omit_dupes=on&field.affects_me.used=&field.has_patch.used=&field.has_branches.used=&field.has_branches=on&field.has_no_branches.used=&field.has_no_branches=on&field.has_blueprints.used=&field.has_blueprints=on&field.has_no_blueprints.used=&field.has_no_blueprints=on&search=Search&orderby=-id&start=0)

### --- Version 2.0.5 (released March 1st 2021)
- REVISED: ImagePath: completely revised and convenience features added ([see docs](https://sikulix-2014.readthedocs.io/en/latest/scripting.html#image-search-path-where-sikulix-looks-for-image-files)) ([base issue](https://github.com/RaiMan/SikuliX1/issues/409))
- ADDED: Region: waitBest(waitTime, image...) and WaitAny(waitTime, image...) returning after first match, waiting max. waitime ([issue](https://github.com/RaiMan/SikuliX1/issues/422))
- REVISED: command line -r now works according to the docs ([issue](https://github.com/RaiMan/SikuliX1/issues/410))
- ADDED: experimental Python bridge based on py4j ([issue](https://github.com/RaiMan/SikuliX1/issues/419))
- FIXED: SX.pop... features now return null/None when timed out ([issue](https://github.com/RaiMan/SikuliX1/issues/387))
- ADDED: macOS: react on missing Security&Privacy settings (Accessibility, ScreenRecording) ([See: Wiki post](https://github.com/RaiMan/SikuliX1/wiki/Allow-SikuliX-actions-on-macOS))
- CHANGED: Complete jars now available for specific systems (Windows, macOS, Linux) - smaller size
- CHANGED: OpenCV libraries (version 4.3.0) now bundled from [Maven::org.openpnp::opencv](https://github.com/openpnp/opencv)
- CHANGED: Tess4J now version 4.5.4 (Tesseract still 4.1.x) [reason: issue #412](https://github.com/RaiMan/SikuliX1/issues/412)
- CHANGED: Jython now version 2.7.2 and bundled with the complete jars (jython-slim.jar)
- DROPPED: JavaScript support: no longer available due to [dropped engine in Java 15+](https://github.com/RaiMan/SikuliX1/issues/383) (also IDE buttons implemented using JavaScript)
- FIXED: Scripting: handling ImagePath/BundlePath correctly with nested runScript() calls (see: [last PR and some more before](https://github.com/RaiMan/SikuliX1/commit/51cf7d067318396fcd3f9c3ab0dc64abdf6b4a66)) ([issue LP bug](https://bugs.launchpad.net/sikuli/+bug/1915397))
- FIXED: [Linux: App.open() did not work](https://github.com/RaiMan/SikuliX1/issues/366)
- FIXED: macOS: libtesseract.dylib must be in /usr/local/lib (workaround, should be fixed in Tess4J finally) [issue #350](https://github.com/RaiMan/SikuliX1/issues/350)
- FIXED: [Match does not act like Region using text()](https://bugs.launchpad.net/sikuli/+bug/1883605)
- ADDED: [OCR.Options().lightFont()](https://github.com/RaiMan/SikuliX1/issues/369): tells the optimization before OCR, that the grayscale image should be inverted (the fonts to read are in light color)
- ADDED: [SikuliX should be able to work in a sandboxed environment (specify APPDATA folder)](https://github.com/RaiMan/SikuliX1/issues/340)
- FIXED: [Region existsText returns match with wrong XY (missing relocate)](https://github.com/RaiMan/SikuliX1/issues/338)
- FIXED: [Finder() should accept image filename string as parameter](https://github.com/RaiMan/SikuliX1/issues/332)
- LIST: [of closed issues with milestone 2.0.5](https://github.com/RaiMan/SikuliX1/milestone/7?closed=1)
- LIST: [of fixed LP-Bugs with milestone 2.0.5](https://bugs.launchpad.net/sikuli/+bugs?field.searchtext=&orderby=-importance&field.status%3Alist=FIXCOMMITTED&field.status%3Alist=FIXRELEASED&assignee_option=any&field.assignee=&field.bug_reporter=&field.bug_commenter=&field.subscriber=&field.structural_subscriber=&field.milestone%3Alist=90271&field.tag=&field.tags_combinator=ANY&field.has_cve.used=&field.omit_dupes.used=&field.omit_dupes=on&field.affects_me.used=&field.has_patch.used=&field.has_branches.used=&field.has_branches=on&field.has_no_branches.used=&field.has_no_branches=on&field.has_blueprints.used=&field.has_blueprints=on&field.has_no_blueprints.used=&field.has_no_blueprints=on&search=Search)

***
### --- Version 2.0.4
- FIXED: [Do/SX::popAsk() should return None/null in case of closed or timed out](https://github.com/RaiMan/SikuliX1/commit/346397f582399d65b744b756b4925979315990c9)
- FIXED: IDE: run selection did not include image names, when working in thumbnail view [issue #288](https://github.com/RaiMan/SikuliX1/issues/288)
- FIXED: [issue #314: RobotDesktop: checkMousePosition possible rounding problems](https://github.com/RaiMan/SikuliX1/issues/314)
- FIXED: [temporary - issue #326: IDE: startup: window should not be too small](https://github.com/RaiMan/SikuliX1/commit/d0391913bd1a3a79cb24051e3c6ea8b00af3d4f1)
- CHANGE: [issue #325:  IDE: the startup process now waits for the IDE to terminate](https://github.com/RaiMan/SikuliX1/commit/f3272a179ad34a6525cb736d0fc4b4c6c5cec2b3)
- FIXED: [IDE: abort key did not work while waiting for images to appear](https://bugs.launchpad.net/sikuli/+bug/1859886) [(commit)](https://github.com/RaiMan/SikuliX1/commit/7a8c55a9b65736be670edc32d9041d4bf865d517)
- FIXED: [when Settings.setImageCache(0) (caching switched off) no history of images should be stored at all](https://github.com/RaiMan/SikuliX1/commit/4afb649d481ca72a8588f4373cddf6747c310c38)
- FIXED: [highlight(0) should do nothing](https://github.com/RaiMan/SikuliX1/commit/1b34e75357faf116f3ee445b78ea669e0ff91a53)
- ADDED: [Finder.findChanges(): PIXEL-DIFF and IMAG_DIFF can be set](https://github.com/RaiMan/SikuliX1/commit/64d5d59a6e8bfd861224b949603f3107a81c2d67)
- FIXED: [Extensions folder content and extensions.txt should work as intended](https://github.com/RaiMan/SikuliX1/issues/318)
- FIXED: [Java classpath from outside should be used internally by sikulix/sikulixapi, when used from commandline](https://github.com/RaiMan/SikuliX1/issues/317)
- FIXED: [Sikulix.popup(): displayed empty box](https://github.com/RaiMan/SikuliX1/commit/01309037041cd858a9d2298c4ea8c3c97f10638f)
- FIXED: [OCR: status did not show configs](https://github.com/RaiMan/SikuliX1/commit/b4eab43cf6ecbdf08c9313439c6b236c05e39651)
- REVISED: [WinUtil: app name comparisons should be done in lowercase](https://github.com/RaiMan/SikuliX1/commit/9e33a692211266296b80f3b41ab982c6fb6c3988)
- FIXED: [Docs: Code example for Settings.getOS() contains error](https://bugs.launchpad.net/sikuli/+bug/1864265)
- FIXED: [Python: select() did not work anymore](https://bugs.launchpad.net/sikuli/+bug/1864443)

***
### --- Version 2.0.3
- FIXED: issue [#310](https://github.com/RaiMan/SikuliX1/issues/310): macOS: App.getApps(): ArrayIndexOutOfBoundsException
- FIXED: timed popups should work with short parameter lists --- [LP bug 688410](https://answers.launchpad.net/sikuli/+question/688410)
- [FIXED: mouse should not move, if current mouse pos is the same as the destination](https://github.com/RaiMan/SikuliX1/commit/aa69dc2c5873b461a603cabb5f7fe58ff68ab085)
- FIXED: [pull #300](https://github.com/RaiMan/SikuliX1/pull/300
) [ConcurrentModificationException in RobotDesktop.keyUp()](https://github.com/RaiMan/SikuliX1/commit/1aa59b20dbdd5cefb6e68c52f083f102f51ba23d)
- FIXED: issue [#299](https://github.com/RaiMan/SikuliX1/issues/299) [Mouse::click: given Location should not be null](https://github.com/RaiMan/SikuliX1/commit/487b8a921d7ae8f0b862d215afa83a433138e7d0) 

***
### --- Version 2.0.2
- REVISED: saving screenshots to a given path and/or filename [see docs](https://sikulix-2014.readthedocs.io/en/latest/screen.html#capturing-taking-screenshots)
- REVISED: TextRecognizer/TextOCR: image optimization before OCR now configurable [see PR](https://github.com/RaiMan/SikuliX1/pull/280) and [in the docs](https://sikulix-2014.readthedocs.io/en/latest/textandocr.html#working-with-text-and-using-ocr-features) and [in the wiki](https://github.com/RaiMan/SikuliX1/wiki/How-to-get-the-best-from-OCR-and-text-features)
- [CHANGED: Image.resize: using OpenCV feature - gives better match score (0.99+ instead of 0.96)](https://github.com/RaiMan/SikuliX1/commit/2192b435d0c7aaa00bf0352b5f58cbc206bbd285)
- FIXED: issues [#144](https://github.com/RaiMan/SikuliX1/issues/144) and [#217](https://github.com/RaiMan/SikuliX1/issues/217): some Problems using class App on Linux (window handling still in early stage) 
- [FIXED: issue #271: Windows: App.Open() did not work, if .exe given as parameter from commandline](https://github.com/RaiMan/SikuliX1/commit/adbcec1f7d9ca0016ba062176d5b9e6696a1bb18)
- [FIXED: issue #270: observe: setActive/setInactive did not work](https://github.com/RaiMan/SikuliX1/commit/60f3993201ccfb398a9a463a2f05839359688332)
- [FIXED: session restore script: hang up when restore not possible (e.g. Jython missing for python script)](https://github.com/RaiMan/SikuliX1/commit/142e2a4d1562bf10aee1491c6789aafd6144a06a)
- [FIXED: Use getScreen() instead of this.scr in Region.](https://github.com/RaiMan/SikuliX1/commit/d1857e7c0f11b415a4c2d41f6135351475f567de)
- [FIXED: Use reflection8 instead of reflection to get rid of Guava](https://github.com/RaiMan/SikuliX1/commit/035e2cf5cd08f23feedd0b4ae5a69bf846236297)
- [FIXED: Do not use String.format() in Debug.log() if no args are given](https://github.com/RaiMan/SikuliX1/commit/16c7ced78b200b027b9756b6daad83391289d753)
- [CHANGED: Pattern/Image::create(URL): should terminate qualified (SikuliXception), if a resource could not be located (not simply a NPE)](https://github.com/RaiMan/SikuliX1/commit/561a023020ff209a7223e11774d6c9ca497bdeef)
- [CHANGED: Finder::hasNext(): maxCount should be int](https://github.com/RaiMan/SikuliX1/commit/06b5b98aca0ee93ee2d7f348f0c7eede84dfb1cc)
- [CHANGED: issue #215: API in Java project: -Dsikuli.Debug=x is recognized](https://github.com/RaiMan/SikuliX1/commit/6c6f78603a21fb62c937bb7e3689a0622bca07c2)
- [ADDED: Highlight: allow to show with frame only (transparent): Settings.HighlightTransparent = true (default: false)](https://github.com/RaiMan/SikuliX1/commit/23dffde600231cd9e6da5f6bb062a1cea5270098)
### --- Version 2.0.1
- [CHANGED: IDE: error handling with "delete images on save" (missing string delimiter) - fixes #231](https://github.com/RaiMan/SikuliX1/commit/205b231cd1efe38afc57ea1acd90c38113aaa861)
- [FIXED: Handle the ocassionally occuring ClassNotFoundException on cleanUp ](https://github.com/RaiMan/SikuliX1/commit/c856f5097c83232b4cf52f25a0b3877e180efc06)
- [FIXED: Correctly synchronize UI and other threads when opening a popup (IDE hang-up on save - issue #229)](https://github.com/RaiMan/SikuliX1/commit/f09c03b0a32beee02254b4f68bfb06bb48c6744a)
- [CHANGED: IDE: capture: Add some delay to give IDE some time to vanish.](https://github.com/RaiMan/SikuliX1/commit/be7f1c10aa936757edc226b6fd16677944392ab0)
- [FIXED:  startup: suppress Java warnings (jython, javax.swing, javascript) and use inside same java executable as outside](https://github.com/RaiMan/SikuliX1/commit/9d57cf1dc0925a93aab389141bf4a2c1a1ee2067)
- [CHANGED: Jython: all site-packages content should go to front of sys.path (also sites.text content)](https://github.com/RaiMan/SikuliX1/commit/9c92aa2d9c8c464ebb182f864f4a25d76103bfc4)
- [CHANGED: IDE: handling if no Jython nor JRuby available (issue #213) ](https://github.com/RaiMan/SikuliX1/commit/947b585ae4e88c0ddacf78ad0ef55144e7849866)
- [CHANGED: IDE: Splash/About with Sikulix and Java version](https://github.com/RaiMan/SikuliX1/commit/88ef287a21112451e82a655461b2e3b7d8b5946c)
- [CHANGED: Always throw exception if in headless mode, not only when running IDE](https://github.com/RaiMan/SikuliX1/commit/7b1b658d52e999bd529488c85a98777ad8a6508c)
- [FIXED: possible NPE with multi-monitor at start-up](https://github.com/RaiMan/SikuliX1/commit/c280717b9b9fab2e92610832ed6b8f0c216de112)

***
### --- Version 2.0.0
[look here for a list of fixes](https://bugs.launchpad.net/sikuli/+bugs?field.searchtext=&orderby=-importance&field.status%3Alist=FIXRELEASED&assignee_option=any&field.assignee=&field.bug_reporter=&field.bug_commenter=&field.subscriber=&field.structural_subscriber=&field.milestone%3Alist=63602&field.tag=&field.tags_combinator=ANY&field.has_cve.used=&field.omit_dupes.used=&field.omit_dupes=on&field.affects_me.used=&field.has_patch.used=&field.has_branches.used=&field.has_branches=on&field.has_no_branches.used=&field.has_no_branches=on&field.has_blueprints.used=&field.has_blueprints=on&field.has_no_blueprints.used=&field.has_no_blueprints=on&search=Search)