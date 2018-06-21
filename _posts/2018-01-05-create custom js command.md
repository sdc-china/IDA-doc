---
layout: page
title: "Javascript command management"
category: test
date: 2018-01-05 15:17:55
order: 5
---

### Create a javascript command

1. Navigate to **Custom Command** in the left-side menu bar, click + button to generate a group command.

   ![][test_js_command]
  
2. Enter the javascript command info.

   ![][test_js_command_info]
  
3. Define the js command parameter.

   ![][test_js_command_parameter]
   
4. Wrote your js command logic.

   ![][test_js_command_logic]
    
5. Add your js command in your test case.

   ![][test_add_js_command]

6. Add new case step reference your js command reference variable.

   ![][test_js_casestep]

If you check the console,it will print the actual value for the specfied key name you filled. See below samples.  

Keter 16:47:30.973 [CaseExecutor-1] INFO  com.ibm.cte.sdc.bpm.testing.command.utility.Debug - Debug log: myValue

  [test_js_command]: ../images/test/test_js_command.PNG
  [test_js_command_info]: ../images/test/test_js_command_info.PNG
  [test_js_command_parameter]: ../images/test/test_js_command_parameter.PNG
  [test_js_command_logic]: ../images/test/test_js_command_logic.PNG
  [test_add_js_command]: ../images/test/test_js_command_add.PNG
  [test_js_casestep]: ../images/test/test_js_casestep.PNG
  
