---
title: "IDA Plug-in troubleshooting"
category: trouble-shooting
date: 2018-11-02 15:17:55
last_modified_at: 2020-06-16 16:50:00
order: 3
---

# IDA plug-in troubleshooting
When you run IDA plug-in for replay you might meet issue for the plug-in. You should see the step with highlighted red color.When you move the mouse the red icon,it will show the detail issue.

   ![][references-idarecorder]

You can use below ways to collect logs of plug-in.

1. You can use the browser console to see the logs for IDA recorder plug-in console.

   ![][references-pluginConsole]

2. You can use the browser console to see the logs for  UI console.

   ![][references-browserconsole]

3.  Manage the extension of IDA plug-in.Switch the "Developer mode" on the right top page.Then click the Inspect views "background page" to see background.js console message.

    ![][references-plugin]


    ![][references-backgroundconsole]

4.  You can also check server side console to see any logs with this step.


  [references-wait-element]: ../images/references/references-wait-element.png
  [references-idarecorder]: ../images/references/IDARecorder.png
  [references-browserconsole]: ../images/references/Browserconsole.png
  [references-pluginConsole]: ../images/references/PluginConsole.png
  [references-plugin]: ../images/references/Plugin.png
  [references-backgroundconsole]: ../images/references/IDABackgroud.png
