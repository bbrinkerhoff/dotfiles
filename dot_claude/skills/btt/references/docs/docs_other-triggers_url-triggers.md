# Source: https://docs.folivora.ai/docs/other-triggers/url-triggers

- [
- [Other & Named Triggers
- BTT as Default Browser / URL Based Triggers

# Did Open URL / URL Based Trigger


BetterTouchTool (starting with version 3.521) allows you to set it as default browser. If you do that, BTT can handle URLs, e.g. to open specific sites with specific browsers.


The sections on this page:


- Adding the Trigger

- Configuring the Trigger

- Configuring the Action

- Show Browser Selection in Context Menu

- Advanced Usage with Scripts


## 1 Adding the Trigger[​


Go to the **Named & Other Triggers** section in BTT and add a new trigger. Select **Did Open URL** from the General section.


## 2 Configuring the Trigger[​


It is pretty simple to do the basic setup so BTT can know which URLs it should intercept. You just need to specify the URL (you can use wildcards *).


Now whenever a matching URL is called it will be saved into the BTT internal variable called **BTT_OPENED_URL**.
Additionally BTT will save the path to the app that triggered the opening of the URL in the variable called **BTT_OPENED_URL_FROM_APP**.


![global settings](/assets/images/browser_matching_urls2-b8ca9357fb271d213c49917cd35be7c4.png)


**Global Settings**


There are currently two global settings (they apply to all **Did Open URL** triggers):


- 


**Default Browser**: This is the Browser that is used for URLs that do not match any of the rules configured in BTT.


- 


**URL Shorteners**: BTT will try to un-shorten links from shortener services defined in the list. If you do not want any un-shortening to happen, remove all entries from that list.


![global settings](/assets/images/global_settings_url-15152f8faf6ba41ef6e5c695bcfe9b51.png)


## 3 Configuring the Action[​


One of the main use cases for this feature is to allow the usage of different web browsers for different websites. This can be achieved easily using the predefined action "Open URL / Open URL with Selection".
Instead of specifying a URL you enter the variable like this: **{BTT_OPENED_URL}**, then just select the browser you want to use for the URL.


![configure did open url part 2](/assets/images/browser_openurl-87f06a66eb3c56041f586dbc17af7bcf.png)


## 4 Show Browser Selection in Context Menu[​


It's also possible to show a menu with a list of possible browsers when clicking on a link. To do this use the predefined action "Show Custom Context Menu" and create multiple [Named Triggers, one for every browser you want to support:


![context menu](/assets/images/browser_context_menu-d6a23da2ce45399825fc9db57d834084.png)


It will then show a menu like this when clicking a link:


![context menu 2](/assets/images/browser_context_2-d8659d403f1e3f8b02ab57ec60d07f0c.png)


## 5 Advanced Usage With Scripts[​


If you need more flexibility, e.g. to trigger some advanced browser features for specific URLs, I recommend to use the predefined action **"Run Real JavaScript"**. While the AppleScript actions would also work, I feel the JavaScript action is easier to use.


Here is an example on how to use the "Run Real JavaScript" action to access the opened URL and app that triggered it - and then running a shell script to open a specific Browser:


![javascript scripting](/assets/images/browser_js-850da26ab4c69a024ca7cecdc59ed2ce.png)


```
`(async ()=> {

// this gets the url that was opened
let url = await get_string_variable({variable_name:'BTT_OPENED_URL'});

// in case you want to decide based on the app you can also get the app path from where it was opened
let appPath = await get_string_variable( {variable_name:'BTT_OPENED_URL_FROM_APP'});

// this will open safari with the given URL
let openScript = {
    launchPath: '/usr/bin/open',     
	parameters: '-b;;com.apple.Safari;;' + url, 
};


await runShellScript(openScript);

returnToBTT(url+'-'+appPath);
})();
`
```
[PreviousReusable Named Triggers[NextCustom Menubar Status Items

- [1 Adding the Trigger
- [2 Configuring the Trigger
- [3 Configuring the Action
- [4 Show Browser Selection in Context Menu
- [5 Advanced Usage With ScriptsCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
