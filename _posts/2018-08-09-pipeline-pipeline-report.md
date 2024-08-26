---
title: "Pipeline Report"
category: pipeline
date: 2018-08-09 15:17:55
last_modified_at: 2019-07-29 15:53:00
---

# Pipeline Report
***

## Pipeline build status

| Build Status 	| Description |
|:----------------|:------------------------|
| Queued | Build is waiting for execution. |
| Running | Build is in progress. |
| Success | Succeed build.|
| Failed | Failed build.|
| Terminated | Cancelled the build or rejected a pending build. |
| Partial Success| If the checkstyle step or test step set "Halt on failure" to be false, and failed the step, then the build status is partial success.|
| Pending | The build is wating for approval or resume. |


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