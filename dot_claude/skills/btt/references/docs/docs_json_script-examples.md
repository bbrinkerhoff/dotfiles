# Source: https://docs.folivora.ai/docs/json/script-examples

- [
- [JSON Definitions
- Script Examples

# Script Examples

Set volume

```
`async function someFunctionName() {
     set_number_variable({ variableName: "OutputVolume", to: 0.5 }); //50%
}
`
```


Shell Script

```
`async function someJavaScriptFunction() {
  let path_or_url = await get_clipboard_content({format: "public.file-url" /*optional*/, asBase64: false, excludeConcealed: false});

  let cfg = {
    script: `/opt/homebrew/bin/airdrop ${path_or_url}`,
    launchPath: "/bin/bash",
    parameters: "-c",
  };
  let result = await runShellScript(cfg);
  
  return result;
}
`
```


Get Running Apps

```
`
async function someJavaScriptFunction() {
let apps = await BTTActions.copyLaunchedApplicationsInFrontToBackOrder();

let appsString = JSON.stringify(apps);

await set_string_variable({variableName: "something", to: appsString});
		
}
`
```
[PreviousJSON Examples[NextNotch Bar (Deprecated)Community

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
