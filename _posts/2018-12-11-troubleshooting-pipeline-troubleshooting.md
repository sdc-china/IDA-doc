---
title: "Pipeline Troubleshooting"
category: troubleshooting
date: 2018-12-11 15:20:55
last_modified_at: 2022-04-27 16:50:00
---

# Pipeline Troubleshooting
When you run a pipeline, you can review pipeline step reports and logs of each pipeline build for troubleshooting.

1. Go to the Overview page of a pipeline build.

   ![][pipeline_build_overview]


2. For a failed Checkstyle step, open and view the detailed Checkstyle report. Check if the health score is above the threshold set in the pipeline step.

   ![][pipeline_checkstyle_report]

   ![][pipeline_checkstyle_step]{:width="60%"}

3. For a failed Test step, open its report and click to view the Trace messages and screenshots (if available) on the failed step of failed test cases.

   ![][pipeline_test_report_1]

   ![][pipeline_test_report_2]

   ![][pipeline_test_report_3]

4. For other failed test step issues or detailed test case run logs, go back to the Overview page of a pipeline build. Scroll down to the Log Details section. Download and review detailed pipeline logs. Check if any runtime exceptions/errors are present in the logs.

   ![][pipeline_logs] 

5. Fix test step issues according to the information collected above. If you are unable to fix it, continue with the steps below to collect more information and contact us for troubleshooting.

6. Replay the failed test case in the test project in the Selenium grid and/or plugin to confirm if it is also failed. 

7. Confirm if the issue can be consistently reproduced.

8. Export the pipeline, test project, and TWX file. Pipeline can be exported to a zip file on the pipeline list page. The test project can be exported to a zip file using the dropdown menu to the right of the test project name. The TWX should be exported from the BAW Workflow Center.

   ![][pipeline_export]

   ![][test_project_export]{:width="30%"}

9. Collect the information above into an issue description document. Send us the document and the collected logs, pipeline.zip, test project.zip, and TWX file. We will review all the collected information and follow up with you.

[pipeline_build_overview]: ../images/troubleshooting/pipeline_build_overview.png
[pipeline_checkstyle_report]: ../images/troubleshooting/pipeline_checkstyle_report.png
[pipeline_checkstyle_step]: ../images/troubleshooting/pipeline_checkstyle_step.png
[pipeline_test_report_1]: ../images/troubleshooting/pipeline_test_report_1.png
[pipeline_test_report_2]: ../images/troubleshooting/pipeline_test_report_2.png
[pipeline_test_report_3]: ../images/troubleshooting/pipeline_test_report_3.png
[test_project_export]: ../images/troubleshooting/test_project_export.png
[pipeline_export]: ../images/troubleshooting/pipeline_export.png
[pipeline_logs]: ../images/troubleshooting/pipeline_logs.png