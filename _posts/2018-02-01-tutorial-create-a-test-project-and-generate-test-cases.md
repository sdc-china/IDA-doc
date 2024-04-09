---
title: "Task 1: Create a Test Project and Generate Test Cases"
category: tutorial
date: 2018-02-01 15:17:55
last_modified_at: 2021-08-23 21:40:00
---

# Task 1: Create a Test Project and Generate Test Cases
***

IDA enables testers to automate their test scenarios easily and provides 60+ built-in automation test commands to support Workflow project testing.

## Prerequisites
Before you start the tutorial, you need to set up the below configurations with the administrative account ("idaAdmin"/"idaAdmin").

[Users Management][1]  
You need to set up a user account for the IDA login credentials.

[BAW Configuration][2]   
You need to set up the BAW server and ensure the Workflow account is ready.

[Selenium Hub Configuration][3]   
You need to set up the Selenium node URL for remote testing.


## About this Task

In this task, you will create a new test project, and after that, you will create test cases based on this test project.

## Step 1: Create a Test Project

In this step, you will create an empty project.   
  
### Procedure

To create a new test project:

  1. On the project list page, click the **Create Project** button. Name the project as **Hiring Sample**. Choose the values as shown in the screenshot below. For visibility, you can choose private or the team you belong to. For advanced options, click the right arrow button, then you can configure the retry time and retry interval for the project.
    
     ![][tutorial_createproject]{:width="60%"}

     **Notes** 
     IDA caches applications and toolkits list per server; you could refresh the cache by clicking the ![][tutorial_refresh_icon] next to the 'Process App'.  
     If you want to create a test project for **CASE**, please configure the **Case Object Store** first, refer to [Add Case Object Store configuration to a BAW server](../administration/administration-baw-configuration.html#add-case-object-store-configuration-to-a-baw-server).
  
  2. Click the **Create** button, and you will enter the project dashboard page.

     ![][tutorial_project_info]{:width="100%"}
   
## Step 2: Generate Test Cases

In this step, you'll generate test cases based on the newly created test project. You can create cases based on the **Artifact Type**.
   
### Procedure
 
To generate a process test case and a user interface test case:

 1. In the left-side menu bar, click the **+** button to the right of the project name.

 2. Choose **Process** in the **Artifact Type** field and **Standard HR Open New Position** in the **Items** field.
  
     ![][tutorial_case_items_form]{:width="80%"}
  
 3. Click the **Generate** button.
  
 4. Click the **+** button to the right of the project name.
  
 5. Choose **User Interface** in the **Artifact Type** field and **Create Position Request CSHS** in the **Items** field. 
  
      ![][tutorial_case_items_form2]{:width="80%"}
  
 6. Click the **Generate** button. You can see two test suites with related test cases generated in the project dashboard.

      ![][tutorial_case_basic_info]{:width="100%"}

<!-- **[< Next>][4]** -->
  

[tutorial_case_items_form]: ../images/tutorial/tutorial_case_items_form.PNG
[tutorial_case_items_form2]: ../images/tutorial/tutorial_case_items_form2.PNG
[tutorial_case_basic_info]: ../images/tutorial/tutorial_case_basic_info.PNG

[1]: ../administration/administration-users-management.html
[2]: ../administration/administration-baw-configuration.html
[3]: ../administration/administration-selenium-hub-configuration.html
[4]: tutorial-run-record-and-replay-a-test-case.html
[tutorial_createproject]: ../images/tutorial/tuorial_project_create.PNG 
[tutorial_refresh_icon]: ../images/tutorial/refresh-icon.PNG
[tutorial_project_info]: ../images/tutorial/tutorial_project_info.PNG