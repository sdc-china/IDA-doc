---
title: "Monitor Management"
category: operation
date: 2018-10-16 15:17:55
last_modified_at: 2019-07-29 16:15:00
order: 2
---

# Monitor Management
***
### About this task

In this task, you will create a new BPM monitor, edit monitor, delete monitor, disable/enable monitor and view monitor charts.

### Prerequisite
To use Monitor feature, target BPM system to be monitored has to integrate with IDA through DEF. For details, please refer to  [Configure BPM DEF][2].

### Create monitor

  1. In the monitor list page, click **Create Monitor** button.

     ![][op_create_monitor]

  2. Fill the monitor form according to the following table.

     Parameter             | Description       
     ----------------------|-------------------
     Monitor Name          |Name of monitor    
     Monitor Descriptions   |Descriptions of monitor
     [Server][1]           |Server environment
     Process App           |Process apps of the selected server
     Branch                |The branch of selected process app or toolkit
     Snapshot              |The snapshot of selected branch
     Monitor Failed Instance    |Indicate whether to monitor failed instance
     Email Notification for Failed Instance                   |Email address to receive notification when instance is failed. If multiple email addresses are needed, separate them by comma.
     Service Flow to Monitor              |Select service flows to be monitored
     Execution Threshold (ms)            |Define execution threshold in millisecond for each selected service flow
     Default Execution Threshold (ms)  | Define the default execution threshold in millisecond for all service flows as a global value in this module. For each selected service flow to be monitored, if the Execute Threshold (ms) is not specified, the Default Execution Threshold (ms) is used. Otherwise, the Execute Threshold (ms) overwrites the Default Execution Threshold (ms)
     Email Notification                   |Email address to receive notification when service flow actual execution time exceeds the threshold. If multiple email addresses are needed, separate them by comma.

  3. Click **Create** button, you will return to the monitor list page and find the new one there.

     ![][op_create_monitor_form]

### Edit monitor

  1. Click **Edit** icon for the monitor you want to edit in the monitor list page.

     ![][op_edit_monitor]

  2. Update monitor form according to the table showed in creating section.

### Disable monitor

  1. Click **Disable** icon for the monitor you want to disable in the monitor list page.

      ![][op_disable_monitor]

### Enable monitor

  1. Click **Enable** icon for the monitor you want to enable in the monitor list page.

      ![][op_enable_monitor]

### Delete monitor

  1. Click **Remove** icon for the monitor you want to delete in the monitor list page.

      ![][op_delete_monitor]

### View monitor chart

  1. Click monitor name for the monitor you want to view chart in the monitor list page. Then you will drill down to the service flow performance line chart.

      ![][op_click_monitor]  

      ![][op_monitor_chart]

[op_create_monitor]: ../images/operation/operation_click_create_monitor.PNG
[op_create_monitor_form]: ../images/operation/operation_create_monitor_form.PNG
[op_edit_monitor]: ../images/operation/operation_click_edit_monitor.PNG
[op_disable_monitor]: ../images/operation/operation_click_disable_monitor.PNG
[op_enable_monitor]: ../images/operation/operation_click_enable_monitor.PNG
[op_delete_monitor]: ../images/operation/operation_click_delete_monitor.PNG
[op_click_monitor]: ../images/operation/operation_click_monitor_name.PNG
[op_monitor_chart]: ../images/operation/operation_monitor_chart.PNG
[1]: ../administration/administration-bpm-configuration.html
[2]: ../installation/installation-integrate-def.html
