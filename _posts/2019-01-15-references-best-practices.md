---
layout: page
title: "Best Practices"
category: references
date: 2018-11-15 15:17:55
order: 8
---

### Long load time AJAX call
* As we know, the modern web application always load data by AJAX call. Sometime, it may needs a long time to get the AJAX call result. The automation test case become not stable in this case. It's because that, the test case run the test steps without waiting the AJAX call end.
* Normally, there is a loading indicator on the HTML to indicate a AJAX call is completed or not. We could resolve the problem by adding the **waitElement** command after the AJAX call test step. So that the system will wait a certain seconds until the loading indicator element becomes **visible/hidden/enabled/disable**. 
* The **waitElement** command:
	* **Type**: The value could be Visible, Hidden, Enabled and Disable.
	* **Timeout**: The waiting seconds.
	* **Element ID/Element CSS/XPATH**: These values can be used to locate the AJAX loading indicator HTML element on the UI page.

   ![][references-wait-element]

### IDA plug-in troubleshooting
* When you run IDA plug-in for replay you might meet isssue for the plug-in. You should see the  the step with highlighted red color.When you move the mouse the red icon,it will show the detail issue.

   ![][references-idarecorder]

* You can also use the browser console to see the logs for plug-in console.You can check the plug-in console for detail error message.

   ![][references-pluginConsole]

* You can also use the browser console to see the logs for BPM UI console.You can check the BPM UI console message for detail error message.

   ![][references-browserconsole]


  [references-wait-element]: ../images/references/references-wait-element.png
  [references-idarecorder]: ../images/references/IDARecorder.png
  [references-browserconsole]: ../images/references/Browserconsole.png
  [references-pluginConsole]: ../images/references/PluginConsole.png
