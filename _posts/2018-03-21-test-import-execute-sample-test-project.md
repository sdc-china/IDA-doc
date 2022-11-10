---
title: "Import and Execute Sample Test Project"
category: test
date: 2018-03-21 15:17:55
last_modified_at: 2019-07-29 15:22:00
---

# Import and Execute Sample Test Project
***

## Import a sample test project

  1. Click the **Sample Project** button in the project tab.

      ![][test_import_form]

  2. Fill import form according to following table.

       |   Parameter   | Description    |
       | ------------- |----------------|
       | [Server][1]   |Server environment|
       | Process App   |Process app list of the selected server, default value is "Hiring Sample"|
       | [Default Browser][2]  |Support chrome, firefox selenium node|

   3. Click **Import** button.

   4. Click **_Hring Sample** from project list and enter into project dashboard.

       ![][test_hiring_sample_project]

      The default sample project contains two suites: **Create Position Request CSHS** and **Standard HR Open New Position**.

       ![][test_import_left_side_bar]

##  Execute a sample test project

  1. Select all the test cases in the dashboard and click **Run** button.

     ![][test_import_run]

     The test result and basic information of hiring sample project can be viewed in project dashboard.

     ![][test_import_project_info]

  2. You can see report of a test case by clicking case name ,then clicking **report**.[More details.][3]

[test_import_form]: ../images/test/test_import_form.PNG
[test_import_project_info]: ../images/test/test_import_project_info.PNG
[test_import_run]: ../images/test/test_import_run.png
[test_import_left_side_bar]: ../images/test/test_import_left_side_bar.PNG
[test_hiring_sample_project]: ../images/test/test_hiring_sample_project.PNG
[1]: ../administration/administration-baw-configuration.html
[2]: ../administration/administration-selenium-hub-configuration.html
[3]: test-case-report.html
