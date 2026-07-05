### _This applies to version 2.0.5+_

### Create a jar file from a script

**The prerequisites:**
- save the script to a `.sikuli` script folder
- make sure it works and does not produce any syntax errors

**Imports for additional private stuff:**
- is currently under investigation and will be improved over time
- currently it has to be organised by putting folders (jars not finally tested) outside the jar on `sys.path` at runtime in your packed script. 
- having imported `.py` files also in the packed `.sikuli` folder should work 

**Handling of images**
- is currently under investigation and will be improved over time
- currently you should either have all needed images in the packed `.sikuli` folder or use the ImagePath feature to access images inside/outside the jar

**Create the jar file**
- open your script in the IDE
- in the menu `File` use the entry `Export as runnable jar`
- wait for the OK-popup
- the jar is created as `your-scripts-name_sikuli.jar` in the parent folder of your script
- you can move it where ever you want

### Run the created jar

Currently both menu entries `Export as jar` and `Export as runnable jar` produce jars, that can be run by using
```
method 1: java -jar sikulix(ide/api)....jar -r somescript_sikuli.jar parameter
``` 
Only a jar produced with `Export as runnable jar` currently is self-runnable, which means can be used as
```
method 2: java -jar somescript_sikuli.jar parameter
```

**Prerequisites for method 1**
- the system must have a valid SikuliX installation of version 2.0.x+

**Prerequisites for method 2 (only available in 2.0.5+)**
- same as for method 1
- (only available in 2.0.5+) or a jar containing SikuliX and Jython packed together in the same folder as the runnable script jar named `sikulixjython.jar` (see `Create a sikulixjython.jar`).

### Create a sikulixjython.jar (only available in 2.0.5+)
- this jar can be used as is on systems only having a valid Java installation
- Have a valid SikuliX installation with a `sikulixide....jar` and a `jython-standalone-2.7.1.jar`
- start the IDE and be sure that Jython scripts are running without problems
- in menu `Tools` use the entry `Pack Jar with Jython`
- the creation of the jar will take a while (about 10 - 20 seconds), is reported in the status line at the bottom of the IDE (currently no progress indicator) and will end with a success/error popup
- the created jar `sikulixjython.jar` will be in the `<appdata-folder>/SikulixStore` 

### Comment on current state of development (2.0.5)
- both export concepts will be merged to one `Export to runnable` including the `.skl` variant
- the detection of the environment will be improved
- the possibilities to support imports of scripts and images will be improved
