---
title: "IDA Troubleshooting"
category: troubleshooting
date: 2018-12-05 15:10:55
last_modified_at: 2023-04-28 16:50:00
---

# IDA Troubleshooting
To troubleshoot all IDA issues, you may need to adjust the log level. You may also need to check data in the IDA database.

1. On the Settings page, set the trace level to DEBUG.

   ![][set_log_level]{:width="50%"}

2. Monitor the IDA server logs. Reproduce the issue and collect the logs when the issue is reproduced. For example, if you have installed IDA on Liberty, you may collect logs using either method below:
   - Find the log files console.log and message.log in the logs folder.

   ![][get_logs]

   - Dump all server logs using the Liberty server command below. The file ida_server.zip is generated in the server folder, which includes all server logs.
   ```
   server dump ida_server --archive="ida_server.zip"
   ```

   - If an OutOfMemory (OOM) error is found in the logs, please provide the Liberty server dump including the heap dump, using the command below:
   ```
   server dump ida_server --archive="ida_server.zip" --include=heap
   ```

3. Refer to [Test Project Troubleshooting](../troubleshooting/troubleshooting-test-project-troubleshooting.html), [Pipeline Troubleshooting](../troubleshooting/troubleshooting-pipeline-troubleshooting.html), and [IDA plug-in troubleshooting](../troubleshooting/troubleshooting-ida-plugin-troubleshooting.html) to collect more information for troubleshooting test project and pipeline issues.

4. Collect the information above into an issue description document. Send us the document and the collected logs and other files. We will review all the collected information and follow up with you. We may also provide further instructions to check data in the IDA database, according to your specific issue.

5. Remember to adjust the log level back to INFO after troubleshooting is done on the production environment if needed.


[set_log_level]: ../images/troubleshooting/set_log_level.png
[get_logs]: ../images/troubleshooting/get_logs.png