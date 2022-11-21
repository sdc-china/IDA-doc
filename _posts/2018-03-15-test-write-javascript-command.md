---
title: "Write a Javascript Command"
category: test
date: 2018-03-15 15:17:55
last_modified_at: 2021-05-06 11:48:00
---

# Write a Javascript Command
***

## Create a javascript command

1. Navigate to **Custom Command** in the left-side menu bar, click + button to generate a group command.

   ![][test_js_command]

2. Enter the javascript command info.

   **Notes** The scope field has two options, the private means the command can be used only in current project, the public means the command can be used in other projects. By default, the value is private. You can input the {Parameters.XXX} as verbalization. The parameter is defined in this JS. XXX is the parameter key name you defined in this custom js.

   ![][test_js_command_info]{:width="60%"}

3. Define the javascript command parameter. You can refer these parameters' value through verbalization.
For example: {Parameters.myKey}. You can configure a list of possible values of the parameter, separated by comma.

   ![][test_js_command_parameter]{:width="80%"}

4. Define your javascript command content.

   ![][test_js_command_logic]


5. Add your javascript command in your test case. If you have configured the list of possible values of the parameter, you can select from the parameter dropdown list.

   ![][test_add_js_command]{:width="60%"}

6. You can  refer js variable in the case step.

   ![][test_js_casestep]{:width="60%"}
   ![][test_js_commandlist]


7. Refer to [Javascript API Reference](../references/references-javascript-api.html) for OOTB
Javascript functions   

## Javascript Command sample
   In Hiring sample Standard_HR_Open_New_Position/case2, we will change the number of employees to value 3 if we choose Position Request Department as **Sales**.

   Here are the steps:
1. We create a js testCommand named **change sales number**    
2. Copy the below js command content into this js command.

```
var controlId='Section1.Section4.Requisition_CV1.Section1.Single_Select2';   
var textId='Section1.Section4.Requisition_CV1.Section1.Text3';   
var coachView;   
var inputElement;   
var selectedValue = [];  
if (controlId) {   
    coachView = bta.util.getCoachViewByControlId(controlId);     
}   
var selectElement;   
if (coachView) {   
	selectElement = coachView.context.element.querySelector("select.form-control");     
	if (bta.util.isElementTag(selectElement, "select")) {   
	    var selectOptions = selectElement.options;   
	    for (var i=0; i<selectOptions.length; i++) {   
	    	 if (selectOptions[i].selected) {                 
	    		if (selectOptions[i].text=='Sales'){                 
                   var textView = bta.util.getCoachViewByControlId(textId);                 
	           inputElement = textView.context.element.querySelector("input.form-control");	   
                    if (inputElement) {        
                      inputElement.value=3 ;   
                      }    

 	    	 }   
      	       }   
           }      
        }   
}    
return bta.util.callback();

```
3. Insert this js command in the **Submit position request**  task UI.

   ![][test_js_commandsample]

4. When you record/replay this case again, you will find when you select the department value as **sales** , the number of employee value is **3**.

   ![][test_js_commandresult]


### Post Custom JS Command

  This feature allow you to inject a custom JS command to the case steps in bulk.

  The classic use case:

  Issue:
  In some user interface test cases, you may need to request data from the server. If the response time is too long, it will block the later case steps and cause the test case to fail.

  Solution:
  Add a customized javascript which waits for the request to complete as post script and insert it after the case steps that trigger the request.

Here is the steps:
1. Post Script function is disable by default and user should enble it in project configuration.

   Step1: Edit the project

   Step2: Add **"post_script":true** in Engine Properties.

   ![][post_script_eanble]

2. Create Post Custom Command:

   Global level: Create a javascript command named `ida_post_script` in **Administration -> Custom Command**. Then the post script toggle will shown in the case step edit table. And allow all projects of your system to insert post script after UI/JS commands.

   Project level: Create a javascript command named `ida_post_script` in one project. Then the post script toggle will shown in the case step edit table of this project. And allow this project to insert post script after UI/JS commands. It will overwrite the global level post script.

   Test Case level: Create a javascript command named `ida_post_script_[project Id]_[test Case Id]` in one project. Then the post script toggle will shown in the case step edit table of this test case. And allow this test case to insert post script after UI/JS commands. It will overwrite global level and project level post script.

   Default post script:

   ```
	console.log("Start to run post script!");
	var timeout = 10;
	var interval = 2;
	var parameter = {
		elementId: "",
		elementCss: "img[alt='Loading']",
		xpath: ""
	};
	bta.util.waitElement(parameter, {
		 visibility: "Visible",
	     timeout: timeout,
	     interval: interval
	}, function(status){
	  if (status === "success") {
	    bta.util.waitElement(parameter, {
	         visibility: "Hidden",
	         timeout: timeout,
	         interval: interval
	    }, function(){
	      bta.util.callback();
	    });
	  } else {
	    bta.util.callback();
	  }
	});

   ```

   You can configure **timeout**, **interval**, **elementId**, **elementCss** and **xpath** as you need.The default sample
   will wait some time util  loading icon(img[alt='Loading']) disapper(Usually it is located on right top of the UI).It    applys for long loading ajax      service or Long time UI loaing.

   ![][test_post_script_sampleUI]

   Also you can change the post script to meet your needs.It will run js after every command you apply for ida_post_script.
   When you replay the test case you can open the web console to debug your test case.For example:

   ```
	console.log("Start to run post script!");
	setTimeout(function(){ }, 3000);
    ```
3. Insert Post Script to Case Step

   If you have created any level of the post script then the layout of case step table:

   ![][test_post_script_look]

   Click the toggle can insert post script after the command.

   Batch operation:

   Select the case steps, right click then click **On**/**Off** button.

   ![][test_operation_post_script]



  [test_js_command]: ../images/test/test_js_command.PNG
  [test_js_command_info]: ../images/test/test_js_command_info.PNG
  [test_js_command_parameter]: ../images/test/test_js_command_parameter.PNG
  [test_js_command_logic]: ../images/test/test_js_command_logic.PNG
  [test_add_js_command]: ../images/test/test_js_command_add.PNG
  [test_js_casestep]: ../images/test/test_js_casestep.PNG
  [test_js_commandlist]: ../images/test/test_js_commandlist.PNG
  [test_js_commandsample]: ../images/test/test_js_commandsample.PNG
  [test_js_commandresult]: ../images/test/test_js_commandresult.PNG
  [test_post_script_look]: ../images/test/test_post_script_look.PNG
  [test_post_script_sampleUI]: ../images/test/test_post_script_sample.PNG
  [test_operation_post_script]: ../images/test/test_operation_post_script.png
  [post_script_eanble]: ../images/test/post_script_eanble.png
