On Linux settings can be found on user home under:

```
~/.Sikulix/
~/.Sikulix/Extensions/
 etc.
```
Read this page:
 - [Version 2.0.2+ - Special for Linux people](https://sikulix-2014.readthedocs.io/en/latest/newslinux.html#newslinux)

If it helps the following bash snippet will let you launch Sikuli ...
```
#!/bin/bash
#
    PROG_PATH="/opt/dev/sikuli/home"
    export JAVA_HOME="/opt/lib/java/jre/${JDK_08}"
#
#   ------------------------------------
#
##  echo  "nohup  java -jar \"${PROG_PATH}/sikulixide-2.0.3.jar\""   "${@}"  "  > /dev/null "
    nohup  java -jar "${PROG_PATH}/sikulixide-2.0.3.jar"  "${@}"    > /dev/null  2>&1  &
#
#   ------------------------------------
exit 0
```

Obviously put your own paths in to point to where you have unzipped Sikuli and where you keep your other files.

Any paths names or environment variables needed (say a Python path) should be exported inside the script before Sikuli starts.

The line beginning `nohup ...`  launches your process in the background.  You can keep using the terminal or  launch this script with a `.Desktop` file.  I use "${JDK_08}" to be a specific Java release.  If things go wrong comment-out the "` > /def/null`" part.

----
to be filled