---
layout: page
title: "Task 2: Record, replay and run a test case"
category: tutorial
date: 2018-01-05 15:17:55
order: 2
---

Keter provides a browser plugin recorder, which allows user to record their test scenarios without coding.

### About this task

  In this task, you can record, replay and run a test case that you generated in the previous task.
  
### Step 1: Set up assignee for case steps

  In this step, you need to assign the BPM tasks users for case steps. Take the case1 of **Create Position Request CSHS** as an example.
  
#### Procedure

To set up assignee for case steps:

 1. Click **Create Position Request CSHS** in left-side menu bar.
 
 2. Click **case1**.
 
 3. Click **Edit** button on the right of suite name.
 
    ![][test_case_step_table]
 
 4. Click ![][test_case_step_edit_button] button of case step which includes "Assignee" in **actions** column.
 
    ![][test_case_step_table2]
 
 5. Select **administrator** in **Assignee** field in order to specify other BPM users to help you complete the business process.
 
 6. Click **Exit Edit** button to finish edit.
 
 
### Step 2: Record a test case

  In this step, you can record a test case according to your inputs on the web UI.
 
#### Procedure 

To record a test case: 

  1. Click **Edit** button on the right top of page.
  
     ![][test_case_step_table]
  
  2. Click **Record**  button on the right top of page. You will enter record page.
  
     ![][test_case_step_table2]
     
     ![][test_record_page]
  
  3. In the **Debug \{\{log\}\}** step, the process will be stopped. You need to click ![][test_case_record_resume] button to resume.
   
     ![][test_case_record_plugin]
  
  4. Record according to the business process, you can see each step you have done in tool bar.
  
      ![][test_case_record_plugin2]
  
  5. Click ![][test_record_stop] button to finish the record. The operations you done are showed in case step list table.
  
     ![][test_record_steps]
  
### Step 3: Replay a test case

  In this step, you can replay a test case that you record in the previous step.
 
#### Procedure 

To replay a test case:

  1. Click **Record** button on the right of case name to replay it.
  
  2. Click ![][test_record_stop] button to finish the replay.
  
  3. Click **Exit Edit** button on the right of suite name.
  
### Step 4: Run a test case

   In this step, you run a test case.The running of automated testing is asynchronous.
   
#### Procedure

To run a test case:

 1. Click **Run** button on the right of case name.
  
 2. Click **report** button to see detail report including process execution flow.  
 
 3. Check every case step result status with "PASSED" or "FAILED" in case step list table. 
 
 4. Click the **Screenshots** icon link to see the captured screenshot.
  
![][tutorial_running_result]
  
  
**[<Previous][2] [\| Next>][3]**

[test_case_step_edit_button]: ../images/test/test_case_step_edit_button.PNG
[test_case_step_table]: ../images/test/test_case_step_table.PNG
[test_case_step_table2]: ../images/test/test_case_step_table2.PNG
[tutorial_case_run_button]: ../images/tutorial/tutorial_case_run_button.PNG
[tutorial_running_result]: ../images/tutorial/tutorial_running_result.PNG
[1]: ../test/test-record-and-replay-a-test-case.html
[2]: tutorial-create-a-test-project-and-generate-test-cases.html
[3]: tutorial-set-up-checkstyle.html
[test_case_step_table]: ../images/test/test_case_step_table.PNG
[test_case_step_table2]: ../images/test/test_case_step_table2.PNG   
[test_case_record_resume]: ../images/test/test_case_record_resume.PNG
[test_case_record_plugin]: ../images/test/test_case_record_plugin.PNG
[test_case_record_plugin2]: ../images/test/test_case_record_plugin2.PNG
[test_record_stop]: ../images/test/test_record_stop.PNG
[test_record_steps]: ../images/test/test_record_steps.PNG
[test_case_record_button]: ../images/test/test_case_record_button.PNG
[test_record_page]: ../images/test/test_record_page.PNG
