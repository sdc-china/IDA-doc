---
title: "IDA Plug-in Troubleshooting"
category: troubleshooting
date: 2018-12-07 15:17:55
last_modified_at: 2020-06-16 16:50:00
---

# IDA Plug-in Troubleshooting
When you run the IDA plug-in for replay, you might encounter an issue with the plug-in. You should see the step with a highlighted red color. When you move the mouse over the red icon, it will show the details of the issue.

   ![][references-idarecorder]

You can use the following ways to collect logs for the plug-in.

1. You can use the browser console to see the logs for the IDA recorder plug-in console.

   ![][references-pluginConsole]

2. You can use the browser console to see the logs for the UI console.

   ![][references-browserconsole]

3. Manage the extension of the IDA plug-in. Switch the "Developer mode" on the top right page. Then, click the "Inspect views" "background page" to see the background.js console messages.

    ![][references-plugin]

    ![][references-backgroundconsole]

4. You can also check the server-side console to see any logs with this step.


  [references-wait-element]: ../images/references/references-wait-element.png
  [references-idarecorder]: ../images/references/IDARecorder.png
  [references-browserconsole]: ../images/references/Browserconsole.png
  [references-pluginConsole]: ../images/references/PluginConsole.png
  [references-plugin]: ../images/references/Plugin.png
  [references-backgroundconsole]: ../images/references/IDABackgroud.png