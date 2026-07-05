This is tested on Windows 10, but the steps are similar on macOS and Linux.

### 1. Have a Java 8 or 11 active
I recommend the packages from [AdoptOpenJDK](https://adoptopenjdk.net/)

Either have the the `<java-folder>\bin` in the PATH environment variable or use the environment variable `JAVA_HOME`.

To check whether it works use `java -version` in a command line prompt.

### 2. Install Jython 2.7.2

Download the installer from here: [https://www.jython.org/download](https://yip.su/2Ry3U8) and follow the [installation instructions](https://www.jython.org/installation).

To check whether it works use `<jython-folder>\bin\jython` in a command line prompt.

You should get something like that:
```
Jython 2.7.2 (v2.7.2:925a3cc3b49d, Mar 21 2020, 10:03:58)
[OpenJDK 64-Bit Server VM (AdoptOpenJDK)] on java1.8.0_272
Type "help", "copyright", "credits" or "license" for more information.
>>>
```
which is the interactive Jython interpreter (exit by pressing `crtl-d`).

### 3. Download SikuliX IDE
... and make it ready with Jython.

Run it at least once, to setup the SikuliX environment.

### 4. Test Jython with SikuliX features
After step 3, you should have a folder `%APPDATA%\Sikulix\Lib`.

In the environment add `JYTHONPATH` as `<appdata>\Sikulix\Lib`.

Again start a Jython interactive prompt (see step 2).

At the prompt enter: `import sys; print sys.path`

You should get something like this:
```
['', 'C:\\Users\\rmhde\\AppData\\Roaming\\Sikulix\\Lib', 'C:\\jython2.7.2\\Lib', '__classpath__', '__pyclasspath__/', 'C:\\jython2.7.2\\Lib\\site-packages']
```

At the prompt enter: `from sikuli import *`, which should work without any error messages. 

At the prompt enter: `print SCREEN`, which should show sthg. like `R[0,0 1920x1200]@S(0)`.

Now you have the SikuliX environment ready with Jython as script runner.

### 5. Prepare and run scripts

Your main script now needs the line `from sikuli import *` at the beginning, like all imported scripts, that use SikuliX features.

Since in this scenario there are no SikuliX automatics like access to your images or support for importing other scripts, you have to setup this manually yourself: 
- image access: use the `ImagePath` features
- import other scripts: add the relevant folders to `sys.path`

To run a script, just use

`<jython-folder>\bin\jython <some-folder>\you-name-it.py`


