---
title: "Run Load Test"
category: test
date: 2018-03-23 10:22:00
last_modified_at: 2023-03-01 15:22:00
---

# Run Load Test
***

## Edit Gatling Home Path

1. Download [Gatling v3.6.0](https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/3.6.0/gatling-charts-highcharts-bundle-3.6.0-bundle.zip).

2. Go to the **Settings** configuration page under **Administration**.

3. Type your Gatling installation path in **Gatling Home Path** or click **Download Gatling** to download the galting executable.

   ![][gatling_home]{:width="80%"}

## Import a Sample Test Project

1. Click the **Sample Project** button in the project tab.

   ![][test_import_form]{:width="60%"}

2. Fill in the import form according to the following table.

   | Parameter | Description |
   | --- | --- |
   | [Server][1] | Server environment |
   | Process App | Process app list of the selected server, default value is "Hiring Sample" |
   | [Selenium Hub][2] | Support Chrome, Firefox Selenium node |

3. Click the **Import** button.

4. Click **_Hring Sample**  from the project list and enter the project dashboard.

   ![][test_hiring_sample_project]{:width="60%"}

   The default sample project contains some test suites, e.g. **Create Position Request CSHS** and **Standard HR Open New Position**.

   ![][test_import_left_side_bar]{:width="60%"}

## Edit Engine Properties

1. Click the **Edit** button to edit the project.

   ![][edit_project]{:width="60%"}

2. Click **Advance** and type the following parameter in **Engine Properties**:

   ![][enable_load_test]{:width="60%"}

## Replay a Test Case

1. Click the project name to get into the project, click the **case1** under the **Create Position Request CSHS** package. Click the **Record** button on the right of the case name to replay it.

2. Do not click ![][test_record_stop] button. Let it run from the first step to the last step.

3. In the **Debug** step, which has ![][test_debug_point] in front of it, the recording will be stopped. You need to click ![][test_case_record_resume] button to resume.

4. When all the steps are finished, the recorder will automatically close, and there will be an extra button on the page named **Load Test**. The **Load Test** button is only displayed after the test case is replayed from the first to the last step.

   ![][load_test_button]

## Run Test Case Load Test

1. Click the **Load Test** button on the right of the case name.

   ![][load_test_button]

2. A strategy selection window will pop up. Here, we use the **atOnceUsers** strategy and set the proper number of users.

   ![][select_strategy]

   We provide two strategies for usage:

   - atOnceUsers(nbUsers): Injects a given number of users at once.
   - rampUsers(nbUsers) during(duration): Injects a given number of users distributed evenly on a time window of a given duration.

   In the Advanced tab:

   - Change the default assertion value to meet the load case scenario statistics. If any assertion fails, the whole load test case will fail.
   - Change the log level for the load testing. You can download the load testing log in the Performance Report tab page.
   - Switch on Check BAW Product Requests to include BAW product internal requests (i.e., JS/CSS/Image resources and Portal requests loaded by BAW) in the Load Test Report. The default value is off.

   ![][gatling_report]

3. Click the **Run** button to start the load test.

4. After the load test finishes, switch to view **Performance Report**.

   ![][switch_to_view_report]

   ![][view_load_test_report]

## Check Load Test Case Data

1. Sometimes when you click the **Load Test** button on the right of the case name, you might see some warnings on the page. If you see the screenshot below, it means the recorded network information is incorrect. You need to use the IDA plug-in to replay the test case again.

   ![][gatling_network_incorrect]

2. If you see the error below, it means your recorded load test data is out of sync. You also need to use the IDA plug-in to replay the test case again.

   ![][gatling_network_outofdate]

Note: The Load Test feature currently has the following **limitations**:

- Frequently used test commands in the BPM category are supported.
- Most test commands in the UI category are supported.
- Assertion and Utility commands are not supported yet.

[test_import_form]: ../images/test/test_import_form.png
[edit_project]: ../images/test/edit_project.png
[enable_load_test]: ../images/test/enable_load_test.png
[test_import_left_side_bar]: ../images/test/test_import_left_side_bar.PNG
[test_hiring_sample_project]: ../images/test/test_hiring_sample_project.PNG
[1]: ../administration/administration-baw-configuration.html
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
[gatling_report]: ../images/test/gatling_report.png
[gatling_network_incorrect]: ../images/test/gatling_incorrectnetwork.png
[gatling_network_outofdate]: ../images/test/gatling_outofdatenetwork.png