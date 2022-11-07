---
title: "Test Project Troubleshooting"
category: trouble-shooting
date: 2018-12-09 15:19:55
last_modified_at: 2022-04-27 16:50:00
---

# Test Project Troubleshooting
When you run test cases in a test project, you can review test reports and logs for troubleshooting.


1. For a failed test case, open its test report and click to view the Trace messages on the failed step. Also review the screenshots above the failed step if available.

   ![][test_project_test_report]

   ![][test_project_test_step_trace]

2. Scroll down the test report to the Log Details section. Download and review detailed test case logs.

   ![][test_project_test_logs]

3. Fix the test case according to info collected above. If you are not able to fix it, continue with steps below to collect more info and contact us for troubleshooting.


4. Replay the test case in plugin to determine if it is only failed in selenium grid or failed on the same test step both in plugin and in selenium grid. 

5. Confirm if the issue can be consistently reproduced.

6. Export the test project and twx file. Test project can be exported to a zip file using the dropdown menu to the right of the test project name. TWX should be exported from BAW Workflow Center.

   ![][test_project_export]

7. Collect info above into an issue description document. Send us the document and the collected logs, test project.zip and twx file. We will review all collected info and follow up with you.

[test_project_test_report]: ../images/troubleshooting/test_project_test_report.png
[test_project_test_step_trace]: ../images/troubleshooting/test_project_test_step_trace.png
[test_project_test_logs]: ../images/troubleshooting/test_project_test_logs.png
[test_project_export]: ../images/troubleshooting/test_project_export.png
