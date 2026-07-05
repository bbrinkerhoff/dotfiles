# Source: https://docs.folivora.ai/docs/launcher/dynamic_content

- [
- [Launcher
- Dynamically Generated Content

# Dynamically Generated Content

The Launcher allows you to show dynamic items. For example you could dynamically query some APIs (e.g. stock info, weather data etc.), run shell or apple scripts. This all works by leveraging BTT's [Simple JSON Format / JavaScript


To configure this you will need to add a "Launcher Simple JSON Item" in BTT's "Automations, Named & Other Triggers" section and provide a script that returns the JSON to define the items:


![alt text](/assets/images/dynamically_generated_groups2026-05-04T07:59:49.430Z-7e8a251017a0b6bf6b176a2f7d854c9b.png)


Here is an example that dynamically loads various system information by calling some basic shell scripts:


Sorry, your browser doesn't support embedded videos, but don't worry, you can
[download it
and watch it with your favorite video player!


Here is the [Simple JSON Format Script for this example:

```
`async function retrieveJSON(prompt) {
  return JSON.stringify([
    {
      title: "Overview",
      meta: "overview",
      icon: "sfsymbol::desktopcomputer",
      subitemsFunction: "loadOverviewItems"
    },
    {
      title: "Hardware",
      meta: "hardware",
      icon: "sfsymbol::cpu",
      subitemsFunction: "loadHardwareItems"
    },
    {
      title: "Storage",
      meta: "storage",
      icon: "sfsymbol::internaldrive",
      subitemsFunction: "loadStorageItems"
    }
  ]);
}

async function loadOverviewItems(prompt, itemIdentifier) {
  const output = await runShellScript({
    launchPath: "/bin/zsh",
    parameters: "-lc",
    script: `
      printf 'macOS|%s\\n' "$(/usr/bin/sw_vers -productVersion)"
      printf 'Uptime|%s\\n' "$(/usr/bin/uptime | /usr/bin/sed 's/^.*up //; s/, [0-9]* users.*$//')"
      printf 'Computer Name|%s\\n' "$(/usr/sbin/scutil --get ComputerName 2>/dev/null || /bin/hostname)"
    `
  });

  return JSON.stringify(itemsFromPipeOutput(output, "sfsymbol::info.circle"));
}

async function loadHardwareItems(prompt, itemIdentifier) {
  const output = await runShellScript({
    launchPath: "/bin/zsh",
    parameters: "-lc",
    script: `
      printf 'Model|%s\\n' "$(/usr/sbin/sysctl -n hw.model)"
      printf 'Chip|%s\\n' "$(/usr/sbin/sysctl -n machdep.cpu.brand_string 2>/dev/null || /usr/sbin/sysctl -n hw.model)"
      printf 'CPU Cores|%s\\n' "$(/usr/sbin/sysctl -n hw.ncpu)"
      printf 'Memory|%s\\n' "$(/usr/sbin/sysctl -n hw.memsize | /usr/bin/awk '{printf "%.1f GB", $1/1024/1024/1024}')"
    `
  });

  return JSON.stringify(itemsFromPipeOutput(output, "sfsymbol::cpu"));
}

async function loadStorageItems(prompt, itemIdentifier) {
  const output = await runShellScript({
    launchPath: "/bin/zsh",
    parameters: "-lc",
    script: `
      /bin/df -h / /System/Volumes/Data 2>/dev/null | /usr/bin/awk 'NR>1 {print $9 "|" $4 " free of " $2}'
    `
  });

  return JSON.stringify(itemsFromPipeOutput(output, "sfsymbol::internaldrive"));
}

function itemsFromPipeOutput(output, icon) {
  return String(output)
    .trim()
    .split("\n")
    .filter(Boolean)
    .map((line) => {
      const [title, ...valueParts] = line.split("|");
      const value = valueParts.join("|");
      const text = `${title}: ${value}`;

      return {
        title,
        subtitle: value,
        icon,
        action: `btt::paste_text@@${JSON.stringify({ text })}`
      };
    });
}
`
```


## Preserving the Launcher prompt for subitems[​


When a Launcher Simple JSON item uses `subitemsFunction`, BetterTouchTool normally calls that function with the current prompt and the item's identifier:

```
`async function loadItems(prompt, itemIdentifier) {
  return JSON.stringify([
    // ...
  ]);
}
`
```


If an item should carry the prompt that created it into the next page, add `preservePrompt: true`. BetterTouchTool will then pass that original prompt as a third argument:

```
`async function loadItems(prompt, itemIdentifier, preservedPrompt) {
  return JSON.stringify([
    // ...
  ]);
}
`
```


Keep `meta` stable and use it as the item identifier. Do not put the typed prompt into `meta`; that would make item identity change depending on what the user typed.


## Using the subgroup prompt as input[​


For command-style groups you often want a different behavior:


- Search for a Launcher Simple JSON item, for example `Open URL`.

- Open that item.

- Type the actual input, for example `https://heise.de`.

- Choose one of the visible actions, for example "Open in Safari" or "Paste URL".


In that case the typed prompt should be treated as input, not as a filter for the subgroup. Set `launcherDisplayMode: "always"` on the returned action items. This is the Simple JSON equivalent of **Show In Launcher (Ignore Prompt Filter, Always Show)**.


The current subgroup prompt is available to actions as the `BTTLauncherPrompt` variable. The following script returns browser actions that stay visible while you type the URL:

```
`async function retrieveJSON() {
  return JSON.stringify([
    {
      title: "Open in Safari",
      subtitle: "Uses the current Launcher prompt as URL",
      meta: "open-in-safari",
      icon: "sfsymbol::safari",
      launcherDisplayMode: "always",
      action: openUrlAction("com.apple.Safari")
    },
    {
      title: "Open in Default Browser",
      subtitle: "Uses the current Launcher prompt as URL",
      meta: "open-in-default-browser",
      icon: "sfsymbol::globe",
      launcherDisplayMode: "always",
      action: openUrlAction("Default")
    },
    {
      title: "Paste URL",
      subtitle: "Uses the current Launcher prompt as URL",
      meta: "paste-url",
      icon: "sfsymbol::doc.on.clipboard",
      launcherDisplayMode: "always",
      action: pasteUrlAction()
    }
  ]);
}

function openUrlAction(browserBundleIdentifier) {
  return {
    js: `
      async function run() {
        const input = await get_string_variable({ variable_name: "BTTLauncherPrompt" });
        const url = normalizeUrl(input);
        return await trigger_action({
          json: JSON.stringify({
            BTTPredefinedActionType: 59,
            BTTPredefinedActionName: "Open URL  or  Open URL With Selection",
            BTTOpenURL: url,
            BTTOpenURLBrowser: ${JSON.stringify(browserBundleIdentifier)}
          }),
          wait_for_reply: true
        });
      }

      function normalizeUrl(value) {
        const text = String(value || "").trim();
        if (/^https?:\\/\\//i.test(text)) {
          return text;
        }
        return "https://" + text;
      }
    `,
    function: "run"
  };
}

function pasteUrlAction() {
  return {
    js: `
      async function run() {
        const input = await get_string_variable({ variable_name: "BTTLauncherPrompt" });
        const url = normalizeUrl(input);
        return await paste_text({
          text: url,
          insert_by_pasting: true
        });
      }

      function normalizeUrl(value) {
        const text = String(value || "").trim();
        if (/^https?:\\/\\//i.test(text)) {
          return text;
        }
        return "https://" + text;
      }
    `,
    function: "run"
  };
}
`
```


`launcherDisplayMode` accepts the same modes as the configured Launcher UI:


|  | Value | UI behavior |
|  | `"hidden"` or `0` | Don't Include In Launcher |
|  | `"filter"` or `1` | Show In Launcher (Filter With Prompt) |
|  | `"always"` or `3` | Show In Launcher (Ignore Prompt Filter, Always Show) |
|  | `"keyword"` or `4` | Only Show If Keyword Matches |
|  | `"prompt"` or `5` | Only Show If Prompt Matches |
|  | `"fallback"` or `6` | Only Show If Prompt Matches, Or If Nothing Else Matches |[PreviousSwift Plugins[NextInclude Existing BTT Triggers

- [Preserving the Launcher prompt for subitems
- [Using the subgroup prompt as inputCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
