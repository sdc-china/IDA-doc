---
title: "Pipeline report"
category: pipeline
date: 2018-10-14 15:17:55
last_modified_at: 2019-07-29 15:53:00
order: 5
---
### Pipeline build summary

  In pipeline dashboard, you can see the pipeline build summary. **Ratio** is the success rate of pipeline build, **Running** is the number of running pipeline build, **Failed** is the number of failed pipeline build, **Passed** is the number of successful pipeline build and **Total** means the number of total pipeline build.

  ![][pipeline_summary]

### Test build trend

  In pipeline dashboard, you can see three kind of test build trend: **Unit Test Build Trend**, **Functional Test Build Trend(QA)** and **Staging Functional Test Build Trend**. It supports conversion to data view, line chart and pie chart. You can also download the image by clicking **SaveASImage** icon in tool bar.

  ![][pipeline_chart]

### Pipeline report  

  Every successful step will have a report in **Test Reports** page. You can read the report you want by clicking links.

  ![][pipeline_fullreport]  


  Click the **Unit Test Report** link,you can read the whole unit testing report of this project. It includes
  test summary statistic of every test suite, test case, test step.  

  ![][pipeline_unitreport]  

  Click the **[checkstyle report][2]** link to see the result. The same way to read other reports.



[pipeline_summary]: ../images/pipeline/pipeline_build_summary.PNG
[pipeline_report]: ../images/pipeline/pipeline_report.png
[pipeline_chart]: ../images/pipeline/pipeline_chart.png
[pipeline_fullreport]: ../images/pipeline/pipeline_fullreport.png
[pipeline_unitreport]: ../images/pipeline/pipeline_unit_report.png
[1]: ../test/test-import_execute-sample-test-project.html
[2]: ../checkstyle/checkstyle-report.html
