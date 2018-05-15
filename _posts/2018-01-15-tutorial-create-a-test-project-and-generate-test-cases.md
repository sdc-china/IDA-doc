---
layout: page
title: "Task 1: Create a test project and generate test cases"
category: tutorial
date: 2018-01-05 15:17:55
order: 1
---

Keter enables testers to automate their test scenarios easily and provides 60+ built-in automation test commands to support BPM application test.

### About this task

In this task, you will create a new test project. After that you create test cases based on this test project.

### Step 1: Create a test project

  In this step, you create an empty project.   
  
#### Procedure

To create a new test project:

  1. In the project list page, click **Create Project** button. Name the project name to **Hiring Sample**. Choose the values like below screenshot.
    
     ![][tutorial_createproject] 
  
  2. Click **Create** button, you will enter into project dashboard page.

     ![][tutorial_project_info] 
  
  
   
### Step 2: Generate test cases

  In this step, you generate test cases based on new created test project. You can create cases based on the  **Artifact** Type.
   
#### Procedure
 
To generate a process test case and a user interface test case:

 1. In the left-side menu bar, click **+** button on the right of project name.

 2. Choose **Process** in the **Artifact Type** field and **Standard HR Open New Position** in the **Items** field.
  
     ![][tutorial_case_items_form]
  
 3. Click **Create** button.
  
 4. Click **+** button on the right of project name.
  
 5. Choose **User Interface** in the **Artifact Type** field and **Create Position Request CSHS** in the **Items** field. 
  
      ![][tutorial_case_items_form2]
  
 6. Click **Create** button.You can see two test suites with related test cases are generated in the project dashboard.

      ![][tutorial_case_basic_info]

**[<Previous ][1][\| Next>][2]**
  

[tutorial_case_items_form]: ../images/tutorial/tutorial_case_items_form.PNG
[tutorial_case_items_form2]: ../images/tutorial/tutorial_case_items_form2.PNG
[tutorial_case_basic_info]: ../images/tutorial/tutorial_case_basic_info.PNG
[1]: tutorial-configuration.html
[2]: tutorial-run-record-and-replay-a-test-case.html
[tutorial_createproject]: ../images/tutorial/tuorial_project_create.PNG 
[tutorial_project_info]: ../images/tutorial/tutorial_project_info.PNG
