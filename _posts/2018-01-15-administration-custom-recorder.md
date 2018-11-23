---
layout: page
title: "Custom recorder"
category: administration
date: 2018-01-05 15:17:55
order: 8
---
### Overview
  To support the various modern UI frameworks, we can extend the IDA recorder script. The page can be accessed by the menu **Administration -> Custom Recorder**.

![][administrator_default_script]

  Uncomment the definition of the **bta.record.RECORD_EVENTS** to enable the script. 

|**bta.record.RECORD_EVENTS**|Array of **recorder mapping**|This is the array to maintain the mapping between test command and the target UI control.
|**The recorder mapping**|JSON object|The key represents a test command which compose of the command category and command name. For example: **UI.click** stands for the command **click** under category **UI**. The value is **the target UI control configuration**.
|**The target UI control configuration**|JSON object|The JSON contains three keys **cssSelector**, **setValue** and **events**.
|**cssSelector**|Array of string|The css selector can identify the UI controls.
|**setValue**|function(element, data)|**element** is the target UI control DOM element. **data** is the recorded data.
|**events**|Array of string|The recorder will fire the corresponding event on the target UI control, and also trigger the **setValue** function.
  
[administrator_default_script]: ../images/administrator/administrator_default_script.png