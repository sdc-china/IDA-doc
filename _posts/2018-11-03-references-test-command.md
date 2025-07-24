---
title: "Test Commands"
category: references
date: 2018-11-03 15:17:55
last_modified_at: 2025-07-24 13:00:00
---

# Test Commands
***

This document refers to the Command Editor options and not JavaScript API to call a command. JavaScript API for the test case step can be viewed by clicking the label for the step. API inputs may not be named exactly the same as Command Editor fields. For example, **Assignee** in the Dialog box corresponds to a **user** in the API.


  ![][command_start_process_javascript_API]

  ![][command_start_process_editor]

There are more than 80 commands to simplify testing and categorized into five categories below:

* [BPM](#bpm): A set of commands for calling server-side components. 
* [BPM Assertion](#bpm-assertion) : A set of commands for asserting server-side components.
* [Case](#case): A set of commands for calling server-side components of a case. 
* [Case Assertion](#case-assertion) : A set of commands for asserting server-side components of a case.
* [BA](#ba): A set of commands for calling server-side components of a business application (available on Cloud Pak for Business Automation). 
* [UI](#ui): A set of commands for UI recording and actions.
* [UI assertion](#ui-assertion): A set of commands for asserting UI components.
* [Utility](#utility): A set of commands for utility methods, e.g., debug, putContext

___

## **BPM**

This category of commands is for calling server-side components. There are a lot of common input fields. Below are some statements which are common for most of the commands in this category.  

___

### **Common Parameters**

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BAW user. The drop-down lists all *BAW user names* defined in the BAW Configuration the Test Project is connected to. More details refer to [**BAW Configuration/Add user to a BAW server**][1]. <br/>**Notes:** Currently, all the commands are run as the "default user", unless manually modified. If manually modified, the following commands are run as the latest modified user until modified again. If your recorded commands come from the "BPM", "BPM Assertion", "Case" or "Case Assertion" command category (these commands will invoke BAW REST API or Java API), you need to choose the proper assignee based on business logic. Recorded commands come from the "UI", "UI assertion", "Utility" command category don't need to set an assignee for these commands. You can leave it blank or use the "default user".|
| `Exception` | Optional | Checked means we are expecting to get an error for the test case. Unchecked means we are expecting to get a normal result from the test case. | 
| `Params`  | Depend on command. |JSON or XML format. If the template of parameters is rendered successfully by selecting the service, the field is required. The parameters are defaulted based on the service signature. The template of parameters includes keys of data, and you only need to fill in the value. <br/>*e.g.:*<br/>{<br/>"variable_name": "value",<br/>"variable2_name": "value2"<br/>}<br/>Also, the parameter supports variables like CSV binding variables and context variables. You can use ${csv.xxxx} or ${xxx} to reference your variable value. If the variable value is a number, please remove the quote before $.<br/>*e.g.:*<br/>{<br/>"textReader":"${csv.instanceId}",<br/>"integer":${number},<br/>"decimal":0,<br/>"text":"${mytext}"<br/>}  |
| `Expected Output` |Optional|Used for validating the command response. In some cases, there is a refresh button, which can be used to get default expected results. Make sure to fill out the params before clicking refresh. If refresh does not work, execute the case step without setting the expectedOutput. If passed, edit the step and click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results. <br/>**Notes:** The ![][command_params_error_icon] icon will appear below the *Expected Output* field when the wrong *Params* is filled out after clicking ![][command_expected_output_refresh_button] button in the Command Editor Dialog. The error message can be obtained by hovering over the ![][command_params_error_icon] icon.|
|`TaskName`|Required| Drop-down lists all task names in the Process Application of the Test Project which is connected to.|
|`Json Path`|Optional| JSON path to a variable in the output JSON data.|
|`Variable Name`|Optional| Variable name to save the value that the JSON path points to. This variable can be accessed via ${variable_name} in later commands in this test case.|
|`Comment`|Optional|Not part of any command and can be used for documenting the test case step.|


___

### **loginPortal**

Log in to the BPM portal. As a result, the BPM Portal page is opened.

- Example  

	![][loginPortal_Sample]

___

### **loginWorkplace**

Log in to the Workplace on CP4BA. As a result, the BAW Workplace page is opened.

- Example  

	![][loginWorkpalce_Sample]

___

### **loginBPMoC**

Log in to BPM on Cloud. As a result, the BPM on Cloud page is opened.

- Example

	![][Login_BPMoC_Sample]

___

### **openInstanceDetail**

Open the current instance detail page of the BAW portal page by calling the REST API: https://[BAW Server]/ProcessPortal/launchInstanceUI?instanceId=[currentInstanceId].

- Example  

	![][openInstanceDetail_Sample]

___

### **open**

Open a URL.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `URL`   | Yes | The URL to be opened. |

- Example  

	![][open_sample]
	
___

### **startProcess**

Start a BPM process by REST API, only exposed processes are supported by default. Install the IDA Toolkit to support all processes. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Process`   | Yes |  The name of the process to be started. Select from the drop-down. |
	| `Params`   | Depend on Process. | Parameters in JSON or XML format required to start the process. Tip: when creating a test suite to test a Process by **Generate Test Cases**, the default parameters will be generated. |

- Example  

	![][start_process_sample]
	
___

### **startExternalProcess**

Start an external BPM process by REST API, only exposed processes are supported, and the snapshot must be active. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Process App`   | Yes |  The name of the process app. Select from the drop-down. |
	| `Snapshot`   | Yes |  The name of the snapshot. Select from the drop-down. |
	| `Process`   | Yes |  The name of the process to be started. Select from the drop-down. |
	| `Params`   | Depend on Process. | Parameters in JSON or XML format required to start the external process. |

- Example  

	![][start_external_process_sample]
	
___

### **startHumanService**

Test a Human Service in stand-alone mode.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Service`   | Yes |  The name of the Human Service to be started. Select from the drop-down.|
	| `Params`   | Depend on Human Service. | Input list in JSON or XML format required to start the Human Service. Only simple input arguments are supported.|

- Example  

	![][start_human_service_sample]
	
___

### **startExposedHeritageHumanService**

Test an exposed Heritage Human Service in stand-alone mode. Be sure to expose the Heritage Human Service to the specified team.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Assignee` |Refer to the common input fields description. |The user should belong to the team where the service was exposed.|
	| `Service`   | Yes |  The name of the Human Service to be started. Select from the drop-down.|
	| `Params`   | Depend on Heritage Human Service. | Input list in JSON or XML format required to start the Heritage Human Service. Only simple input arguments are supported.|

- Example  

	![][startExposedHeritageHumanService_sample]
	
___

### **startAjaxService**

Start an AJAX service edited in Eclipse PD by REST API. To call services created in Web PD, use the startServiceFlow command.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Exception` | Optional |Checked means we are expecting to get an error for the test case. Unchecked means we are expecting to get a normal result from the test case. Refer to the common input fields description.|
	| `Service`   | Yes |  The name of the AJAX Service to be started. Select from the drop-down.|
	| `Params`   | Depend on Heritage AJAX Service. | Input list in JSON or XML format required to start the Heritage AJAX Service.|
	| `Expected Output`   | If `Exception` is not checked, it is mandatory. Otherwise, you need to keep it empty.| Expected service output in JSON. Tip: Click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results.|

- Example  

	Unchecked `Exception`:

	![][start_ajax_service_normal_sample]
	
	Checked `Exception`:
	
	![][start_ajax_service_exception_sample]
	
___

### **startSystemService**

Start a Generic or Integration service edited in Eclipse PD. Please install the IDA Toolkit to support the system service. To call services created in Web PD, use the startServiceFlow command.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Exception` | Optional |Checked means we are expecting to get an error for the test case. Unchecked means we are expecting to get a normal result from the test case. Refer to the common input fields description.|
	| `Service`   | Yes |  The name of the System Service to be started. Select from the drop-down.|
	| `Params`   | Depend on System Service. | Input list in JSON or XML format required to start the System Service.|
	| `Expected Output`   | If `Exception` is not checked, it is mandatory. Otherwise, you need to keep it empty.| Expected service output in JSON. Tip: Click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results.|

- Example  

	Unchecked `Exception`:

	![][start_system_service_normal_example]
	
	Checked `Exception`:
	
	![][start_system_service_exception]
	
___

### **executeSQL**

Perform an SQL Query by REST API, please install the BPM Testing Asset Toolkit to support SQL Query.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `SQL` | Required |SQL script.|
	| `Max Rows`   | Optional |  Max rows of expected output. If empty, IDA will retrieve all rows.|
	| `Data Source`   | Required | Data source JNDI name as defined in the target BAW environment. The default dataSourceName is jdbc/TeamWorksDB.|
	| `Expected Output` | Required | Expected output in JSON format. Tip: Click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results.|
	|`Expected Rows`|Optional|Expected rows of results.|

- Example  

	![][sql_sample]
	
___

### **startUCA**

Start a message UCA.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `UCA` | Required |Name of the message UCA, select from the drop-down.|
	| `Params`   | Depend on UCA. |  UCA inputs. |

- Example  

	![][uca_sample]
	
___

### **startServiceFlow**

Start a Service Flow by REST API developed in Web PD, please install the BPM Testing Asset Toolkit to support the system service.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Exception` | Optional |Checked means we are expecting to get an error for the test case. Unchecked means we are expecting to get a normal result from the test case. Refer to the common input fields description.|
	| `Service`   | Yes |  The name of the Service Flow to be started. Select from the drop-down.|
	| `Params`   | Depend on Service Flow. | Input list in JSON or XML format required to start the Service Flow.|
	| `Expected Output`   | If `Exception` is not checked, it is mandatory. Otherwise, you need to keep it empty.| Expected service output in JSON. Tip: Click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results.|


- Example  

	![][service_flow_sample]
	
___

### **startAdHoc**

Start an AdHoc event (deprecated) for stand-alone activities to use runAdHocActivity.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Ad Hoc Name` | Required |Ad Hoc name, select from the drop-down. |
    

- Example  

	![][startAdhoc_sample]
	
___

### **runAdHocActivity**

Start an AdHoc Activity, can be executed in the context of a business process instance. Can be added to a test case created based on a process or BPD.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Ad Hoc Activity Name` | Required |Ad Hoc Activity Name, select from the drop-down. |
    

- Example  

	![][run_adhoc_activity]
	
___

### **runTaskByDisplayName**

Run a task by display name.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |Task Name, select from the drop-down. |
    | `byTaskOwner` | Optional |Checked means the task owner will run this task. Unchecked indicates that the assigned user will run the task.|
    

- Example  

	![][run_task_by_display_name_sample]
	
___
 
### **runTaskByActivityName**

Run a task by Activity name. Can only be used in the context of process instance execution.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |Task Name, select from the drop-down. |
    | `byTaskOwner` | Optional |Checked means the task owner will run this task. Unchecked indicates that the assigned user will run the task.|
    

- Example  

	![][runTaskByDisplayName_sample]
	
___

### **assignTask**

Assign a task to a specific user. Can only be used in the context of process instance execution.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |The name of the task assigned to the specific user. Select from the drop-down. |
    | `To User` | Required | Select from the drop-down list of users defined in IDA/BAW Configuration for the target BAW server.|

- Example  

	![][assign_task_sample]
	
___

### **claimTask**

Claim a task.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |The name of the task. Select from the drop-down. |
    
- Example  

	![][claim_task_sample]
	
___
  
### **finishTask**

Complete a given task and set the output for the task. Can only be used in the context of process instance execution.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |The name of the task. Select from the drop-down. |
    | `Output` | Depend on  |Task output, JSON format. Set this value to the output of the task. |
    
- Example  

	![][finish_task_sample]
	
___
   
### **addInstanceId**

Add the process instance ID to the context. Use this command if the process was not started as part of the current use case. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Instance ID` | Required | Instance ID of the process. Can be found in Web PD or in Eclipse PD.|
    
- Example  

	![][addInstance]
	
___ 
    
### **getTaskIdByName**

Get the task ID by name.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Task Name` | Required |The name of the task. Select from the drop-down. |
    
- Example  

	![][get_task_id_by_name_sample]
	
___  
 
### **getLatestInstanceIdByProcess**

Get the latest process instance ID by process name and add it to the context.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Process Name` | Required | Process name to get the latest instance. Select from the drop-down.|
    
- Example  

	![][get_latest_process_instance_id]

___  
 
### **getInstanceIdByInstanceName**

Get the process instance ID by process name and instance name.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Process Name` | Required | Process name to get the instance. Select from the drop-down.|
    | `Instance Name` | Required | Instance name of the instance ID.|
    
- Example  

	![][get_instance_by_instance_name]

___ 
 
### **getInstanceIdByTaskName**

Get the process instance ID by process name and task subject name.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Process Name` | Required | Process name to get the instance. Select from the drop-down.|
    | `Task Name` | Required | Task name.|
    
- Example  

	![][get_instance_id_by_task]

___ 

### **getInstanceIdByTaskUrl**

Get the process instance ID by the task ID in the URL. Use it by: ${context.currentInstanceId}.
    
- Example  

	![][get_instance_by_task_url]

___

### **getInstanceIdByBusinessData**

Get the process instance ID by process name and business data.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Process Name` | Required | Process name to get the instance. Select from the drop-down.|
    | `Business Data Alias` | Required | Business data alias name. ![][alias]|
    | `Business Data Value` | Required | Actual data value.|
    
- Example  

	![][get_instance_id_by_business_data]

___

### **fireTimer**

Fire a timer for the current instance.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Token` | Required | Timer name, selected from the drop-down.|
    
- Example  

	![][fire_timer_sample]

___

### **startRestApi**

Assert the REST API result. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	|`API Name`|Required|REST API name, selected from the drop-down. <br/>Supported REST API list:<br/>*Organization(Groups)*<br/>*Organization(Users)*<br/>*Process(ProcessQueryEntityList)*<br/>*Search(ExecuteQuery)*<br/>*Task(TaskQueryEntityList)*|
    | `Params` | Required | Parameters of the REST API. Refer to https://[BAW-Server-URL]/bpmrest-ui/BPMRestAPITester/<br/>|
    |`Expected Value`|Required|The expected response of the REST API.|
    
- Example  

	![][search_found_expected_output_sample]
	
	![][start_rest_api_sample]

___

### **startQuery**

Performs a custom search. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	|`Columns`|Required|Valid column names are taskId, instanceId, bpdName, taskSubject, taskArrived, taskStarted, taskFinished, e.g.: taskId,instanceId.|
  | `Condition` | Optional | Query condition: &quot;&lt;field&gt;\|&lt;value&gt;&quot; or &quot;&lt;field&gt;\|&lt;op&gt;\|&lt;value&gt;&quot;|
  |`Sort`|Optional|Name of the primary sort column|
  |`Second Sort`|Optional|Name of the secondary sort column|
  |`Organization`|Optional|A string indicating how the results should be organized. Valid values are byTask and byInstance. The default value is byInstance.|
  |`Size`|Optional|Specifies the maximum number of entities to be returned. If a number is not specified, the default size defined for the query will be used.|
  |`Offset`|Optional|Specifies the number of entities to be skipped. Offset 0 refers to the first entity from the result set. If this parameter is not specified, the default value of 0 is used.|
  |`Filter By Current User`|Optional|Filter By Current User|
  |`Result`|Optional|The query result. Tip: Click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results.|
  |`Json Path`|Optional|Use the JSON path to extract the output value or sub-JSON|
  |`Variable Name`|Optional|Save Output into memory|

- Example  

	![][start_query_sample]
	
___
### **WaitProcessInstanceStatus**

Wait for the process instance status to update. Fail when timeout.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
  |`Instance Status`|Required|Process instance status to check|
  |`Timeout(seconds)`|Required|Wait timeout|

- Example  

	![][WaitProcessInstanceStatus_sample]
	
___


### **GetProcessInstanceData**

Get process instance data.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
  |`Json Path`|Optional|Use the JSON path to extract the instance data variable or sub-JSON|
  |`Variable Name`|Optional|Save the instance data variable or sub-JSON into memory|

- Example  

	![][GetProcessInstanceData_sample]
	
___
### **GetTaskData**

Get task data of the current process instance.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
  | `Task Name` | Required |Task Name, select from the drop-down. |
  |`Json Path`|Optional|Use the JSON path to extract the task data variable or sub-JSON|
  |`Variable Name`|Optional|Save the task data variable or sub-JSON into memory|

- Example  

	![][GetTaskData_sample]{:width="70%"}
	
___
## **BPM Assertion**

This category is for asserting server-side components.

___

### **Common Parameters**

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BAW user. The drop-down lists all *BAW user names* defined in the BAW Configuration the Test Project is connected to. More details refer to [**BAW Configuration/Add user to a BAW server**][1]. <br/>**Notes:** Currently, all the commands are run as the "default user", unless manually modified. If manually modified, the following commands are run as the latest modified user until modified again. If your recorded commands come from the "BPM", "BPM Assertion", "Case" or "Case Assertion" command category (these commands will invoke BAW REST API or Java API), you need to choose the proper assignee based on business logic. Recorded commands come from the "UI", "UI assertion", "Utility" command category don't need to set an assignee for these commands. You can leave it blank or use the "default user".|
|`TaskName`|Required| Name of the task that needs to be asserted. The drop-down lists all task names in the Process Application of the Test Project which is connected to.|
|`Comment`|Optional|Not part of any command and can be used for documenting the test case step.|

___

### **assertProcessInstanceStatus**

Check the current process instance status.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Instance Status` | Required | Expected status of the current process instance.<br>Possible values: <br>*Active*<br>*Completed*<br>*Failed*<br>*Terminated*<br>*Suspended*|
    
- Example  

	![][assert_process_instance_status_sample]

___

### **assertProcessInstanceData**

Assert the data of the current process instance. Can only be used in the context of process instance execution.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Expected Value` | Required | JSON object, expected value of the data.<br>**Notes:** <br>  Before adding this step, run the test case and look at the report. In the **Process Instance** section, click on the **click to show full data** link. <br>![][command_instance_data_template]<br>Copy the shown JSON into the **Expected Value** as the data template. Then change the value as you need. If your data has auto-generated fields, like current dates, instance IDs or some other unique identifiers, they have to be removed from the JSON.|
    
- Example  

	![][assert_process_instance_data_sample]

___

### **assertTaskAssignmentByUser**

Check that the correct user is assigned (claimed) to the task. Can only be used in the context of process instance execution.

- Example  

	![][assertTaskAssignmentByUser_sample]

___

### **assertTaskStatus**

Check the status of a task for the current process instance.

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

Check that the task is not generated.
    
- Example  

	![][assertTaskNotGenerated_sample]

___

### **assertTaskData**

Check the task data of the current process instance. It checks the variables saved in the BPM Task execution context. Use UI Assertions to check the page contents during the coach execution.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Value` | Required | Expected value of the data.<br>**Notes:**<br>Before adding this step, run the test case and look at the report. In the **Task Data** section, click on the **click to show full data** link.<br>![][command_task_data_template]<br> Copy the JSON value into the **Expected Value** as the data template. Then change the value as you need. If your data has auto-generated fields, like current dates, instance IDs or some other unique identifiers, they have to be removed from the JSON.|
	
- Example  

	![][assertTaskData_sample]

___

### **assertServiceData**

Check the current service data.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Value` | Required | Expected value of the data.<br>**Notes:**<br>Before adding this step, run the test case and look at the report. In the **Service Data** section, click on the **click to show full data** link. <br>![][command_service_data_template]<br>Copy the JSON value into the **Expected Value** as the data template. Then change the value as you need. If your data has auto-generated fields, like current dates, instance IDs or some other unique identifiers, they have to be removed from the JSON.|
	
- Example  

	![][assertServiceData_sample]

___

## **Case**

This category of commands is for calling server-side components of a case. There are a lot of common input fields. Below are some statements which are common for most of the commands in this category.  

___

### **Common Parameters**

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BAW user. Drop down lists all *BAW user names* defined in the BAW Configuration the Test Project is connected to. More details refer to [**BAW Configuration/Add user to a BAW server**][1]. <br/>**Notes:** Currently, all the commands are run as the "default user", unless manually modified. If manually modified, the following commands are run as the latest modified user until modified again. If your recorded commands come from the "BPM", "BPM Assertion", "Case" or "Case Assertion" command category (these commands will invoke BAW rest api or Java api), you need to choose the proper assignee based on business logic. Recorded commands that come from the "UI", "UI assertion", "Utility" command category don't need to set an assignee for these commands. You can leave it blank or use the "default user".|
| `Exception` | Optional | Checked means we are expecting to get an error for the test case. Unchecked means we are expecting to get a normal result from the test case. | 
| `Params`  | Depend on command. |JSON or XML format. If the template of parameters is rendered successfully by selecting the service, the field is required. The parameters are defaulted based on the service signature. The template of parameters includes keys of data, and you only need to fill in the value. <br/>*e.g:*<br/>{<br/>"variable_name": "value",<br/>"variable2_name": "value2"<br/>}<br/>Also, the parameter supports variables like CSV binding variables and context variables. You can use ${csv.xxxx} or ${xxx} to reference your variable value. If the variable value is a number, please remove the quote before $.<br/>*e.g:*<br/>{<br/>"textReader":"${csv.instanceId}",<br/>"integer":${number},<br/>"decimal":0,<br/>"text":"${mytext}"<br/>}  |
| `Expected Output` |Optional|Used for validating the command response. In some cases, there is a refresh button, which can be used to get default expected results. Make sure to fill out the params before clicking refresh. If refresh does not work, execute the case step without setting the expectedOutput. If passed, edit the step and click on ![][command_expected_output_refresh_button] button in the Command Editor Dialog to capture the results. <br/>**Notes:** The ![][command_params_error_icon] icon will appear below the *Expected Output* field when the wrong *Params* is filled out after clicking the ![][command_expected_output_refresh_button] button in the Command Editor Dialog. The error message can be obtained by hovering over the ![][command_params_error_icon] icon.|
|`Comment`|Optional|Not part of any command and can be used for documenting the test case step.|


___

### **loginCaseClient**

Login Case Client. As a result, the Case Client page is opened.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Solution` | Required | The case solution|

- Example  

	![][loginCaseClient_sample]
	
___

### **addCase**

Add a case based on the solution case type.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Case Type` | Required | The current case type name|
    | `Params` | Required | The initial case data|

- Example  

	![][add_case_sample]
	
___

### **addCaseFolderId**

Add a case folder id to the context, use it by: ${context.currentCaseFolderId}.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Case Folder ID` | Required | The case folder id|

- Example  

	![][add_case_folder_id_sample]
	
___

### **addActivity**

Add a discretionary activity based on the activity type.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Activity Type Name` | Required | The activity type name|
    | `Activity Name` | Required | The custom activity name|

- Example  

	![][add_activity_sample]
	
___

### **updateCaseData**

Update the current case data.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Case Type` | Required | The current case type name|
    | `Params` | Required | The updated case data|

- Example  

	![][update_case_data_sample]
	
___

### **runActivityByName**

Run a case solution activity by name.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Activity Name` | Required | The case solution activity name of the current case type|
    | `Task Name` | Required | The task name of the selected activity. |
    | `byTaskOwner` | Optional(BPMN) | Checked means the task owner will run this task. Unchecked indicates that the assigned user will run the task.|

- Example  

	![][run_filenet_p8_activity_by_name_sample_1]
	
	![][run_filenet_p8_activity_by_name_sample_2]
	
___

### **startManualActivity**

Start a manual activity.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Manual Activity Name` | Required | The manual activity name of the current case type|

- Example  

	![][start_manual_activity_sample]
	
___

## **Case Assertion**

This category is for asserting server-side components of a case.

___

### **Common Parameters**

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BAW user. Drop down lists all *BAW user names* defined in the BAW Configuration the Test Project is connected to. More details refer to [**BAW Configuration/Add user to a BAW server**][1]. <br/>**Notes:** Currently, all the commands are run as the "default user", unless manually modified. If manually modified, the following commands are run as the latest modified user until modified again. If your recorded commands come from the "BPM", "BPM Assertion", "Case" or "Case Assertion" command category (these commands will invoke BAW rest api or Java api), you need to choose the proper assignee based on business logic. Recorded commands that come from the "UI", "UI assertion", "Utility" command category don't need to set an assignee for these commands. You can leave it blank or use the "default user".|
|`Comment`|Optional|Not part of any command and can be used for documenting the test case step.|

___

### **assertCaseState**

Check the current case state.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Case State` | Required | Expected state of the current case.<br>Possible values: <br>*Complete*<br>*Failed*<br>*Initializing*<br>*New*<br>*Working*|
    
- Example  

	![][assert_case_state_sample]
	
___

### **assertActivityState**

Check the activity state of the current case.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Activity Name` | Required | The name of the activity.|
    | `Activity State` | Required | Expected state of the case activity.<br>Possible values: <br>*Waiting*<br>*Ready*<br>*Started*<br>*Completed*<br>*Canceled*|
    | `Activity Is Required` | Required | Expected required state of the case activity.<br>Possible values: <br>*True*<br>*False*|
    | `Activity Is Disabled` | Required | Expected disabled state of the case activity.<br>Possible values: <br>*True*<br>*False*|
    
- Example  

	![][assert_activity_state_sample]

___

## **BA**

This category of commands is for calling server-side components of a business application (available on Cloud Pak for Business Automation). There are some common input fields. Below are some statements which are common for most of the commands in this category. 

___

### **Common Parameters**

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BAW user. Drop down lists all *BAW user names* defined in the BAW Configuration the Test Project is connected to. More details refer to [**BAW Configuration/Add user to a BAW server**][1]. <br/>**Notes:** Currently, all the commands are run as the "default user", unless manually modified. If manually modified, the following commands are run as the latest modified user until modified again. If your recorded commands come from the "BPM", "BPM Assertion", "Case" or "Case Assertion" command category (these commands will invoke BAW rest api or Java api), you need to choose the proper assignee based on business logic. Recorded commands that come from the "UI", "UI assertion", "Utility" command category don't need to set an assignee for these commands. You can leave it blank or use the "default user".|
|`Comment`|Optional|Not part of any command and can be used for documenting the test case step.|

___

### **startBusinessApplication**

Start the business application.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
    | `Business Application` | Required | The unique name of the business application.|
    
- Example  

	![][startBusinessApplication_sample]{:height="70%" width="70%"}
___

## **UI**  

In most cases, the UI commands are recorded using the IDA plugin. If you find a need to add a command manually, for example, a validation command, look at the recorded command for the element and copy the location information from it.
<br>*e.g:*
Any one or combination of the recorded values can be used to identify the control:  Control ID, Element ID, or XPATH. If the Label is unique on the page, it can be used as well. Enough location arguments are required to uniquely identify an element on the page. **IDA** cycles through available ids until it finds the element. For example, if you recorded a select step and later moved the control around on the page, the Control ID and XPATH are probably different from the recorded step, but the Element ID is still the same.

In most cases, the UI commands are recorded and displayed immediately in the IDA recorder. Commands below are only displayed after recording of some other control as the command value cannot be set immediately:
- bpmFileDropzone
- bpmFileUploader
- coachControl

___

### **Common Parameters**

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BAW user. Drop down lists all *BAW user names* defined in the BAW Configuration the Test Project is connected to. More details refer to [**BAW Configuration/Add user to a BAW server**][1]. <br/>**Notes:** Currently, all the commands are run as the "default user", unless manually modified. If manually modified, the following commands are run as the latest modified user until modified again. If your recorded commands come from the "BPM", "BPM Assertion", "Case" or "Case Assertion" command category (these commands will invoke BAW rest api or Java api), you need to choose the proper assignee based on business logic. Recorded commands that come from the "UI", "UI assertion", "Utility" command category don't need to set an assignee for these commands. You can leave it blank or use the "default user".|
|`Value`|Optional, fields `Value`, `Control ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.| The value of the control.|
|`Control ID`|Optional, fields `Value`, `Control ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The ID of the control. Control ID is the PATH control IDs leading to the selected control id.|
|`Label`|Optional, fields `Value`, `Control ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The label of the control.|
|`Element ID`|Optional, fields `Value`, `Control ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The ID of the element.|
|`Element CSS`|Optional, fields `Value`, `Control ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The CSS of the element.|
|`XPATH`|Optional, fields `Value`, `Control ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The xpath of the control.|
|`Comment`|Optional|Not part of any command and can be used for documenting the test case step.|

***Notes:** The element is first obtained through the Control ID. If it fails, the label, Element ID, and Element CSS are then used in turn. Finally, the XPATH is used. If successful, the rest will not be used.*

___

### **bpmFileDropzone**

Upload a file to the BAW server by using the Dropzone control. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value` | Required |Name of the BPM file.|
	| `Control ID` | Required |Control ID of the BPM file drop zone.|
	
- Example  

	![][bpmFileDropzone_sample]

___

### **bpmFileUploader**

BPM file uploader. UI.bpmFileUploader can't be replayed on the IDA Plugin due to browser security issues, but this command can work on the Selenium Grid. So you can record the file upload commands by the IDA Plugin, but replay them on the Selenium Grid.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value` | Required |Name of the BPM file.|
	| `Control ID` | Required |The control id of the BPM file that needs to be uploaded. |
	
- Example  

	![][bpm_file_uploader]

___

### **checkbox**

 	Set the value of the checkbox control. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value` | Required | The value of the checkbox to operate on. |
	| `Select Options` | Required | Checkbox operation, Select or Unselect. Select: to check the checkbox. Unselect: to clear the checkbox. |
	
- Example  

	![][checkbox]

___

### **click**

Click an element by id, CSS, or xpath. **Notes:** The BPM UI toolkit has an *id* on a button, but Coach v8 and BP3 do not. Thus, the latter two can only be identified by XPATH. Moving the coach view around the page may change its xpath and break the test case.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Type` | Optional | *Link* or *Button*.|
	| `Trigger Event` | Optional | The JavaScript event triggered by the click.|
	
- Example  

	![][click]

___

### **coachControl**

Set the value of the coach control. This is a generic setter. The value should match the selected control type.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value Type` | Optional | Select the type from the drop-down. |
	| `Default Value` | Optional | Default value of the control. |
	
- Example  

	![][coach_control]
___

### **confirmOK**

Click the OK button for window.confirm and return *true*. This isn't supported in the IDA plugin. It needs to be added to the test case manually when used and can work fine in Selenium.
	
- Example  

	![][confirm_ok]

___

### **confirmCancel**

Click the Cancel button for window.confirm and return *false*. This isn't supported in the IDA plugin. It needs to be added to the test case manually when used and can work fine in Selenium.
	
- Example  

	![][confirm_Cancel]

___

### **doubleClick**

Double-click an element by id, CSS, or xpath. This is similar to **click**. It needs to be added to the test case manually when used.
	
- Example  

	![][double_click]

___

### **file**

Upload a file. UI.file can't be replayed on the IDA Plugin due to browser security issues, but this command can work on the Selenium Grid. So you can record the file upload commands by the IDA Plugin, but replay them on the Selenium Grid.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value` | Required | The filename that needs to be uploaded. |
	
- Example  

	![][file]

___

### **close**

Close the currently opened browser.
	
- Example  

	![][close_window]

___

### **radio**

Set the value of the radio control.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Value` | Required | The value of the radio to select. The value should be the LABEL on the CV control.<br>*e.g:*<br>![][command_UI_radio]<br> The value should be set to *Make a selection*.|
	
- Example  

	![][radio]

___

### **saveCoachControl**

Put the control value into a key. <br>Tip:<br> a) record a step to set the value of the control;<br>b) edit the recorded step in the Command Editor and change the command to saveCoachControl;<br>c) set the Key.<br> If the control you try to save is read-only, record any other controls which are at the same level (e.g., in the container). Modify the Control ID path to match the control you are trying to save.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Required | Name of a variable, which can later be referenced as ${key} in a value field of any command.|
	| `Property` | Optional | When the control binds a complex object, you can get the value from the complex object by property. <br> *e.g.:* <br> *bindingObject.value* |
	
- Example  

	![][save_coach_control]

___

### **saveText**

Save text into the context. Can put the output text, single select, and input value to a key.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Required | Name of a variable, which can later be referenced as ${key} in a value field of any command.|
	
- Example  

	![][saveText]

___

### **select**

 Set the value of the select (drop-down) control. The value is a JSON list of selected display values for this Select or Multi-Select CV. <br>*e.g.:*``["Selected value1","Selected value2"] ``
	
- Example  

	![][select_control]

___

### **selectWindow**

 Select a window by window information.
	
- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Info` | Required | Window information.  |
	
- Example  

	![][select_window]

___
  
### **text**

Set the value of any control, which UI accepts textual input. Examples: input text CV, Integer CV, Date Picker. This event is captured when the control loses focus. So it is possible for some controls like Date Picker to record two steps. One for an empty value and the other for the actual value. This is because the first empty data is captured when the mouse focus moves from the control to the Date select popup. Users can remove the first recorded case step or just keep them as-is.

- Example  

	![][text]

___
  
### **waitElement**

Wait for an element to be visible/hidden/editable/read-only until the timeout. Fail when the timeout is reached.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Type` | Required | Select the element type from the drop-down. *Visible*, *Hidden*, *Editable*, and *Readonly*.  |
	| `Timeout` | Optional | The maximum time to wait for the element. If empty, use engine-config.wait-timeout set on ida.properties.|
	
- Example  

	![][wait_element]

___  
  
___
  
### **waitTextPresent**

Wait for a text to be displayed until the timeout. Fail when the timeout is reached.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Text` | Required | Text waiting to be displayed on the page.  |
	| `Timeout` | Optional | The maximum time to wait for the element. If empty, use engine-config.wait-timeout set on ida.properties.|
	
- Example  

	![][wait_text_present]

___  


### **clickActivityFromPortal**

Click an activity from the portal.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Activity` | Required | The activity name  |
	| `Process` | Optional | The process name|
  | `Track` | Optional | The track name|
	
- Example  

	![][clickActivityFromPortal]

___  


## **UI Assertion**

 Record a command to populate the field you want to assert. Then edit the generated test case step and change the command to assert. The edit would pick up matching fields from the recorded command.

___

### **Common Parameters**

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BAW user. Drop down lists all *BAW user names* defined in the BAW Configuration the Test Project is connected to. More details refer to [**BAW Configuration/Add user to a BAW server**][1]. <br/>**Notes:** Currently, all the commands are run as the "default user", unless manually modified. If manually modified, the following commands are run as the latest modified user until modified again. If your recorded commands come from the "BPM", "BPM Assertion", "Case" or "Case Assertion" command category (these commands will invoke BAW rest api or Java api), you need to choose the proper assignee based on business logic. Recorded commands that come from the "UI", "UI assertion", "Utility" command category don't need to set an assignee for these commands. You can leave it blank or use the "default user".|
|`Control ID`|Optional, fields `Value`, `Control ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The ID of the control. Control ID is the PATH control IDs leading to the selected control id.|
|`Label`|Optional, fields `Value`, `Control ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The label of the control.|
|`Element ID`|Optional, fields `Value`, `Control ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The ID of the element.|
|`Element CSS`|Optional, fields `Value`, `Control ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The CSS of the element.|
|`XPATH`|Optional, fields `Value`, `Control ID`, `Label`, `Element ID`, `Element CSS` and `XPATH` must be filled in at least one of them.|The xpath of the control.|
|`Expected Value`|Required|The expected value of the control|
|`Comment`|Optional|Not part of any command and can be used for documenting the test case step.|

***Notes:** The element is first obtained through the Control ID. If it fails, the label, Element ID, and Element CSS are then used in turn. Finally, the XPATH is used. If successful, the rest will not be used.*

___
  
### **assertButtons**

Check if the buttons are rendered or not.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Texts` | Required | Text of the buttons that you want to render.<br>*e.g.:*<br>![][command_UIAssert_buttons]<br>If you want to check that all the buttons are rendered in this form, you can fill it in like this:<br>``Save``<br>``Cancel``<br>**Notes:** *Texts are separated by the line break.*|
	| `Expected Visibility` | Required | The expected visibility of the control. Select from the drop-down. *Enabled*, *Disabled,* and *Hidden*.|
	
- Example  

	![][assert_buttons]

___  
  
### **assertCheckbox**

Assert checkbox value and options.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Checked Labels` | Required | Labels of checkboxes that are expected to be checked.<br>*e.g.:* <br>![][command_UIAssert_checkbox]<br>To verify the options on this page, fill in like this: <br>``Create Position Request CSHS``<br>``GM Approval CSHS``. <br>**Notes:** *Labels are separated by the line break.*|
	| `Expected Options` | Required | Labels of all options that are expected to be rendered. <br>*e.g.:* If you want to check that all the checkbox options are rendered in the figure above, you can fill in like this:<br>``Create Position Request CSHS``<br>``Find Candidates CSHS``<br>``GM Approval CSHS``<br>**Notes:** *Labels are separated by the line break.*|
	
- Example  

	![][assert_check_box]

___ 
  
### **assertCoachControl**

Assert Coach Control binding value and visibility. It only supports String, Number, Date, and Boolean types of binding values now. Either the Control ID or label is required. The Control ID is the coach view Control ID, and the label is the coach view label.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Value Type` | Required | The value Type of the control, select from the drop-down. *String*, *Number*, *Date(MM/dd/yyyy)*, and *Boolean*.|
	| `Expected Visibility` | Required | The visibility of the control. Select from the drop-down. *Enabled*, *Disabled,* and *Hidden*.|
	
- Example  

	![][assert_Coach_Control]

___ 
  
### **assertDatePicker**

Assert the date picker value.

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
	| `Expected visibility` | Required | The visibility of the control. Select from the drop-down. *Enabled*, *Disabled,* and *Hidden*.|
	
- Example  

	![][assert_element]

___

### **assertInputText**

Check the coach text field value. If you check the regular expression, it will use the expected value as a regular expression to match the actual value.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Max Length` | Optional | Expected maximum length of the text.|
	
- Example  

	![][assert_input_text]

___
 
### **assertOutputText**

Check the coach output text value. 

- Example  

	![][Assert_Output_Text]

___
   
### **assertRadio**

Assert Radio value and options.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Checked Label` | Required | Label of the radio box that is expected to be checked.|
	| `Expected Options` | Required | Labels of all options that are expected to be rendered. Refer to the statements of *Expected Options* in **assertCheckbox**.|

- Example  

	![][assert_radio]

___
     
### **assertSelect**

Assert Select value and options.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Expected Value` | Required | The expected value of the control. If it is a multi-select, the value is separated by the line break.|
	| `Expected Options` | Required | Labels of select options that are expected to be rendered. Refer to the statements of *Expected Options* in **assertCheckbox**.|

- Example  

	![][assert_select]

___
     
### **assertSwitch**

Assert the Switch box.

- Example  

	![][assert_switch]

___
       
### **assertTableContent**

Assert the cell value of the table.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Column Name` | Required | The name of the column where the value needs to be asserted. Column Name is used prior to Column Number to match the column.|
	| `Column Number` | Optional | The number of the column where the value needs to be asserted. Required if Column Name can not be specified.|
	| `Row Number` | Required | The number of the row where the value needs to be validated.|
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

Assert that the text does not appear on the UI.  

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Text` | Required | The text that is not expected to appear on the UI.|

- Example  

	![][assert_text_no_present]

___
           
### **assertTextPresent**

Assert that the text appears on the UI. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Text` | Required | The text that is expected to appear on the UI. |

- Example  

	![][assert_text_present]

___
           
### **assertValidationPassed**

Check whether the coach page has passed the validation or not.

- Example  

	![][assert_validation_passed]

___

## **Utility**

This category provides utility commands.

___

| Name | Required | Description |
|----------------|------------|--------------|
| `Assignee`   | Optional | When specified, the command is executed by the specified BAW user. The drop-down lists all *BAW user names* defined in the BAW Configuration the Test Project is connected to. More details refer to [**BAW Configuration/Add user to a BAW server**][1]. <br/>**Notes:** Currently, all the commands are run as the "default user", unless manually modified. If manually modified, the following commands are run as the latest modified user until modified again. If your recorded commands come from the "BPM", "BPM Assertion", "Case" or "Case Assertion" command category (these commands will invoke BAW rest api or Java api), you need to choose the proper assignee based on business logic. Recorded commands that come from the "UI", "UI assertion", "Utility" command category don't need to set an assignee for these commands. You can leave it blank or use the "default user".|
|`Comment`|Optional|Not part of any command and can be used for documenting the test case step.|

___
           
### **addContext**

Append another value to this key. 

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Required | Name of the key. |
	| `Value` | Required | Value that needs to be appended. |

- Example  

	![][add_context]

___
           
### **dateString**

Generate a date string before/after a number of days from today. If the key is not specified, then the default key is "DATE_STRING". You can use the date string by ${context.DATE_STRING}.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Optional | Name of the key. Default is `DATE_STRING`.|
	| `Days` | Optional | The number of days from the current date that you want to convert to a string. A negative number of days means before today, while a positive number of days means after today. <br>*e.g.:* **-1** means generating a string of the date of yesterday. Default is `0`.|
	| `Format` | Optional |Format of the date. Default is `MM/dd/YYYY`.|

- Example  

	![][date_string]

___
           
### **debug**

Command for debugging, recording of the case will stop at this step.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Log` | Optional | Log text will be shown in the console.|
	
___
           
### **putContext**

 Put a new key-value pair into the context.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Required | Name of the key.|
	| `Value` | Required | Value that needs to be put into the context.|
	
___
           
### **wait**

Wait for a specified number of seconds.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Time` | Required | The number of seconds to wait.|
	
___

### **randomString**

Generate a random string of a specified length with a key.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Optional | Key name for the generated random string, default value is "RANDOM_STRING".|
	| `Length` | Required | Length of the generated random string.|

- Example 
  
  No key name, just use the default value "RANDOM_STRING".

  ![][random_string_default_define]

  ![][random_string_default_use]

  ![][random_string_steps_desc]

  Use a key name, e.g., SKey1.

  ![][random_string_key_define]

  ![][random_string_key_use]

  ![][random_string_key_steps_desc]
	
___

### **randomNumber**

Generate a random number of a specified length with a key.

- Parameters

	| Name | Required | Description |
	|----------------|------------|--------------|
	| `Key` | Optional | Key name for the generated random number, default value is "RANDOM_NUMBER".|
	| `Length` | Required | Length of the generated random number.|
	
- Example 

  No key name, just use the default value "RANDOM_NUMBER".

  ![][random_number_default_define]

  ![][random_number_default_use]

  ![][random_number_steps_desc]


  Use a key name, e.g., Key1.

  ![][random_number_key_define]

  ![][random_number_key_use]

  ![][random_number_key_steps_desc]

___


[1]: ../administration/administration-baw-configuration.html#add-user-to-a-bpm-server
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
[loginWorkpalce_Sample]: ../images/command/loginWorkplace_Sample.png
[Login_BPMoC_Sample]: ../images/command/Login_BPMoC_Sample.png
[openInstanceDetail_Sample]: ../images/command/openInstanceDetail_Sample.png
[open_sample]: ../images/command/open_sample.png
[start_process_sample]: ../images/command/start_process_sample.png
[start_external_process_sample]: ../images/command/start_external_process_sample.png
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
[start_query_sample]: ../images/command/start_query_sample.png
[assert_process_instance_status_sample]: ../images/command/assert_process_instance_status_sample.png
[assert_process_instance_data_sample]: ../images/command/assert_process_instance_data_sample.png
[assertTaskAssignmentByUser_sample]: ../images/command/assertTaskAssignmentByUser_sample.png
[assertTaskStatus_sample]: ../images/command/assertTaskStatus_sample.png
[assertNextTaskName_sample]: ../images/command/assertNextTaskName_sample.png
[assertTaskNotGenerated_sample]: ../images/command/assertTaskNotGenerated_sample.png
[assertTaskData_sample]: ../images/command/assertTaskData_sample.png
[loginCaseClient_sample]: ../images/command/loginCaseClient_sample.png
[add_case_sample]: ../images/command/add_case_sample.png
[add_case_folder_id_sample]: ../images/command/add_case_folder_id_sample.png
[add_activity_sample]: ../images/command/add_activity_sample.png
[update_case_data_sample]: ../images/command/update_case_data_sample.png
[run_activity_by_name_sample]: ../images/command/run_activity_by_name_sample.png
[run_filenet_p8_activity_by_name_sample_1]: ../images/command/run_filenet_p8_activity_by_name_sample_1.png
[run_filenet_p8_activity_by_name_sample_2]: ../images/command/run_filenet_p8_activity_by_name_sample_2.png
[start_manual_activity_sample]: ../images/command/start_manual_activity_sample.png
[assertServiceData_sample]: ../images/command/assertServiceData_sample.png
[assert_case_state_sample]: ../images/command/assert_case_state_sample.png
[assert_activity_state_sample]: ../images/command/assert_activity_state_sample.png
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
[clickActivityFromPortal]: ../images/command/clickActivityFromPortal.png
[WaitProcessInstanceStatus_sample]: ../images/command/WaitProcessInstanceStatus.png
[GetProcessInstanceData_sample]: ../images/command/GetProcessInstanceData.png
[random_string_default_define]: ../images/command/random_string_default_define.png
[random_string_default_use]: ../images/command/random_string_default_use.png
[random_string_steps_desc]: ../images/command/random_string_steps_desc.png
[random_string_key_define]: ../images/command/random_string_key_define.png
[random_string_key_use]: ../images/command/random_string_key_use.png
[random_string_key_steps_desc]: ../images/command/random_string_key_steps_desc.png
[random_number_default_define]: ../images/command/random_number_default_define.png
[random_number_default_use]: ../images/command/random_number_default_use.png
[random_number_steps_desc]: ../images/command/random_number_steps_desc.png
[random_number_key_define]: ../images/command/random_number_key_define.png
[random_number_key_use]: ../images/command/random_number_key_use.png
[random_number_key_steps_desc]: ../images/command/random_number_key_steps_desc.png
[GetTaskData_sample]: ../images/command/GetTaskData.png
[startBusinessApplication_sample]: ../images/command/startBusinessApplication_sample.png
