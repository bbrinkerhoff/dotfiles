# Source: https://docs.folivora.ai/docs/configuration/global-vs-app-specific

- [
- [BTT Configuration
- Global and App Specific Triggers

# Global and App-Specific Triggers


In BetterTouchTool, you can configure either **global triggers** that work across all apps or **app-specific triggers** that are active only when a specific app is in focus.


## Global Triggers[​


To create a trigger that works in all apps:


- Select **"All Apps"** from the sidebar.

- Add the desired trigger.


![Global Trigger Example](/assets/images/trackpad_global_trigger_example-5b9106341969aa1c1377faada46adc38.png)


## App-Specific Triggers[​


To create a trigger for a specific app:


- Click the **+** button at the bottom left of the BetterTouchTool preferences window.

- Choose an app from your running applications or your file system.


![Add App-Specific Trigger](/assets/images/add_app_specific_trigger_menu-9b96c916bfb514be9532a668026e994d.png)


- Select the added app in the sidebar and configure your trigger.


![App-Specific Trigger Example](/assets/images/app_specific_trigger_example-8f041ed5183865713cbd29e7dd23ca27.png)


## Specify Triggers for Groups of Apps[​


Sometimes, you may want to assign triggers to a group of apps (e.g., all browsers). To do this, use **Conditional Activation Groups**:


- Click the **+** button at the bottom left of the preferences window and select **"Create Conditional Activation Group."**

- Define a condition that applies to multiple apps.


![Define Conditions for Apps](/assets/images/conditional_activation_group_browsers-de28d0b9e11711cba8d2f13626375474.png)


- Assign your trigger to the conditional activation group.


![Assign Trigger to Group](/assets/images/conditional_activation_group_selected-14411fdc6086cbbfafb4f8c6e90d89b5.png)


Conditional activation groups can also be used to create exclusions. For instance, the following condition excludes specified browsers but enables the assigned triggers to all other apps:


![Exclusion Example](/assets/images/conditional_activation_group_exclusion-1f57b061c577379267ce6c6046960f00.png)


## Exclude Global Triggers from Specific Apps[​


To exclude some global triggers for specific apps, you have several options:


- 


**Disable the global trigger for the app**:


- If a trigger is disabled for a specific app, the app will fall back to its default behavior for that trigger.


- 


**Assign the action "Use Apple Default or Do Nothing"**:


- Same as disabling a trigger, the app will fall back to its default behavior for that trigger.


- 


**Use Conditional Activation Groups**:


- Define conditions to specify where the trigger should be active. See the [previous section for details.


# Special Cases (Work in Progress)


## Floating Menus and Merging[​


If you define an app-specific floating menu, it will appear only in that app. However, if you configure a floating menu with the **same identifier** in the "All Apps" section, BetterTouchTool will merge these menus.


![Merged Floating Menus Example](/assets/images/floating_menu_merged_identifier-c0052bdca8969342126d41d652299560.png)


This functionality allows you to dynamically adjust menus based on the active app or the active [Conditional Activation Group.


To control the order of merged menu items, use the **"Display Order"** property:


![Display Order Example](/assets/images/floating_menu_display_order-ac346fa0cc2b8469e4a0aebe204031a7.png)


## Stream Deck[​


## Touch Bar[​[PreviousSetting up a new Trigger[NextPresets

- [Global Triggers
- [App-Specific Triggers
- [Specify Triggers for Groups of Apps
- [Exclude Global Triggers from Specific Apps
- [Floating Menus and Merging
- [Stream Deck
- [Touch BarCommunity

- [ForumMore

- [Privacy Policy
- [Website
- [Documentation GitHubCopyright 2026 folivora.AI GmbH.
