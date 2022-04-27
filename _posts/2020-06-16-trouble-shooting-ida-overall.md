---
title: "IDA Troubleshooting"
category: trouble-shooting
date: 2018-11-02 15:10:55
last_modified_at: 2022-04-27 16:50:00
order: 5
---

# IDA Troubleshooting
To trouble shoot all IDA issues, you may need to adjust log level. You may also need to check data in the IDA database.

1. On Settings page, set trace level to DEBUG.

   ![][set_log_level]

2. Monitor IDA server logs. Reproduce the issue and collect the logs when the issue is reproduced. For example, if you installed IDA on Liberty, you may find log files console.log, message.log in logs folder.

   ![][get_logs]

3. Refer [Test Project Troubleshooting](https://sdc-china.github.io/IDA-doc/trouble-shooting/trouble-shooting-ida-test-project.html), [Pipeline Troubleshooting](https://sdc-china.github.io/IDA-doc/trouble-shooting/trouble-shooting-ida-pipeline.html) and [IDA plug-in troubleshooting](https://sdc-china.github.io/IDA-doc/trouble-shooting/trouble-shooting-ida-plugin.html) to collect more info for troubleshooting test project and pipeline issues.

4. Collect info above into an issue description document. Send us the document and the collected logs and other files. We will review all collected info and follow up with you. We may also provide further instructions to check data in IDA database, according to your specific issue.


[set_log_level]: ../images/troubleshooting/set_log_level.png
[get_logs]: ../images/troubleshooting/get_logs.png