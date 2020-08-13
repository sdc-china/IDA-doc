---
title: "Task 1: Create a test project and generate test cases"
category: tutorial
date: 2018-09-23 15:17:55
last_modified_at: 2019-07-25 21:40:00
order: 1
---

# Task 1: Create a test project and generate test cases
***
IDA enables testers to automate their test scenarios easily and provides 60+ built-in automation test commands to support BPM application test.

### Pre-requisites
Before you start the tutorial, you need to setup below configurations with the administrative account ("idaAdmin"/"idaAdmin").

[Users management][1]  
You need to setup user account for the IDA login credentials.

[BPM configuration][2]   
You need to setup BPM server and make the BPM account be ready.

[Selenium hub configuration][3]   
You need to setup selenium node url for the remote testing.


### About this task

In this task, you will create a new test project after you create test cases based on this test project.

### Step 1: Create a test project

  In this step, you will create an empty project.   
  
#### Procedure

To create a new test project:

  1. In this project list page, click **Create Project** button. Name the project name as **Hiring Sample**. Choose the values like below screenshot. For the visibility, you can choose private or team you belong to. For advance, click the right arrow button then you can configure retry time and retry interval for the project.
    
     ![][tutorial_createproject]
    
  
  2. Click **Create** button, you will enter into project dashboard page.

     ![][tutorial_project_info] 
  
     **Notes** IDA caches applications and toolkits list per server, you could refresh the cache by clicking the ![][tutorial_refresh_icon] next to the 'Process App'.
   
### Step 2: Generate test cases

  In this step, you'll generate test cases based on new created test project. You can create cases based on the  **Artifact** Type.
   
#### Procedure
 
To generate a process test case and an user interface test case:

 1. In the left-side menu bar, click **+** button on the right of project name.

 2. Choose **Process** in the **Artifact Type** field and **Standard HR Open New Position** in the **Items** field.
  
     ![][tutorial_case_items_form]
  
 3. Click **Create** button.
  
 4. Click **+** button on the right of project name.
  
 5. Choose **User Interface** in the **Artifact Type** field and **Create Position Request CSHS** in the **Items** field. 
  
      ![][tutorial_case_items_form2]
  
 6. Click **Create** button.You can see two test suites with related test cases are generated in the project dashboard.

      ![][tutorial_case_basic_info]

<!-- **[< Next>][4]** -->
  

[tutorial_case_items_form]: ../images/tutorial/tutorial_case_items_form.PNG
[tutorial_case_items_form2]: ../images/tutorial/tutorial_case_items_form2.PNG
[tutorial_case_basic_info]: ../images/tutorial/tutorial_case_basic_info.PNG

[1]: ../administration/administration-users-management.html
[2]: ../administration/administration-bpm-configuration.html
[3]: ../administration/administration-selenium-hub-configuration.html
[4]: tutorial-run-record-and-replay-a-test-case.html
[tutorial_createproject]: ../images/tutorial/tuorial_project_create.PNG 
[tutorial_refresh_icon]: ../images/tutorial/refresh-icon.PNG
[tutorial_project_info]: ../images/tutorial/tutorial_project_info.PNG
