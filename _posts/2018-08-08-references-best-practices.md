---
title: "Best Practices"
category: references
date: 2019-01-15 15:17:55
last_modified_at: 2019-07-29 16:52:00
order: 8
---

# Best Practices
***
### Long load time AJAX call
* As we know, the modern web application always load data by AJAX call. Sometime, it may needs a long time to get the AJAX call result. The automation test case become not stable in this case. It's because that, the test case run the test steps without waiting the AJAX call end.
* Normally, there is a loading indicator on the HTML to indicate a AJAX call is completed or not. We could resolve the problem by adding the **waitElement** command after the AJAX call test step. So that the system will wait a certain seconds until the loading indicator element becomes **visible/hidden/enabled/disable**.
* The **waitElement** command:
	* **Type**: The value could be Visible, Hidden, Enabled and Disable.
	* **Timeout**: The waiting seconds.
	* **Element ID/Element CSS/XPATH**: These values can be used to locate the AJAX loading indicator HTML element on the UI page.

   ![][references-wait-element]



  [references-wait-element]: ../images/references/references-wait-element.png
  [references-idarecorder]: ../images/references/IDARecorder.png
  [references-browserconsole]: ../images/references/Browserconsole.png
  [references-pluginConsole]: ../images/references/PluginConsole.png
  [references-plugin]: ../images/references/Plugin.png
  [references-backgroundconsole]: ../images/references/IDABackgroud.png
