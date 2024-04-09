---
title: "Test Report"
category: test
date: 2018-03-25 15:17:55
last_modified_at: 2023-07-26 15:50:00
---

# Test Report
***

IDA offers detailed reports including screenshots, execution process flow, and coverage to improve communication between testers and developers on every test case.

## Test Case Report

In the Test project dashboard page, you can click any test case link to see the detailed case report.

  ![][testcase_list]

  Switch to the **Report** tab, check the execution status of every step.
  Click the **screenshot** image link to see the screenshot if this case step includes UI.

  ![][testcase_step_status]

  In the process diagram execution flow, you can see two lines.

  The **blue** line stands for the expected process execution flow.
  The **red** line stands for the actual execution flow.
  You can adjust your test case based on the difference between the "actual flow" and the "expected flow" process diagram.

  ![][test_BPD_test_case_diagram]

## Coverage

Coverage is used to display the test coverage of the Process/BPD. It will calculate the coverage rate based on the line information in the **Passed** test cases and the line information in the whole Process/BPD.

  ![][dashboard_coverage]{:width="70%"}

It only works on test suites of the **Process** type.

  ![][generate_test_cases_artifact_type]{:width="70%"}

Click **Coverage**, it will show the BPD Coverage dialog, where you can view detailed information of each **Process** test suite.

  ![][bpd_coverage]{:width="70%"}


## Print Report

In the Test project dashboard page, you can click the ... button -> Print Report to get this project's test report in a new tab.

  ![][print_report]{:width="70%"}

The report has three parts: test project summary, test suite summary, and test case details.
    ![][print_repot_summary]{:width="80%"}

The failed test cases will display the trace log and screenshot if available.

   ![][print_report_failed]{:width="80%"}
   ![][print_report_failed_2]{:width="80%"}

   [testcase_list]: ../images/test/test_case_dashboard.png
   [testcase_step_status]: ../images/test/test_case_step_status.png
   [test_BPD_test_case_diagram]: ../images/test/test_BPD_test_case_diagram.PNG
   [bpd_coverage]: ../images/test/bpd_coverage.png
   [dashboard_coverage]: ../images/test/dashboard_coverage.png
   [generate_test_cases_artifact_type]: ../images/test/generate_test_cases_artifact_type.png
   [print_report]: ../images/test/print_report.png
   [print_repot_summary]: ../images/test/print_repot_summary.png
   [print_report_failed]: ../images/test/print_report_failed.png
   [print_report_failed_2]: ../images/test/print_report_failed_2.png