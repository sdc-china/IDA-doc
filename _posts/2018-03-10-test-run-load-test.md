---
title: "Run Load Test"
category: test
date: 2021-05-27 15:22:00
last_modified_at: 2021-05-28 15:22:00
order: 70
---

# Run Load Test
***
###  Edit gatling home path

  1. Download **Gatling** from their [official website](https://gatling.io/open-source/start-testing/).

  2. Go to the **Settings** configuration page under **Administration**.

  3. Type your gatling installation path in **Gatling Home Path**.

     ![][gatling_home]

### Import a sample test project

  1. Click the **Sample Project** button in the project tab.

      ![][test_import_form]

  2. Fill import form according to following table.

       |   Parameter   | Description    |
       | ------------- |----------------|
       | [Server][1]   |Server environment|
       | Process App   |Process app list of the selected server, default value is "Hiring Sample"|
       | [Selenium Hub][2]  |Support chrome, firefox selenium node|
       | BPMoc         |Using BPMoc check|

   3. Click **Import** button.

   4. Click **_Hring Sample** from project list and enter into project dashboard.

       ![][test_hiring_sample_project]

      The default sample project contains two suites: **Create Position Request CSHS** and **Standard HR Open New Position**.

       ![][test_import_left_side_bar]

###  Edit engine properties

  1. Click the **Edit** button to edit project.

     ![][edit_project]

  2. Click **Advance** and type the following parameter in **Engine Properties**:

     ![][enable_load_test]

### Replay a test case

  1. Click project name to get into this project, click the **case1** under **Create Position Request CSHS** package. Click **Record** button on the right of case name to replay it.

  2. Do not click ![][test_record_stop] button. Let it run from the first step to last step.

  3. In the **Debug** step which has ![][test_debug_point] in front of it, the record will be stopped. You need to click ![][test_case_record_resume] button to resume.

  4. When all the steps are finished, the recorder will automatically close, and there will be an extra button on the page which name is **Load Test**.

     ![][load_test_button]

### Run test case load test

  1. Click **Load Test** button on the right of case name.

     ![][load_test_button]

  2. Pop up a strategy selection window. Here we use the **atOnceUsers** strategy and set the number of users to 10.

     ![][select_strategy]

  3. Click **Run** button to start the load test.

  4. After the load test finished, click the small arrow next to **Load Test** button, switch the option to **View Report**.

     ![][switch_to_view_report]

  5. Click **View Report** button to see the Load Test Report.

     ![][view_load_test_report]


[test_import_form]: ../images/test/test_import_form.png
[edit_project]: ../images/test/edit_project.png
[enable_load_test]: ../images/test/enable_load_test.png
[test_import_left_side_bar]: ../images/test/test_import_left_side_bar.PNG
[test_hiring_sample_project]: ../images/test/test_hiring_sample_project.PNG
[1]: ../administration/administration-bpm-configuration.html
[2]: ../administration/administration-selenium-hub-configuration.html
[3]: test-case-report.html
[test_record_stop]: ../images/test/test_record_stop.PNG
[test_record_steps]: ../images/test/test_record_steps.PNG
[test_case_record_resume]: ../images/test/test_case_record_resume.PNG
[load_test_button]: ../images/test/load_test_button.png
[switch_to_view_report]: ../images/test/switch_to_view_report.png
[select_strategy]: ../images/test/select_strategy.png
[view_load_test_report]: ../images/test/view_load_test_report.png
[test_debug_point]: ../images/test/test_debug_point.png
[gatling_home]: ../images/test/gatling_home.png
