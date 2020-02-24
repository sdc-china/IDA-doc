---
title: "Custom OOTB Command"
category: test
date: 2018-10-03 15:17:55
last_modified_at: 2020-02-20 15:19:00
order: 59
---

# Update a Customer Replayer command
***


### Replayer command customization


1.  Login into IDA web console.	 Click **Administrator** tab, then switch to  **Custom Command** tab. 
  
2.  Click **Custom OOTB Command**.

     ![][ootbui]

3.  Choose the command from OOTB command list,it will show the template code for usage.

    ![][textcommand]

4.  Write your command logic after **TODO add your implementation below, For example** line.

    ![][textcommandscript]

5.  Click the **save** button to save the content.

6.  You can run your test case in replay mode to see it works or not.

**Reference**  
[Test Command](https://sdc-china.github.io/IDA-doc/references/references-test-command.html)   
[JavaScript API](https://sdc-china.github.io/IDA-doc/references/references-js-api.html) 

**Notes**

You can write console.log to debug your replay script in your browser.

 [ootbui]: ../images/test/test_ootb_ui.png
 [textcommand]: ../images/test/test_ootb_textcommand.png
 [textcommandscript]: ../images/test/test_ootb_textscript.png
 
