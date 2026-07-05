**This applies also when using the API jar to run scripts from commandline using -r**

If you got here, then probably because after start of the IDE you got the message<br>
`Neither Jython nor JRuby available`<br>
or you want to add Jython as additional scripting language to the IDE (see 1.).

Another reason might be, that you want to use your already available Jython installation (see 2.).

**1. Adding Jython to the SikuliX setup by downloading the standalone jar-package**

 - download from these links:<br>
   *for SikuliX 2.0.4 and earlier:*<br>
   [Jython standalone jar package 2.7.1](https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.1/jython-standalone-2.7.1.jar) or<br>
   [Jython standalone jar package 2.7.2](https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.2/jython-standalone-2.7.2.jar)<br>
   *for SikuliX 2.0.5 and later:*<br>
   [Jython standalone jar package 2.7.2](https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.2/jython-standalone-2.7.2.jar) or<br>
   [Jython slim jar package 2.7.2](https://repo1.maven.org/maven2/org/python/jython-slim/2.7.2/jython-slim-2.7.2.jar) (only 15MB, but not fully tested)
 - put the jar-file in the same folder as you have your sikulix.jar
 - start the IDE - it will take care for the rest

SikuliX will move the jar into its `<appdata>/Extensions` folder and then use it by putting it on the Java classpath at runtime.

**2. Use your available Jython installation**

If you already have a valid `Jython 2.7.1` (mandatory for 2.0.4) or `Jython 2.7.2` (2.0.5+) installation on your system, then you can tell SikuliX to use the Jython jar package from there.

The place to do that is the file `extensions.txt` in the `<appdata>/Extensions` folder.<br>
You might edit it in place or use the SikuliX IDE to do that.

With a fresh SikuliX installation the file `<appdata>/Extensions/extensions.txt` looks something like this:

```
# add absolute paths one per line, that point to other jars,
# that need to be available on Java's classpath at runtime
# They will be added automatically at startup in the given sequence

# empty lines and lines beginning with # or // are ignored
# delete the leading # to activate a prepared keyword line

# pointer to a Jython install outside SikuliX
# jython = c:/jython2.7.1/jython.jar

... more
```

You can open/edit/save the file in the SikuliX IDE:
 - in menu File -> Open Special Files
 - enter 2 to select `SikuliX Extension Options`
 - the file will open in a tab in the IDE

To point to a Jython outside SikuliX, there must be a line<br>
`jython = <path-to>/jython.jar` (see example above)<br>
As a convenience forward slashes are accepted on Windows.

So you might simply remove the leading # from the line `jython = ...` and revise the path according to your situation.

**On macOS** you might have installed Jython using HomeBrew (`brew install jython`). Then you can find the Jython jar at `/usr/local/Cellar/jython/2.7.1/libexec/jython.jar`.