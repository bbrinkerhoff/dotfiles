If you got here, then you may have tried to use one of the SikuliX OCR features and got an error telling you, that the Tesseract library is missing.

In the IDE it looks something like this:
```
[error] ************************************ ERROR
The Tesseract lib (552) is not available. Save your work, correct it and try again.
https://github.com/oculix-org/SikuliX1/wiki/macOS-Linux:-Tess4J-OCR:-Tesseract-libs
********************************************
[error] script [ test ] stopped with error in line 3
[error] org.sikuli.script.SikuliXception ( org.sikuli.script.SikuliXception: The Tesseract lib is not available )
[error] --- Traceback --- error source first
line: module ( function ) statement 
3: main (  <module> )     print OCR.readText(img)
[error] --- Traceback --- end ———————
```

The reason behind: The native libraries of the Tesseract package are only bundled with SikuliX for Windows, but have to be installed on macOS and Linux by the SikuliX user himself.

The following applies to Oculix (beginning May 2026)

***

**Tesseract for macOS**

***
The recommendation is to install [Homebrew](https://brew.sh) as package manager, which should not make any problems on recent macOS versions. It is tested and works.

Get the Tesseract installation by just running this in a Terminal window:

```
brew update
brew install tesseract
```
The `brew update` is mandatory, but assures you get the latest versions with `brew install . . .`
If interested, you might use the Tesseract features then from a Terminal window using the command `tesseract`. 
***

**Tesseract for Linux**

***

You have to check, wether for your Linux flavour a package Tesseract is available, that installs the libraries eventually including any development stuff.

***

**After successful installation of Tesseract run this in a terminal window**

***

`tesseract -v`

and you should get something like this:
```
tesseract 5.5.2
 . . . and more lines
``` 
