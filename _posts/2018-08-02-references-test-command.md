---
title: "Test Commands"
category: references
date: 2018-10-27 15:17:55
last_modified_at: 2019-07-29 16:42:00
order: 2
---

# Test Commands
***
This document refers to the Command Editor options and not JavaScript API to call a command. JavaScript API for the test case step can be viewed by clicking the label for the step. API inputs may not be named exactly the same as Command Editor fields. For example, **Assignee** in the Dialog box corresponds to a **user** in the API.


  ![][command_start_process_javascript_API]

  ![][command_start_process_editor]

There are five(5) categories of commands:

* [BPM](#bpm)
* [BPM Assertion](#bpm-assertion)
* [UI](#ui)
* [UI assertion](#ui-assertion)
* [Utility](#utility)

___

## **BPM**

This category of commands are for calling server side components. There are a lot of common input fields. Below are some statements which are common for most of the commands in this category.  

___

### **Common Parameters**

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BPM user. Drop down lists all *BPM user names* defined in the BPM Configuration the Test Project is connected to. More details refer to [**BPM Configuration/Add user to a BPM server**][1]. <br/>**Notes:**Currently all the commands are run as "default user", unless manually modified. If your recorded commands come from "BPM" command category(these commands will invoke BPM rest api),you need to choose proper assignee based on business logic. Recorded commands come from "UI","BPM assertion","UI assertion","Utility" command category don't need to set assignee for these commands. You can leave blank or "default user".|
| `Exception` | Optional | Checked means we are expecting to get an error for the test case. Unchecked means we are expecting to get a normal result from the test case. | 
| `Params`  | Depend on command. |JSON or XML format. If the template of parameters is rendered successfully by selecting service, the field is required. The parameters are defaulted based on the service signature. The template of parameters includes keys of data and you only need to fill in value. <br/>*e.g:*<br/>{<br/>"variable_name": "value",<br/>"variable2_name": "value2"<br/>}<br/>Also parameter support varaible like csv binding variable and context variable.You can use ${csv.xxxx} or ${xxx} to reference your vairable value.If vairable value is number please remove quote before $.<br/>*e.g:*<br/>{<br/>"textReader":"${csv.instanceId}",<br/>"integer":${number},<br/>"decimal":0,<br/>"text":"${mytext}"<br/>}  |
| `Expected Output` |Optional|Used for validating command response. In some cases, there is a refresh button, which can be used to get default expected results. Make sure to fill out params before clicking refresh. If refresh does not work, execute the case step with out expectedOutput set. If passed, edit the step and click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results. <br/>**Notes:**The ![][command_params_error_icon] icon will appears below *Expected Output* field when the wrong *Params* is filled out after click ![][command_expected_output_refresh_button] button in the Command Editor Dialog. The error message can be got by hovering on the ![][command_params_error_icon] icon.|
|`TaskName`|Required| Drop down lists all task names in the Process Application of the Test Project which is connected to.|
|`Json Path`|Optional| Json path to a variable in the output json data.|
|`Variable Name`|Optional| Variable name to save the value that json path points to. This variable can be accessed via ${variable_name} in later commands in this test case.|
|`Comment`|Optional|Not part of any command and can be used for documenting test case step.|


___

### **loginPortal**

Login into BPM portal. As a result BPM Portal page is opened.

- Example  

	![][loginPortal_Sample]

___

### **loginBPMoC**

Login into BPM on cloud.As a result BPM on cloud page is opened.

- Example

	![][Login_BPMoC_Sample]

___

### **openInstanceDetail**

Open the current instance detail page of BAW portal page by calling the rest API: https://[BAW Server]/ProcessPortal/launchInstanceUI?instanceId=[currentInstanceId].

- Example  

	![][openInstanceDetail_Sample]

___

### **open**

Open an URL.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `URL`   | Yes | The URL to be opened. |

- Example  

	![][open_sample]
	
___

### **startProcess**

Start a BPM process by REST API, only exposed process are supported by default. Install IDA Toolkit to support all processes. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Process`   | Yes |  The name of the process to be started. Select from drop down. |
	| `Params`   | Depend on Process. | Parameters in JSON or XML format required to start the process. Tip: when create a test suite to test Process by **Generate Test Cases**, the default parameters will be generated. |

- Example  

	![][start_process_sample]
	
___

### **startHumanService**

Tests Human Service in stand alone mode.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Service`   | Yes |  The name of the Human Service to be started. Select from drop down.|
	| `Params`   | Depend on Human Service. | Input list in JSON or XML format required to start the Human Service. Only simple input arguments are supported.|

- Example  

	![][start_human_service_sample]
	
___

### **startExposedHeritageHumanService**

Tests Heritage Human Service in stand alone mode. Be sure to expose the Heritage Human Service to the specified team.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Assignee` |Refer to common input fields description. |The user should belong to the team where the service was exposed.|
	| `Service`   | Yes |  The name of the Human Service to be started. Select from drop down.|
	| `Params`   | Depend on Heritage Human Service. | Input list in JSON or XML format required to start the Heritage Human Service. Only simple input arguments are supported.|

- Example  

	![][startExposedHeritageHumanService_sample]
	
___

### **startAjaxService**

Start an ajax service edited in Eclipse PD by REST API. To call services created in Web PD, use startServiceFlow command.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Exception` | Optional |Checked means we are expecting to get an error for the test case. Unchecked means we are expecting to get a normal result from the test case. Refer to common input fields description.|
	| `Service`   | Yes |  The name of the Ajax Service to be started. Select from drop down.|
	| `Params`   | Depend on Heritage Ajax Service. | Input list in JSON or XML format required to start the Heritage Human Service.|
	| `Expected Output`   | If `Exception` is not checked, it is mandatory. Otherwise, you need to keep it empty.| Expected service output in JSON. Tip: Click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results.|

- Example  

	Unchecked `Exception`:

	![][start_ajax_service_normal_sample]
	
	Checked `Exception`:
	
	![][start_ajax_service_exception_sample]
	
___

### **startSystemService**

Start a Generic or Integration service edited in Eclipse PD. Please install IDA Toolkit to support system service. To call services created in Web PD, use startServiceFlow command.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Exception` | Optional |Checked means we are expecting to get an error for the test case. Unchecked means we are expecting to get a normal result from the test case. Refer to common input fields description.|
	| `Service`   | Yes |  The name of the System Service to be started. Select from drop down.|
	| `Params`   | Depend on System Service. | Input list in JSON or XML format required to start the System Service.|
	| `Expected Output`   | If `Exception` is not checked, it is mandatory. Otherwise, you need to keep it empty.| Expected service output in JSON. Tip: Click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results.|

- Example  

	Unchecked `Exception`:

	![][start_system_service_normal_example]
	
	Checked `Exception`:
	
	![][start_system_service_exception]
	
___

### **startSQLQuery**

Perform SQL Query by REST API, please install BPM Testing Asset Toolkit to support SQL Query.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `SQL` | Required |SQL script.|
	| `Max Rows`   | Optional |  Max rows of expected output. If empty, IDA will retrieve all rows.|
	| `Data Source`   | Required | Data source JNDI name as defined in target BPM environment. Default dataSourceName is jdbc/TeamWorksDB.|
	| `Expected Output` | Required | Expected  output in JSON format. Tip: Click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results.|
	|`Expected Rows`|Optional|Expected rows of results.|

- Example  

	![][sql_sample]
	
___

### **startUCA**

Start message UCA.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `UCA` | Required |Name of message UCA, select from drop down.|
	| `Params`   | Depend on UCA. |  UCA inputs. |

- Example  

	![][uca_sample]
	
___

### **startServiceFlow**

Start a Service Flow by REST API developed in Web PD, please install BPM Testing Asset Toolkit to support system service.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Exception` | Optional |Checked means we are expecting to get an error for the test case. Unchecked means we are expecting to get a normal result from the test case. Refer to common input fields description.|
	| `Service`   | Yes |  The name of the Service Flow to be started. Select from drop down.|
	| `Params`   | Depend on Service Flow. | Input list in JSON or XML format required to start the Service Flow.|
	| `Expected Output`   | If `Exception` is not checked, it is mandatory. Otherwise, you need to keep it empty.| Expected service output in JSON. Tip: Click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results.|

- Example  

	![][service_flow_sample]
	
___

### **startAdHoc**

Start AdHoc event (depreciated) for stand alone activities to use runAdHocActivity.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Ad Hoc Name` | Required |Ad Hoc name, select from drop down. |
    

- Example  

	![][startAdhoc_sample]
	
___

### **runAdHocActivity**

Start AdHoc Activity, can be executed in a context of a business process instance. Can be added to a test case created based on a process or bpd.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Ad Hoc Activity Name` | Required |Ad Hoc Activity Name, select from drop down. |
    

- Example  

	![][run_adhoc_activity]
	
___

### **runTaskByDisplayName**

Run task by display name.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |Task Name, select from drop down. |
    | `byTaskOwner` | Optional |Checked means the task owner will run this task. Unchecked indicates that the assigned user will run the task.|
    

- Example  

	![][run_task_by_display_name_sample]
	
___
 
### **runTaskByActivityName**

Run task by Activity name. Can only be used in a context of process instance execution.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |Task Name, select from drop down. |
    | `byTaskOwner` | Optional |Checked means the task owner will run this task. Unchecked indicates that the assigned user will run the task.|
    

- Example  

	![][runTaskByDisplayName_sample]
	
___

### **assignTask**

Assign task to specific user. Can only be used in a context of process instance execution.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |The name of the task assigned to the specific user. Select from drop down. |
    | `To User` | Required | Select from drop down list of users defined in IDA/BPM Configuration for target BPM server.|

- Example  

	![][assign_task_sample]
	
___

### **claimTask**

Claim task.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |The name of the task. Select from drop down. |
    
- Example  

	![][claim_task_sample]
	
___
  
### **finishTask**

Complete a given task and set output for the task. Can only be used in a context of process instance execution.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |The name of the task. Select from drop down. |
    | `Output` | Depend on  |Task output, Json format. Set this value to the output of the task. |
    
- Example  

	![][finish_task_sample]
	
___
   
### **addInstanceId**

Add the process instance id to context. Use this command if the process was not started as part of the current use case. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Instance ID` | Required | Instance id of the process. Can be found in web PD or in Eclipse PD.|
    
- Example  

	![][addInstance]
	
___ 
    
### **getTaskIdByName**

Get task id by name.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |The name of the task. Select from drop down. |
    
- Example  

	![][get_task_id_by_name_sample]
	
___  
 
### **getLatestInstanceIdByProcess**

Get the latest process instance id by process name and add it to the context.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Process Name` | Required | Process name to get latest instance. Select from drop down.|
    
- Example  

	![][get_latest_process_instance_id]

___  
 
### **getInstanceIdByInstanceName**

Get the process instance id by process name and instance name.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Process Name` | Required | Process name to get instance. Select from drop down.|
    | `Instance Name` | Required | Instance name of the instance id.|
    
- Example  

	![][get_instance_by_instance_name]

___ 
 
### **getInstanceIdByTaskName**

Get the process instance id by process name and task subject name.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Process Name` | Required | Process name to get instance. Select from drop down.|
    | `Task Name` | Required | Task name.|
    
- Example  

	![][get_instance_id_by_task]

___ 

### **getInstanceIdByTaskUrl**

Get the process instance id by the task id in url. Use it by: ${context.currentInstanceId}.
    
- Example  

	![][get_instance_by_task_url]

___

### **getInstanceIdByBusinessData**

Get the process instance id by process name and business data.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Process Name` | Required | Process name to get instance. Select from drop down.|
    | `Business Data Alias` | Required | Business data alias name. ![][alias]|
    | `Business Data Value` | Required | Actual data value.|
    
- Example  

	![][get_instance_id_by_business_data]

___

### **fireTimer**

Fire timer for the current instance.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Token` | Required | Timer name, selected from drop down.|
    
- Example  

	![][fire_timer_sample]

___

### **startRestApi**

Assert Rest API result. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	|`API Name`|Required|Rest API name, selected from drop down. <br/>Support Rest API list:<br/>*Organization(Groups)*<br/>*Organization(Users)*<br/>*Process(ProcessQueryEntityList)*<br/>*Search(ExecuteQuery)*<br/>*Task(TaskQueryEntityList)*|
    | `Params` | Required | Parameters of Rest API. Refer to https://[BAW-Server-URL]/bpmrest-ui/BPMRestAPITester/<br/>|
    |`Expected Value`|Required|The expected response of Rest API.|
    
- Example  

	![][search_found_expected_output_sample]
	
	![][start_rest_api_sample]

___

## **BPM Assertion**

This category is for asserting server side components.

___

### **Common Parameters**

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BPM user. Drop down lists all *BPM user names* defined in the BPM Configuration the Test Project is connected to. More details refer to [**BPM Configuration/Add user to a BPM server**][1]. <br/>**Notes:**Currently all the commands are run as "default user", unless manually modified. If your recorded commands come from "BPM" command category(these commands will invoke BPM rest api),you need to choose proper assignee based on business logic. Recorded commands come from "UI","BPM assertion","UI assertion","Utility" command category don't need to set assignee for these commands. You can leave blank or "default user".|
|`TaskName`|Required| Name of the task that needs to be asserted. Drop down lists all task names in the Process Application of the Test Project which is connected to.|
|`Comment`|Optional|Not part of any command and can be used for documenting test case step.|

___

### **assertProcessInstanceStatus**

Check current process instance status.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Instance Status` | Required | Expected status of the current process instance.<br>Possible values: <br>*Active*<br>*Completed*<br>*Failed*<br>*Terminated*<br>*Suspended*|
    
- Example  

	![][assert_process_instance_status_sample]

___

### **assertProcessInstanceData**

Assert the data of current process instance. Can only be used in a context of process instance execution.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Expected Value` | Required | JSON object, expected value of the data.<br>**Notes:** <br>  Before adding this step, run the test case and look at the report. In the **Process Instance** section, click on the **click to show full data** link. <br>![][command_instance_data_template]<br>Copy the shown JSON into the **Expected Value** as data template. Then change the value as you need. If your data has auto generated fields, like current dates, instance ids or some other unique identifiers, they have to be removed from the JSON.|
    
- Example  

	![][assert_process_instance_data_sample]

___

### **assertTaskAssignmentByUser**

Check that correct user is assigned (claimed) to the task. Can only be used in a context of process instance execution.

- Example  

	![][assertTaskAssignmentByUser_sample]

___

### **assertTaskStatus**

Check the status of a task for current process instance.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Status` | Required | Expected status of the task. <br>Valid task status values: <br>*Received* <br>*Closed*|
    
- Example  

	![][assertTaskStatus_sample]

___

### **assertNextTaskName**

Check that the task is received.
    
- Example  

	![][assertNextTaskName_sample]

___

### **assertTaskNotGenerated**

Check the task is not generated.
    
- Example  

	![][assertTaskNotGenerated_sample]

___

### **assertTaskData**

Check the task data of current process instance. It checks the variables saved in BPM Task execution context. Use UI Assertions to check on page contents during the coach execution.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Value` | Required | Expected value of the data.<br>**Notes:**<br>Before adding this step, run the test case and look at the report. In the **Task Data** section, click on the **click to show full data** link.<br>![][command_task_data_template]<br> Copy JSON value into the **Expected Value** as data template. Then change the value as you need. If your data has auto generated fields, like current dates, instance ids or some other unique identifiers, they have to be removed from the JSON.|
	
- Example  

	![][assertTaskData_sample]

___

### **assertServiceData**

Check the current service data.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Value` | Required | Expected value of the data.<br>**Notes:**<br>Before adding this step, run the test case and look at the report. In the **Service Data** section, click on the **click to show full data** link. <br>![][command_service_data_template]<br>Copy JSON value into the **Expected Value** as data template. Then change the value as you need. If your data has auto generated fields, like current dates, instance ids or some other unique identifiers, they have to be removed from the JSON.|
	
- Example  

	![][assertServiceData_sample]

___


## **UI**  

In most cases, the UI commands are recorded using the IDA plug in. If you find a need to add a command manually, for example, validation command, look at the recorded command for the element and copy the location information from it.
<br>*e.g:*
Any one or combination of the recorded values can be used to identify the control:  Control ID, Element ID or XPATH. If Label is unique on the page, it can be used as well. Enough location arguments are required to uniquely identify an element on the page. **IDA** cycles through available ids until it finds the element. For example, if you recorded a select step and later moved the control around on the page, the Control ID and XPATH are probably different from the recorded step, but Element ID is still the same.

___

### **Common Parameters**

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BPM user. Drop down lists all *BPM user names* defined in the BPM Configuration the Test Project is connected to. More details refer to [**BPM Configuration/Add user to a BPM server**][1]. <br/>**Notes:**Currently all the commands are run as "default user", unless manually modified. If your recorded commands come from "BPM" command category(these commands will invoke BPM rest api),you need to choose proper assignee based on business logic. Recorded commands come from "UI","BPM assertion","UI assertion","Utility" command category don't need to set assignee for these commands. You can leave blank or "default user".|
|`Value`|Optional, fields `Value`, `Contorl ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.| The value of the control.|
|`Contorl ID`|Optional, fields `Value`, `Contorl ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The ID of the control. Control ID is the PATH control IDs leading to the selected control id.|
|`Label`|Optional, fields `Value`, `Contorl ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The label of the control.|
|`Element ID`|Optional, fields `Value`, `Contorl ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The ID of the element.|
|`Element CSS`|Optional, fields `Value`, `Contorl ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The CSS of the element.|
|`XPATH`|Optional, fields `Value`, `Contorl ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The xpath of the control.|
|`Comment`|Optional|Not part of any command and can be used for documenting test case step.|

***Notes:** The element is first obtained through the Control ID. If is failed, the label, Element ID and Element CSS are then used in turn. Finally is XPATH. If is successful, the rest will not be used.*

___

### **bpmFileDropzone**

Upload file to BPM server by Dropzone control. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value` | Required |Name of the BPM file.|
	| `Control ID` | Required |Control ID of BPM file drop zone.|
	
- Example  

	![][bpmFileDropzone_sample]

___

### **bpmFileUploader**

BPM file uploader. UI.bpmFileUploader can't be replayed on IDA Plugin due to browser security issue, but this command can work on Selenium Grid. So you can record the file upload commands by IDA Plugin, but replay them on Selenium Grid.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value` | Required |Name of the BPM file.|
	| `Control ID` | Required |The control id of BPM file that needs to be Uploaded. |
	
- Example  

	![][bpm_file_uploader]

___

### **checkbox**

 	Set the value of check box control. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value` | Required | The value of the check box to operate on. |
	| `Select Options` | Required | Check box operation, Select or Unselect. Select: to check the check box. Unselect: to clear the check box. |
	
- Example  

	![][checkbox]

___

### **click**

Click an element by id , CSS or xpath. **Notes:** BPM UI toolkit has *id* on a button but Coach v8 and BP3 do not. Thus the later two can only be identified by XPATH. Moving the coach view around the page may change its xpath and break the test case.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Type` | Required | *Link* or *Button*.|
	
- Example  

	![][click]

___

### **coachControl**

Set value of coach control. This is a generic setter. Value should match the selected control type.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value Type` | Optional | Select type from drop down. |
	| `Default Value` | Optional | Default value of the control. |
	
- Example  

	![][coach_control]

___

### **confirmOK**

Click OK button for window.confirm and return *true*, isn't supported in IDA plugin. It needs to be added to the test case manually when used and can work fine in selenium.
	
- Example  

	![][confirm_ok]

___

### **confirmCancel**

Click the Cancel button for window.confirm and return *false*, isn't supported in IDA plugin. It needs to be added to the test case manually when used and can work fine in selenium.
	
- Example  

	![][confirm_Cancel]

___

### **doubleClick**

Double click an element by id, CSS or xpath. Be similar to **click**. It needs to be added to the test case manually when used.
	
- Example  

	![][double_click]

___

### **file**

Upload file. UI.file can't be replayed on IDA Plugin due to browser security issue, but this command can work on Selenium Grid. So you can record the file upload commands by IDA Plugin, but replay them on Selenium Grid.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value` | Required | File name that needs to be uploaded. |
	
- Example  

	![][file]

___

### **close**

Close current opened browser.
	
- Example  

	![][close_window]

___

### **radio**

Set the value of radio control.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value` | Required | The value of radio to select. Value should be the LABEL on the CV control.<br>*e.g:*<br>![][command_UI_radio]<br> Value should be set to *Make a selection*.|
	
- Example  

	![][radio]

___

### **saveCoachControl**

Put the control value into a key. <br>Tip:<br> a) record a step to set the value of the control;<br>b) edit the recorded step in Command Editor and change the command to saveCoachControl;<br>c) set the Key.<br> If the control you try to save is readonly, record any other controls which are the same level ( e.g in the container ).  Modify the Control ID path to match the control you are trying to save.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Required | Name of a variable, which can later be referenced as ${key} in a value field of any command.|
	| `Property` | Optional | When the control binding complex object, you can get the value form complex object by property. <br> *eg:* <br> *bindingObject.value* |
	
- Example  

	![][save_coach_control]

___

### **saveText**

Save text into context. Can put the output text, single select and input value to a key.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Required | Name of a variable, which can later be referenced as ${key} in a value field of any command.|
	
- Example  

	![][saveText]

___

### **select**

 Set the value of select (drop down) control. Value is a json list of selected display values for this Select or Multi Select CV. <br>*e.g:*``["Selected value1","Selected value2"] ``
	
- Example  

	![][select_control]

___

### **selectWindow**

 Select window by window info.
	
- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Info` | Required | window information.  |
	
- Example  

	![][select_window]

___
  
### **text**

Set the value of any control, which UI accepts textual input. Example: input text CV, Integer CV, Date Picker. This event is captured when the control loses focus. So it is possible for some controls like Date Picker to record 2 steps. One for empty value and the other for actual value. It is because the first empty data is captured when the mouse focus moves from control to the Data select popup. Users can remove the first recorded case step or just keep them as-is.

- Example  

	![][text]

___
  
### **waitElement**

Wait a element visible/hidden/editable/readonly until timeout.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Type` | Required | Select the element type from drop down. *Visible*, *Hidden*, *Enabled* and *Disabled*.  |
	| `Timeout` | Optional | The maximum time that wait for the element. If empty, use engine-config.wait-timeout set on ida.properties.|
	
- Example  

	![][wait_element]

___  
  
___
  
### **waitTextPresent**

Wait for displaying a text until timeout.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Text` | Required | Text waiting to be displayed on the page.  |
	| `Timeout` | Optional | The maximum time that wait for the element. If empty, use engine-config.wait-timeout set on ida.properties.|
	
- Example  

	![][wait_text_present]

___  


## **UI Assertion**

 Record a command to populate the field you want to assert. Then edit the generated test case step and change command to assert. The edit would pick up matching fields from the recorded command.

___

### **Common Parameters**

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BPM user. Drop down lists all *BPM user names* defined in the BPM Configuration the Test Project is connected to. More details refer to [**BPM Configuration/Add user to a BPM server**][1]. <br/>**Notes:**Currently all the commands are run as "default user", unless manually modified. If your recorded commands come from "BPM" command category(these commands will invoke BPM rest api),you need to choose proper assignee based on business logic. Recorded commands come from "UI","BPM assertion","UI assertion","Utility" command category don't need to set assignee for these commands. You can leave blank or "default user".|
|`Contorl ID`|Optional, fields `Value`, `Contorl ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The ID of the control. Control ID is the PATH control IDs leading to the selected control id.|
|`Label`|Optional, fields `Value`, `Contorl ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The label of the control.|
|`Element ID`|Optional, fields `Value`, `Contorl ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The ID of the element.|
|`Element CSS`|Optional, fields `Value`, `Contorl ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The CSS of the element.|
|`XPATH`|Optional, fields `Value`, `Contorl ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The xpath of the control.|
|`Expected Value`|Required|The expected value of the control|
|`Comment`|Optional|Not part of any command and can be used for documenting test case step.|

***Notes:** The element is first obtained through the Control ID. If is failed, the label, Element ID and Element CSS are then used in turn. Finally is XPATH. If is successful, the rest will not be used.*

___
  
### **assertButtons**

Check the buttons are rendered or not.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Texts` | Required | Text of buttons that you want to render.<br>*e.g:*<br>![][command_UIAssert_buttons]<br>If you want to check that all the buttons are rendered in this form, you can fill like this:<br>``Save``<br>``Cancel``<br>**Notes:** *Texts are separated by the line break.*|
	| `Expected Visibility` | Required | The expected visibility of the control. Select from drop down. *Enabled*, *Disabled,* and *Hidden*.|
	
- Example  

	![][assert_buttons]

___  
  
### **assertCheckbox**

Assert checkbox value and options.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Checked Labels` | Required | Labels of checkboxes that are expected to be checked.<br>*e.g:* <br>![][command_UIAssert_checkbox]<br>To verify the options in this page, fill in like this: <br>``Create Position Request CSHS``<br>``GM Approval CSHS``. <br>**Notes:** *Labels are separated by the line break.*|
	| `Expected Options` | Required | Labels of all options that are expected to be rendered. <br>*e.g:* If you want to check that all the checkbox options are rendered in the figure above, you can fill in like this:<br>``Create Position Request CSHS``<br>``Find Candidates CSHS``<br>``GM Approval CSHS``<br>**Notes:** *Labels are separated by the line break.*|
	
- Example  

	![][assert_check_box]

___ 
  
### **assertCoachControl**

Assert Coach Control binding value and visibility, it only supports String, Number, Date and Boolean type of binding value now. Either of Control ID or label is required. The Control ID is the coach view Control ID, label is the coach view label.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Value Type` | Required | The value Type of the control, select from drop down. *String*, *Number*, *Date(MM/dd/yyyy)* and *Boolean*.|
	| `Expected Visibility` | Required | The visibility of the control. Select from drop down. *Enabled*, *Disabled,* and *Hidden*.|
	
- Example  

	![][assert_Coach_Control]

___ 
  
### **assertDatePicker**

Assert date picker value.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Date` | Required | The expected date of the DatePicker|
	
- Example  

	![][assert_date_picker]

___
  
### **assertElement**

Assert the element value and visibility.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected visibility` | Required | The visibility of the control. Select from drop down. *Enabled*, *Disabled,* and *Hidden*.|
	
- Example  

	![][assert_element]

___

### **assertInputText**

Check coach text field value. If you check the regular expression, it will use expected value as regular expression to match the actual value.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Max Length` | Optional | Expected max length of the text.|
	
- Example  

	![][assert_input_text]

___
 
### **assertOutputText**

Check coach output text value. 

- Example  

	![][Assert_Output_Text]

___
   
### **assertRadio**

Assert Radio value and options.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Checked Label` | Required | Label of radio box that is expected to be checked.|
	| `Expected Options` | Required | Labels of all options that are expected to be rendered. Refer to the statements of *Expected Options* in **assertCheckbox**.|

- Example  

	![][assert_radio]

___
     
### **assertSelect**

Assert Select value and options.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Value` | Required | The expected value of the control. If is multiSelect, the value is separated by the line break.|
	| `Expected Options` | Required | Labels of select options that are expected to be rendered. Refer to the statements of *Expected Options* in **assertCheckbox**.|

- Example  

	![][assert_select]

___
     
### **assertSwitch**

Assert Switch box.

- Example  

	![][assert_switch]

___
       
### **assertTableContent**

Assert the cell value of the table.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Column Name` | Required | The name of the column where the value needs to be asserted.|
	| `Row Number` | Required | The number of row where the value needs to be validated.|
	| `Expected value` | Required | The cell value that needs to be checked. |

- Example  

	![][assert_table_content]

___
        
### **assertTableRows**

Assert the total number of rows in the table.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Rows` | Required | The expected total number of rows in the table.|

- Example  

	![][assert_table_rows]

___
         
### **assertTextarea**

Assert the textarea value. 

- Example  

	![][assert_text_area]

___
          
### **assertTextNotPresent**

Assert text is not appear on UI.  

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Text` | Required | The text that is not expected to appear on the UI.|

- Example  

	![][assert_text_no_present]

___
           
### **assertTextPresent**

Assert text is appear on UI. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Text` | Required | The text that is expected to appear on the UI. |

- Example  

	![][assert_text_present]

___
           
### **assertValidationPassed**

Check whether the coach page is passed the validation or not.

- Example  

	![][assert_validation_passed]

___

## **Utility**

This category provides utility commands.

___

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BPM user. Drop down lists all *BPM user names* defined in the BPM Configuration the Test Project is connected to. More details refer to [**BPM Configuration/Add user to a BPM server**][1]. <br/>**Notes:**Currently all the commands are run as "default user", unless manually modified. If your recorded commands come from "BPM" command category(these commands will invoke BPM rest api),you need to choose proper assignee based on business logic. Recorded commands come from "UI","BPM assertion","UI assertion","Utility" command category don't need to set assignee for these commands. You can leave blank or "default user".|
|`Comment`|Optional|Not part of any command and can be used for documenting test case step.|

___
           
### **addContext**

Append another value to this key. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Required | Name of key. |
	| `Value` | Required | Value that need to be appended. |

- Example  

	![][add_context]

___
           
### **dateString**

Generate date string before/after number of days of today. If the key is not specified, then the default key is "DATE_STRING". You can use the date string by ${context.DATE_STRING}.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Optional | Name of key. Default is `DATE_STRING`.|
	| `Days` | Optional | The number of days from the current date that you want to convert to a string. Negative number of days means before today, while positive number of days means after today. <br>*e.g:* **-1** means generating string of the date of yesterday. Default is `0`.|
	| `Format` | Optional |Format of date. Default is `MM/dd/YYYY`.|

- Example  

	![][date_string]

___
           
### **debug**

Command for debug, recording of the case will stop at this step.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Log` | Optional | Log text will be shown in console.|
	
___
           
### **putContext**

 Put a new key-value pair to context.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Required | Name of key.|
	| `Value` | Required | Value that need to into context.|
	
___
           
### **putContext**

Wait for specify seconds.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Time` | Required | The seconds to be wait.|
	
___

### **randomString**

Generate a specified length random string.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Length` | Required | Length of the generated random string.|
	
___

### **randomNumber**

Generate a specified length random number.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Length` | Required | Length of the generated random number.|
	
___


[1]: ../administration/administration-bpm-configuration.html#add-user-to-a-bpm-server
[command_expected_output_refresh_button]: ../images/command/command_expected_output_refresh_button.png
[command_start_process_editor]: ../images/command/command_start_process_editor.png
[command_start_process_javascript_API]: ../images/command/command_start_process_javascript_API.png
[command_params_error_icon]: ../images/command/command_params_error_icon.png
[command_instance_data_template]: ../images/command/command_instance_data_template.png
[command_task_data_template]: ../images/command/command_task_data_template.png
[command_service_data_template]: ../images/command/command_service_data_template.png
[command_UI_radio]: ../images/command/command_UI_radio.png
[command_UI_Checkbox]: ../images/command/command_UI_Checkbox.png
[command_UIAssert_buttons]: ../images/command/command_UIAssert_buttons.png
[command_UIAssert_checkbox]: ../images/command/command_UIAssert_checkbox.png
[loginPortal_Sample]: ../images/command/loginPortal_Sample.png
[Login_BPMoC_Sample]: ../images/command/Login_BPMoC_Sample.png
[openInstanceDetail_Sample]: ../images/command/openInstanceDetail_Sample.png
[open_sample]: ../images/command/open_sample.png
[start_process_sample]: ../images/command/start_process_sample.png
[start_human_service_sample]: ../images/command/start_human_service_sample.png
[startExposedHeritageHumanService_sample]: ../images/command/startExposedHeritageHumanService_sample.png
[start_ajax_service_normal_sample]: ../images/command/start_ajax_service_normal_sample.png
[start_ajax_service_exception_sample]: ../images/command/start_ajax_service_exception_sample.png
[start_system_service_normal_example]: ../images/command/start_system_service_normal_example.png
[start_system_service_exception]: ../images/command/start_system_service_exception.png
[sql_sample]: ../images/command/sql_sample.png
[uca_sample]: ../images/command/uca_sample.png
[service_flow_sample]: ../images/command/service_flow_sample.png
[startAdhoc_sample]: ../images/command/startAdhoc_sample.png
[run_adhoc_activity]: ../images/command/run_adhoc_activity.png
[runTaskByDisplayName_sample]: ../images/command/runTaskByDisplayName_sample.png
[run_task_by_display_name_sample]: ../images/command/run_task_by_display_name_sample.png
[assign_task_sample]: ../images/command/assign_task_sample.png
[claim_task_sample]: ../images/command/claim_task_sample.png
[finish_task_sample]: ../images/command/finish_task_sample.png
[addInstance]: ../images/command/addInstance.png
[get_task_id_by_name_sample]: ../images/command/get_task_id_by_name_sample.png
[get_latest_process_instance_id]: ../images/command/get_latest_process_instance_id.png
[get_instance_by_instance_name]: ../images/command/get_instance_by_instance_name.png
[get_instance_id_by_task]: ../images/command/get_instance_id_by_task.png
[get_instance_by_task_url]: ../images/command/get_instance_by_task_url.png
[get_instance_id_by_business_data]: ../images/command/get_instance_id_by_business_data.png
[alias]: ../images/command/alias.png
[fire_timer_sample]: ../images/command/fire_timer_sample.png
[search_found_expected_output_sample]: ../images/command/search_found_expected_output_sample.png
[start_rest_api_sample]: ../images/command/start_rest_api_sample.png
[assert_process_instance_status_sample]: ../images/command/assert_process_instance_status_sample.png
[assert_process_instance_data_sample]: ../images/command/assert_process_instance_data_sample.png
[assertTaskAssignmentByUser_sample]: ../images/command/assertTaskAssignmentByUser_sample.png
[assertTaskStatus_sample]: ../images/command/assertTaskStatus_sample.png
[assertNextTaskName_sample]: ../images/command/assertNextTaskName_sample.png
[assertTaskNotGenerated_sample]: ../images/command/assertTaskNotGenerated_sample.png
[assertTaskData_sample]: ../images/command/assertTaskData_sample.png
[assertServiceData_sample]: ../images/command/assertServiceData_sample.png
[bpmFileDropzone_sample]: ../images/command/bpmFileDropzone_sample.png
[bpm_file_uploader]: ../images/command/bpm_file_uploader.png
[checkbox]: ../images/command/checkbox.png
[click]: ../images/command/click.png
[coach_control]: ../images/command/coach_control.png
[confirm_ok]: ../images/command/confirm_ok.png
[confirm_Cancel]: ../images/command/confirm_Cancel.png
[double_click]: ../images/command/double_click.png
[file]: ../images/command/file.png
[close_window]: ../images/command/close_window.png
[radio]: ../images/command/radio.png
[save_coach_control]: ../images/command/save_coach_control.png
[saveText]: ../images/command/saveText.png
[select_control]: ../images/command/select_control.png
[select_window]: ../images/command/select_window.png
[text]: ../images/command/text.png
[wait_element]: ../images/command/wait_element.png
[wait_text_present]: ../images/command/wait_text_present.png
[assert_buttons]: ../images/command/assert_buttons.png
[assert_check_box]: ../images/command/assert_check_box.png
[assert_Coach_Control]: ../images/command/assert_Coach_Control.png
[assert_date_picker]: ../images/command/assert_date_picker.png
[assert_element]: ../images/command/assert_element.png
[assert_input_text]: ../images/command/assert_input_text.png
[Assert_Output_Text]: ../images/command/Assert_Output_Text.png
[assert_radio]: ../images/command/assert_radio.png
[assert_select]: ../images/command/assert_select.png
[assert_switch]: ../images/command/assert_switch.png
[assert_table_content]: ../images/command/assert_table_content.png
[assert_table_rows]: ../images/command/assert_table_rows.png
[assert_text_area]: ../images/command/assert_text_area.png
[assert_text_no_present]: ../images/command/assert_text_no_present.png
[assert_text_present]: ../images/command/assert_text_present.png
[assert_validation_passed]: ../images/command/assert_validation_passed.png
[add_context]: ../images/command/add_context.png
[date_string]: ../images/command/date_string.png