# Source: https://docs.folivora.ai/docs/actions/text-transformer

- [
- [Actions
- JS Text Transformer Functions

# JavaScript Text Transformer functions


Starting with BTT 3.356 you can define custom JavaScript functions that can be used to transform text inside of BTT.


## Use Cases[​


- **[BTT Clipboard Manager:**


All JavaScript Text Transformer functions automatically show up as actions in the BTT Clipboard Manager. This allows to transform copied text before pasting it.

![clipboardmanager](/assets/images/clipboard_transformer-5fd55833b7f7d6253af08efb159be3b6.png)


- **In-Place Text Replacement**


Combined with the predefined action **Transform Selected Text With JavaScript** this can be used for replacing selected text with some transformed version:


Sorry, your browser doesn't support embedded videos, but don't worry, you can
[download it
and watch it with your favorite video player!


Transformer functions also work with the **[Insert / Paste / Type Custom Text** action.


## How to Create a Transformer Function[​


To create a new transformer function go to the "Named & Other Triggers" section in BetterTouchTool. Then create a new trigger and select "Clipboard Manager / JavaScript Transformer".


![clipboardmanager](/assets/images/transformer_function-f623cf5427db8fbb35fa140bbae942cc.png)


There you should enter a name for the transformer. Optionally you can select a pasteboard type (advanced & optional, you usually don't need that for text) and you can also select a keyboard shortcut and icon which will be helpful in the BTT clipboard manager.


## How to define transformer functions[​


There are three requirements for the transformer functions:


- The transformer functions always need to be defined as async.

- It must take a parameter and that parameter needs to be called clipboardContentString.

- It must return a string.


Inside of that function you can use all standard JavaScript and additionally the BTT additions to e.g. run shell scripts or AppleScripts.


**Examples**


Simple function that converts text to upper case:

```
`async (clipboardContentString) => {
    //example
   return clipboardContentString.toUpperCase()
}
`
```


Function that creates 𝕗𝕒𝕟𝕔𝕪 𝕝𝕠𝕠𝕜𝕚𝕟𝕘 text:

```
`async (clipboardContentString) => {
clipboardContentString= clipboardContentString.replace(/[a-z]/g, (char) => {
    const code = char.charCodeAt() - 97;
    return String.fromCharCode(55349, code + 56658);
  });
return clipboardContentString;
}
`
```


Function that replaces a selected math equation with its result (stupid example :-):

```
`async (clipboardContentString) => {
   return eval(clipboardContentString);
}
`
```


Function that executes a terminal command

```
`async (clipboardContentString) => {
  let shellScript = `date`;

    let shellScriptWrapper = {
        script: shellScript, // mandatory
        launchPath: '/bin/bash', //optional - default is /bin/bash
        parameters: '-c', // optional - default is -c (please separate additional parameters using ;;)
        environmentVariables: '' //optional e.g. VAR1=/test/;VAR2=/test2/;
    };


    let result = await runShellScript(shellScriptWrapper);
    return result
}
`
```
[PreviousInsert / Type / Paste Custom Text[NextScreenshots

- [Use Cases
- [How to Create a Transformer Function
- [How to define transformer functionsCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
