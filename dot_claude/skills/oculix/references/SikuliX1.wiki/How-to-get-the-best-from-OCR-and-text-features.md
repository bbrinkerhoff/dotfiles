**This is for version 2.0.x and 2.1.x**

to be written ;-)

Just some notes for measures when default doesn't provide good results (@RaiMan needs to add some additional explanations :-)):

* Try legacy engine (OEM 0) together with tessdata from [here](https://github.com/tesseract-ocr/tessdata)
* Use [tessdata_best](https://github.com/tesseract-ocr/tessdata_best) models instead of tessdata_fast (causes massive performance degradation). Or just use [tessdata](https://github.com/tesseract-ocr/tessdata) which use integerized (faster) versions of tessdata_best without sacrificing too much accuracy.
* Use an appropriate PSM. Especially 7/8/9 if you want to detect a single line/word/character. Use convenience methods `TextRecognizer.asLine()`, `TextRecognizer.asWord()` or `TextRecognizer.asChar()` to get preconfigured `TextRecognizer`instances for this use cases.
* If text is very small (<= 8 px) or very big (> 30px) give the OCR engine a hint using `setFontSize()` or `setUppercaseXHeight()`