## Recoder Test Run in the project context (IntelliJ IDEA)

***

### *** Maven Config to rebuild the API branch

***

![](https://github.com/RaiMan/SikuliX1/blob/release_2.0.x/Support/resources/RunRecorder00.png)

***

### *** Run Config to run a Recorder session in the project context

***

![](https://github.com/RaiMan/SikuliX1/blob/release_2.0.x/Support/resources/RunRecorder01.png)

***

### *** Code in org.sikuli.script.Sikulix::testRun

***

``` java
    if (arg.startsWith("rec")) {
      //region recording
      Device.checkAccessibility();
      if(!MouseDevice.isUseable() || !ScreenDevice.isUseable()) {
        Commons.terminate(999, "Mouse and/or Screen not useable");
      }

      // we are running in API context
      Commons.setStartClass(Sikulix.class);

      // AppDataPath as SikulixAppData in Project/API
      File path = Commons.setAppDataPath(Commons.getStartArg(APPDATA));
      Commons.setTempFolder(new File(path, "Temp"));

      // delete previous recordings
      Recorder.INSTANCE.resetRecordingDirectory();

      SX.popup("ok to start recording");
      Recorder.INSTANCE.startRecording();

      SX.popup("ok to stop recording");
      Recorder.INSTANCE.finishRecording();

      Commons.terminate();
      //endregion
    }
```

