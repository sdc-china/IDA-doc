---
title: "IDA REST APIs"
category: references
date: 2018-11-07 15:17:55
last_modified_at: 2026-05-12 16:00:00
---

# IDA REST APIs
***

IDA REST APIs references.

## Swagger URL
    http://[serverhost]:[port]/ida/swagger-ui/index.html
    http://[serverhost]:[port]/ida/v2/api-docs

![][swagger_ui]

## Authentication

IDA REST APIs support basic authentication. 

## Pipeline
- **[<code>GET /rest/v2/pipelines</code> Get pipeline list.](#get-pipeline-list)**
- **[<code>GET /rest/v2/pipelines/metadata?pipelineId=:id(?pipelineName=:name)</code> Get pipeline metadata.](#get-pipeline-metadata)**
- **[<code>POST /rest/v2/pipelines/builds?pipelineId=:id(?pipelineName=:name)</code>  Trigger pipeline build.](#trigger-pipeline-build)**
- **[<code>PUT /rest/v2/pipelines/builds/{buildId}</code> Operate on pipeline build.](#operate-on-pipeline-build)**
- **[<code>GET /rest/v2/pipelines/builds/{buildId}</code> Get pipeline build status.](#get-pipeline-build-status)**



### **Get Pipeline List**
___
Get the list of pipelines user can access.

**URL:**

```
/rest/v2/pipelines
```

**Method:**  ```GET```


**Parameters:**
No parameters.

**Example:**

Request
```
  curl -X GET "https://[serverhost]:[port]/ida/rest/v2/pipelines" -H "accept: application/json;charset=UTF-8"
```

Response
``` json
{
  "pipelines": [
    {
      "pipelineId": 33,
      "pipelineName": "Checkstyle Only"
    },
    {
      "pipelineId": 1,
      "pipelineName": "HSS Pipeline"
    },
    {
      "pipelineId": 65,
      "pipelineName": "Snapshot"
    }
  ]
}
```

### **Get Pipeline Metadata**
___
Get pipeline metadata that can be overwritten when invoking the [Trigger Pipeline Build REST API](#trigger-pipeline-build). Specify either pipeline id or name to get pipeline metadata.

**URL:**

```
/rest/v2/pipelines/metadata
```

**Method:**  ```GET```


**Parameters:**

| Name | Required                        | Description        |
|----------------|------------|--------------|
| `pipelineId`   | No          | Pipeline id. <br>You could get the pipeline id from the [Get Pipeline List REST API](#get-pipeline-list). |
| `pipelineName` | No          | Pipeline name. <br>You could get the pipeline name from the [Get Pipeline List REST API](#get-pipeline-list). |

**Example:**

Request
```
  curl -X GET "https://[serverhost]:[port]/ida/rest/v2/pipelines/metadata?pipelineId=1" -H "accept: application/json;charset=UTF-8"
```
   or
```
  curl -X GET "https://[serverhost]:[port]/ida/rest/v2/pipelines/metadata?pipelineName=HSS%20Pipeline" -H "accept: application/json;charset=UTF-8"
```

Response
``` json
{
  "container": "",
  "snapshotAcronym": "",
  "branchName": "",
  "installFileName": "",
  "stages": [
    {
      "name": "Development",
      "steps": [
        {
          "name": "Snapshot",
          "params": {
            "namingConvention": "{MAJOR.MINOR.PATCH} - {APP_ACRONYM} {TRACK} {yyyyMMddHHmmss}"
          }
        },
        {
          "name": "Checkstyle",
          "params": {
            "tip": false,
            "healthScoreThreshold": 20,
            "warningsThreshold": 200,
            "ignoreDocCheck": true,
            "ignoreJsCheck": true,
            "ignoreToolkitsCheck": true,
            "haltOnFailure": true
          }
        },
        {
          "name": "Test",
          "params": {
            "testProjectId": 4,
            "tip": true,
            "haltOnFailure": true
          }
        }
      ],
      "serverName": "BAW2301 Dev Server"
    },
    {
      "name": "Test",
      "steps": [
        {
          "name": "Test",
          "params": {
            "testProjectId": 4,
            "tip": true,
            "haltOnFailure": true
          }
        }
      ],
      "serverName": "BAW2301 QA Server"
    }
  ]
}
```

### **Trigger Pipeline Build**
___
Start a pipeline build by pipeline id or name. Specify either pipeline id or name to start a build.

**URL:**

```
/rest/v2/pipelines/builds
```

**Method:**  ```POST```


**Parameters:**

| Name | Required                        | Description        |
|----------------|------------|--------------|
| `pipelineId`   | No          | Pipeline ID. <br>You could get the pipeline ID from the [Get Pipeline List REST API](#get-pipeline-list). |
| `pipelineName` | No          | Pipeline name. <br>You could get the pipeline name from the [Get Pipeline List REST API](#get-pipeline-list). |
| `pipelineRestInput`   | No          |  **Please copy response from the [Get Pipeline Metadata REST API](#get-pipeline-metadata) and then overwrite parameter values if needed.** Parameter values that can be overwritten include: <br>**container:** the acronym of a process application/toolkit used to trigger a build.<br>**snapshotAcronym:** the snapshot acronym of the process app/toolkit.<br>**branchName:** the track name of the process app/toolkit. <br>Either snapshotAcronym or branchName can be specified. If branchName is specified, the latest snapshot on that branch will be used to start the build. If no **container**/**snapshotAcronym**/**branchName**, the snapshot configured in the pipeline definition will be used to start the build.<br>**installFileName:** the Workflow installation package file name to be deployed.<br><br>For a pipeline stage, **serverName** can be overwritten. Please note a valid serverName must be selectable when you manually edit the pipeline. *Supported from IDA v24.0.9.*<br><br>For a Snapshot step, **namingConvention** can be overwritten.<br>For a Checkstyle step, all Checkstyle options e.g. **tip**, **healthScoreThreshold**, **warningsThreshold**, **ignoreDocCheck**, **ignoreJsCheck**, **ignoreToolkitsCheck**, **haltOnFailure** can be overwritten.<br>For a Test step, **tip**, **testProjectId** and **haltOnFailure** can be overwritten. Specify a test project ID of the triggering process app/toolkit.<br>For a Deployment step, **deploymentDateTime**, **deploymentReason** can be overwritten. The **deploymentDateTime** should be written in UTC format, e.g. 2025-04-02T17:00Z.|

**Example:**

Request
```
  curl -X POST "https://[serverhost]:[port]/ida/rest/v2/pipelines/builds?pipelineId=1" -H "accept: application/json;charset=UTF-8" -H "Content-Type: application/json" -d "{\"container\":\"ISA\", \"snapshotAcronym\":\"0.00.06\", \"branchName\":\"\", \"installFileName\":\"\", \"stages\":[{\"name\":\"Development\", \"steps\":[{\"name\":\"Snapshot\", \"params\":{\"namingConvention\":\"{MAJOR.MINOR.PATCH} - {APP_ACRONYM} {TRACK} {yyyyMMddHHmmss}\"}}, {\"name\":\"Checkstyle\", \"params\":{\"tip\":false, \"healthScoreThreshold\":20, \"warningsThreshold\":200, \"ignoreDocCheck\":true, \"ignoreJsCheck\":true, \"ignoreToolkitsCheck\":true, \"haltOnFailure\":false}}, {\"name\":\"Test\", \"params\":{\"testProjectId\":56, \"tip\":true, \"haltOnFailure\":true}}], \"serverName\":\"BAW2301 Dev Server\"}, {\"name\":\"Test\", \"steps\":[{\"name\":\"Test\", \"params\":{\"testProjectId\":56, \"tip\":true, \"haltOnFailure\":true}}], \"serverName\":\"BAW2302 QA Server\"}]}"
```
  or
```
  curl -X POST "https://[serverhost]:[port]/ida/rest/v2/pipelines/builds?pipelineName=HSS%20Pipeline" -H "accept: application/json;charset=UTF-8" -H "Content-Type: application/json" -d "{\"container\":\"ISA\", \"snapshotAcronym\":\"0.00.06\", \"branchName\":\"\", \"installFileName\":\"\", \"stages\":[{\"name\":\"Development\", \"steps\":[{\"name\":\"Snapshot\", \"params\":{\"namingConvention\":\"{MAJOR.MINOR.PATCH} - {APP_ACRONYM} {TRACK} {yyyyMMddHHmmss}\"}}, {\"name\":\"Checkstyle\", \"params\":{\"tip\":false, \"healthScoreThreshold\":20, \"warningsThreshold\":200, \"ignoreDocCheck\":true, \"ignoreJsCheck\":true, \"ignoreToolkitsCheck\":true, \"haltOnFailure\":false}}, {\"name\":\"Test\", \"params\":{\"testProjectId\":56, \"tip\":true, \"haltOnFailure\":true}}], \"serverName\":\"BAW2301 Dev Server\"}, {\"name\":\"Test\", \"steps\":[{\"name\":\"Test\", \"params\":{\"testProjectId\":56, \"tip\":true, \"haltOnFailure\":true}}], \"serverName\":\"BAW2302 QA Server\"}]}"
```

Response
``` json
{
  "pipelineId": 1,
  "pipelineName": "HSS Pipeline",
  "buildId": 674,
  "teamName": "Private",
  "status": "Running"
}
```

### **Operate On Pipeline Build**
___
Operate on a pipeline build by build ID.

**URL:**

```
/rest/v2/pipelines/builds/{buildId}
```

**Method:**  ```PUT```


**Parameter:**

| Name | Required                        | Description        |
|----------------|------------|--------------|
| `buildId`   | Yes          | Build ID. <br>You could get the build ID from the response of the [Trigger Pipeline Build REST API](#trigger-pipeline-build). |
| `action`   | Yes          | Supported actions: approve, reject, resume.|

**Example:**

Request
```
  curl -X PUT "https://[serverhost]:[port]/ida/rest/v2/pipelines/builds/223178?action=approve" -H "accept: application/json;charset=UTF-8"
```
Response
``` json
{
  "pipelineId": 222556,
  "pipelineName": "HSS Pipeline",
  "status": "Running"
}
```

### **Get Pipeline Build Status**
___
Get a pipeline build status by build ID.

**URL:**

```
/rest/v2/pipelines/builds/{buildId}
```

**Method:**  ```GET```


**Parameter:**

| Name | Required                        | Description        |
|----------------|------------|--------------|
| `buildId`   | Yes          | Build ID. <br>You could get the build ID from the response of the [Trigger Pipeline Build REST API](#trigger-pipeline-build). |
| `parts`   | No          | Specify value "all" to get detailed build status including detailed build logs and test case results.|


**Example:**

Request
```
  curl -X GET "https://[serverhost]:[port]/ida/rest/v2/pipelines/builds/6860?parts=all" -H "accept: application/json;charset=UTF-8"
```
Response
``` json
{
  "status": "Success",
  "pipelineId": 127,
  "pipelineName": "Hiring Sample Pipeline",
  "triggerBy": "system",
  "report": "https://ida-demo1.fyre.ibm.com:9443/ida/pipelines/127/builds/6860/report",
  "logs": "28 Apr 2026 21:30:00,328 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: ======Start to run pipeline======\n28 Apr 2026 21:30:00,344 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: Pipeline ID:127\n28 Apr 2026 21:30:00,344 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: Pipeline Name:Hiring Sample Pipeline\n28 Apr 2026 21:30:00,344 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: Trigger By:system\n28 Apr 2026 21:30:00,392 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: Triggering pipelineRestInput:{\"PipelineRestInput\":{\"toolkit\":false,\"stages\":[\"\"]}}\n28 Apr 2026 21:30:00,393 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: Trigger Time:20260428213000\n28 Apr 2026 21:30:00,394 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: =================================\n28 Apr 2026 21:30:04,217 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_6860]: App Type: Business Automation\n28 Apr 2026 21:30:04,854 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: Start to execute pipeline step(name: Checkstyle, type: Checkstyle) in stage(name: Process Center,type: DEV,toolkit: false,processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,snapshotId: 2064.5ea373ed-f512-47b4-bb4e-d0e445d804db), exeuctionParam(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,branchName: Main,snapshotId: 2064.5ea373ed-f512-47b4-bb4e-d0e445d804db,snapshotAcronym: 0.00.08,appType: Business Automation)\n28 Apr 2026 21:30:05,138 com.ibm.cte.sdc.bpm.testing.executor.pipeline.CheckstyleStepExecutor [INFO ] [pipelineBuild_6860]: Start to run checkstyle with args: ProcessAppId=2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, BranchId=2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e, SnapshotId=null, Tip=true\n28 Apr 2026 21:30:05,582 com.ibm.cte.sdc.bpm.checkstyle.service.CheckstyleService [DEBUG] [pipelineBuild_6860]: Exporting snapshot to /sdc-nfs/ida-data/demo-data/twx/9.30.43.59_9443/2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0/2064.754457c3-3b60-473c-a356-4907acd8a0b1.twx by swagger API\n28 Apr 2026 21:30:13,146 com.ibm.cte.sdc.bpm.checkstyle.service.CheckstyleService [DEBUG] [pipelineBuild_6860]: Exported snapshot to /sdc-nfs/ida-data/demo-data/twx/9.30.43.59_9443/2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0/2064.754457c3-3b60-473c-a356-4907acd8a0b1.twx by swagger API, it takes 8.000383185 seconds.\n28 Apr 2026 21:30:13,164 com.ibm.websphere.bpm.checkstyle.TWXFileChecker [DEBUG] [pipelineBuild_6860]: checkstyle.properties not found in WEB\n28 Apr 2026 21:30:13,407 com.ibm.cte.sdc.bpm.checkstyle.executor.CheckstyleExecutor [INFO ] [pipelineBuild_6860]: Execute Checkstyle with uploadPath:/sdc-nfs/ida-data/demo-data/twx, docId:9.30.43.59_9443/2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0/2064.754457c3-3b60-473c-a356-4907acd8a0b1.twx, styleRulePath:null, twx:/sdc-nfs/ida-data/demo-data/twx/9.30.43.59_9443/2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0/2064.754457c3-3b60-473c-a356-4907acd8a0b1.twx\n28 Apr 2026 21:30:13,409 com.ibm.cte.sdc.bpm.checkstyle.service.TWXFileEmbeddedChecker [DEBUG] [pipelineBuild_6860]: BPM checkstyle embedded started. Input twx = /sdc-nfs/ida-data/demo-data/twx/9.30.43.59_9443/2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0/2064.754457c3-3b60-473c-a356-4907acd8a0b1.twx.\n28 Apr 2026 21:30:21,283 com.ibm.websphere.bpm.twx.TwxReaderServiceImpl [DEBUG] [pipelineBuild_6860]: Load Process App in /sdc-nfs/ida-data/demo-data/twx/9.30.43.59_9443/2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0/2064.754457c3-3b60-473c-a356-4907acd8a0b1.twx  takes 7872 milliseconds\n28 Apr 2026 21:30:29,622 com.ibm.cte.sdc.bpm.checkstyle.service.TWXFileEmbeddedChecker [INFO ] [pipelineBuild_6860]: End invoking decision service. Count of check messages: 22.\n28 Apr 2026 21:30:30,011 com.ibm.cte.sdc.baw.statistic.BawStatServiceImpl [DEBUG] [pipelineBuild_6860]: The case artifact file is null, skip the case artifact analysis!\n28 Apr 2026 21:30:30,301 com.ibm.websphere.bpm.util.FileUtils [DEBUG] [pipelineBuild_6860]: write file /sdc-nfs/ida-data/demo-data/pipeline/checkstyle/127/build_6860/9.30.43.59_9443/2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0/Tip/1777437013408/CheckstyleReport.csv\n28 Apr 2026 21:30:30,303 com.ibm.cte.sdc.bpm.checkstyle.service.TWXFileEmbeddedChecker [INFO ] [pipelineBuild_6860]: Report generated. BPM checkstyle ended\n28 Apr 2026 21:30:30,304 com.ibm.cte.sdc.bpm.checkstyle.executor.CheckstyleExecutor [DEBUG] [pipelineBuild_6860]: Execute Checkstyle takes 16.896509839 seconds with parameters:  uploadPath:/sdc-nfs/ida-data/demo-data/twx, docId:9.30.43.59_9443/2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0/2064.754457c3-3b60-473c-a356-4907acd8a0b1.twx, styleRulePath:null, twx:/sdc-nfs/ida-data/demo-data/twx/9.30.43.59_9443/2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0/2064.754457c3-3b60-473c-a356-4907acd8a0b1.twx\n28 Apr 2026 21:30:30,342 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: End pipeline step execution.\n28 Apr 2026 21:30:30,468 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: Start to execute pipeline step(name: Unit Test, type: Test) in stage(name: Process Center,type: DEV,toolkit: false,processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,snapshotId: 2064.5ea373ed-f512-47b4-bb4e-d0e445d804db), exeuctionParam(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,branchName: Main,snapshotId: 2064.5ea373ed-f512-47b4-bb4e-d0e445d804db,snapshotAcronym: 0.00.08,appType: Business Automation)\n28 Apr 2026 21:30:30,492 com.ibm.cte.sdc.bpm.testing.executor.pipeline.TestStepExecutor [INFO ] [pipelineBuild_6860]: Start to run tests with args: projectName=Simple Test, ProcessAppId=2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, BranchId=2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e, SnapshotId=2064.5ea373ed-f512-47b4-bb4e-d0e445d804db, Tip=true\n28 Apr 2026 21:30:33,089 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_6860]: The tip snapshot id is 2064.754457c3-3b60-473c-a356-4907acd8a0b1, search by appId 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0 and branchId 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e from server https://9.30.43.59:9443\n28 Apr 2026 21:30:34,356 com.ibm.cte.sdc.baw.analysis.icm.service.ContentEngineService [DEBUG] [pipelineBuild_6860]: Folder /IBM Case Manager/Solutions/Hiring Sample/ not found.Failed to get the solution definition from bpmConfig https://9.30.43.59:9443 from object store dos, it is not a case solution project.\n28 Apr 2026 21:30:34,357 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_6860]: Start to get dependency toolkits\n28 Apr 2026 21:30:34,382 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_6860]: The number of dependency toolkits is 3\n28 Apr 2026 21:30:34,469 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_6860]: Complete geting dependency toolkits\n28 Apr 2026 21:30:34,521 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_6860]: Start to load BPD item Standard HR Open New Position:25.c904b3b1-afc1-4698-bf5a-a20892c20275 diagram information from app 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, track 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e, snapshot 2064.754457c3-3b60-473c-a356-4907acd8a0b1\n28 Apr 2026 21:30:34,667 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_6860]: Start to load service item Requisition CV Validation:1.7ae7e89c-6f6f-4eb0-87ea-cd61531dfc54 diagram information from app 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, track 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e, snapshot 2064.754457c3-3b60-473c-a356-4907acd8a0b1\n28 Apr 2026 21:30:34,817 com.ibm.cte.sdc.bpm.testing.executor.DefaultTaskExecutor [DEBUG] [pipelineBuild_6860]: Register thread pool SeleniumGrid_9_30_223_94_4444_wd_hub_firefox, the pool size is 10\n28 Apr 2026 21:30:34,860 com.ibm.cte.sdc.bpm.testing.service.TestCaseService [DEBUG] [pipelineBuild_6860_testcase_4191]: Running test case case1\n28 Apr 2026 21:30:35,060 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4191]: Start executing the test case with id 4191 and name case1\n28 Apr 2026 21:30:35,108 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4191]: Generate description for command:Command [id=58, name=startServiceFlow, executionType=null, project=null]\n28 Apr 2026 21:30:35,120 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4191]: Generate description for command:Command [id=3, name=debug, executionType=null, project=null]\n28 Apr 2026 21:30:39,771 com.ibm.cte.sdc.bpm.testing.util.BpmUtils [INFO ] [pipelineBuild_6860_testcase_4191]: The BAW login url is https://9.30.43.59:9443/teamworks/login.jsp and the login command is LoginOnPrem\n28 Apr 2026 21:30:39,772 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4191]: [case1]#ID:[4191] - Running the case step with index [1], associate command [Command [id=58, name=startServiceFlow, executionType=null]], parameters [{\"exception\":false,\"user\":\"\",\"service\":\"Requisition CV Validation\",\"params\":\"{\\n\\\"positionDate\\\":\\\"2026-08-19T00:00:00Z\\\",\\n\\\"positionType\\\":\\\"fulltime\\\",\\n\\\"positionLocation\\\":\\\"dallas\\\",\\n\\\"positionStatus\\\":\\\"new\\\",\\n\\\"positionDepartment\\\":\\\"marketing\\\"\\n}\",\"expectedOutput\":\"{\\n\\t\\\"coachValidation\\\": {\\n\\t\\t\\\"validationErrors\\\": {\\n\\t\\t\\t\\\"selected\\\": [],\\n\\t\\t\\t\\\"items\\\": []\\n\\t\\t}\\n\\t}\\n}\",\"toolkitName\":\"\",\"jsonPath\":\"\",\"variableName\":\"\"}], parent parameters [null] and case data [null], assignee []\n28 Apr 2026 21:30:39,787 com.ibm.cte.sdc.bpm.testing.command.bpm.StartServiceFlow [DEBUG] [pipelineBuild_6860_testcase_4191]: start service flow, processItem.isInvokedAsynchronously():false, processItem.isTransactionalFlow(): false, createTask: false.\n28 Apr 2026 21:30:40,041 com.ibm.cte.sdc.bpm.testing.util.BpmUtils [DEBUG] [pipelineBuild_6860_testcase_4191]: Get tip snapshot id 2064.754457c3-3b60-473c-a356-4907acd8a0b1 by branchId 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e from server https://9.30.43.59:9443\n28 Apr 2026 21:30:40,800 com.ibm.cte.sdc.bpm.testing.util.BpmUtils [DEBUG] [pipelineBuild_6860_testcase_4191]: Get tip snapshot id 2064.754457c3-3b60-473c-a356-4907acd8a0b1 by branchId 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e from server https://9.30.43.59:9443\n28 Apr 2026 21:30:41,057 com.ibm.websphere.bpm.api.rest.RestAPIClient [DEBUG] [pipelineBuild_6860_testcase_4191]: Started service {\"status\":\"200\",\"data\":{\"serviceStatus\":\"end\",\"key\":\"@41\",\"step\":\"End\",\"reset\":false,\"stepId\":null,\"poId\":null,\"processItemId\":null,\"data\":{\"result\":{\"message\":\"The IDA Toolkit is installed.\",\"status\":\"Success\"}},\"coach\":null,\"coachEvals\":null,\"actions\":null,\"actionsMap\":null}}\n28 Apr 2026 21:30:41,661 com.ibm.websphere.bpm.api.rest.RestAPIClient [DEBUG] [pipelineBuild_6860_testcase_4191]: Started service {\"status\":\"200\",\"data\":{\"serviceStatus\":\"end\",\"key\":\"@42\",\"step\":\"End\",\"reset\":false,\"stepId\":null,\"poId\":null,\"processItemId\":null,\"data\":{\"result\":{\"data\":{\"coachValidation\":{\"@metadata\":{\"objectID\":\"9c358719-53cd-4fea-832b-125dfb01943a-12697-1777437040677\",\"dirty\":true,\"invalid\":false,\"shared\":false,\"rootVersionContextID\":\"2064.1080ded6-d153-4654-947c-2d16fce170db\",\"className\":\"CoachValidation\",\"contentObject\":false},\"validationErrors\":{\"selected\":[],\"items\":[],\"@metadata\":{\"objectID\":\"9c358719-53cd-4fea-832b-125dfb01943a-12697-1777437040680\",\"dirty\":false,\"invalid\":false,\"shared\":false,\"contentObject\":false}}}},\"status\":\"Success\"}},\"coach\":null,\"coachEvals\":null,\"actions\":null,\"actionsMap\":null}}\n28 Apr 2026 21:30:41,665 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4191]: [case1]#ID:[4191] - Running the case step with index [2], associate command [Command [id=3, name=debug, executionType=null]], parameters [{}], parent parameters [null] and case data [null], assignee []\n28 Apr 2026 21:30:41,672 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_6860_testcase_4191]: Debug log is: null\n28 Apr 2026 21:30:42,655 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4191]: End with executing the test case with id 4191 and name case1!\n28 Apr 2026 21:30:43,045 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: End pipeline step execution.\n28 Apr 2026 21:30:43,206 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: Start to execute pipeline step(name: Take Snapshot, type: Snapshot) in stage(name: Process Center,type: DEV,toolkit: false,processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,snapshotId: 2064.5ea373ed-f512-47b4-bb4e-d0e445d804db), exeuctionParam(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,branchName: Main,snapshotId: 2064.5ea373ed-f512-47b4-bb4e-d0e445d804db,snapshotAcronym: 0.00.08,appType: Business Automation)\n28 Apr 2026 21:30:44,453 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_6860]: The last snapshot name is 0.00.12 - HSS Main 20260427213044\n28 Apr 2026 21:30:44,454 com.ibm.websphere.bpm.util.StringUtils [DEBUG] [pipelineBuild_6860]: nextVersion: 0.00.13\n28 Apr 2026 21:30:44,454 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_6860]: The next version is 0.00.13\n28 Apr 2026 21:30:44,455 com.ibm.cte.sdc.bpm.testing.executor.pipeline.SnapshotStepExecutor [INFO ] [pipelineBuild_6860]: Start to take snapshot with args: BranchId=2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e, snapshotName=0.00.13 - HSS Main 20260428213043\n28 Apr 2026 21:30:47,483 com.ibm.cte.sdc.bpm.testing.service.PipelineService [DEBUG] [pipelineBuild_6860]: update pipeline last trigger time: 2026-04-28T21:30:43.000-0700\n28 Apr 2026 21:30:47,484 com.ibm.cte.sdc.bpm.testing.executor.pipeline.SnapshotStepExecutor [INFO ] [pipelineBuild_6860]: Run pipeline with a new snapshot: [0.00.13 - HSS Main 20260428213043, 2064.da847473-46ca-493e-bde1-2f72f1c481b0, 0.00_11]\n28 Apr 2026 21:30:47,504 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: End pipeline step execution.\n28 Apr 2026 21:30:47,884 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: ======Pending at stage Process Server. Approvers: idaAdmin,idaDemo3,idaDemo5.======\n28 Apr 2026 21:30:48,038 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [DEBUG] [pipelineBuild_6860]: Start to send email notification: subject:Build 6860 of pipeline Hiring Sample Pipeline: Pending, to:[weiweixu@cn.ibm.com], cc:null, bcc:null, message:Build 6860 of pipeline Hiring Sample Pipeline: Pending.<p>View detailed pipeline build report at: https://ida-demo1.fyre.ibm.com:9444/ida/pipelines/127/builds/6860.</p>, build:6860, pipeline:Hiring Sample Pipeline.\n29 Apr 2026 17:36:56,269 com.ibm.cte.sdc.bpm.testing.service.BuildService [INFO ] [pipelineBuild_6860]: Build #4 is approved by user idaDemo5.\n29 Apr 2026 17:36:59,352 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: ======Resume pipeline on stage Process Server======\n29 Apr 2026 17:36:59,934 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [WARN ] [pipelineBuild_6860]: Can't find snapshot configured in the stage(name: Process Server,type: QA,toolkit: false), executionParams(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,branchName: Main,snapshotId: 2064.da847473-46ca-493e-bde1-2f72f1c481b0,snapshotAcronym: 0.00_11,appType: Business Automation)\n29 Apr 2026 17:37:00,370 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: Start to execute pipeline step(name: Deployment, type: Deployment) in stage(name: Process Server,type: QA,toolkit: false,processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0), exeuctionParam(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchName: Main,snapshotAcronym: 0.00_11,appType: Business Automation)\n29 Apr 2026 17:37:00,736 com.ibm.cte.sdc.bpm.testing.service.QuartzJobService [INFO ] [pipelineBuild_6860]: Schedule job for jobName:127-6860, jobGroup:ScheduledPipelineBuildDeployment, schedule time:null, schedule type:DoesNotRepeat, schedule start time:2026-04-29T18:00:00.000-0700, schedule end time:null\n29 Apr 2026 17:37:00,750 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: End pipeline step execution.\n29 Apr 2026 17:37:00,750 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: ======The build is pending at step Deployment of stage Process Server and will start deployment at 2026-04-30T01:00Z.======\n29 Apr 2026 17:37:00,933 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [DEBUG] [pipelineBuild_6860]: Start to send email notification: subject:Build 6860 of pipeline Hiring Sample Pipeline: Pending, to:[weiweixu@cn.ibm.com, weiweixu@cn.ibm.com], cc:null, bcc:null, message:Build 6860 of pipeline Hiring Sample Pipeline: Pending.<p>View detailed pipeline build report at: https://ida-demo1.fyre.ibm.com:9444/ida/pipelines/127/builds/6860.</p>, build:6860, pipeline:Hiring Sample Pipeline.\n29 Apr 2026 18:00:03,088 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: ======Resume pipeline on stage Process Server======\n29 Apr 2026 18:00:03,629 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [WARN ] [pipelineBuild_6860]: Can't find snapshot configured in the stage(name: Process Server,type: QA,toolkit: false,processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0), executionParams(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchName: Main,snapshotAcronym: 0.00_11,appType: Business Automation)\n29 Apr 2026 18:00:04,095 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: ======Resume pipeline on step Deployment======\n29 Apr 2026 18:00:04,215 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: Start to execute pipeline step(name: Deployment, type: Deployment) in stage(name: Process Server,type: QA,toolkit: false,processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0), exeuctionParam(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchName: Main,snapshotAcronym: 0.00_11,appType: Business Automation)\n29 Apr 2026 18:00:05,508 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [WARN ] [pipelineBuild_6860]: Failed to get snapshot 0.00_11 of process app HSS from BAW server:https://9.30.57.148:9443, due to: Bad Request, the respone code is 400 with method as GET,\n{\"error_number\":\"CWTBG0646E\",\"error_message\":\"CWTBG0646E: Snapshot '0.00_11' specified for parameter 'version' does not exist.\",\"error_message_parameters\":[\"0.00_11\",\"version\"]}\n29 Apr 2026 18:00:05,510 com.ibm.cte.sdc.bpm.testing.executor.pipeline.DeploymentStepExecutor [INFO ] [pipelineBuild_6860]: Start the online deployment with args: ProcessApp=HSS, snapshotName=0.00_11\n29 Apr 2026 18:00:05,511 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_6860]: Start to install snapshot 0.00_11 of process app HSS from https://9.30.43.59:9443 to BPMProcessServer with targetEnvironmentName Workflow Default Target Environment\n29 Apr 2026 18:00:05,867 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_6860]: Installed snapshot 0.00_11 of process app HSS from https://9.30.43.59:9443 to BPMProcessServer with targetEnvironmentName Workflow Default Target Environment, result:null\n29 Apr 2026 18:00:05,868 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [DEBUG] [pipelineBuild_6860]: Start to check the snapshot 0.00_11 is installed or not, the request will timeout after 600 seconds\n29 Apr 2026 18:00:06,150 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [WARN ] [pipelineBuild_6860]: Failed to get snapshot 0.00_11 of process app HSS from BAW server:https://9.30.57.148:9443, due to: Bad Request, the respone code is 400 with method as GET,\n{\"error_number\":\"CWTBG0646E\",\"error_message\":\"CWTBG0646E: Snapshot '0.00_11' specified for parameter 'version' does not exist.\",\"error_message_parameters\":[\"0.00_11\",\"version\"]}\n29 Apr 2026 18:00:36,150 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [DEBUG] [pipelineBuild_6860]: Recheck the snapshot 0.00_11 intallation status for the 1 time\n29 Apr 2026 18:00:36,470 com.ibm.cte.sdc.bpm.testing.executor.pipeline.DeploymentStepExecutor [INFO ] [pipelineBuild_6860]: Snapshot 0.00_11 is installed to server https://9.30.57.148:9443.\n29 Apr 2026 18:00:37,125 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_6860]: Start to set default snapshot for snapshot 0.00_11 of process app HSS.\n29 Apr 2026 18:00:37,472 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [DEBUG] [pipelineBuild_6860]: Start to check the snapshot 0.00_11 is set to default or not, the request will timeout after 600 seconds\n29 Apr 2026 18:00:37,846 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_6860]: Set default snapshot for snapshot 0.00_11 of process app HSS.\n29 Apr 2026 18:00:37,846 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_6860]: Start to sync environment variables from snapshot 0.00_10 to 0.00_11 for process app HSS.\n29 Apr 2026 18:00:38,141 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_6860]: Start to check BAW Queue status, Queue url: https://9.30.57.148:9443/ops/system/queue/4906?key=af530c924d6e8930ba130ca17b32915a, the request will timeout after 600 seconds\n29 Apr 2026 18:00:38,156 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_6860]: Queue status: {state=running, last_modified=2026-04-30T01:00:38.134Z}\n29 Apr 2026 18:01:08,177 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_6860]: Recheck BAW Queue status for the 1 time, Queue status: {state=success, last_modified=2026-04-30T01:00:38.165Z, result={Message=The environment variables of '0.00_11' target snapshot were successfully synchronized with '0.00_10' source snapshot., status=success}}\n29 Apr 2026 18:01:08,178 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_6860]: Synced environment variables, result: {state=success, last_modified=2026-04-30T01:00:38.165Z, result={Message=The environment variables of '0.00_11' target snapshot were successfully synchronized with '0.00_10' source snapshot., status=success}}\n29 Apr 2026 18:01:08,178 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_6860]: Start to sync EPVs from snapshot 0.00_10 to 0.00_11 for process app HSS.\n29 Apr 2026 18:01:08,544 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_6860]: Start to check BAW Queue status, Queue url: https://9.30.57.148:9443/ops/system/queue/4907?key=b061a81ddcea32733ea144f737798638, the request will timeout after 600 seconds\n29 Apr 2026 18:01:08,560 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_6860]: Queue status: {state=success, last_modified=2026-04-30T01:01:08.551Z, result={Message=The EPVs of '0.00_11' target snapshot were successfully synchronized with '0.00_10' source snapshot., status=success}}\n29 Apr 2026 18:01:08,561 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_6860]: Synced EPVs, result: {state=success, last_modified=2026-04-30T01:01:08.551Z, result={Message=The EPVs of '0.00_11' target snapshot were successfully synchronized with '0.00_10' source snapshot., status=success}}\n29 Apr 2026 18:01:08,561 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_6860]: Start to sync team bindings from snapshot 0.00_10 to 0.00_11 for process app HSS.\n29 Apr 2026 18:01:08,907 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_6860]: Start to check BAW Queue status, Queue url: https://9.30.57.148:9443/ops/system/queue/4908?key=f05c890d13efc19d2da04263de5fab18, the request will timeout after 600 seconds\n29 Apr 2026 18:01:08,921 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_6860]: Queue status: {state=running, last_modified=2026-04-30T01:01:08.901Z}\n29 Apr 2026 18:01:38,940 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_6860]: Recheck BAW Queue status for the 1 time, Queue status: {state=success, last_modified=2026-04-30T01:01:08.950Z, result={Message='0.00_11' target snapshot was successfully synchronized with '0.00_10' source snapshot., status=success}}\n29 Apr 2026 18:01:38,941 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_6860]: Synced team bindings, result: {state=success, last_modified=2026-04-30T01:01:08.950Z, result={Message='0.00_11' target snapshot was successfully synchronized with '0.00_10' source snapshot., status=success}}\n29 Apr 2026 18:01:38,974 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: End pipeline step execution.\n29 Apr 2026 18:01:39,129 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: Start to execute pipeline step(name: Functional Test, type: Test) in stage(name: Process Server,type: QA,toolkit: false,processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,branchId: 2063.99cd37fd-4169-4464-a509-5e2d613f13dd,snapshotId: 2064.da847473-46ca-493e-bde1-2f72f1c481b0), exeuctionParam(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchId: 2063.99cd37fd-4169-4464-a509-5e2d613f13dd,branchName: 0.00.13 - HSS Main 20260428213043,snapshotId: 2064.da847473-46ca-493e-bde1-2f72f1c481b0,snapshotAcronym: 0.00_11,appType: Business Automation)\n29 Apr 2026 18:01:39,134 com.ibm.cte.sdc.bpm.testing.executor.pipeline.TestStepExecutor [INFO ] [pipelineBuild_6860]: Start to run tests with args: projectName=Simple Test, ProcessAppId=2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, BranchId=2063.99cd37fd-4169-4464-a509-5e2d613f13dd, SnapshotId=2064.da847473-46ca-493e-bde1-2f72f1c481b0, Tip=true\n29 Apr 2026 18:01:40,577 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_6860]: The tip snapshot id is 2064.da847473-46ca-493e-bde1-2f72f1c481b0, search by appId 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0 and branchId 2063.99cd37fd-4169-4464-a509-5e2d613f13dd from server https://9.30.57.148:9443\n29 Apr 2026 18:01:41,054 com.ibm.cte.sdc.baw.analysis.icm.service.ContentEngineService [DEBUG] [pipelineBuild_6860]: Folder /IBM Case Manager/Solutions/Hiring Sample/ not found.Failed to get the solution definition from bpmConfig https://9.30.57.148:9443 from object store dos, it is not a case solution project.\n29 Apr 2026 18:01:41,054 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_6860]: Start to get dependency toolkits\n29 Apr 2026 18:01:41,075 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_6860]: The number of dependency toolkits is 3\n29 Apr 2026 18:01:41,212 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_6860]: Complete geting dependency toolkits\n29 Apr 2026 18:01:41,238 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_6860]: Start to load BPD item Standard HR Open New Position:25.c904b3b1-afc1-4698-bf5a-a20892c20275 diagram information from app 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, track 2063.99cd37fd-4169-4464-a509-5e2d613f13dd, snapshot 2064.da847473-46ca-493e-bde1-2f72f1c481b0\n29 Apr 2026 18:01:41,384 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_6860]: Start to load service item Requisition CV Validation:1.7ae7e89c-6f6f-4eb0-87ea-cd61531dfc54 diagram information from app 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, track 2063.99cd37fd-4169-4464-a509-5e2d613f13dd, snapshot 2064.da847473-46ca-493e-bde1-2f72f1c481b0\n29 Apr 2026 18:01:41,462 com.ibm.cte.sdc.bpm.testing.service.TestCaseService [DEBUG] [pipelineBuild_6860_testcase_4189]: Running test case case1\n29 Apr 2026 18:01:41,612 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: Start executing the test case with id 4189 and name case1\n29 Apr 2026 18:01:41,638 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=51, name=startProcess, executionType=null, project=null]\n29 Apr 2026 18:01:41,641 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=3, name=debug, executionType=null, project=null]\n29 Apr 2026 18:01:41,645 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=624, name=Create Request, executionType=GROUP_COMMAND, project [id=569, name=Simple Test]]\n29 Apr 2026 18:01:41,683 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=62, name=runTaskByActivityName, executionType=null, project=null]\n29 Apr 2026 18:01:41,686 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=24, name=selectWindow, executionType=null, project=null]\n29 Apr 2026 18:01:41,686 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=23, name=select, executionType=null, project=null]\n29 Apr 2026 18:01:41,687 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=23, name=select, executionType=null, project=null]\n29 Apr 2026 18:01:41,687 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=23, name=select, executionType=null, project=null]\n29 Apr 2026 18:01:41,687 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=23, name=select, executionType=null, project=null]\n29 Apr 2026 18:01:41,687 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=11, name=click, executionType=null, project=null]\n29 Apr 2026 18:01:41,688 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=11, name=click, executionType=null, project=null]\n29 Apr 2026 18:01:41,688 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=3, name=debug, executionType=null, project=null]\n29 Apr 2026 18:01:41,692 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=62, name=runTaskByActivityName, executionType=null, project=null]\n29 Apr 2026 18:01:41,693 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=25, name=text, executionType=null, project=null]\n29 Apr 2026 18:01:41,694 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=11, name=click, executionType=null, project=null]\n29 Apr 2026 18:01:41,694 com.ibm.cte.sdc.bpm.testing.service.CaseStepService [DEBUG] [pipelineBuild_6860_testcase_4189]: Generate description for command:Command [id=3, name=debug, executionType=null, project=null]\n29 Apr 2026 18:01:45,361 com.ibm.cte.sdc.bpm.testing.util.BpmUtils [INFO ] [pipelineBuild_6860_testcase_4189]: The BAW login url is https://9.30.57.148:9443/teamworks/login.jsp and the login command is LoginOnPrem\n29 Apr 2026 18:01:45,361 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [1], associate command [Command [id=51, name=startProcess, executionType=null]], parameters [{\"process\":\"Standard HR Open New Position\",\"params\":\"\"}], parent parameters [null] and case data [null], assignee []\n29 Apr 2026 18:01:45,369 com.ibm.cte.sdc.bpm.testing.command.bpm.StartProcess [DEBUG] [pipelineBuild_6860_testcase_4189]: Starting the process Standard HR Open New Position with bpd id 25.c904b3b1-afc1-4698-bf5a-a20892c20275, app acronym HSS, app id 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, snapshot id 2064.da847473-46ca-493e-bde1-2f72f1c481b0, params  and is tip true\n29 Apr 2026 18:01:45,920 com.ibm.websphere.bpm.api.rest.RestAPIClient [DEBUG] [pipelineBuild_6860_testcase_4189]: Started the process with id 2254\n29 Apr 2026 18:01:45,920 com.ibm.cte.sdc.bpm.testing.command.bpm.StartProcess [DEBUG] [pipelineBuild_6860_testcase_4189]: Start an instance of the process Standard HR Open New Position with id 2254.\n29 Apr 2026 18:01:45,921 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [2], associate command [Command [id=3, name=debug, executionType=null]], parameters [{}], parent parameters [null] and case data [null], assignee []\n29 Apr 2026 18:01:45,923 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_6860_testcase_4189]: Debug log is: null\n29 Apr 2026 18:01:45,923 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [3], associate command [Command [id=624, name=Create Request, executionType=GROUP_COMMAND, project [id=569]]], parameters [{\"department\":\"Sales\"}], parent parameters [null] and case data [null], assignee []\n29 Apr 2026 18:01:45,925 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [3.1], associate command [Command [id=62, name=runTaskByActivityName, executionType=null]], parameters [{\"taskName\":\"Submit position request\"}], parent parameters [{\"department\":\"Sales\"}] and case data [null], assignee []\n29 Apr 2026 18:01:46,456 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_6860_testcase_4189]: Wait until receiving task by name: Submit position request and instance id: 2254, filtering by current user bpmadmin.\n29 Apr 2026 18:01:46,560 com.ibm.cte.sdc.bpm.testing.command.bpm.RunTaskByActivityName [DEBUG] [pipelineBuild_6860_testcase_4189]: URL:[https://9.30.57.148:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D5455] returned when starting the human task: Submit position request for the instance: 2254\n29 Apr 2026 18:01:46,782 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_6860_testcase_4189]: previous logined BPM user: null, current BPM user: bpmadmin\n29 Apr 2026 18:01:48,036 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: Open url https://9.30.57.148:9443/teamworks/ibm_security_logout, the window handler is 8e00de82-ec49-4b28-b39d-5efbaeab32a4\n29 Apr 2026 18:01:49,366 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: Open url https://9.30.57.148:9443/teamworks/process.lsw, the window handler is 8e00de82-ec49-4b28-b39d-5efbaeab32a4\n29 Apr 2026 18:01:59,814 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: Open url https://9.30.57.148:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D5455, the window handler is 8e00de82-ec49-4b28-b39d-5efbaeab32a4\n29 Apr 2026 18:02:00,990 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [3.2], associate command [Command [id=24, name=selectWindow, executionType=null]], parameters [{\"info\":\"[\\\"window-MAIN\\\",\\\"iframe-0\\\"]\"}], parent parameters [{\"department\":\"Sales\"}] and case data [null], assignee []\n29 Apr 2026 18:02:03,215 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [3.3], associate command [Command [id=23, name=select, executionType=null]], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/select[1]\",\"elementId\":\"singleselect-Requisition_CV1:Single_Select1\",\"tagName\":\"select\",\"event\":\"change\",\"command\":\"UI.select\",\"value\":\"Full-time\",\"controlId\":\"Section1.Section4.Requisition_CV1.Section1.Single_Select1\",\"label\":\"Employment type\"}], parent parameters [{\"department\":\"Sales\"}] and case data [null], assignee []\n29 Apr 2026 18:02:04,762 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/select[1], value:Full-time}\n29 Apr 2026 18:02:06,193 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [3.4], associate command [Command [id=23, name=select, executionType=null]], parameters [{\"value\":\"${parameter.department}\",\"controlId\":\"Section1.Section4.Requisition_CV1.Section1.Single_Select2\",\"label\":\"Department\",\"elementId\":\"singleselect-Requisition_CV1:Single_Select2\",\"elementCss\":\"\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/select[1]\"}], parent parameters [{\"department\":\"Sales\"}] and case data [null], assignee []\n29 Apr 2026 18:02:07,554 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/select[1], value:Sales}\n29 Apr 2026 18:02:08,985 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [3.5], associate command [Command [id=23, name=select, executionType=null]], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/select[1]\",\"elementId\":\"singleselect-Position_CV1:Single_Select2\",\"tagName\":\"select\",\"event\":\"change\",\"command\":\"UI.select\",\"value\":\"Dallas\",\"controlId\":\"Section1.Section4.Position_CV1.Section1.Single_Select2\",\"label\":\"Location\"}], parent parameters [{\"department\":\"Sales\"}] and case data [null], assignee []\n29 Apr 2026 18:02:10,401 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/select[1], value:Dallas}\n29 Apr 2026 18:02:11,885 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [3.6], associate command [Command [id=23, name=select, executionType=null]], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/select[1]\",\"elementId\":\"multiselect-Qualifications_CV1:Multiple_Select2\",\"tagName\":\"select\",\"event\":\"change\",\"command\":\"UI.select\",\"value\":\"[\\\"Bachelor of Arts (BA)\\\"]\",\"controlId\":\"Section1.Qualifications_CV1.Panel1.Tabs1.Vertical_Layout3.Multiple_Select2\",\"label\":\"Education\"}], parent parameters [{\"department\":\"Sales\"}] and case data [null], assignee []\n29 Apr 2026 18:02:13,627 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/select[1], value:Bachelor of Arts (BA)}\n29 Apr 2026 18:02:15,040 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [3.7], associate command [Command [id=11, name=click, executionType=null]], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[4]\\/div[1]\\/div[1]\\/button[1]\",\"elementId\":\"button-button-Button1\",\"tagName\":\"button\",\"event\":\"mouseup\",\"command\":\"UI.click\",\"value\":\"Next\",\"type\":\"Button\"}], parent parameters [{\"department\":\"Sales\"}] and case data [null], assignee []\n29 Apr 2026 18:02:16,254 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: [clickButton] element {id:button-button-Button1, value:Next}\n29 Apr 2026 18:02:20,668 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [3.8], associate command [Command [id=11, name=click, executionType=null]], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/button[1]\",\"elementId\":\"button-button-Button2\",\"tagName\":\"button\",\"event\":\"mouseup\",\"command\":\"UI.click\",\"value\":\"Submit\",\"type\":\"Button\"}], parent parameters [{\"department\":\"Sales\"}] and case data [null], assignee []\n29 Apr 2026 18:02:21,817 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: [clickButton] element {id:button-button-Button2, value:Submit}\n29 Apr 2026 18:02:31,681 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [4], associate command [Command [id=3, name=debug, executionType=null]], parameters [{}], parent parameters [null] and case data [null], assignee []\n29 Apr 2026 18:02:31,683 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_6860_testcase_4189]: Debug log is: null\n29 Apr 2026 18:02:31,684 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [5], associate command [Command [id=62, name=runTaskByActivityName, executionType=null]], parameters [{\"taskName\":\"Review new position request\"}], parent parameters [null] and case data [null], assignee []\n29 Apr 2026 18:02:41,188 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_6860_testcase_4189]: Wait until receiving task by name: Review new position request and instance id: 2254, filtering by current user bpmadmin.\n29 Apr 2026 18:02:41,228 com.ibm.cte.sdc.bpm.testing.command.bpm.RunTaskByActivityName [DEBUG] [pipelineBuild_6860_testcase_4189]: URL:[https://9.30.57.148:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D5456] returned when starting the human task: Review new position request for the instance: 2254\n29 Apr 2026 18:02:50,619 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_6860_testcase_4189]: previous logined BPM user: bpmadmin, current BPM user: bpmadmin\n29 Apr 2026 18:03:00,765 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: Open url https://9.30.57.148:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D5456, the window handler is 8e00de82-ec49-4b28-b39d-5efbaeab32a4\n29 Apr 2026 18:03:02,168 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [6], associate command [Command [id=25, name=text, executionType=null]], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/textarea[1]\",\"elementId\":\"textarea-textarea-Text1\",\"tagName\":\"textarea\",\"event\":\"blur\",\"command\":\"UI.text\",\"value\":\"rejected\",\"controlId\":\"Section2.Text1\",\"label\":\"GM comment\"}], parent parameters [null] and case data [null], assignee []\n29 Apr 2026 18:03:03,382 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: [sendKey] element {xpath:/html[1]/body[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/textarea[1], value:rejected}\n29 Apr 2026 18:03:04,710 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [7], associate command [Command [id=11, name=click, executionType=null]], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[3]\\/button[1]\",\"elementId\":\"button-button-Button1\",\"tagName\":\"button\",\"event\":\"mouseup\",\"command\":\"UI.click\",\"value\":\"Submit\",\"type\":\"Button\"}], parent parameters [null] and case data [null], assignee []\n29 Apr 2026 18:03:05,878 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_6860_testcase_4189]: [clickButton] element {id:button-button-Button1, value:Submit}\n29 Apr 2026 18:03:15,793 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: [case1]#ID:[4189] - Running the case step with index [8], associate command [Command [id=3, name=debug, executionType=null]], parameters [{}], parent parameters [null] and case data [null], assignee []\n29 Apr 2026 18:03:15,796 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_6860_testcase_4189]: Debug log is: null\n29 Apr 2026 18:03:16,688 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_6860_testcase_4189]: End with executing the test case with id 4189 and name case1!\n29 Apr 2026 18:03:17,587 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_6860]: End pipeline step execution.\n",
  "errorMessage": null,
  "buildId": 6860,
  "currentStage": "Process Server",
  "currentStep": "Functional Test",
  "stages": [
    {
      "name": "Process Center",
      "status": "Success",
      "server": "BAW24000 Dev Server",
      "processAppAcronym": "HSS",
      "processAppId": "2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0",
      "branchName": "Main",
      "branchId": "2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e",
      "snapshotAcronym": "0.00_11",
      "snapshotId": "2064.da847473-46ca-493e-bde1-2f72f1c481b0",
      "toolkit": "false",
      "steps": [
        {
          "name": "Checkstyle",
          "ignoreDocCheck": "true",
          "ignoreJsCheck": "true",
          "ignoreToolkitsCheck": "true",
          "healthScoreThreshold": "20",
          "warningsThreshold": "200",
          "isTip": "true",
          "artifacts": "30",
          "score": "11",
          "warnings": "22",
          "status": "Success",
          "startDate": "2026-04-29T04:30:05Z",
          "endDate": "2026-04-29T04:30:30Z",
          "duration": "25",
          "haltOnFailure": "false",
          "result": {
            "details": [
              {
                "tag": "Redundant",
                "artifactName": "The Input Variable <b>currentPosition</b> of the Process <b>Find position candidates Process</b>",
                "ruleName": "check-bpd-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "Unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Input Variable <b>data</b> of the Service Flow <b>Populate DepartmentList</b>",
                "ruleName": "check-service-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "The unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Input Variable <b>data</b> of the Service Flow <b>Populate EducationList</b>",
                "ruleName": "check-service-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "The unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Input Variable <b>data</b> of the Service Flow <b>Populate EmploymentTypeList</b>",
                "ruleName": "check-service-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "The unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Input Variable <b>data</b> of the Service Flow <b>Populate ExperienceList</b>",
                "ruleName": "check-service-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "The unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Input Variable <b>data</b> of the Service Flow <b>Populate LocationList</b>",
                "ruleName": "check-service-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "The unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Input Variable <b>data</b> of the Service Flow <b>Populate PositionTypeList</b>",
                "ruleName": "check-service-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "The unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Input Variable <b>data</b> of the Service Flow <b>Populate SkillsList</b>",
                "ruleName": "check-service-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "The unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Input Variable <b>instanceId</b> of the Client Side Human Service <b>Create Position Request CSHS</b>",
                "ruleName": "check-service-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "The unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Input Variable <b>text</b> of the Service Flow <b>Populate ApprovalList</b>",
                "ruleName": "check-service-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "The unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Output Variable <b>candidates</b> of the Process <b>Find position candidates Process</b>",
                "ruleName": "check-bpd-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "Unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Performance",
                "artifactName": "The Participant <b>GeneralManagers</b>",
                "ruleName": "check-participant-all-users",
                "symptom": "The participant contains a group set to all users.",
                "bestPractice": "The participant group would better not contain all users (tw_allusers). If it does, that means any user in the LDAP can see all of the tasks assigned to this group, that may cause negative performance implications. Please consider changing your group members.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Performance",
                "artifactName": "The Participant <b>HiringManagers</b>",
                "ruleName": "check-participant-all-users",
                "symptom": "The participant contains a group set to all users.",
                "bestPractice": "The participant group would better not contain all users (tw_allusers). If it does, that means any user in the LDAP can see all of the tasks assigned to this group, that may cause negative performance implications. Please consider changing your group members.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Performance",
                "artifactName": "The Participant <b>Human Resources</b>",
                "ruleName": "check-participant-all-users",
                "symptom": "The participant contains a group set to all users.",
                "bestPractice": "The participant group would better not contain all users (tw_allusers). If it does, that means any user in the LDAP can see all of the tasks assigned to this group, that may cause negative performance implications. Please consider changing your group members.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Private Variable <b>candidates</b> of the Process <b>HR Open New Position</b>",
                "ruleName": "check-bpd-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "Unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Private Variable <b>skills</b> of the Client Side Human Service <b>Create Position Request CSHS</b>",
                "ruleName": "check-service-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "The unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Performance",
                "artifactName": "The Process <b>HR Open New Position</b>",
                "ruleName": "check-auto-tracking-enable",
                "symptom": "The auto tracking is enabled.",
                "bestPractice": "<b>Auto-tracking</b> is enabled by default for Processs. This capability is important for many Processs because it enables the gathering, tracking, and reporting of key business metrics. However, an additional cost exists as a result of auto-tracking because the events are processed by the Performance Data Warehouse and persisted in the database. Disable auto tracking for Proesses that do not require tracking and reporting business metrics. This rule only applies to BAW on-prem, and can be ignored if you will deploy the app to BAW on Container.",
                "severityLevel": "MAJOR",
                "referenceList": "IBM Automation Community about best-practices-recommendations;https://www.ibm.com/community/automation/docs/baw/best-practices-recommendations/@RedBook:IBM BPM Performance Tuning and Best Practices;https://www.redbooks.ibm.com/redbooks/pdfs/sg248216.pdf@"
              },
              {
                "tag": "Performance",
                "artifactName": "The Process <b>Standard HR Open New Position</b>",
                "ruleName": "check-auto-tracking-enable",
                "symptom": "The auto tracking is enabled.",
                "bestPractice": "<b>Auto-tracking</b> is enabled by default for Processs. This capability is important for many Processs because it enables the gathering, tracking, and reporting of key business metrics. However, an additional cost exists as a result of auto-tracking because the events are processed by the Performance Data Warehouse and persisted in the database. Disable auto tracking for Proesses that do not require tracking and reporting business metrics. This rule only applies to BAW on-prem, and can be ignored if you will deploy the app to BAW on Container.",
                "severityLevel": "MAJOR",
                "referenceList": "IBM Automation Community about best-practices-recommendations;https://www.ibm.com/community/automation/docs/baw/best-practices-recommendations/@RedBook:IBM BPM Performance Tuning and Best Practices;https://www.redbooks.ibm.com/redbooks/pdfs/sg248216.pdf@"
              },
              {
                "tag": "Implementation",
                "artifactName": "The Script Task Component <b>Notify hiring manager</b> of the Lane <b>System</b> of the Process <b>Standard HR Open New Position</b>",
                "ruleName": "check-bpd-phantom-steps",
                "symptom": "Phantom steps(no implementation on step).",
                "bestPractice": "If the activity is not necessary for the Process you should delete it. Otherwise, add implementaion to the activity.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Implementation",
                "artifactName": "The Script Task Component <b>Notify hiring manager</b> of the Lane <b>System</b> of the Subprocess <b>Review Process</b> of the Process <b>HR Open New Position</b>",
                "ruleName": "check-bpd-phantom-steps",
                "symptom": "Phantom steps(no implementation on step).",
                "bestPractice": "If the activity is not necessary for the Process you should delete it. Otherwise, add implementaion to the activity.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Redundant",
                "artifactName": "The Service Flow <b>Requisition CV Validation</b>",
                "ruleName": "check-app-unused-service",
                "symptom": "The service is not used.",
                "bestPractice": "Services should be used by other artifacts or defined as an exposed human service. Redundant services should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Performance",
                "artifactName": "The System Task Component <b>Send escalation notice</b> of the Lane <b>System</b> of the Process <b>Standard HR Open New Position</b>",
                "ruleName": "check-delete-completed-task",
                "symptom": "The task is not set to delete on completion.",
                "bestPractice": "It's recommended that you enable <b>Delete Task on Completion</b> for tasks in a system swim lane, because large volumes of completed tasks can greatly impact the performance of instance migration.",
                "severityLevel": "CRITICAL",
                "referenceList": "RedBook:IBM BPM Performance Tuning and Best Practices;https://www.redbooks.ibm.com/redbooks/pdfs/sg248216.pdf@"
              }
            ]
          }
        },
        {
          "name": "Unit Test",
          "isTip": "true",
          "selectedTestCaseIds": "4189,4190,4188",
          "execludeTestCases": "true",
          "selectedSeleniumHubIds": "1",
          "status": "Success",
          "startDate": "2026-04-29T04:30:30Z",
          "endDate": "2026-04-29T04:30:43Z",
          "duration": "12",
          "haltOnFailure": "true",
          "result": {
            "testProjectId": 569,
            "testProjectName": "Simple Test",
            "testSuites": [
              {
                "testSuiteId": 22220,
                "testSuiteName": "Requisition_CV_Validation",
                "testSuiteExecutionStatus": "Passed",
                "testSuiteTimestamp": "2026-04-29T04:30:35Z",
                "testCases": [
                  {
                    "testCaseStatus": "Passed",
                    "testCaseTimestamp": "2026-04-29T04:30:35Z",
                    "testCaseId": 4191,
                    "testCaseDesc": null,
                    "testCaseName": "case1",
                    "datasetName": null,
                    "testCaseInfoId": 46339,
                    "testCaseEvidence": []
                  }
                ]
              }
            ]
          }
        },
        {
          "name": "Take Snapshot",
          "namingConvention": "{MAJOR.MINOR.PATCH} - {APP_ACRONYM} {TRACK} {yyyyMMddHHmmss}",
          "snapshotId": "2064.da847473-46ca-493e-bde1-2f72f1c481b0",
          "snapshotName": "0.00.13 - HSS Main 20260428213043",
          "status": "Success",
          "startDate": "2026-04-29T04:30:43Z",
          "endDate": "2026-04-29T04:30:47Z",
          "duration": "4",
          "haltOnFailure": "true"
        }
      ]
    },
    {
      "name": "Process Server",
      "status": "Success",
      "server": "BAW24000 QA Server",
      "processAppAcronym": "HSS",
      "processAppId": "2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0",
      "branchName": "0.00.13 - HSS Main 20260428213043",
      "branchId": "2063.99cd37fd-4169-4464-a509-5e2d613f13dd",
      "snapshotAcronym": "0.00_11",
      "snapshotId": "2064.da847473-46ca-493e-bde1-2f72f1c481b0",
      "toolkit": "false",
      "approvers": "idaAdmin,idaDemo3,idaDemo5",
      "approvedBy": "idaDemo5",
      "steps": [
        {
          "name": "Deployment",
          "migrateInstances": "false",
          "customPolicy": "false",
          "cleanOldSnapshots": "false",
          "deactivatePreviousSnapshot": "false",
          "ignoreValidationError": "true",
          "offlineInstall": "false",
          "deployFromLocalFileSystem": "false",
          "syncEnvs": "true",
          "syncEpvs": "true",
          "syncTeams": "true",
          "previousDefaultSnapshotAcronym": "0.00_10",
          "deploymentDateTime": "2026-04-30T01:00:00Z",
          "deploymentReason": "Reason1",
          "status": "Success",
          "startDate": "2026-04-30T01:00:04Z",
          "endDate": "2026-04-30T01:01:39Z",
          "duration": "94",
          "haltOnFailure": "true"
        },
        {
          "name": "Functional Test",
          "isTip": "true",
          "selectedTestCaseIds": "4191,4190,4188",
          "execludeTestCases": "true",
          "selectedSeleniumHubIds": "1",
          "status": "Success",
          "startDate": "2026-04-30T01:01:39Z",
          "endDate": "2026-04-30T01:03:17Z",
          "duration": "98",
          "haltOnFailure": "true",
          "result": {
            "testProjectId": 569,
            "testProjectName": "Simple Test",
            "testSuites": [
              {
                "testSuiteId": 22245,
                "testSuiteName": "Standard_HR_Open_New_Position",
                "testSuiteExecutionStatus": "Passed",
                "testSuiteTimestamp": "2026-04-30T01:01:42Z",
                "testCases": [
                  {
                    "testCaseStatus": "Passed",
                    "testCaseTimestamp": "2026-04-30T01:01:42Z",
                    "testCaseId": 4189,
                    "testCaseDesc": null,
                    "testCaseName": "case1",
                    "datasetName": null,
                    "testCaseInfoId": 46352,
                    "testCaseEvidence": [
                      "pipeline/screenshots/127/build_6860/project-569-18df8e9a-a41e-4174-8d32-e381926a8b92/case-4189/94462d5d-e6f2-48f0-ab1a-9bab918ebf69.png",
                      "pipeline/screenshots/127/build_6860/project-569-18df8e9a-a41e-4174-8d32-e381926a8b92/case-4189/e0177dad-66f0-4a4b-a40d-d540722df099.png",
                      "pipeline/screenshots/127/build_6860/project-569-18df8e9a-a41e-4174-8d32-e381926a8b92/case-4189/e31a71aa-0342-4003-9640-8b63e12ef415.png",
                      "pipeline/screenshots/127/build_6860/project-569-18df8e9a-a41e-4174-8d32-e381926a8b92/case-4189/4e5ece21-baf3-485f-8687-a3d137321a35.png",
                      "pipeline/screenshots/127/build_6860/project-569-18df8e9a-a41e-4174-8d32-e381926a8b92/case-4189/227fcf34-9ee9-4b76-8b58-ce30e818dfbf.png",
                      "pipeline/screenshots/127/build_6860/project-569-18df8e9a-a41e-4174-8d32-e381926a8b92/case-4189/bff4c19d-e274-4473-9d2b-e2b8b55b1a48.png",
                      "pipeline/screenshots/127/build_6860/project-569-18df8e9a-a41e-4174-8d32-e381926a8b92/case-4189/35fb303e-5483-4344-a480-50b3c65a181b.png",
                      "pipeline/screenshots/127/build_6860/project-569-18df8e9a-a41e-4174-8d32-e381926a8b92/case-4189/477be68e-b11c-4ced-a999-54747a4bb88e.png",
                      "pipeline/screenshots/127/build_6860/project-569-18df8e9a-a41e-4174-8d32-e381926a8b92/case-4189/3a8a2f14-d046-42c9-9ceb-e1ee7b28e8d5.png",
                      "pipeline/screenshots/127/build_6860/project-569-18df8e9a-a41e-4174-8d32-e381926a8b92/case-4189/5bc3b72e-7ed7-4e14-a23f-5e05958dd723.png",
                      "pipeline/screenshots/127/build_6860/project-569-18df8e9a-a41e-4174-8d32-e381926a8b92/case-4189/bae1de3d-3ee0-4532-af5d-1e82840f083d.png"
                    ]
                  }
                ]
              }
            ]
          }
        }
      ]
    }
  ]
}
```

### Response Status
The [Trigger Pipeline Build](#trigger-pipeline-build) and [Get Pipeline Build Status](#get-pipeline-build-status) REST APIs' response will be returned with one of the following status:

**Build Status:**
* `Running` The pipeline build is running.
* `Failed` There was a problem with the pipeline build (step failed, etc.).
* `Success` The pipeline build was successful.
* `Partial Success` The pipeline build was partially successful. Some steps failed, but they were configured with the Halt On Failure option unchecked.
* `Pending` The pipeline build was pending.


**Other Status:**
* `unauthorized` The REST API caller does not have permission to access the requested resource.
* `pipeline not found` An attempt was made to access a pipeline that does not exist.
* `build not found` An attempt was made to access a build that does not exist.
* `ERROR` An error occurred during the REST API call.


[swagger_ui]: ../images/references/swagger_ui.png
