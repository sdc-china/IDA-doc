---
title: "Test Report"
category: test
date: 2018-10-05 15:17:55
last_modified_at: 2019-07-29 15:24:00
order: 80
---

# Test Report
***
IDA offers detailed reports including screenshots, execution process flow and coverage to improve communication between testers and developers on every test case.

### Test Case Report  

In the Test project dashboard page,you can click any  test case link to see the detail case report.


  ![][testcase_list]

  Switch the **Report** tab ,check the every step of execution status.  
  Click the **screenshot** image link to see the screenshot if this case step includes UI.

  ![][testcase_step_status]

  In process diagram execution flow, You can see two lines.  

  The **blue** line stands for  the expected process execution flow.  
  The **red** lines stands for the acutal  execution flow.  
  You can adjust your test case based on the difference between "acutal flow" and "expected flow" process diagram.
  
  ![][test_BPD_test_case_diagram]

### Coverage

Coverage is used to display the test coverage of the Process/BPD. It will calculate the coverage rate based on the line information in the **Passed** test case and the line information in the whole Process/BPD.

  ![][dashboard_coverage]{:width="70%"}

It only works on test suite of **Process** type.

  ![][generate_test_cases_artifact_type]{:width="70%"}
  
Click **Coverage**, it will show the BPD Coverage dialog, you can view detailed information of each **Process** test suite.

  ![][bpd_coverage]{:width="70%"}
  
   [testcase_list]: ../images/test/test_case_dashboard.png
   [testcase_step_status]: ../images/test/test_case_step_status.png
   [test_BPD_test_case_diagram]: ../images/test/test_BPD_test_case_diagram.png
   [bpd_coverage]: ../images/test/bpd_coverage.png
   [dashboard_coverage]: ../images/test/dashboard_coverage.png
   [generate_test_cases_artifact_type]: ../images/test/generate_test_cases_artifact_type.png
