**Be aware:** The behavior is slightly different between using Java 8 and using Java 9+

**Recommendation:** Use Java 11 from [AdoptOpenJDK](https://adoptopenjdk.net)

**SysPrefs** here means `System Preferences -> Security & Privacy`<br> 
with the relevant entries `Accessibility` and `Screen Recording`<br>
(see the images at the end of this text) 

### Background

On newer macOS versions when using the SikuliX IDE or your own application, that internally uses SikuliX features, you might get system popups, that tell you, that something is not allowed.

SikuliX internally uses mouse and keyboard actions and to find images, it has to take screenshots. These features have to be explicitly allowed for an application. The place to do it is in `System Preferences -> Security & Privacy`.

Generally the application running the SikuliX features must be allowed for:
- Java 8: the java executable running from a Terminal window
- Java 9+: (recommended Java 11) the Terminal app running Java/SikuliX from a Terminal window 
- the development app (IntelliJ IDEA, NetNeans, ...), if you run the stuff from there
- a private application, if you have packed the SikuliX features inside an app package (Automator, JarBundler, ...)

**Be aware:**<br>
Currently the **SikuliX IDE cannot be run by double-clicking the jar-file**. If you do so, the critical features will not be allowed and there is no way to allow them. You must run the IDE in one of the above ways, to have a chance to allow the features. It is planned, to have an application `SikulixIDE`.<br>
The same goes for private jar files, you have built containing SikuliX features.

### Some information about Java on macOS

#### Which Java versions do you have on your machine?

In a Terminal window run:<br>
`/usr/libexec/java_home -V`

... reveals something like this:
```
    16 (x86_64) "AdoptOpenJDK" - "AdoptOpenJDK 16" /Library/Java/JavaVirtualMachines/adoptopenjdk-16.jdk/Contents/Home
    11.0.10 (x86_64) "AdoptOpenJDK" - "AdoptOpenJDK 11" /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
    1.8.261.12 (x86_64) "Oracle Corporation" - "Java" /Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
    1.8.0_282 (x86_64) "AdoptOpenJDK" - "AdoptOpenJDK 8" /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
```

meaning per line:<br>
`version number`  `(architecture)`  `"vendor name"` `"version name"` `/Library/.... where it is stored`

In a fresh Terminal window the command `java ...` always runs the Java version with the highest version number (16 in this case).

The dotted sections are respected: `1.8.261.12` is higher than `1.8.0_282`

#### How to select a specific Java version

If you have more than one Java version available (as in this example), you can select in a Terminal window, which version to use.

You do this, by setting the `JAVA_HOME` environment variable:<br>
`export JAVA_HOME=/Library/...`<br>
using one of the above locations.

or you simply use: `/Library/.../bin/java` to run the specific version

As a shortcut you can use the following command to set `JAVA_HOME`:
```
export JAVA_HOME=`/usr/libexec/java_home -v VERSION`
```
... where VERSION is one of the listed version numbers. 
Abbreviations work: the match works left to right and selects the highest version of the matches
- `... -v 1` will select `16`
- `... -v 11` will select `11`
- `... -v 1.8` will select `1.8.261.12`
- `... -v 1.8.0` will select `1.8.0_282`

Or directly as a java command:
```
`/usr/libexec/java_home -v 1.8.0`/bin/java -version`

openjdk version "1.8.0_282"
OpenJDK Runtime Environment (AdoptOpenJDK)(build 1.8.0_282-b08)
OpenJDK 64-Bit Server VM (AdoptOpenJDK)(build 25.282-b08, mixed mode)
```

You might pack all this into shell scripts or even create an Automator app.

### How to get on the road running SikuliX from a Terminal window
At the command prompt use<br>
`java -jar <path-to>/sikulixide....jar <optional parameters>`<br>
to start/use the SikuliX IDE.<br>
You might as well pack this into an executable shell script, that can be run by double-click.

**TODO** Java 11: You have to allow `Terminal.app` to use the mentioned features<br>
**TODO** Java 8: You have to allow `the java executable` to use the mentioned features

**These are the steps to get a clean situation**

- in any case stop the Terminal app completely (Quit!)

- when you want to run the SikuliX IDE from a Terminal using Java 8
  - first in SysPrefs remove all entries with the name java (using - button)
  - then use the + button to add java again: in the file dialog navigate to the respective java executable (..../bin/java)

- when you want to run the SikuliX IDE from a Terminal using Java 11+
  - first in SysPrefs remove the entry with the name Terminal (using - button)
  - then use the + button to add Terminal again: in the file dialog navigate to the Terminal.app

- Then do this in both cases
  - do the above steps for Accessibility and Screenrecording
  - start a Terminal window
  - run the Java command to start the SikuliX IDE

[A discussion about the complete approach](https://github.com/RaiMan/SikuliX1/issues/429)

### When running from inside a development application**<br>
**TODO** You have to allow the dev app `YouNameIt.app` to use the mentioned features

### When building and running a self-created application**
There are tools available to create a macOS application, that then can be used to run the SikuliX IDE.
<br>**Automator** the macOS utility can be used by packing a shell script into an `SikulixIDE.app`.
<br>**[JarBundler](https://github.com/UltraMixer/JarBundler)** is an example for tools targeting more complex app implementations based on Java jars.
<br>**TODO** You have to allow the self-created app `YouNameIt.app` to use the mentioned features

### The macOS popups you get if not allowed

**The left one (Accessibility ...)** you get, when SikuliX starts up (mouse usage is checked internally). After that it takes some seconds until the SikuliX IDE window appears - so be patient. When using the button `Open System Preferences` the active application should already be in the list, but unchecked. So just switch it on. Stop and restart the running application.

**The right one (Screen Recording)** comes up, when you press the screenshot button in the SikulkiX IDE. You will get an empty screen (background only), so simply press `ESC` to get back to the IDE. Now you should allow screen recording. Stop and restart the running application.
<br>**Be aware:** You have to do this in any case, since otherwise the SikuliX find operations will not work and will not trigger the popup.

![](https://github.com/oculix-org/SikuliX-Docs/blob/master/docs/_images/SysPref-SecPriv-5.png)
***
... the `System Preferences`

![](https://github.com/RaiMan/SikuliX-Docs/blob/master/src/main/resources/docs/source/_images/SysPref-SecPriv-1.png)

... and the tab `Privacy` at `Security & Privacy`

![](https://github.com/RaiMan/SikuliX-Docs/blob/master/src/main/resources/docs/source/_images/SysPref-SecPriv-2.png)
