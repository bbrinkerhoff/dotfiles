**This information applies to:**
- Linux with SikuliX 2.0.x
- macOS up to 2.0.4

If you got here automatically, then you have tried to use one of the SikuliX image search or text OCR features and got an error telling you, that the library `libopencv` is missing or has problems with dependencies.

In the IDE it looks something like this:
```
[error] RunTime:loadLib: libopencv_java.dylib (failed) probably dependent libs missing:
/Users/raimundhocke/Library/Application Support/Sikulix/SikulixLibs/libopencv_java.dylib: dlopen(/Users/raimundhocke/Library/Application Support/Sikulix/SikulixLibs/libopencv_java.dylib, 1): Library not loaded: @rpath/libopencv_ml.4.1.dylib
  Referenced from: /Users/raimundhocke/Library/Application Support/Sikulix/SikulixLibs/libopencv_java.dylib
  Reason: image not found
[error] Save your work, correct the problem and restart the IDE!
[error] see: https://github.com/RaiMan/SikuliX1/wiki/macOS-Linux:-Support-Libraries-for-OpenCV-4
TERMINATING: problem with native library: libopencv_java.dylib
[error] script [ testText ] stopped with error in line 2
[error] java.lang.ExceptionInInitializerError ( java.lang.ExceptionInInitializerError )
[error] --- Traceback --- error source first
line: module ( function ) statement 
2: main (  <module> )     tr = TextOCR.start()
[error] --- Traceback --- end --------------
```

The reason behind: Until 2.0.4 the native libraries of the OpenCV package are only bundled for Windows.
They have to be installed on macOS and Linux by the user himself.

**With SikuliX 2.0.5+ the libraries OpenCV version 4.3.x or later are used**

Since 2.0.5 precompiled static libraries including all dependencies are bundled with SikuliX for Windows, macOS and Ubuntu (or compatible Linux flvours). So you might only get problems on Linux flavours.

***

**OpenCV for macOS until 2.0.4**

***
A little background: Only the library `opencv_java.dylib` (bridge from Java to the openCV feature libraries) is bundled as a convenience, since currently in the net it is not available ready to install and is a bit complex to create. So only the openCV feature libraries have to be installed by the SikuliX user himself.

Recommendation: install [Homebrew](https://brew.sh) as package manager, which should not make any problems on recent macOS versions (tested with success on macOS 10.13+).

Get the OpenCV package installation by just running this in a Terminal window:

`brew install opencv`

After successful installation of opencv, try again with SikuliX.

This might work as well with other package managers like MacPorts, Finch, ..., but is not tested.

... and of course you can do it by building from the sources.

***

**OpenCV for Linux**

***

You have to check, whether for your Linux flavour a package OpenCV is available, that provides the needed libraries. Make sure a link named `libopencv_java.so` is available in your loader path at runtime pointing to the provided `libopencv_javaXYZ.so`.

In doubt you have build from the sources.

[Look here for instructions on OpenCV 3.x](https://sikulix-2014.readthedocs.io/en/latest/newslinux.html#getting-the-opencv-support-ready)

[This is an example instruction found in the net (contrib stuff not needed)](https://www.learnopencv.com/install-opencv-4-on-ubuntu-18-04/?_gl=1*hzofr5*_ga*YW1wLVA3SkUxdlVEZXduZERmVmJ0c0xIcndKdkdLWWxLVHZ5Z3pGNFFnT2FWd05pM3hLbVluMUFOUE5sMTRfckxvRHk)

**Ubuntu 20.04 LTS** provides prebuilt OpenCV packages that can run with `sikulixide-2.0.4.jar`.

```
sudo apt install libopencv4.2-java openjdk-11-jre-headless
cd /usr/lib/jni/
sudo ln -s libopencv_java420.so libopencv_java.so
```