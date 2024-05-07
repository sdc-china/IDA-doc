---
title: "Pipeline Script"
category: pipeline
date: 2018-08-07 15:17:55
last_modified_at: 2022-05-17 16:53:00
---

# Pipeline Script
***

## Pipeline script summary

In pipeline stage step definition, there is a step called script, which allows users to execute scripts on the server where IDA is deployed.

## Define script

In the **Edit Step** modal, select **Script** as the **Type**, then you can define one or more scripts in the **Script** text area. For multiple scripts, each of them needs to start from a new line.

![][pipeline_create_script]
<br>
<br>

## Script supported parameters

IDA supports the following parameters in Scripts. They can be used in Scripts to represent Pipeline-related attributes.

**${PIPELINE_NAME}**: current pipeline name
<br>
**${PIPELINE_ID}**: current pipeline ID
<br>
**${STAGE_NAME}**: current stage name
<br>
**${STEP_NAME}**: current step name
<br>
**${BUILD_ID}**: current build ID
<br>
**${BUILD_REPORT_URL}**: current build report URL (relative path)
<br>
**${APP_ACRONYM}**: current processApp acronym name
<br>
**${SNAPSHOT_ACRONYM}**: current snapshot acronym name

## Script samples
**Call RESTful service**
<br>
<br>
You can use **curl** to call a RESTful service or Web Service in a Script. For example, the following script calls a Workflow REST API using curl.

*curl -H "Accept:application/json" -H "Authorization:Basic YWRtaW46UGFzc3cwcmQ=" -k https://[serverhost]:[port]/rest/bpm/wle/v1/systems*
<br>
<br>
**Call Web Service**
<br>
<br>
You can also use **curl** to call a Web Service. For example, you can call a Web Service to send an email notification during pipeline creation. Assume the Web Service is based on SOAP 1.2, and its WSDL URL is: http://[serverhost]:[port]/teamworks/webservices/HSS/SendEmailWS.tws?wsdl, you can use the following curl script to call it.

*curl -H "Content-Type: application/soap+xml;charset=utf-8" -d "<soap:Envelope xmlns:soap='http://www.w3.org/2003/05/soap-envelope' xmlns:sen='https://[serverhost]:[port]/teamworks/webservices/HSS/SendEmailWS.tws'><soap:Header/><soap:Body><sen:send><sen:subject>${PIPELINE_NAME} result</sen:subject><sen:content>Please refer to ${BUILD_REPORT_URL}</sen:content><sen:to>ida-mock@cn.ibm.com</sen:to><sen:cc>ida-mock@cn.ibm.com</sen:cc></sen:send></soap:Body></soap:Envelope>" http://[serverhost]:[port]/teamworks/webservices/HSS/SendEmailWS.tws*
![][pipeline_email_script]

<br>
**Call wsadmin command**
<br>
<br>
You can execute a wsadmin command in a Script. The wsadmin command is running against the BAW server associated with the Stage Workflow configuration. For example,

*ssh AdminTask.BPMSetEnvironmentVariable('[-containerAcronym ${APP_ACRONYM} -containerSnapshotAcronym ${SNAPSHOT_ACRONYM} -environmentVariableName TEST_KEY -environmentVariableValue 8899]')*

This Script first logs on to the BAW server using ssh, then executes the wsadmin command there to update the Workflow environment variable. The format of the Script to call a wsadmin command is

**ssh** + space + **wsadmin command**

We also support executing script files for wsadmin commands, including parameters. For example,

*ssh -f /tmp/bpmtask.py*

*ssh -f bpmtask.py*

*ssh -containerAcronym BTAS -containerSnapshotAcronym T1 -f /tmp/bpmtask.py*

*ssh -containerAcronym ${APP_ACRONYM} -containerSnapshotAcronym ${SNAPSHOT_ACRONYM} -f /tmp/bpmtask.py*

The script file has a .py extension to reflect the Jython language syntax of the script. The example below shows a two-line Jython script file named bpmtask.py.

```
print "This script is used to set BAW EnvironmentVariable"
AdminTask.BPMSetEnvironmentVariable('[-containerAcronym BTAS -containerSnapshotAcronym TS -environmentVariableName TEST_KEY -environmentVariableValue 98744]')
```
### Notes
- If you do not specify the script file path, it will use the BAW deployment remote directory as your script path, which is defined in the IDA setting page. Also, you need to put this script file in the specified folder on the BAW server before running the pipeline.
- ${APP_ACRONYM} and ${SNAPSHOT_ACRONYM} parameters will be replaced at runtime.

The format of the script file to call a wsadmin command is

**ssh** + space + **-f** + space + **scriptFileName**
**ssh** + space + **Parameters** + space + **-f** + space + **scriptFileName**

[pipeline_create_script]: ../images/pipeline/pipeline_create_script.png
[pipeline_email_script]: ../images/pipeline/pipeline_email_script.png