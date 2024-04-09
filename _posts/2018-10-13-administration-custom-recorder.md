---
title: "Custom Recorder"
category: administration
date: 2018-10-13 15:17:55
last_modified_at: 2023-02-28 14:39:00
---

# Custom Recorder
***

## Overview
To support various modern UI frameworks, we can extend the IDA recorder script and utility script. The page can be accessed by the menu **Administration -> Custom Recorder**. Usually, we use this feature to provide a hot fix to customers if the record feature needs to be enhanced.

![][administrator_default_script]{:width="80%"}
![][administrator_util_script]{:width="80%"}

Uncomment the definition of the **bta.record.RECORD_EVENTS** to enable the script.

|**bta.record.RECORD_EVENTS**|Array of **recorder mappings**|This is the array to maintain the mapping between test commands and the target UI controls.|
|**The recorder mapping**|JSON object|The key represents a test command which is composed of the command category and command name. For example: **UI.click** stands for the command **click** under the category **UI**. The value is **the target UI control configuration**.|
|**The target UI control configuration**|JSON object|The JSON contains three keys: **cssSelector**, **setValue**, and **events**.|
|**cssSelector**|Array of strings|The CSS selector can identify the UI controls.|
|**setValue**|function(element, data)|**element** is the target UI control DOM element. **data** is the recorded data.|
|**events**|Array of strings|The recorder will fire the corresponding event on the target UI control and also trigger the **setValue** function.|

[administrator_default_script]: ../images/administrator/administrator_default_script.png
[administrator_util_script]: ../images/administrator/administrator_util_script.png