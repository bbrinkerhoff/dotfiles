This information is for SikuliX versions 2.0.0 and later

It was created and validated on/after **October 19th 2019**<br>
on **macOS Catalina Version 10.15**
... but should work on other macOS 64-Bit systems also.

### Step 1: Java
You need a valid Java 64-Bit installation (recommended Java 13), but it must be at least Java 8.

We recommend to use OpenJDK, which is the new base for usages in private or non commercial environments.<br>
But any Oracle JRE/JDK 8+ should work also.

Make this test in a Terminal: `java -version`<br>
which should show something like:
```
openjdk version "13.0.1" 2019-10-15
OpenJDK Runtime Environment (build 13.0.1+9)
OpenJDK 64-Bit Server VM (build 13.0.1+9, mixed mode, sharing)
```

If it does not work, follow these steps, to make a Java OpenJDK ready on your system:
1. download the package [macOS / x64	tar.gz](https://jdk.java.net/13/) from `jdk.java.net`
2. unzip/untar (right click and open with standard app)
3. you get a folder like `jdk-13.0.1.jdk`
4. move this folder to the system folder `/Library/Java/JavaVirtualMachines`
5. the above test should now work 

... or use any other workflow, that leads to a valid Java 8+ installation and lets you successfully run `java -version`. 

### Step 2: Support for image search ([OpenCV](https://opencv.org/))
The OpenCV native libraries are needed for SikuliX's image search and other features.

**Up to SikuliX version 2.0.x:**<br>
there is nothing to do for you, since the libraries (OpenCV version 3.4.2) are bundled with SikuliX and exported automatically for usage at runtime.

**For SikuliX version 2.1.x and higher:**<br>
you have to [create a valid OpenCV installation](https://github.com/RaiMan/SikuliX1/wiki/macOS-Linux:-Support-Libraries-for-OpenCV-4) before you can use SikuliX with all its features. 

If this is not done before the first use of SikuliX, in case it will terminate abnormally and present information, what has to be done.

### Step 3: Support for text and OCR features (Tesseract OCR)
If you want to use these features, you have to [make the Tesseract libraries ready](https://github.com/RaiMan/SikuliX1/wiki/macOS-Linux:-Support-libraries-for-Tess4J-Tesseract-4-OCR).