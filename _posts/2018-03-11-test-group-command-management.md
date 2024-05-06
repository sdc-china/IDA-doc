---
title: "Group Command Management"
category: test
date: 2018-03-11 15:17:55
last_modified_at: 2019-07-26 16:28:00
---

# Group Command Management
***

## Create a Group Command

Navigate to **Hiring Sample** -> **Create Position Request CSHS** -> **Case1** to generate a group command.

1. [Import the hiring sample project.][1]

2. Enter the project dashboard.

3. Click **Create Position Request CSHS** in the left-side menu bar.

4. Click **Case1**

5. Click the **Edit** button on the right of the suite name.

   ![][test_group_command_caselist_table]{:width="80%"}

6. Choose at least two continuous case steps to save as a group command.

   ![][test_group_command_caselist_table2]{:width="80%"}

7. Click the **Save as Group Command** button.

8. Fill in the group command name and description in the form.

    **Note:** The scope field has two options, the private option means the command can be used only in the current project, and the public option means the command can be used in other projects. By default, the value is private.

   ![][test_group_command_save_form]{:width="60%"}

9. Click the **Save** button.

   Then the **Group Command** and **New Group Command** you have created will appear in the left-side menu bar, and the case steps you have chosen are folded in the new group command.

   ![][test_group_command]{:width="100%"}

10. Click the **Exit Edit** button.

**Notes:**
You can also add a group command through the custom command menu.
![][test_group_command_add]{:width="30%"}<br>
![][test_group_command_create]{:width="60%"}

## Add a Group Command

You can add a group command when you want to add some steps that belong to this group command.

1. Click the **Edit** button on the right of the suite name.

2. Click the ![][test_case_step_add_button] button in the operation column of the case step list table where you want to reuse a group command.

3. Fill out the add case step form according to the table below.

   Parameter | Description
   ----------|-------------
   Command | Reused group command name, in the custom category
   Assignee | Workflow user who helps you finish the process
   Comment | Comment on the command

   ![][test_group_command_add]{:width="30%"}

4. Click the **Add** button.

5. Click the **Exit Edit** button.

## Edit a Group Command

### Edit a Group Command Name and Description

1. Click **Group Command** in the left-side menu bar.

2. Click the ![][test_group_command_edit_button] button on the right of the group command name.

   ![][test_group_command_bar]{:width="30%"}

3. Edit the group command name and group command description.

   ![][test_group_command_edit_form]{:width="60%"}

4. Click the **Update** button.

### Edit Case Steps of a Group Command

1. Click **Execute Custom._command\_name_ with parameters \{\{Parameters\}\}** in the case step list or click the command name in the left-side menu bar.

2. [Edit case steps.][2]

## Delete a Group Command

1. Remove the command from test cases first.

    * Enter the case step list of every test case that includes the group command.
    * Right-click on the row of the group command, and it shows the context menu.
    * Click **Delete** to delete it.
    * Click the **Exit Edit** button.

    ![][test_case_steps_edit]{:width="100%"}

2. Click the ![][test_group_command_delete_button] button on the right of the group command name.

## Define Group Parameter

1. Define the group parameter for the group command.

    * Click **Group Command** in the left-side menu bar.
    * Click the **Parameter** button on the top right of the group command page.
    * Enter the group parameter key and display name in the group parameter page.
    * Click the **Add** button to add the group parameter.
    * Click the **Cancel** button to exit.

       ![][group_parameter_add]{:width="60%"}

2. Bind the group parameter for the case step parameter.

    * Click the **Edit** button to edit the case step.
      ![][test_case_step_edit_button]{:width="100%"}
    * Choose the parameter value from the select box.
    * Click the **Save** button to save the parameter.

       ![][group_parameter_save]{:width="60%"}

3. Edit this group command parameter value in the case step.
   You can see that **name** is defined in the group parameter and will be acted as the parameter input for the group command.
   - ![][group_parameter_input]{:width="60%"}

## Add an IF Command to a Group Command

In some scenarios, IDA Users want to execute a group command only when it meets specific conditions. Now, IDA supports adding an IF Command to a group command, and the group command will be executed if the IF Command result is TRUE. The IF Command is a custom JavaScript command. Let's go through it step by step:

1.Create a custom JavaScript command named 'Custom Condition'.

Please refer to [How to create a custom JavaScript command?][3]

**Note:** The command will read the value of 'Hiring manager' and 'Number of employees' on the HTML page. If the value of 'Hiring manager' equals 'Tom' and the value of 'Number of employees' equals 12, then IDA executes the group command named 'GroupWithCondition'; otherwise, it will skip the group command. The content of the command is as follows:

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

//An IF command must return bta.util.setIFCommandResult(flag)
//If the parameter is true, execute the attached group command; else if the parameter is false, skip the attached group command.
var isExecuteGroupCommand = (hiringManageValue == "Tom" && employeeNumValue == 12);
return bta.util.setIFCommandResult(isExecuteGroupCommand);
```

Here is the sample HTML page:

![][add_if_command_html]

2.Right-click the group command and click **Edit**, Users could add an **IF Command** to a group command from the modal.

![][add_if_command]

## Use a Group Command in Other Test Projects within a Team
If a group command is created in a test project with a specific team scope, then this group command can be used in any test projects created by or accessible to a team member.

1.Add the group command in a test project with a specific team scope visibility.

![][add_group_command_in_team_project]{:width="60%"}

2.In other test projects created by a team member or visible to the team member within a team, the team member can find and use the group command.

![][use_group_command_in_team_project]{:width="60%"}

See also [Team Configuration][4].

[1]: test-import-execute-sample-test-project.html
[2]: test-test-case-management.html#edit-a-case-step
[3]: test-write-javascript-command.html
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