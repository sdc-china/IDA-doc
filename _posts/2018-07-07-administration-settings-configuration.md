---
title: "Settings Configuration"
category: administration
date: 2018-10-24 15:17:55
last_modified_at: 2020-01-08 16:25:00
order: 15
---

# Settings configuration
***
### About this task

In this task, you can runtime update some settings values in IDA.

 ![][administrator_settings]

### Set log level

You can runtime update log level in IDA, after that you can see the logs in real time based on the log level changes.

  1. Click Administrator tab, then switch to Settings tab.
  2. Change the log level and click  save button to save the log configuration. In default it have five levels (TRACE, DEBUG,WARN,INFO,ERROR).
  3. After that you can find the log level is changed in the console, log file etc.  

### Set Interval for Trigger by New Snapshot

You can runtime update the time interval(in seconds) for the background job to query for new snapshots on PC servers.

  1. Click Administrator tab, then switch to Settings tab.
  2. Change the Interval for Trigger by New Snapshot and click  save button to save the value. The default value is 300 seconds.


**Notes:**
The settings values are saved in database so if you restart the server, the configurations are still valid.

[administrator_settings]: ../images/administrator/Administrator_settings.png
