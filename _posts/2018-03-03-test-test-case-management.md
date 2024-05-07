---
title: "Test Case Management"
category: test
date: 2018-03-03 15:17:55
last_modified_at: 2019-07-26 16:24:00
---

# Test Case Management
***

## Generate Test Cases

1. In the left-side menu bar, click the **+** button on the right of the project name.

2. Click the **Artifact Type** field, you can see five kinds of artifacts: Process, User Interface, Service, Case Type and Build from Scratch. Choose **User Interface** or **Service** to generate a unit test case, choose **Process** to generate a BPD test case, choose **Case Type** to generate a case test case, and choose **Build from Scratch** to generate an empty test case folder.

   ![][test_unit_test_add_form]{:width="80%"}
   
3. Choose process items.

4. Click the **Create** button to generate cases.

## Create a Test Case

1. Click the **+** button on the right of the suite name.

    ![][test_unit_test_suite_list]
     
2. Fill in the case name and case description.

    ![][test_unit_test_case_add_form]{:width="60%"}
  
3. Click the **Add** button. You can see the new test case shown in the left-side menu bar. When your mouse hovers over the ![][test_unit_test_case_info_button] button, you can see the description of the test case.

     ![][test_unit_test_case]{:width="100%"}

## Edit Test Case

### Edit Test Suite Info

  1. Click the ![][test_group_command_edit_button] button on the right of the suite name.

     ![][test_unit_test_suite_list]
    
  2. Update the suite name.

  3. Click the **Update** button.

### Edit Test Case Info

  1. Click the ![][test_group_command_edit_button] button on the right of the case name.
  
     ![][test_unit_test_case_list]
     
  2. Edit the test case name and description. 
  
      ![][test_unit_test_case_edit_form]{:width="60%"}
      
  3. Click the **Update** button.
  
### Add a Case Step

  1. Select the test case step position where you want to insert. In the popup menu, choose the **Add** link to insert.   
  
       ![][test_case_step_table_add]{:width="80%"}
  
  2. Choose the command you want to add and add a comment for the command if necessary. Different commands have different parameters. [More details, see API reference.][1] Fill out the form to add a case step.
  
     ![][test_case_step_add_form]{:width="60%"}
     
  3. Click the **Add** button.
  
### Edit a Case Step

  1. Select the case step you want to edit.   
   
  2. In the popup menu, click the edit link.    
  
     ![][test_case_step_edit_button]{:width="80%"}
  
  3. Update the case step.
  
     ![][test_case_step_edit_form]{:width="60%"}
     
  4. Click the **Edit** button.
  
  5. Click the **Exit Edit** button on the right of the suite name.

### Add Post Script

   In some user interface test cases, you may need to request data from the server. If the response time is too long, it will cause a timeout exception and make the test case fail. In this case, you need to add case steps to wait for the loading indicator to be hidden. We provide a post script for you to do this in bulk. [More Details][2]

   ![][test_case_post_script_demo]{:width="80%"}
  
### Adjust the Order of Case Steps

  1.  Select the case step you want to move.
  
  2.  In the popup menu, click the **MoveUp** or **MoveDown** link to adjust the order of a case step.   
     
      ![][test_case_step_updown_button]{:width="80%"} 
  
  3. Click the **Exit Edit** button on the right of the suite name.

### Copy Case Steps

  1. Click the **Edit** button on the right of the suite name.

  2. Select the case steps to be copied, and in the popup menu, click the **Copy** link.
    ![][test_case_step_copy]{:width="80%"}
  
### Copy/Cut Case Steps with Group Commands
  
  1. Click the **Edit** button on the top right of the case editor table.
  2. Select the case steps with group commands, then click the **Copy** link in the popup menu.
    ![][group_command_copy]{:width="80%"}

Notes

You could only paste the copied case steps with group commands into test cases. If you paste the case steps into group commands, you will get a warning:
  ![][group_command_copy_warning]


### Cut Case Steps

  1. Click the **Edit** button on the right of the suite name.

  2. Select the case steps to be cut, and in the popup menu, click the **Cut** link.
  
     ![][test_case_step_cut_button]{:width="80%"}  

### Paste Case Steps

  1. Click the **Edit** button on the right of the suite name.

  2. Choose the test case step position where you want to paste, then click the **Paste** link. The copied/cut case steps will be inserted before the editing case step.      
  ![][test_case_step_paste_button]{:width="80%"} . 

### Delete a Case Step

  Select the test case steps in the test case step table. In the popup menu, click the **Delete** link.  
  ![][test_case_step_delete]{:width="80%"}
  
## Delete a Test Case

  Click the ![][test_project_delete_button] button in the test case list from the left-side menu.
  
## Compare Different Historical Versions of Test Case

1. Click the version number button next to the case name.

	![][test_case_version_button]

2. Select any two versions.

	![][test_case_version_table_list]{:width="80%"}
	
3. Then the **Compare** button will be shown. Click it. You will enter the comparison page.

	![][test_case_version_compare]{:width="80%"}

4. Click the full-screen button at the upper right corner of the comparison page, you will maximize the comparison page. 
At the bottom left corner, updated, deleted, and new steps are shown as legends with different backgrounds, and we also highlight the line of code changed on the bottom left. Just hover the mouse over the yellow highlighted case step, and the tooltip will tell you the changes. 

	![][test_case_version_compare_page]{:width="100%"}
	![][test_case_version_management_maximize_page]{:width="100%"}
	
## Restore a Specific Version of Test Case

1. Click the version number to see the details of a version.

	![][test_case_version_button_inside_table]{:width="80%"}
	
2. Click the **Restore** button to restore the version.

	![][test_case_restore_button]{:width="80%"}
	
	**Note:**
	
	If a custom command is created inside the current project, is used by other test cases, and will be changed by the version to be restored, a warning message like the one below will be shown. Click **OK**, and the custom command will be restored. And other test cases that use this custom command will also be changed.
	
	![][test_case_restrore_message_warning]
	
	If a custom command is shared by another project and will be changed by the version to be restored, a warning message like the one below will be shown. Click **OK**, and the custom command will not be restored, but other commands will be restored normally.
	
	![][test_case_version_warning_message_can_not_restore]


## Create a Group Test Case

A group test case means you could run more than one test case sequentially at a time with a group test case. Let us start with creating a group test case.

  1. In the left-side menu bar, click the **+** button on the right of the project name.

  2. Click the **Artifact Type** field, select **Build from Scratch**, and input the **Suite Name** field.
  	
     ![][build_from_scratch]{:width="80%"}

  3. In the left-side menu bar, click the **+** button on the right of the **MyGroupTestCases** test suite, then select **Create Group Test Case**.
  	
     ![][create_group_test_case]

  4. Input the **Group Test Case Name** and **Group Test Case Description** fields, then click the save button.
    
     ![][group_test_case_name]{:width="60%"}


  5. Click the edit button on the top-right of the test case editor table to enable editing. 
    
     ![][group_test_case_edit]{:width="100%"}

  6. Right-click on the test case editor table and click the **Add** button. Select the target test cases to add to the group test case from the opened modal.
 
     ![][select_group_test_case]{:width="60%"}
	 
[1]: ../references/references-test-command.html
[2]: ../test/test-write-javascript-command.html#post-custom-js-command
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


