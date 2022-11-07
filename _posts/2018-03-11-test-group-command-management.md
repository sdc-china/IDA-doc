---
title: "Group Command Management"
category: test
date: 2018-03-11 15:17:55
last_modified_at: 2019-07-26 16:28:00
order: 40
---

# Group command management
***

## Create a group command

  Navigate to **Hiring sample** -> **Create Position Request CSHS** -> **Case1** to generate a group command.
 
  1. [Import hiring sample project.][1]
 
  2. Enter project dashboard.
  
  3. Click **Create Position Request CSHS** in left-side menu bar.
  
  4. Click **Case1**
  
  5. Click **Edit** button on the right of suite name.
  
      ![][test_group_command_caselist_table]
  
  6. Choose at least two continuous case steps to save as group command.
  
      ![][test_group_command_caselist_table2]
  
  7. Click **Save as Group Command** button.
  
  8. Fill group command name and description in the form.
  
     **Notes** The scope field has two options, the private means the command can be used only in current project, the public means the command can be used in other projects. By default the value is private.
  
      ![][test_group_command_save_form]
  
  9. Click **Save** button.
  
      Then **Group Command** and **New Group Command** you have created will appear in the left-side menu bar, and the case steps you have chosen are folded in the new group command.  
  
      ![][test_group_command]
  
  10. Click **Exit Edit** button.
  
  **Notes**  
  You can also add group command through the custom command menu.     
    ![][test_group_command_add]
    ![][test_group_command_create] 

## Add group command

  You can add a group command when you want to add some steps which belongs to this group command.

  1. Click **Edit** button on the right of suite name.
  
  2. Click ![][test_case_step_add_button] button in the operation column of case step list table where you want to reuse a group command.
  
  3. Fill add case step form according to below table.
  
      Parameter           | Description       
    ----------------------|-------------------
      Command             | Reused group command name, in custom category
      Assignee            | Workflow user who help you finish process
      comment             | Comment of command
  
      ![][test_group_command_add]
  
  4. Click **Add** button.
  
  5. Click **Exit Edit** button.
  
## Edit group command

### Edit group command name and description

  1. Click **Group Command** in left-side menu bar.
  
  2. Click ![][test_group_command_edit_button] button on the right of group command name.
  
      ![][test_group_command_bar]
  
  3. Edit group command name and group command description.
  
      ![][test_group_command_edit_form]
  
  4. Click **Update** button.
  
### Edit case steps of group command

  1. Click **Execute Custom._command\_name_ with parameters \{\{Parameters\}\}** in case step list or click command name in left-side menu bar.
  
  2. [Edit case steps.][2]
  
## Delete Group command

  1. Remove the command from test cases first.
  
     * Enter into case step list of every test case which includes the group command.
     * Right click on the row of group command, it shows the context menu.
     * Click **Delete** to delete it.
     * Click **Exit Edit** button.
  
        ![][test_case_steps_edit]
  
  2. Click ![][test_group_command_delete_button] button on the right of group command name.
  
## Define Group parameter  

  1. Define the group parameter for the group command.
  
      * Click **Group Command** in left-side menu bar.
      * Click **Parameter** button on the top right of group command page.
      * Enter group parameter key,display name in the group parameter page.
      * Click **Add** button to add group parameter.
      * Click **Cancel** button to exit.
      
         ![][group_parameter_add]
     
   2. Bind group parameter for case step parameter.
   
       * Click ![][test_case_step_edit_button] button to edit case step.
       * Choose the parameter value from the  select box.                   
       * Click **Save** button to save the parameter.
       
          ![][group_parameter_save]
  3. Edit this group command parameter value in the case step.
     You can see **name** is defined in the group parameter will be acted as the parameter input for group command.
     ![][group_parameter_input]  
          
## Add IF Command to a group command

In some scenarios, IDA Users want to execute a group command only when it meets some conditions. Now, IDA supports to add an IF Command to a group comand, and the group command will be executed if the IF Command result is TRUE. The IF Command is a custom javascript command. Let's go through it step by step:

  1\. Create a custom javascript command named 'Custom Condition'. 
  
  Please refer to [How to create a custom javascript command?][3]
  
  **Notes:** The command will read the value of 'Hiring manager' and 'Number of employees' on the html page. If the value of 'Hiring manager' equals 'Tom' and the value of 'Number of employees' euqals 12, then IDA executes the group command named 'GroupWithCondition', or else, it will skip the group command. The content of the command is as below:  

  ```javascript
    //TODO Add your JavaScript implementation here
    var hiringManagerCoachView = bta.util.getCoachViewByLabel("Hiring manager", null);
    var hiringManageValue;
    if (hiringManagerCoachView.context.binding) {
      hiringManageValue = hiringManagerCoachView.context.binding.get("value");
    }
    var employeeNumCoachView = bta.util.getCoachViewByLabel("Number of employees", null);
    var employeeNumValue;
    if (employeeNumCoachView.context.binding) {
      employeeNumValue = employeeNumCoachView.context.binding.get("value");
    }

    //A IF command must return bta.util.setIFCommandResult(flag)
    //If the parameter is true, execute the attached group command, else the parameter is false, skip the attached group command.
    var isExecuteGroupCommand = (hiringManageValue == "Tom" && employeeNumValue == 12);
    return bta.util.setIFCommandResult(isExecuteGroupCommand);
  ```

  Here is the sample html page:

  ![][add_if_command_html]


  2\. Right click the group command and click **Edit**, Users could add a **IF Command** to a group command from the modal.

  ![][add_if_command]
  


## Use a Group Command in Other Test Projects within a Team
  If a group command is created in a test project with a specific team scope, then this group command can be used in any test projects created by or accessible to a team member.

  1\. Add the group command in a test project with a specific team scope visibility.
  
  ![][add_group_command_in_team_project]{:height="60%" width="60%"}

  2\. In other test projects created by a team member or visible to the team member within a team, the team member can find and use the group command.
  
  ![][use_group_command_in_team_project]{:height="60%" width="60%"}

  See also [Team Configuration][4].


  [1]: test-import-execute-sample-test-project.html
  [2]: test-unit-test-case-management.html
  [3]: test-write-js-command.html
  [4]: ../administration/administration-team-configuration.html
  [test_group_command_caselist_table]: ../images/test/test_group_command_caselist_table.PNG
  [test_group_command_caselist_table2]: ../images/test/test_group_command_caselist_table2.PNG
  [test_group_command]: ../images/test/test_group_command.PNG
  [test_group_command_add]: ../images/test/test_group_command_add.PNG
  [test_group_command_create]: ../images/test/test_group_command_create.PNG
  [test_group_command_edit_button]: ../images/test/test_group_command_edit_button.PNG
  [test_group_command_delete_button]: ../images/test/test_group_command_delete_button.PNG
  [test_group_command_bar]: ../images/test/test_group_command_bar.PNG
  [test_group_command_edit_form]: ../images/test/test_group_command_edit_form.PNG
  [test_group_command_save_form]: ../images/test/test_group_command_save_form.PNG
  [test_group_command_add]: ../images/test/test_group_command_add.PNG
  [test_case_step_delete_button]: ../images/test/test_case_step_delete_button.PNG
  [test_case_step_add_button]: ../images/test/test_case_step_add_button.PNG
  [test_case_steps_edit]: ../images/test/test_case_steps_edit.PNG
  [group_parameter_add]: ../images/test/test_group_parameter_add.PNG
  [test_case_step_edit_button]: ../images/test/test_case_step_edit_button.PNG
  [group_parameter_save]: ../images/test/test_case_step_parameter_save.PNG
  [group_parameter_input]: ../images/test/test_case_step_parameter_input.PNG
  [add_if_command]: ../images/test/add_if_command.PNG
  [add_if_command_html]: ../images/test/add_if_command_html.png
  [add_group_command_in_team_project]: ../images/test/add_group_command_in_team_project.png
  [use_group_command_in_team_project]: ../images/test/use_group_command_in_team_project.png

