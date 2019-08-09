---
title: "Record and replay a test case"
category: test
date: 2018-10-01 15:17:55
last_modified_at: 2019-07-26 16:32:00
order: 50
---

# Record and replay a test case
***
### Record a test case

  1. Click **Edit** button on the right of suite name.
  
     ![][test_case_step_table]
  
  2. Click **Record** button on the right of suite name. You will enter record mode.
  
     ![][test_case_step_table2]
     
     ![][test_record_page]
  
  3. In the **Debug \{\{log\}\}** step, the process will be stopped. You need to click ![][test_case_record_resume] button to resume.
   
     ![][test_case_record_plugin]
  
  4. Record according to process diagram execution flow, you can see each step you have done in tool bar.
  
      ![][test_case_record_plugin2]
  
  5. Click ![][test_record_stop] button to finish the record.The operations you done are showed in case step list table.
  
     ![][test_record_steps]

### Replay a test case 

  1. Click ![][test_case_record_button] button on the right of case name to replay it.
  
  2. Click ![][test_record_stop] button to finish the replay.
  
  3. In the **Debug \{\{log\}\}** step, the record will be stopped. You need to click ![][test_case_record_resume] button to resume.
  
  4. Click **Exit Edit** button on the right of suite name.
  
  **Notes**: 
  
  If you need to  record to a  test case, you can add **debug** command. When replay to the **debug** command, you can prepare to record your operation.
  
### Record a test case with group command

  1. Preparation
  
     - Prepare group commands that you want to add into test case. Refer to **Create a group command** in **[Reusable group command management][1]**. Here is the group command that is ready to be used as example.
          
          ![][test_record_and_replay_example_group_command]
          
     - Add group command to test case. Refer to **Reuse a group command** in **[Reusable group command management][1]**.
    
     - Add **debug** command following the group command. In case you would like to record after the group command. Take case2 of **Standard HR Open New Position** as an example. After finishing preparation, the case step list will be like that shown in the following screenshot.

         ![][test_record_and_record_group_command]
      
  2. The recording operation refers to **Record a test case**.
  
### Replay a test case with group command

  Refer to **Replay a test case**.
    
    
[test_case_step_table]: ../images/test/test_case_step_table.PNG
[test_case_step_table2]: ../images/test/test_case_step_table2.PNG   
[test_case_record_resume]: ../images/test/test_case_record_resume.PNG
[test_case_record_plugin]: ../images/test/test_case_record_plugin.PNG
[test_case_record_plugin2]: ../images/test/test_case_record_plugin2.PNG
[test_record_stop]: ../images/test/test_record_stop.PNG
[test_record_steps]: ../images/test/test_record_steps.PNG
[test_case_record_button]: ../images/test/test_case_record_button.PNG
[test_record_page]: ../images/test/test_record_page.PNG
[test_record_and_record_group_command]: ../images/test/test_record_and_record_group_command.PNG
[test_record_and_replay_example_group_command]: ../images/test/test_record_and_replay_example_group_command.PNG
[1]: test-record-and-replay-a-test-case.html