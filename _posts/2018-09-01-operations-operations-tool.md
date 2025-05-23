---
title: "Operations Tool"
category: operations
date: 2018-09-01 15:17:55
last_modified_at: 2025-05-23 16:16:00
---

# Operations Tool
***

## About this Task

In this task, you will use the Workflow operations tools to manage instances: search for instances, migrate instances between snapshots, update task data, finish tasks, move tokens, and retry failed instances. You can also use it to clean up snapshots.


## Search Instance

  1. In the **Operations Tool** menu, click **Manage Instance**.

  2. Fill the instance search form according to the following table.

     Parameter             | Description       
     ----------------------|-------------------
     [Server][1]           |Server environment
     Process App           |Process apps of the selected server
     Branch                |The branch of the selected process app or toolkit
     Snapshot              |The snapshot of the selected branch
     Instance ID           |ID of the instance
     Instance Name         |Name of the instance
     Instance Status        |Status of the instance. Must be Active or Failed or both.

  3. Click the **Search** button, you will see the instance table as the search result.

     ![][op_search_instance]{:width="100%"}

## Migrate Instance

  1. Select one or more instances in the search result table, choose a target snapshot from the **Migrate Instance to** drop-down list, then click the **Migrate** button.

     ![][op_migrate_instance]{:width="100%"}   

  2. As a result, the instance is migrated from the source snapshot (snapshot selected in the search form) to the target snapshot (snapshot selected in the **Migrate Instances** drop-down list).

## Update Task Data

  1. Locate the instance row, then click the **Update Task Data** icon in the **Operations** column.  

     ![][op_click_update_task_data]{:width="100%"}      

  2. In the pop-up window, select the **Task** name. The task information is retrieved from the instance details.
  3. Select the **Variable** name. The variable information is retrieved from the task selected above.
  4. Once the **Variable** is selected, the **Task Data** is retrieved. You can update the task data, then click the **Update Data** button to update the task data.  

      ![][op_update_task_data_form]{:width="60%"}   

## Finish Task

  1. Locate the instance row, then click the **Update Task Data** icon in the **Operations** column.  

      ![][op_click_update_task_data]{:width="100%"}      

  2. In the pop-up window, select the **Task** name. The task information is retrieved from the instance details.
  3. Select the **Variable** name. The variable information is retrieved from the task selected above.
  4. Once the **Variable** is selected, the **Task Data** is retrieved. You can update the task data, then click the **Finish Task** button to update the task data and finish the task.

      ![][op_update_task_data_form]{:width="60%"}   

## Move Token

  1. Locate the instance row, then click the **Move Token** icon in the **Operations** column.  

       ![][op_click_update_task_data]{:width="100%"}  

  2. In the pop-up window, select the **Token** name. The token information is retrieved from the instance details.
  3. Select the **Target Step** name, then click the **Move Token** button to move the instance token to the target step.   

       ![][op_move_token_form]{:width="60%"}     


## Clean Snapshot

  1. In the **Operations Tool** menu, click **Clean Snapshot**.

  2. Fill the snapshot search form by process application or toolkit.

  3. Check **Include Unnamed Snapshots** if you want to search for unnamed snapshots as well.

  4. In the result table, select any named snapshots and click **Delete** to clean the snapshot. Or click **Cleanup Unnamed Snapshots** to clean up all unnamed snapshots.
      
     ![][op_clean_snapshot]{:width="100%"}  

  5. Confirm whether you want to clean up all completed tasks.

     ![][op_clean_snapshot_confirm]{:width="100%"}  

  6. After the snapshot is deleted, a success message is shown.

     ![][op_clean_snapshot_success]{:width="100%"}  

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