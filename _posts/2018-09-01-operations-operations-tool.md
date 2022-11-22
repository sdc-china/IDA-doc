---
title: "Operations Tool"
category: operations
date: 2018-09-01 15:17:55
last_modified_at: 2022-10-28 16:16:00
---

# Operations Tool
***

## About this task

In this task, you will use the Workflow operations tools to manage instances: search instance, migrate instance between snapshots, update task data, finish task, move token, and re-try failed instance. You can also use it to clean up snapshots.


## Search instance

  1. In **Operations Tool** menu, click **Manage Instance**.

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

## Migrate instance

  1. Select one or more instances in the search result table, choose a target snapshot from **Migrate Instance to** drop down list, the click **Migrate** button.

     ![][op_migrate_instance]   

  2. As the result, the instance is migrated from source snapshot (snapshot selected in the search form) to target snapshot (snapshot selected in the **Migrate Instances** drop down list).

## Update task data

  1. Locate the instance row then click **Update Task Data** icon in **Operations** column.  

     ![][op_click_update_task_data]   

  2. In the popup window, select **Task** name. The task information is retrieved from the instance details.
  3. Select **Variable** name. The variable information is retrieved from the task selected above.
  4. Once the **Variable** is selected, the **Task Data** is retrieved. You can update the task data then click **Update Data** button to update the task data.  

      ![][op_update_task_data_form]   

## Finish task

  1. Locate the instance row then click **Update Task Data** icon in **Operations** column.  

      ![][op_click_update_task_data]

  2. In the popup window, select **Task** name. The task information is retrieved from the instance details.
  3. Select **Variable** name. The variable information is retrieved from the task selected above.
  4. Once the **Variable** is selected, the **Task Data** is retrieved. You can update the task data then click **Finish Task** button to update the task data and finish task.

      ![][op_update_task_data_form]

## Move token

  1. Locate the instance row then click **Move Token** icon in **Operations** column.  

       ![][op_click_update_task_data]

  2. In the popup window, select **Token** name. The token information is retrieved from the instance details.
  3. Select **Target Step** name then click **Move Token** button to move the instance token to target step.   

       ![][op_move_token_form]  


## Clean Snapshot

  1. In **Operations Tool** menu, click **Clean Snapshot**.

  2. Fill the snapshot search form by process application or toolkit.

  3. Check **Include Unnamed Snapshots** if you want to search for unnamed snapshots as well.

  4. In the result table, select any named snapshots and click **Delete** to clean the snapshot. Or click **Cleanup Unnamed Snapshots** to clean up all unnamed snapshots.
      
     ![][op_clean_snapshot]

  5. Confirm whether you want to cleanup all completed tasks.

     ![][op_clean_snapshot_confirm]

  5. After snapshot is deleted, success message is shown.

     ![][op_clean_snapshot_success]

[op_search_instance]: ../images/operation/operation_search_instance.PNG
[op_migrate_instance]: ../images/operation/operation_migrate_instance.PNG
[op_click_update_task_data]: ../images/operation/operation_click_update_task_data.PNG
[op_update_task_data_form]: ../images/operation/operation_update_task_data_form.PNG
[op_click_move_token]: ../images/operation/operation_click_move_token.PNG
[op_move_token_form]: ../images/operation/operation_move_token_form.PNG
[op_click_show_trace]: ../images/operation/operation_click_show_error_trace.PNG
[op_show_trace]: ../images/operation/operation_error_trace.PNG
[op_click_resume_instance]: ../images/operation/operation_click_resume_instance.PNG
[op_clean_snapshot]: ../images/operation/operation_clean_snapshot.PNG
[op_clean_snapshot_confirm]: ../images/operation/operation_clean_snapshot_confirm.PNG
[op_clean_snapshot_success]: ../images/operation/operation_clean_snapshot_success.PNG
[1]: ../administration/administration-baw-configuration.html
