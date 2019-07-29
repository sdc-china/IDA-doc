---
title: "Write a Javascript command"
category: test
date: 2018-10-02 15:17:55
last_modified_at: 2019-07-29 15:17:00
order: 55
---

### Create a javascript command

1. Navigate to **Custom Command** in the left-side menu bar, click + button to generate a group command.

   ![][test_js_command]

2. Enter the javascript command info.

   **Notes** The scope field has two options, the private means the command can be used only in current project, the public means the command can be used in other projects. By default the value is private.

   ![][test_js_command_info]

3. Define the javascript command parameter.

   ![][test_js_command_parameter]

4. Define your javascript command logic.

   ![][test_js_command_logic]


5. Add your javascript command in your test case.

   ![][test_add_js_command]

6. You can  reference js variable in the case step

   ![][test_js_casestep]
   ![][test_js_commandlist]


7. Refer to [Javascript API Reference](references/references-js-api.html) for OOTB
Javascript functions   

### Javascript Command sample
   In Hiring sample Standard_HR_Open_New_Position/case2,we will create a addition logic if choose position Request department is **Sales**, we will change the number of employees to value 3 no matter the value we choose before.   

1. We create a js testCommand name **change sales number**    
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

4. When you record/replay this case again,you will find when you recorded  department value is **sales** ,the number of employee value is **3**.

   ![][test_js_commandresult]


  [test_js_command]: ../images/test/test_js_command.PNG
  [test_js_command_info]: ../images/test/test_js_command_info.PNG
  [test_js_command_parameter]: ../images/test/test_js_command_parameter.PNG
  [test_js_command_logic]: ../images/test/test_js_command_logic.PNG
  [test_add_js_command]: ../images/test/test_js_command_add.PNG
  [test_js_casestep]: ../images/test/test_js_casestep.PNG
  [test_js_commandlist]: ../images/test/test_js_commandlist.PNG
  [test_js_commandsample]: ../images/test/test_js_commandsample.PNG
  [test_js_commandresult]: ../images/test/test_js_commandresult.PNG
