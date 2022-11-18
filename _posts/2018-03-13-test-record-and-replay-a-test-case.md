---
title: "Record and Replay a Test Case"
category: test
date: 2018-03-13 15:17:55
last_modified_at: 2019-07-26 16:32:00
---

# Record and Replay a Test Case
***

## Record a test case

  1. Click **Edit** button on the right of suite name.
  
     ![][test_case_step_table]{:width="90%"}
  
  2. Click **Record** button on the right of suite name. You will enter record mode.
  
     ![][test_case_step_table2]{:width="90%"}
     
      ![][test_record_page]
  
  3. In the **Debug** step which has ![][test_debug_point] in front of it, the process will be stopped. If you need to resume, you can click ![][test_case_record_resume].
   
     ![][test_case_record_plugin]
  
  4. Record according to process diagram execution flow, you can see each step you have done in tool bar.
  
      ![][test_case_record_plugin2]
  
  5. Click ![][test_record_stop] button to finish the record.The operations you done are showed in case step list table.
  
     ![][test_record_steps]

## Replay a test case 

  1. Click **Record** button on the right of case name to replay it.
  
  2. Click ![][test_record_stop] button to finish the replay.
  
  3. In the **Debug** step which has ![][test_debug_point] in front of it, the record will be stopped. You need to click ![][test_case_record_resume] button to resume. 
  
  4. Click **Exit Edit** button on the right of suite name.
  
  **Notes**: 
  
  If you need to record some test steps, you can add **debug** command where you need to record. When replay to the **debug** command, you can record your case steps.
  
  Here are the description of plugin buttons:
  
   | Button   |Description      |Can click while running|
   |----|---------------------- |-----------------------|
   |![][test_case_record_resume] |Run test case until break point step.| False, can click on debug steps.|
   |![][test_case_break_point_button]|Skip all break points.|True|
   |![][test_case_skip_break_point]|Enable all break points.|True|
   |![][test_case_disabled_record_button]|Disable record case steps.|False, can click on debug steps.|
   |![][test_case_enable_record_button]|Enable record case steps.|False, can click on debug steps.|
  
## Record a test case with group command

  1. Preparation
  
     - Prepare group commands that you want to add into test case. Refer to **Create a group command** in **[Group Command Management][1]**. Here is the group command that is ready to be used as example.
          
          ![][test_record_and_replay_example_group_command]
          
     - Add group command to test case. Refer to **Use a group command** in **[Group Command Management][1]**.
    
     - Add **debug** command following the group command. In case you would like to record after the group command. Take case2 of **Standard HR Open New Position** as an example. After finishing preparation, the case step list will be like that shown in the following screenshot.

         ![][test_record_and_record_group_command]
      
  2. The recording operation refers to **Record a test case**.
  
## Replay a test case with group command

  Refer to **Replay a test case**.
    
    
[test_case_step_table]: ../images/test/test_case_step_table.PNG
[test_case_step_table2]: ../images/test/test_case_step_table2.PNG   
[test_case_record_resume]: ../images/test/test_case_record_resume.PNG
[test_case_record_plugin]: ../images/test/test_case_record_plugin.PNG
[test_case_record_plugin2]: ../images/test/test_case_record_plugin2.PNG
[test_record_stop]: ../images/test/test_record_stop.PNG
[test_record_steps]: ../images/test/test_record_steps.PNG
[test_case_record_button]: ../images/test/test_case_record_button.PNG
[test_case_break_point_button]: ../images/test/test_case_break_point_button.PNG
[test_case_disabled_record_button]: ../images/test/test_case_disabled_record_button.PNG
[test_case_skip_break_point]: ../images/test/test_case_skip_break_point.PNG
[test_case_enable_record_button]: ../images/test/test_case_enable_record_button.PNG
[test_debug_point]: ../images/test/test_debug_point.png
[test_record_page]: ../images/test/test_record_page.PNG
[test_record_and_record_group_command]: ../images/test/test_record_and_record_group_command.PNG
[test_record_and_replay_example_group_command]: ../images/test/test_record_and_replay_example_group_command.PNG
[1]: test-group-command-management.html