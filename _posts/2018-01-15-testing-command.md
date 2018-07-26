---
layout: page
title: "Testing command Reference"
category: references
date: 2018-01-05 15:17:55
order: 1
---


* BPM   

  |   Field                          |Parameters                          | Description                                                                       |
  | -------------------------------- |-----------------------------------------------------------------------------------|                                          
  | loginPortal                      |     N/A                            |   Login into BPM portal                                                                    |
  | loginBPMoC                  	 |                                    |  Login into BPM on cloud  
  | openInstanceDetail               |     N/A                            |   Open the instance detail page for current instance                                  |
  | startProcess                     |    user : user name<br>process : process will be start<br>params: process input list<br>toolkitName : toolkit name|  Start a BPM process by REST API, only exposed process are supported by default. Install BPM Testing Asset Toolkit to support all processes.   |                                                                        
  | startHumanService                |  user : user name<br>service : process will be start<br>params: human service input list<br>toolkitName : toolkit name |   Start Human Service                                  | 
  | startExposedHertiageHumanService |  user : user name<br>service : process will be start<br>params: human service input list<br>toolkitName : toolkit name  | Start an exposed heritage human service, please make sure the human service is exposed to a specify team
  | startAjaxService                 |  exception: is an exception case<br>user: user name<br>service: service name<br>param: service input list<br>expectedOutput: expected service output<br>toolkitName- toolkit name  |   Start an ajax service by REST API                                  |
  | startSystemService               |  exception: is an exception case<br>user: user name<br>service: service name<br>param: service input list<br>expectedOutput: expected service output<br>toolkitName- toolkit name  | Start a system service by REST API, please install BPM Testing Asset Toolkit to support system service. |      
  | saveSQLQueryResult               | user: user name<br>sql: sql statement<br>dataSourceName: data source name<br>key: key name  |   Save the SQL query result into context |
  | startSQLQuery                    | user: user name<br>sql: sql statement<br>maxRows: max rows<br>dataSourceName: data source name<br>expectedOutput: expected output| Perform SQL Query by REST API, please install BPM Testing Asset Toolkit to support SQL Query                                     |   
  | startUCA                         | user: user name<br>uca: uca name<br>params: UCA inputs<br>toolkitName: toolkit name | start UCA                                |    
  | startServiceFlow                 |                                    |                                     |
  | startAdHoc                       | user : user name<br>taskName : Adhoc name | Start AdHoc event            |    
  | runAdHocActivity                 | Ad Hoc Activity Name: adhoc activity|     run AdHoc Activity             |    
  | runTaskByDisplayName             | user: user name<br>taskName: task name |  Run task by display name       |    
  | runTaskByActivityName            |  user: user name<br>taskName: task name|   Run task by display name      |                                 
  | assignTask                       |  user: user name<br>taskName: task name<br>toUser: to user name  |  assign task                                   |
  | claimTask                        | user: user name<br>taskName: task name  |   claim task                   | 
  | finishTask                       | user:user name<br>taskName: task name<br>params :task output     |   finsih task                                  | 
  | addInstanceId                    | instanceId : instance id           |   Add a process instance id to context                                  | 
  | openBPMDefaultUrl                |     N/A                            |    Go to the BPM default url                                 | 
  | setCurrentInstanceIndex          |  index : current instance index    |   Switch the working instance by specify the index of the multiple process instances|
  | getTaskIdByName                  |  taskName : task name              |    Get task id by name                                 | 
  | getLatestInstanceIdByProcess     |   processName : process name       |   Get the latest process instance id by process name                                  | 
  | getInstanceIdByInstanceName      |  processName: process name<br>instanceName:instance name|  Get the process instance id by process name and instance name    | 
  | getTgetInstanceIdByTaskName      | processName: process name<br>taskName: task name  |  Get the process instance id by process name and task subject name      | 
  | getInstanceIdByTaskUrl           |    N/A                             |   Get the process instance id by the task id in url                                  | 
  | getInstanceIdByBusinessData      | processName: process name<br>businessDataAlias: business data alias name<br>businessDataValue: business data value     |  Get the process instance id by process name and business data     | 
  | fireTimer                        |  user: user<br>name token: token name  |     Fire timer for the current instance                           |                                 
  | startRestApi                     | API Name:rest api name<br>Parameter: rest api parameter template  <br>Expected Value: the expected rest api response   |   assert rest api result|                            
  
* BPM Assertion  

  |   Field                                 | Parameters                                |Description                                                        |
  | --------------------------------------- |------------------------------------------------------------------ ------- ------- ------- - ------- -------  |                                          
  | assertProcessInstanceStatus             |instanceStatus : expected status of the current process instance<br>errorMessage - error message |Check current process instance status                                           |                                                         
  | assertProcessInstanceData               |expectedValue : expected value of the data<br>errorMessage: error message | Assert the data of current process instance                                                      |  
  | assertTaskAssignmentByUser              | taskName : task name                                          |   Check user is  assigned to the task 
  | assertTaskStatus                        | taskName : task name<br>taskStatus : expected status of the task<br>errorMessage - error message   |    Check the status of a BPM task for current process instance.        |  
  | assertNextTaskName                      | taskName: task name of current process<br>errorMessage: error message   |   Check the task is received.                                                    | 
  | assertTaskNotGenerated                  | taskName: task name of current process<br>errorMessage: error message    |  Check the task is not generated.                     |  
  | assertTaskData                          | taskName : task name<br>expectedValue : expected value of the data<br>errorMessage - error message |  Check the task data of current process instance      |  
  | assertServiceData                       | expectedValue : expected value of the data<br>                                   |      check the currenct service data                                                 |   
  
* UI  
   
  |   Field                | Parameters                          | Description                                                             |
  | ---------------------- |-------------------------------------------------------------------------|                                
  | bpmFileDropzone           | value: the value of the BPM file<br>control ID: the control id of BPM file drop zone<br>Default value: the value of default |  BPM file drop zone   |  

 
     
* UI Assertion  

  |   Field                | Parameters                          | Description                                                             |
  | ---------------------- |-------------------------------------------------------------------------|                                
  | assertSelect           | controlId : control id<br>Setion:the section ID of the control<br>Label:the label name of the control<br>Element ID:the ID of the element<br>Element CSS:the css of the Element<br>XPATH: the xpath of the coach control<br>Expected Value: the expected value of the control<br> |  Check select value   |  
  | assertInputText        | controlId :  control id<br>Setion:the section ID of the control<br>Label:the label name of the control<br>Element ID:the ID of the element<br>Element CSS:the css of the Element<br>XPATH: the xpath of the coach control<br>Expected Value: the expected value of the control<br> |  Check coach text field value       |                                    
  | assertOutputText       | controlId :  control id<br>Setion:the section ID of the control<br>Label:the label name of the control<br>Element ID:the ID of the element<br>Element CSS:the css of the Element<br>XPATH: the xpath of the coach control<br>Expected Value: the expected value of the control<br> |  Check coach output text  value     |
  | assertTextarea         | controlId :  control id             |    assert the textarea value                                |                                                                         
  | assertDatePicker       | controlId :  control id<br>Setion:the section ID of the control<br>Label:the label name of the control<br>Element ID:the ID of the element<br>Element CSS:the css of the Element<br>XPATH: the xpath of the coach control<br>Expected Value: the expected value of the control<br> |  Assert the date picker value     |
  | assertCheckbox         | controlId :  control id<br>Setion:the section ID of the control<br>Label:the label name of the control<br>Element ID:the ID of the element<br>Element CSS:the css of the Element<br>XPATH: the xpath of the coach control<br>Checked: the checkbox is checked or not  |     assert checkbox is checked or not                               |      
  | assertSwitch           | controlId :  control id<br>Setion:the section ID of the control<br>Label:the label name of the control<br>Element ID:the ID of the element<br>Element CSS:the css of the Element<br>XPATH: the xpath of the coach control<br>Checked: the Switch box is on or off |  assert Switch box is on or off                                   |                                   
  | assertRadio            | controlId :  control id<br>Setion:the section ID of the control<br>Label:the label name of the control<br>Element ID:the ID of the element<br>Element CSS:the css of the Element<br>XPATH: the xpath of the coach control<br>Checked: the radio box is checked or not   |assert radio box is on or off                                 |                                      
  | assertTableRows        | Control ID: the id of table<br>Expected Rows: the row number of the table |     assert row number of the table                               |   
  | assertTableContent     | Control ID: the id of table<br>Column: the name of the column <br> Row Number: the row number of table<br>Expected value: the cell value of the table   |    assert the cell value of the table                                | 
  | assertElement              |  Element ID: the id of element<br>Element css: the css of element <br> Xpath: the xpath of element<br>Expected value: the expected value of the element<br>Expected visibility: the visibility  of element <br> Ignore Element XPATHs: ignore the element xpath   |   assert the value of the element |
  | assertTextPresent          | Text: the text on the UI           |   assert text is appear on UI                                 |  
  | assertTextNotPresent       | Text: the text on the UI         |   assert text is not appear on UI                                
  | assertValidationPassed                  | errorMessage : error message       |  Check whether the coach page is passed the validation or not.                  |
  | assertCoachControl                      |  value : coach value <br>label - control label <br>controlId : coach control id <br>elementId : element id of the control<br>xPath : xpath of the control <br>Expected Value: the expected value of the control <br>Expected Value Tyep: the  value Type of the control (Integer,String) <br>Expected Visibility:the visibility of the control|  assert the control value,type,visibility                   |
    
  
* Utility  

  |   Field                | Parameters                          | Description                                                             |
  | ---------------------- |-------------------------------------------------------------------------|                                          
  | debug                  |  log - log text will be shown in console  |   Command for debug, case will stop at this step                                 |      
  | wait                   | time - the seconds to be wait  |   Wait for specify seconds                                 |     
  | putContext             |  key - name of key <br>value - name of value |  Put a key-value pair to context                                  |     
  | addContext             |   key - name of key <br>value - name of value | Add a key-value pair to list of context                                   |                                    |     
  | randomString           |    length : length of the generated random string |Generate a specified length random string.                                |                                     
  | randomNumber           |    length : length of the generated random string |Generate a specified length random number                                |                                       
  | dateString             |   key : key for save data string <br>Days:  Use currenct date add the number of days <br>Format: Formate of date   |      Calculate a new date String                               |  

   
 
