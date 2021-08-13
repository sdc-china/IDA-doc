---
title: "Pipeline script"
category: pipeline
date: 2018-10-13 15:17:55
last_modified_at: 2019-07-29 15:53:00
order: 4
---

# Pipeline script
***
### Pipeline script summary

  In pipeline stage step definition, there is a step called script, which allows users to execute script in the server where IDA is deployed.

### Define script

  In **Edit Step** modal, select **Script** as **Type** then you can define one or more scripts in **Script** text area. For multiple scripts, each of them need to start from a new line.

  ![][pipeline_create_script]
  <br>
  <br>
  After the pipeline is executed, you can view the script execution result.

  ![][pipeline_script_result]  

### Script supported parameters

  IDA supports below parameters in Script. They can be used in Script to represent Pipeline related attributes.

  **${PIPELINE_NAME}**: current pipeline name
  <br>
  **${PIPELINE_ID}**: current pipeline ID
  <br>
  **${STAGE_NAME}**: current stage name
  <br>
  **${STEP_NAME}**: current step name
  <br>
  **${BUILD_ID}**: current build id
  <br>
  **${BUILD_REPORT_URL}**: current build report URL
  <br>
  **${APP_ACRONYM}**: current processApp acronym name
  <br>
  **${SNAPSHOT_ACRONYM}**: current snapshot acronym name

### Script samples
**Call RESTFul service**
  <br>
  <br>
   You can use **curl** to call a RESTful service or Web Service in Script. For example, below script calls a Workflow REST API by curl.

  *curl -H "Accept:application/json" -H "Authorization:Basic YWRtaW46UGFzc3cwcmQ=" -k https://[serverhost]:[port]/rest/bpm/wle/v1/systems*
  <br>
  <br>
  **Call Web Service**
  <br>
  <br>
  You can also use **curl** to call a Web Service.  For example, you can call a Web Service to send email notification during pipeline creation. Assume the Web Service is based on SOAP 1.2 and its WSDL URL is: http://[serverhost]:[port]/teamworks/webservices/HSS/SendEmailWS.tws?wsdl, you can use below curl script to call it.

*curl -H "Content-Type: application/soap+xml;charset=utf-8" -d "<soap:Envelope xmlns:soap='http://www.w3.org/2003/05/soap-envelope' xmlns:sen='https://[serverhost]:[port]/teamworks/webservices/HSS/SendEmailWS.tws'><soap:Header/><soap:Body><sen:send><sen:subject>${PIPELINE_NAME} result</sen:subject><sen:content>Please refer to ${BUILD_REPORT_URL}</sen:content><sen:to>ida-mock@cn.ibm.com</sen:to><sen:cc>ida-mock@cn.ibm.com</sen:cc></sen:send></soap:Body></soap:Envelope>" http://[serverhost]:[port]/teamworks/webservices/HSS/SendEmailWS.tws*
![][pipeline_email_script]

  <br>
  **Call wsadmin command**
  <br>
  <br>
   You can execute a wsadmin command in Script. The wsadmin command is running against the BPM server associated to the Stage Workflow configuration. For example,

  *ssh AdminTask.BPMSetEnvironmentVariable('[-containerAcronym ${APP_ACRONYM} -containerSnapshotAcronym ${SNAPSHOT_ACRONYM} -environmentVariableName TEST_KEY -environmentVariableValue 8899]')*

  This Script first logon BAW server using ssh, then execute the wsadmin commmand there to update the Workflow environment variable. The format of the Script to call wsadmin command is

**ssh** + space + **wsadmin command**

  We also support execute script file for wasadmin command. For example,

  *ssh -f /tmp/bpmtask.py*

  *ssh -f bpmtask.py* 
  
  The script file has a .py extension to reflect the Jython language syntax of the script.  Example below shows a two-line Jython script file named bpmtask.py.
  
  ``` 
  print "This script is used to set BPM EnvironmentVariable"
  AdminTask.BPMSetEnvironmentVariable('[-containerAcronym BTAS -containerSnapshotAcronym TS -environmentVariableName TEST_KEY -environmentVariableValue 98744]')
  ``` 
#### Notes:
  - If you not specify the script file path,it will use the BAW deployment remote dir as your script path,which is defined in the IDA setting page.Also you need to put this script file in the BAW server specfied folder before you run the pipeline.

The format of the script file to call wsadmin command is

**ssh** + space + **-f** + space + **scriptFileName**

[pipeline_create_script]: ../images/pipeline/pipeline_create_script.png
[pipeline_script_result]: ../images/pipeline/pipeline_script_result.png
[pipeline_email_script]: ../images/pipeline/pipeline_email_script.png
