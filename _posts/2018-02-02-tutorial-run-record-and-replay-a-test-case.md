---
title: "Task 2: Record, replay and run a test case"
category: tutorial
date: 2018-09-23 15:17:55
last_modified_at: 2019-07-25 21:41:00
order: 2
---

# Task 2: Record, replay and run a test case
***
IDA provides a browser plugin recorder, which allows users to record their test scenarios without coding.

### About this task

  In this task, you can record, replay and run a test case that you generated in the previous task.
  
### Step 1: Set up assignees for case steps

  In this step, you need to assign the BPM task users for case steps. Take the case1 of **Create Position Request CSHS** as an example.
  
#### Procedure

To set up assignees for case steps:

 1. Click **Create Position Request CSHS** in left-side menu bar.
 
 2. Click **case1**.
 
 3. Click **Edit** button on the right of suite name.
 
    ![][test_case_step_table]
 
 4. Click button of case step which includes "Assignee" in **actions** column.
    ![][test_case_step_edit_button]
 
 
 5. Select **administrator** in **Assignee** field in order to specify other BPM users to help you complete the business process.
    ![][test_case_step_table2]
 
 6. Click **Exit Edit** button to finish edit.
 
 
### Step 2: Record a test case

  In this step, you can record a test case according to your inputs on the web UI.
 
#### Procedure 

To record a test case: 

  1. Click **Edit** button on the right top of page.
  
     ![][test_case_step_table]
  
  2. Click **Record**  button on the right top of page. It will the launch UI record page.
  
     ![][test_case_step_table2]
     
     ![][test_record_page]
  
  3. In the **Debug \{\{log\}\}** step, the process will be stopped. You need to click ![][test_case_record_resume] button to resume.
   
     ![][test_case_record_plugin]
  
  4. Record every UI action, you can see each step you have done in tool bar.
  
      ![][test_case_record_plugin2]
  
  5. Click ![][test_record_stop] button to finish the recording. You can see the recorded case step in the list table.
  
     ![][test_record_steps]
  
### Step 3: Replay a test case

  In this step, you can replay a test case that you record in the previous step.
 
#### Procedure 

To replay a test case:

  1. Click **Record** button on the right of case name to replay it.
  
  2. Click ![][test_record_stop] button to finish the replay.
  
  3. Click **Exit Edit** button on the right of suite name.
  
### Step 4: Run a test case

   In this step, you can run a test case.The running of automated testing is asynchronous.
   
#### Procedure

To run a test case:

 1. Click **Run** button on the right of case name.
  
 2. Click **report** button to see detail report including process execution flow.  
 
 3. Check every case step result status with "PASSED" or "FAILED" in case step list table. 
 
 4. Click the **Screenshots** icon link to see the captured screenshot.
  
![][tutorial_running_result]


### Step 5: Stop a test case

   In this step, you can stop a test case.   
   
#### Procedure

Click **Stop** button on the right of case name.

![][tutorial_case_stop_button]

**Notes**

When you fist record and play your test case you might see the below error.

   ![][test_record_issue]
   
This is because IBM Business Process Manager uses default certificates that are not issued by a trusted certificate authority (CA).  The untrusted certificate can cause errors in the user’s browser and possibly block the functions of the OpenPages' integration, including the Process Portal home page.  

In order to solve this issue, you need to click the url from the warning message box as in the screenshot above. A new browser window will open this url and you should accept the ssl security warning, then try to restart the recoder to record/replay again.

If your test project is configured on a container version of BAW, you may need to manually accept multiple certificates for Process Portal and Case Client separately. Follow the step above to accept each certificate warning.
  
<!-- **[<Previous][2] [\| Next>][3]** -->

[test_case_step_edit_button]: ../images/test/test_case_step_edit_button.PNG
[test_case_step_table]: ../images/test/test_case_step_table.PNG
[test_case_step_table2]: ../images/test/test_case_step_table2.PNG
[tutorial_case_run_button]: ../images/tutorial/tutorial_case_run_button.PNG
[tutorial_case_stop_button]: ../images/tutorial/tutorial_case_stop.PNG
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
[test_record_issue]: ../images/tutorial/tuorial_recordissue.png
