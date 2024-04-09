
---
title: "Best Practices"
category: references
date: 2018-11-19 15:17:55
last_modified_at: 2019-07-29 16:52:00
---

# Best Practices
***

## Long Load Time for AJAX Calls
* As we know, modern web applications always load data by AJAX calls. Sometimes, it may take a long time to get the AJAX call result. The automation test case becomes unstable in this case, because the test case runs the test steps without waiting for the AJAX call to end.
* Normally, there is a loading indicator on the HTML to indicate whether an AJAX call is completed or not. We could resolve the problem by adding the **waitElement** command after the AJAX call test step. So that the system will wait for a certain number of seconds until the loading indicator element becomes **visible/hidden/enabled/disabled**.
* The **waitElement** command:
	* **Type**: The value could be Visible, Hidden, Enabled, and Disabled.
	* **Timeout**: The waiting time in seconds.
	* **Element ID/Element CSS/XPath**: These values can be used to locate the AJAX loading indicator HTML element on the UI page.

   ![][references-wait-element]

  [references-wait-element]: ../images/references/references-wait-element.png
  [references-idarecorder]: ../images/references/IDARecorder.png
  [references-browserconsole]: ../images/references/Browserconsole.png
  [references-pluginConsole]: ../images/references/PluginConsole.png
  [references-plugin]: ../images/references/Plugin.png
  [references-backgroundconsole]: ../images/references/IDABackgroud.png