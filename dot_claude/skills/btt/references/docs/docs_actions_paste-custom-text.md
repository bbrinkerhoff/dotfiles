# Source: https://docs.folivora.ai/docs/actions/paste-custom-text

- [
- [Actions
- Insert / Type / Paste Custom Text

# Insert / Type / Paste Custom Text


This action allows you to paste / type some static text you define. It can also work with some dynamic data and allows to transform text with JavaScript Text Transformer functions (starting with BTT 3.356).


You can assign this action to any trigger in BTT, in this example I'm assigning it to a keyboard shortcut:

![clipboardmanager](/assets/images/paste_ex2-7c228d68c45aba7f3f4a53e7fcddfbf6.png)


## Advanced Dynamic Functionality[​


Instead of just pasting some static text, this action offers various dynamic behaviors.


### Dynamic Placeholders[​


Using the "Insert Special" dropdown menu, you can choose from a few placeholders that will automatically be replaced when pasting:


**Currently Selected Text or Clipboard Contents**


This allows to include the currently selected text or the clipboard content. This is really powerful when combined with JavaScript Text Transformer functions. (See bottom of this page)


![clipboardmanager](/assets/images/paste_selected-e7837028ce56446572b96b093d573fed.png)


Sorry, your browser doesn't support embedded videos, but don't worry, you can
[download it
and watch it with your favorite video player!


**Date / Time**


This allows to insert custom date strings into your text. The placeholder that is used for this looks like this:


`(BTT)@dateformat:MM/dd/yy hh:mm:ss a(BTT)`


You can use any custom date format you like (see [http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns for more details).


![paste date time](/assets/images/paste_date_time-6c053f16f4e150c34a6879dfe8053af6.png)


**Variables**


You can access any variables that have been defined in BTT [(they can be defined via scripts)


`(BTT)@variable:theVariableName(BTT)`


## Custom JavaScript Text Transformer Functions[​


Starting with BTT 3.356 this action allows to transform the text using [custom JavaScript transformer functions before pasting it.

![paste transformer](/assets/images/paste_transformer-498b8824bd5da67c55cc97d31ff6f40a.png)
[PreviousClipboard Manager[NextJS Text Transformer Functions

- [Advanced Dynamic Functionality

- [Dynamic Placeholders
- [Custom JavaScript Text Transformer FunctionsCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
