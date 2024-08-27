---
title: "Pipeline Report"
category: pipeline
date: 2018-08-09 15:17:55
last_modified_at: 2019-07-29 15:53:00
---

# Pipeline Report
***

## Pipeline Build Status

| Build Status 	| Description |
|:----------------|:------------------------|
| Queued | The build is queued to be executed. |
| Running | The build is running in progress. |
| Success | The build is successful.|
| Failed | The build is failed.|
| Partial Success| The build is partially failed if it has failed, unchecked Halt on Failure steps(for example on Checkstyle or Test steps).|
| Pending | The build is pending for approval on a stage or to be resumed on a deployment step due to a missing custom migration policy.|
| Terminated | The build is cancelled or rejected by a user. |




## Pipeline Report  

Every successful step will have a report in the **Test Reports** page. You can read the report you want by clicking on the cards.

![][pipeline_fullreport]  

Click the **Test Report** card, you can read the whole unit testing report of this project. It includes the test summary statistics of every test suite, test case, and test step.  

![][pipeline_unitreport]  

Click the **[Checkstyle Report][2]** card to see the result. The same way to read other reports.

[pipeline_summary]: ../images/pipeline/pipeline_build_summary.PNG
[pipeline_report]: ../images/pipeline/pipeline_report.png
[pipeline_chart]: ../images/pipeline/pipeline_chart.png
[pipeline_fullreport]: ../images/pipeline/pipeline_fullreport.png
[pipeline_unitreport]: ../images/pipeline/pipeline_unit_report.png
[1]: ../test/test-import_execute-sample-test-project.html
[2]: ../checkstyle/checkstyle-checkstyle-report.html