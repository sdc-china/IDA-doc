---
layout: page
title: "Test case management"
category: test
date: 2018-01-05 15:17:55
order: 2
---
### Generate test cases

1. In the left-side menu bar, click **+** button on the right of project name.

2. Click **Artifact Type** field, you can see there are three kinds of artifact: Process, User Interface and System Service. Choose **User Interface** or **System Service** to generate a unit test case and choose **Process** to generate a BPD test case.

   ![][test_unit_test_add_form]
   
3. Choose process items.

4. Click **Create** button to generate cases.

### Create a test case

1. Click **+** button on the right of suite name.

    ![][test_unit_test_suite_list]
     
2. Fill case name and case description.

    ![][test_unit_test_case_add_form]
  
3. Click **Add** button. You can see new test case showed in left-side menu bar. When your mouse hover on ![][test_unit_test_case_info_button] button, you can see the description of the test case.

     ![][test_unit_test_case]

### Edit test case

#### Edit test suite info

  1. Click ![][test_group_command_edit_button] button on the right of suite name.

     ![][test_unit_test_suite_list]
    
  2. Update suite name.

  3. Click **Update** button.

#### Edit test case info

  1. Click ![][test_group_command_edit_button] button on the right of case name.
  
     ![][test_unit_test_case_list]
     
  2. Edit test case name and description. 
  
      ![][test_unit_test_case_edit_form]
      
  3. Click **Update** button.
  
#### Migrate test case 

1. Click **...** link on the right of suite name and popup the menu.

2. Click "Migrate Test Cases" link on the popup menu.

   ![][test_case_migration_menu]
 
3. Click the  "Add file" button to upload the zip file then click the "Migrate" button to migrate test cases.

   ![][test_case_migration_form]
  
#### Add a case step

  1. Click **Add** button when add the first case step to a test case, otherwise click **+** button on case step list table.
  
       ![][test_case_step_table_add]
  
  2. Choose command you want to add and add comment for command if necessary. Different commands have different parameters. [More details see API reference.][1] Fill form to add case step.
  
     ![][test_case_step_add_form]
     
  3. Click **Add** button.
  
#### Edit a case step

  1. Click **Edit** button on the right of suite name.
   
  2. Click ![][test_case_step_edit_button] button in the operation column of the case step you want to edit.
  
  3. Update case step.
  
     ![][test_case_step_edit_form]
     
  4. Click **Edit** button.
  
  5. Click **Exit Edit** button on the right of suite name.
  
#### Adjust the order of case step.

  1. Click **Edit** button on the right of suite name.
  
  2. Click ![][test_case_step_up_button] and ![][test_case_step_down_button] button to adjust the order of a case step.
  
  3. click **Exit Edit** button on the right of suite name. 
  
#### Delete a case step

  Click ![][test_case_step_delete_button] button in the operation column of the case step you want to delete.
  
### Delete a test case

  Click ![][test_project_delete_button] button in test case list from left-side menu.
    
[1]: ../references/referrence-api-reference.html
[test_unit_test_add_form]: ../images/test/test_unit_test_add_form.PNG
[test_group_command_edit_button]: ../images/test/test_group_command_edit_button.PNG
[test_unit_test_case_list]: ../images/test/test_unit_test_case_list.PNG
[test_unit_test_suite_list]: ../images/test/test_unit_test_suite_list.PNG
[test_unit_test_case_add_form]: ../images/test/test_unit_test_case_add_form.PNG
[test_unit_test_case]: ../images/test/test_unit_test_case.PNG
[test_unit_test_case_info_button]: ../images/test/test_unit_test_case_info_button.PNG
[test_unit_test_case_edit_form]: ../images/test/test_unit_test_case_edit_form.PNG
[test_case_step_add_form]: ../images/test/test_case_step_add_form.PNG
[test_case_step_table_add]: ../images/test/test_case_step_table_add.PNG
[test_case_step_edit_button]: ../images/test/test_case_step_edit_button.PNG
[test_case_step_edit_form]: ../images/test/test_case_step_edit_form.PNG
[test_case_step_up_button]: ../images/test/test_case_step_up_button.PNG
[test_case_step_down_button]: ../images/test/test_case_step_down_button.PNG
[test_case_step_delete_button]: ../images/test/test_case_step_delete_button.PNG
[test_project_delete_button]: ../images/test/test_project_delete_button.PNG
[test_case_migration_menu]:../images/test/test_case_migration_menu.PNG
[test_case_migration_form]:../images/test/test_case_migration_form.PNG
