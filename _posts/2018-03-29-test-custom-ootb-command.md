---
title: "Custom OOTB Command"
category: test
date: 2018-03-29 18:17:55
last_modified_at: 2020-02-26 15:19:00
---

# Custom OOTB Command
***

## Replayer Command Customization

1. Log in to the IDA web console. Click the **Administrator** tab, then switch to the **Custom Command** tab.

2. Click **Custom OOTB Command**.

   ![][ootbui]

3. Choose the command from the OOTB command list; it will show the template code for usage.

   ![][textcommand]{:width="80%"}

4. Write your command logic after the **TODO add your implementation below, For example** line.

   ![][textcommandscript]{:width="80%"}

```
var coachView = bta.util.getCoachView(this.jsonObject);
var element = coachView.context.element
 .querySelector("div.CoachView.MySelect div.dijitInputField input,div.CoachView.MyText div.dijitInputField input");
if (element) 
{
  var xpath = bta.util.getXpath(element);
  var parameter = {
    xpath: xpath,
    value: value
  };
  return bta.util.callback("sendKey", parameter);
}
```

5. Click the **save** button to save the content.

6. You can run your test case in replay mode to see if it works or not.

**Reference**  
[Test Command](../references/references-test-command.html)   
[JavaScript API](../references/references-javascript-api.html) 

**Notes**

You can write console.log to debug your replay script in your browser.

[ootbui]: ../images/test/test_ootb_ui.png
[textcommand]: ../images/test/test_ootb_textcommand.png
[textcommandscript]: ../images/test/test_ootb_textscript.png