---
title: "Test case management"
category: test
date: 2018-09-28 15:17:55
last_modified_at: 2019-07-26 16:24:00
order: 20
---

# Test case management
***
### Generate test cases

1. In the left-side menu bar, click **+** button on the right of project name.

2. Click **Artifact Type** field, you can see three kinds of artifacts: Process, User Interface and System Service. Choose **User Interface** or **System Service** to generate a unit test case and choose **Process** to generate a BPD test case.

   ![][test_unit_test_add_form]
   
3. Choose process items.

4. Click **Create** button to generate cases.

### Create a test case

1. Click **+** button on the right of suite name.

    ![][test_unit_test_suite_list]
     
2. Fill case name and case description.

    ![][test_unit_test_case_add_form]
  
3. Click **Add** button. You can see new test case shown in left-side menu bar. When your mouse hover on ![][test_unit_test_case_info_button] button, you can see the description of the test case.

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
  
#### Import test case 

1. Click **...** link on the right of suite name and popup the menu.

2. Click "Import" link on the popup menu.

   ![][test_case_migration_menu]
 
3. Click the  "Add file" button to upload the zip file then click the "Import" button to migrate test cases.

   ![][test_case_migration_form]
  
#### Add a case step

  1. Select the test case step position you want to insert.In the popup menu choose  **Add**  link to insert.   
  
       ![][test_case_step_table_add]
  
  2. Choose command you want to add and add comment for command if necessary. Different commands have different parameters. [More details see API reference.][1] Fill form to add case step.
  
     ![][test_case_step_add_form]
     
  3. Click **Add** button.
  
#### Edit a case step

  1. Select the case step you want to edit.   
   
  2. In the popup menu click the  edit link.    
  
     ![][test_case_step_edit_button]
  
  3. Update case step.
  
     ![][test_case_step_edit_form]
     
  4. Click **Edit** button.
  
  5. Click **Exit Edit** button on the right of suite name.
  
#### Adjust the order of case step.

  1.  Select the case step you want to move.
  
  2.  In the popup menu, click **MoveUP** or  **Movedown** link to adjust the order of a case step.   
     
      ![][test_case_step_updown_button]   
  
  3. click **Exit Edit** button on the right of suite name.

#### Copy case steps

  1. Click **Edit** button on the right of suite name.

  2. Select the case steps to be copied,in the popup menu  click **Copy** link.
    ![][test_case_step_copy]
  
#### Copy/Cut case steps with group commands
  
  1. Click **Edit** button on the top right of the case editor table.
  2. Select the case steps with group commands, then click **Copy** link in the popup menu.
    ![][group_command_copy]

  ##### Notes
  You could only paste the copied case steps with group command to test cases, if you paste the case steps to group commands. You will get a warning:
     ![][group_command_copy_warning]


#### Cut case steps

  1. Click **Edit** button on the right of suite name.

  2. Select the case steps to be cut, in the popup menu  click **Cut** link.
  
     ![][test_case_step_cut_button]  

#### Paste case steps

  1. Click **Edit** button on the right of suite name.

  2. Choose the test case step position you want to paste then click the **Paste** link,The copied/cut case steps will be inserted before the editing case step.      
  ![][test_case_step_paste_button]. 

#### Delete a case step

  Select the test case steps in the test case step table.In the popup menu  click **delete** link.  
  ![][test_case_step_delete]
  
### Delete a test case

  Click ![][test_project_delete_button] button in test case list from left-side menu.
    
[1]: ../references/testing-command.html
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
[test_case_step_operation_button]: ../images/test/test_case_step_operation_button.PNG
[test_case_step_edit_form]: ../images/test/test_case_step_edit_form.PNG
[test_case_step_up_button]: ../images/test/test_case_step_up_button.PNG
[test_case_step_down_button]: ../images/test/test_case_step_down_button.PNG
[test_case_step_updown_button]: ../images/test/test_case_step_updown_button.PNG
[test_case_step_delete_button]: ../images/test/test_case_step_delete_button.PNG
[test_case_step_delete]: ../images/test/test_case_step_delete.PNG
[test_case_step_copy_button]: ../images/test/test_case_step_copy_button.PNG
[test_case_step_paste_button]: ../images/test/test_case_step_paste_button.PNG
[test_case_step_cut_button]: ../images/test/test_case_step_cut_button.PNG
[test_case_step_copy]: ../images/test/test_case_step_copy.PNG
[group_command_copy]: ../images/test/group_command_copy.PNG
[group_command_copy_warning]: ../images/test/group_command_copy_warning.PNG
[test_project_delete_button]: ../images/test/test_project_delete_button.PNG
[test_case_migration_menu]: ../images/test/test_case_migration_menu.PNG
[test_case_migration_form]: ../images/test/test_case_migration_form.PNG
