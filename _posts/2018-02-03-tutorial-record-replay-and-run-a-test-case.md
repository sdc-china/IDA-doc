---
title: "Task 2: Record, Replay and Run a Test Case"
category: tutorial
date: 2018-02-03 15:17:55
last_modified_at: 2022-08-24 15:41:00
---

# Task 2: Record, Replay and Run a Test Case
***

IDA provides a browser plugin recorder, which allows users to record their test scenarios without coding.

## About this task

In this task, you can record, replay and run a test case that you generated in the previous task.

## Prerequisites

1. IDA is up and running.
2. BAW Process Center is up and running.
3. Selenium Hub is up and running.

## Step 1: Set Up Testing Environment
As a developer, you need to set up your testing environment first.

### Procedure

1. Install IDA browser plugin according to [Doc](../installation/installation-installing-ida-application.html#step-3-installing-ida-browser-plug-in). Click the plugin icon on your browser extension toolbar, enter the IDA web URL and click **Sign In** to sign into the plugin.

   ![][plugin_login]{:width="40%"}

2. After you have successfully signed into the plugin, clicking **Home** will open another browser tab of the IDA web homepage.

   ![][plugin_login_success]{:width="40%"}


## Step 2: Set up assignees for case steps

In this step, you need to assign the Workflow task users for case steps. Take the case1 of **Create Position Request CSHS** as an example.
  
### Procedure

To set up assignees for case steps:

1. Click **Create Position Request CSHS** in the left-side menu bar.

2. Click **case1**.

3. Click the **Edit** button on the right top of this page.

   ![][test_case_step_table]{:width="80%"}

4. Move your mouse to the first row of the case steps, right-click your mouse and click the **Edit** button to edit this case step.

   ![][test_case_step_edit_button]{:width="80%"}

5. Select **celladmin** in the **Assignee** field in order to specify other Workflow users to help you complete the business process. Click the **Save** button to finish editing this case step.\
   ![][assign_bpm_user]{: width="60%"}

6. Click the **Exit Edit** button on the right top of this page to finish editing the test case.


## Step 3: Record a test case

In this step, you can record some case steps according to your inputs on the web UI.

### Procedure

To record a test case:

1. Click the **Edit** button on the right top of the page.

    ![][test_case_step_table]{:height="80%" width="80%"}

2. Click the **Record** button on the right top of the page.

    ![][test_case_step_table2]{:height="80%" width="80%"}

3. The IDA Recorder window pops up. Click the **Run** icon to start recording.

    ![][ida_recorder]{:height="30%" width="30%"}

    When you first record and play your test case, you might see the below error.

    ![][test_record_issue]{:width="100%"}

    Solve this issue according to [Doc](https://sdc-china.github.io/IDA-doc/installation/installation-ida-installing.html#self-signed-ssl-certificates-installation).

4. Step 1 is executed, and once it is completed, the human service is shown.

    ![][test_record_page]{:width="100%"}

5. Then the recorder comes to step 2: the **Debug \{\{log\}\}** step. Due to the debug purpose, the recording is pending at this step. You can perform some actions on the human service, and IDA recorder will record every UI action.

    ![][test_case_record_plugin]{:width="100%"}

6. In the **Submit position request** human service, change **Employment type** to **Full-time**, **Department** to **Marketing**, **Location** to **Boston**. As you can see, these three web operation steps are captured in the IDA Recorder as test case steps.

     ![][test_case_record_plugin2]{:width="100%"}

7. Click the ![][test_record_stop] button to finish the recording. You can see the recorded case steps in the list table.

    ![][test_record_steps]{:width="100%"}

## Step 4: Replay a test case

In this step, you can replay a test case that you recorded in the previous step.

### Procedure

To replay a test case:

1. Click the **Record** button on the right of the case name to replay it.

2. Click the **Run** icon on the IDA recorder to start the replay.

    ![][tutorial_click_run_button]{:height="30%" width="30%"}

## Step 5: Run a test case

In this step, you can run a test case. The running of automated testing is asynchronous.

### Procedure

To run a test case:

1. Click the Selenium Hub button on the right of the **Edit** button.

   ![][click_run_case_button]{:height="80%" width="80%"}

2. When it is finished, go to the **Test Report** section to see the detailed report, including the process execution flow.

   ![][tutorial_go_to_test_report]{:height="80%" width="80%"}

3. Check every case step result status with **PASSED** or **FAILED** in the case step list table.

   ![][tutorial_running_result]{:height="80%" width="80%"}

4. Click the **Screenshots** icon link to see the captured screenshot.

   ![][tutorial_case_screenshot]{:height="80%" width="100%"}

## Step 6: Stop a test case

In this step, you can stop a test case.

### Procedure

When the test case is running, click the **Stop** button on the right of the case name.

![][tutorial_case_stop_button]{:height="80%" width="80%"}

  
<!-- **[<Previous][2] [\| Next>][3]** -->
[plugin_login]: ../images/test/plugin_login.png
[plugin_login_success]: ../images/test/plugin_login_success.png
[test_case_step_edit_button]: ../images/test/test_case_step_edit_button.PNG
[test_case_step_table]: ../images/test/test_case_step_table.PNG
[assign_bpm_user]: ../images/test/assign_bpm_user.PNG
[test_case_step_table2]: ../images/test/test_case_step_table2.PNG
[ida_recorder]: ../images/test/ida_recorder.PNG
[tutorial_case_run_button]: ../images/tutorial/tutorial_case_run_button.PNG
[tutorial_case_stop_button]: ../images/tutorial/tutorial_case_stop.PNG
[tutorial_click_run_button]: ../images/tutorial/tutorial_click_run_button.PNG
[tutorial_running_result]: ../images/tutorial/tutorial_running_result.PNG
[tutorial_case_screenshot]: ../images/tutorial/tutorial_case_screenshot.PNG
[1]: ../test/test-record-and-replay-a-test-case.html
[2]: tutorial-create-a-test-project-and-generate-test-cases.html
[3]: tutorial-set-up-checkstyle.html
[test_case_step_table]: ../images/test/test_case_step_table.PNG
[test_case_record_resume]: ../images/test/test_case_record_resume.PNG
[test_case_record_plugin]: ../images/test/test_case_record_plugin.PNG
[test_case_record_plugin2]: ../images/test/test_case_record_plugin2.PNG
[test_record_stop]: ../images/test/test_record_stop.PNG
[test_record_steps]: ../images/test/test_record_steps.PNG
[test_case_record_button]: ../images/test/test_case_record_button.PNG
[test_record_page]: ../images/test/test_record_page.PNG
[test_record_issue]: ../images/tutorial/tuorial_recordissue.png
[click_run_case_button]: ../images/test/click_run_case_button.png
[tutorial_go_to_test_report]: ../images/tutorial/tutorial_go_to_test_report.PNG
