---
title: "Task 3: Set up Checkstyle"
category: tutorial
date: 2018-02-05 15:17:55
last_modified_at: 2019-07-26 16:12:00
---

# Task 3: Set up Checkstyle
***

IDA enables developers to perform static analysis on the Workflow project, which enforces design convention and processes development standard. There are 120+ checkstyle rules are defined based on Workflow development best practices and anti-patterns. The rules have been implemented with POJO engine. Refer to [Customize Checkstyle rules](../checkstyle/checkstyle-customize-checkstyle-rules.html) about rules custmization.


## About this task

  In this task,you can set up Checkstyle of the project that you created in the previous task.
  
## Procedure

Set up Checkstyle of a project:

  1. Click ![][tutorial_checkstyle_button] button for **Hiring Sample** in project list page and the report will be shown in a few seconds. The analyzing of checkstyle is asynchronous that you could do other things when it is performing the checkstyle.
  
     ![][tutorial_project_list]{:height="80%" width="80%"}
      
     then IDA will redirect from **Test** to **Checkstyle** tab.
    
  2. When the analysis is over, the checkstyle report will be displayed as below. [Details of the report.][1]
  
      ![][tutorial_checkstyle_report]{:height="80%" width="80%"}

  3. You can also analyze any of your workflow project in the **Checkstyle** tab. [More Detailed.][2]
 
  
  
<!-- **[<Previous][3] [\| Next>][4]** -->
 
[tutorial_checkstyle_button]: ../images/tutorial/tutorial_checkstyle_button.PNG
[tutorial_project_list]: ../images/tutorial/tutorial_project_list.PNG
[checkstyle_notification]: ../images/checkstyle/checkstyle_notification.png
[tutorial_checkstyle_report]: ../images/tutorial/tutorial_checkstyle_report.PNG

[1]: ../checkstyle/checkstyle-checkstyle-report.html
[2]: ../checkstyle/checkstyle-analyze-workflow-projects-with-checkstyle.html
[3]: tutorial-run-record-and-replay-a-test-case.html
[4]: tutorial-create-a-pipeline-for-continuous-deployment.html
