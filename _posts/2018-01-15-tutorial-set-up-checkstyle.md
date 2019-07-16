---
layout: page
title: "Task 3: Set up Checkstyle"
category: tutorial
date: 2018-01-05 15:17:55
order: 3
---

IDA enables developers to perform static analysis on the BPM application, which enforces design convention and processes development standard. There are 80+ checkstyle rules are defined based on BPM development best practices and anti-patterns. The rules have been implemented with POJO engine. Refer to [Customize Checkstyle rules](../checkstyle/checkstyle-customize-checkstyle-rules.html) about rules custmization.


### About this task

  In this task,you can set up Checkstyle of the project that you created in the previous task.
  
### Procedure

Set up Checkstyle of a project:

  1. Click ![][tutorial_checkstyle_button] button for **Hiring Sample** in project list page and the report will be shown in a few seconds. The analyzing of checkstyle is asynchronous that you could do other things when it is performing the checkstyle.
  
     ![][tutorial_project_list]
      
       Once completed, the notification will be appeared in the lower right corner of the screen. 
     
      ![][checkstyle_notification]
  
       You can also analyze any of your BPM projects in the **Checkstyle** tab. [More Detailed.][2]
  
  2. When the analysis is over, the analysis report will be displayed as below. [Details of the report.][1]
  
      ![][tutorial_checkstyle_report]
  
  
**[<Previous][3] [\| Next>][4]**
 
[tutorial_checkstyle_button]: ../images/tutorial/tutorial_checkstyle_button.PNG
[tutorial_project_list]: ../images/tutorial/tutorial_project_list.PNG
[checkstyle_notification]: ../images/checkstyle/checkstyle_notification.png
[tutorial_checkstyle_report]: ../images/tutorial/tutorial_checkstyle_report.PNG

[1]: ../checkstyle/checkstyle-report.html
[2]: ../checkstyle/checkstyle-analyze-BPM-projects-with-checkstyle.html
[3]: tutorial-run-record-and-replay-a-test-case.html
[4]: tutorial-create-a-pipeline-for-continuous-deployment.html
