**valid for version 2.0.5+**
***
### Fixes/Enhancements
[List of fixes/enhancements](https://github.com/RaiMan/SikuliX1/wiki/ZZZ-Bug-Fixes)

[gh bugs](https://github.com/RaiMan/SikuliX1/issues?q=is%3Aissue+is%3Aopen+milestone%3A%222.0.6%22+label%3Abug)
<br>[gh possible bugs](https://github.com/RaiMan/SikuliX1/issues?q=is%3Aissue+is%3Aopen+milestone%3A%222.0.6%22+label%3A%22possible+bug%22)
<br>[gh enhancemants](https://github.com/RaiMan/SikuliX1/issues?q=is%3Aissue+is%3Aopen+milestone%3A%222.0.6%22+label%3Aenhancement)

[gh issues postponed](https://github.com/RaiMan/SikuliX1/milestone/2)
***

### Jython included
The package `jython-2.7.2-slim` is now included in the SikuliX jars.<br>
So there is no need anymore, to download extra stuff for the Jython scripting support.

### JavaScript support paused
The anyways experimental support for JavaScript is currently switched off, since beginning with Java 15 the JavaScript engine is no longer included in Java.<br>
Ideas and suggestions, how to proceed with that are welcome.

### System specific artefacts (smaller size)
The SikuliX jars, that run on Windows, macOS and Linux, have a size of about 120 MB.<br>
There are jars available, that only support a specific system and are a bit smaller.<br>
There size is about 80 MB and they have an identifying suffix in their name.<br>
Still it is possible, to rename the SikuliX jars after download to whatever you need.

### OpenCV included for Windows, macOS and Linux
The needed libraries for OpenCV are now included even for Linux systems, that allow to use libraries available for Ubuntu.<br>
If this makes problems on your Linux, you have to provide your own OpenCV library setup.

### macOS: new security restrictions
With the latest macOS versions, Apple has raised the security fences more and more. Especially the SikuliX features screenshot and mouse/keybord usage are now restricted and have to be unlocked in the SystemPreferences ([more info here](https://github.com/RaiMan/SikuliX1/wiki/Allow-SikuliX-actions-on-macOS))<br>
Until a more general solution is available, you have to run SikuliX from a Terminal window:
`java -jar sikulix....jar`

### Support for Android device access paused
This feature has to be used as is. In case of problems you might post an issue, but support and development is paused until further notice.

### Support for VNC paused
This feature has to be used as is. In case of problems you might post an issue, but support and development is paused until further notice.


