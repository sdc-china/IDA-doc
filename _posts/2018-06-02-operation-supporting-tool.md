---
title: "Supporting Tool"
category: operation
date: 2018-10-17 15:17:55
last_modified_at: 2019-07-29 16:16:00
order: 3
---

# Supporting Tool
***

### About this task

In this task, you will use the Workflow supporting tools to search instance, migrate instance between snapshots, update task data, finish task, move token, and re-try failed instance.

### Search instance

  1. In **Operation page**, click **Supporting Tool** menu.

  2. Fill the instance search form according to the following table.

     Parameter             | Description       
     ----------------------|-------------------
     [Server][1]           |Server environment
     Process App           |Process apps of the selected server
     Branch                |The branch of selected process app or toolkit
     Snapshot              |The snapshot of selected branch
     Instance ID    |ID of instance
     Instance Name                  |Name of instance
     Instance Status              |Status of instance. Must be Active or Failed or both.

  3. Click **Search** button, you will see the instance table as search result.

     ![][op_search_instance]

### Migrate instance

  1. Select one or more instances in the search result table, choose a target snapshot from **Migrate Instance to** drop down list, the click **Migrate** button.

     ![][op_migrate_instance]   

  2. As the result, the instance is migrated from source snapshot (snapshot selected in the search form) to target snapshot (snapshot selected in the **Migrate Instance to** drop down list).

### Update task data

  1. Locate the instance row then click **Update Task Data** icon in **Operations** column.  

     ![][op_click_update_task_data]   

  2. In the popup window, select **Task** name. The task information is retrieved from the instance details.
  3. Select **Variable** name. The variable information is retrieved from the task selected above.
  4. Once the **Variable** is selected, the **Task Data** is retrieved. You can update the task data then click **Update Data** button to update the task data.  

      ![][op_update_task_data_form]   

### Finish task

  1. Locate the instance row then click **Update Task Data** icon in **Operations** column.  

      ![][op_click_update_task_data]

  2. In the popup window, select **Task** name. The task information is retrieved from the instance details.
  3. Select **Variable** name. The variable information is retrieved from the task selected above.
  4. Once the **Variable** is selected, the **Task Data** is retrieved. You can update the task data then click **Finish Task** button to update the task data and finish task.

      ![][op_update_task_data_form]

### Move token

  1. Locate the instance row then click **Move Token** icon in **Operations** column.  

       ![][op_click_move_token]

  2. In the popup window, select **Token** name. The token information is retrieved from the instance details.
  3. Select **Target Step** name then click **Move Token** button to move the instance token to target step.   

       ![][op_move_token_form]  

### Retry failed instance

  1. For failed instance, you can click the view icon in **Instance Status** column to view the detailed error trace.  

       ![][op_click_show_trace]  

       ![][op_show_trace]   

  2. Failed instance can be re-tried by clicking the **Resume Instance** icon in **Operations** column.  

       ![][op_click_resume_instance]     

  3. As the result, the **Instance Status** will be updated (Active or Failed).

[op_search_instance]: ../images/operation/operation_search_instance.PNG
[op_migrate_instance]: ../images/operation/operation_migrate_instance.PNG
[op_click_update_task_data]: ../images/operation/operation_click_update_task_data.PNG
[op_update_task_data_form]: ../images/operation/operation_update_task_data_form.PNG
[op_click_move_token]: ../images/operation/operation_click_move_token.PNG
[op_move_token_form]: ../images/operation/operation_move_token_form.PNG
[op_click_show_trace]: ../images/operation/operation_click_show_error_trace.PNG
[op_show_trace]: ../images/operation/operation_error_trace.PNG
[op_click_resume_instance]: ../images/operation/operation_click_resume_instance.PNG
[1]: ../administration/administration-bpm-configuration.html
