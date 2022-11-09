---
title: "IDA Troubleshooting"
category: trouble-shooting
date: 2018-12-05 15:10:55
last_modified_at: 2022-04-27 16:50:00
---

# IDA Troubleshooting
To trouble shoot all IDA issues, you may need to adjust log level. You may also need to check data in the IDA database.

1. On Settings page, set trace level to DEBUG.

   ![][set_log_level]

2. Monitor IDA server logs. Reproduce the issue and collect the logs when the issue is reproduced. For example, if you installed IDA on Liberty, you may collect logs using either method below:
   - Find log files console.log, message.log in logs folder.

   ![][get_logs]

   - Dump all server logs using Liberty server commmand below. File ida_server.zip is generated in server folder which includes all server logs.
   ```
   server dump ida_server --archive="ida_server.zip"
   ```

3. Refer [Test Project Troubleshooting](../troubleshooting/troubleshooting-test-project-troubleshooting.html), [Pipeline Troubleshooting](../troubleshooting/troubleshooting-pipeline-troubleshooting.html) and [IDA plug-in troubleshooting](../troubleshooting/troubleshooting-ida-plugin-troubleshooting.html) to collect more info for troubleshooting test project and pipeline issues.

4. Collect info above into an issue description document. Send us the document and the collected logs and other files. We will review all collected info and follow up with you. We may also provide further instructions to check data in IDA database, according to your specific issue.

5. Remember to adjust log level back to INFO after troubleshooting is done on production environment if needed.


[set_log_level]: ../images/troubleshooting/set_log_level.png
[get_logs]: ../images/troubleshooting/get_logs.png