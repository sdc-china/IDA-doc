---
title: "Test case management"
category: test
date: 2018-03-03 15:17:55
last_modified_at: 2019-07-26 16:24:00
---

# Test case management
***

## Generate test cases

1. In the left-side menu bar, click **+** button on the right of project name.

2. Click **Artifact Type** field, you can see five kinds of artifacts: Process, User Interface, Service, Case Type and Build from Scratch. Choose **User Interface** or **Service** to generate a unit test case, choose **Process** to generate a BPD test case, choose **Case Type** to generate a case test case and choose **Build from Scratch** to generate an empty test case folder.

   ![][test_unit_test_add_form]
   
3. Choose process items.

4. Click **Create** button to generate cases.

## Create a test case

1. Click **+** button on the right of suite name.

    ![][test_unit_test_suite_list]
     
2. Fill case name and case description.

    ![][test_unit_test_case_add_form]
  
3. Click **Add** button. You can see new test case shown in left-side menu bar. When your mouse hover on ![][test_unit_test_case_info_button] button, you can see the description of the test case.

     ![][test_unit_test_case]

## Edit test case

### Edit test suite info

  1. Click ![][test_group_command_edit_button] button on the right of suite name.

     ![][test_unit_test_suite_list]
    
  2. Update suite name.

  3. Click **Update** button.

### Edit test case info

  1. Click ![][test_group_command_edit_button] button on the right of case name.
  
     ![][test_unit_test_case_list]
     
  2. Edit test case name and description. 
  
      ![][test_unit_test_case_edit_form]
      
  3. Click **Update** button.
  
### Import test case 

1. Click **...** link on the right of suite name and popup the menu.

2. Click "Import" link on the popup menu.

   ![][test_case_migration_menu]
 
3. Click the  "Add file" button to upload the zip file then click the "Import" button to migrate test cases.

   ![][test_case_migration_form]
  
### Add a case step

  1. Select the test case step position you want to insert.In the popup menu choose  **Add**  link to insert.   
  
       ![][test_case_step_table_add]
  
  2. Choose command you want to add and add comment for command if necessary. Different commands have different parameters. [More details see API reference.][1] Fill form to add case step.
  
     ![][test_case_step_add_form]
     
  3. Click **Add** button.
  
### Edit a case step

  1. Select the case step you want to edit.   
   
  2. In the popup menu click the  edit link.    
  
     ![][test_case_step_edit_button]
  
  3. Update case step.
  
     ![][test_case_step_edit_form]
     
  4. Click **Edit** button.
  
  5. Click **Exit Edit** button on the right of suite name.

### Add Post Script

   In some user interface test cases, you may need to request data from server. If the response time is too long, it will cause time out exception and make the test case failed. In this case, you need to add case steps to wait loading indicate to be hidden. We provide post script for you to do this in bulk. [More Details][2]

   ![][test_case_post_script_demo]
  
### Adjust the order of case step.

  1.  Select the case step you want to move.
  
  2.  In the popup menu, click **MoveUP** or  **Movedown** link to adjust the order of a case step.   
     
      ![][test_case_step_updown_button]   
  
  3. click **Exit Edit** button on the right of suite name.

### Copy case steps

  1. Click **Edit** button on the right of suite name.

  2. Select the case steps to be copied,in the popup menu  click **Copy** link.
    ![][test_case_step_copy]
  
### Copy/Cut case steps with group commands
  
  1. Click **Edit** button on the top right of the case editor table.
  2. Select the case steps with group commands, then click **Copy** link in the popup menu.
    ![][group_command_copy]

#### Notes

You could only paste the copied case steps with group command to test cases. If you paste the case steps to group commands, you will get a warning:
  ![][group_command_copy_warning]


### Cut case steps

  1. Click **Edit** button on the right of suite name.

  2. Select the case steps to be cut, in the popup menu  click **Cut** link.
  
     ![][test_case_step_cut_button]  

### Paste case steps

  1. Click **Edit** button on the right of suite name.

  2. Choose the test case step position you want to paste then click the **Paste** link,The copied/cut case steps will be inserted before the editing case step.      
  ![][test_case_step_paste_button]. 

### Delete a case step

  Select the test case steps in the test case step table.In the popup menu  click **delete** link.  
  ![][test_case_step_delete]
  
## Delete a test case

  Click ![][test_project_delete_button] button in test case list from left-side menu.
  
## Compare different historical versions of test case

1. Click version number button next to the case name.

	![][test_case_version_button]

2. Select any two versions.

	![][test_case_version_table_list]
	
3. Then the **Compare** button will be shown. Click it. You will enter the comparison page.

	![][test_case_version_compare]

4. Click full screen button at the upper right corner of comparison page, you will maximize the comparison page. 
At the bottom left corner, update, delete and new steps are shown as legends with different backgroup and we also highligh the line of code changed on bottom left.  Just hover the mouse to the yellow highlighted case step, the tooltip will tell you the changes. 

	![][test_case_version_compare_page]
	![][test_case_version_management_maximize_page]
	
## Restore a specific version of test case

1. Click version number to see the detail of a version.

	![][test_case_version_button_inside_table]
	
2. Click **Restore** button to restore the version.

	![][test_case_restore_button]
	
	**Note:**
	
	If a custom command is created inside current project, is used by other test cases and will be changed by the version to be restored, warning message like below will be shown. Click **OK**, the custom command will be restored. And other test cases that use this custom command will also be changed.
	
	![][test_case_restrore_message_warning]
	
	If a custom command is shared by other project, and will be changed by the version to be restored, warning message like below will be shown. Click **OK**, the custom command will not be restored, but other commands will be restored normally.
	
	![][test_case_version_warning_message_can_not_restore]


## Create a group test case

A group test case means you could run more than one test case sequentially a time with a group test case. Let us start with creating a group test case.

  1. In the left-side menu bar, click + button on the right of project name.

  2. Click Artifact Type field,  select **Build from Scratch** and input the Suite name field.
  	
     ![][build_from_scratch]

  3. In the left-side menu bar, click **+** button on the right of **MyGrouptestCases** test suite, then select **Create Group Test Case**.
  	
     ![][create_group_test_case]

  4. Input the **Group Test Case Name** and **Group Test Case Description** filed, then click save button.
    
     ![][group_test_case_name]

  5. Click edit button on the top-right of the test case editor table to enable editing. 
    
     ![][group_test_case_edit]

  6. Right click on the test case editor table and click Add button. Select the target test cases to the group test case from the opened modal.
 
     ![][select_group_test_case]





    
[1]: ../references/testing-command.html
[2]: ../test/test-write-js-command.html#post-custom-js-command
[test_unit_test_add_form]: ../images/test/test_unit_test_add_form.PNG
[test_case_post_script_demo]: ../images/test/test_case_post_script_demo.png
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
[group_command_copy_warning]: ../images/test/group_command_copy_warning.png
[test_project_delete_button]: ../images/test/test_project_delete_button.PNG
[test_case_migration_menu]: ../images/test/test_case_migration_menu.PNG
[test_case_migration_form]: ../images/test/test_case_migration_form.PNG
[test_case_version_button]: ../images/test/test_case_management_version_button.PNG
[test_case_version_table_list]: ../images/test/test_case_version_table_list.PNG
[test_case_version_compare]: ../images/test/test_case_version_compare.PNG
[test_case_version_compare_page]: ../images/test/test_case_version_compare_page.PNG
[test_case_version_management_maximize_page]: ../images/test/test_case_version_management_maximize_page.PNG
[test_case_version_button_inside_table]: ../images/test/test_case_version_button_inside_table.PNG
[test_case_restore_button]: ../images/test/test_case_restore_button.PNG
[test_case_restrore_message_warning]: ../images/test/test_case_restrore_message_warning.PNG
[test_case_version_warning_message_can_not_restore]: ../images/test/test_case_version_warning_message_can_not_restore.PNG
[build_from_scratch]: ../images/test/build_from_scratch.png
[create_group_test_case]: ../images/test/create_group_test_case.png
[group_test_case_name]: ../images/test/group_test_case_name.png
[group_test_case_edit]: ../images/test/group_test_case_edit.png
[select_group_test_case]: ../images/test/select_group_test_case.png


