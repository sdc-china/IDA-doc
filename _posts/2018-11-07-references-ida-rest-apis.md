---
title: "IDA REST APIs"
category: references
date: 2018-11-07 15:17:55
last_modified_at: 2024-10-29 16:44:00
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
| `pipelineRestInput`   | No          |  **Please copy response from the [Get Pipeline Metadata REST API](#get-pipeline-metadata) and then overwrite parameter values if needed.** Parameter values that can be overwritten include: <br>**container:** the acronym of a process application/toolkit used to trigger a build.<br>**snapshotAcronym:** the snapshot acronym of the process app/toolkit.<br>**branchName:** the track name of the process app/toolkit. <br>Either snapshotAcronym or branchName can be specified. If branchName is specified, the latest snapshot on that branch will be used to start the build. If no **container**/**snapshotAcronym**/**branchName**, the snapshot configured in the pipeline definition will be used to start the build.<br>**installFileName:** the Workflow installation package file name to be deployed.<br><br>For a pipeline stage, **serverName** can be overwritten. Please note a valid serverName must be selectable when you manually edit the pipeline.<br><br>For a Snapshot step, **namingConvention** can be overwritten.<br>For a Checkstyle step, all Checkstyle options e.g. **tip**, **healthScoreThreshold**, **warningsThreshold**, **ignoreDocCheck**, **ignoreJsCheck**, **ignoreToolkitsCheck**, **haltOnFailure** can be overwritten.<br>For a Test step, **tip**, **testProjectId** and **haltOnFailure** can be overwritten. Specify a test project ID of the triggering process app/toolkit.|

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
  curl -X GET "https://[serverhost]:[port]/ida/rest/v2/pipelines/builds/674" -H "accept: application/json;charset=UTF-8"
```
Response
``` json
{
  "status": "Success",
  "pipelineId": 1,
  "pipelineName": "HSS Pipeline",
  "triggerBy": "idaAdmin",
  "report": "https://[serverhost]:[port]/ida/pipelines/1/builds/674?standalone=true"
}
```

or

Request
```
  curl -X GET "https://[serverhost]:[port]/ida/rest/v2/pipelines/builds/674?parts=all" -H "accept: application/json;charset=UTF-8"
```

Response
``` json
{
  "status": "Success",
  "pipelineId": 65,
  "pipelineName": "Hiring Sample",
  "triggerBy": "idaAdmin",
  "report": "https://localhost:8443/ida/pipelines/65/builds/513?standalone=true",
  "logs": "26 Jul 2023 16:03:26,657 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: ======Start to run pipeline======\n26 Jul 2023 16:03:26,661 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: Pipeline ID:65\n26 Jul 2023 16:03:26,661 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: Pipeline Name:Hiring Sample\n26 Jul 2023 16:03:26,661 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: Trigger By:idaAdmin\n26 Jul 2023 16:03:26,705 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: Triggering pipelineRestInput:{\"PipelineRestInput\":{\"stages\":[\"\"]}}\n26 Jul 2023 16:03:26,707 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: Trigger Time:20230726160326\n26 Jul 2023 16:03:26,707 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: =================================\n26 Jul 2023 16:03:29,608 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [WARN ] [pipelineBuild_513]: Can't found snapshot configured in the stage(name: Development,type: DEV,toolkit: false,processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,snapshotId: 2064.d4a3ce98-fdd5-4c30-9dcd-95d6033e0c87), executionParams(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e)\n26 Jul 2023 16:03:30,397 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: Start to execute pipeline step(name: Checkstyle, type: Checkstyle) in stage(name: Development,type: DEV,toolkit: false,processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,snapshotId: 2064.d4a3ce98-fdd5-4c30-9dcd-95d6033e0c87), exeuctionParam(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,branchName: Main)\n26 Jul 2023 16:03:30,588 com.ibm.cte.sdc.bpm.testing.executor.pipeline.CheckstyleStepExecutor [INFO ] [pipelineBuild_513]: Start to run checkstyle with args: ProcessAppId=2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, BranchId=2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e, SnapshotId=null, Tip=true\n26 Jul 2023 16:03:57,889 com.ibm.cte.sdc.bpm.checkstyle.service.CheckstyleService [DEBUG] [pipelineBuild_513]: Export snapshot to \\var\\ida\\data\\twx\\socking1.fyre.ibm.com_9443\\2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0\\2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9.twx by swagger API\n26 Jul 2023 16:03:57,890 com.ibm.cte.sdc.bpm.checkstyle.service.CheckstyleService [DEBUG] [pipelineBuild_513]: Export snapshot to \\var\\ida\\data\\twx\\socking1.fyre.ibm.com_9443\\2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0\\2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9.twx by swagger API, it takes 27.2700147 seconds.\n26 Jul 2023 16:03:57,899 com.ibm.websphere.bpm.checkstyle.TWXFileChecker [DEBUG] [pipelineBuild_513]: checkstyle.properties not found in WEB\n26 Jul 2023 16:03:58,185 com.ibm.cte.sdc.bpm.checkstyle.executor.CheckstyleExecutor [INFO ] [pipelineBuild_513]: Execute Checkstyle with uploadPath:/var/ida/data\\twx, docId:socking1.fyre.ibm.com_9443\\2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0\\2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9.twx, styleRulePath:null, twx:\\var\\ida\\data\\twx\\socking1.fyre.ibm.com_9443\\2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0\\2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9.twx\n26 Jul 2023 16:03:58,185 com.ibm.cte.sdc.bpm.checkstyle.service.TWXFileEmbeddedChecker [DEBUG] [pipelineBuild_513]: BPM checkstyle embedded started. Input twx = \\var\\ida\\data\\twx\\socking1.fyre.ibm.com_9443\\2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0\\2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9.twx.\n26 Jul 2023 16:04:01,832 com.ibm.websphere.bpm.twx.TwxReaderServiceImpl [DEBUG] [pipelineBuild_513]: Load Process App in \\var\\ida\\data\\twx\\socking1.fyre.ibm.com_9443\\2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0\\2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9.twx  takes 3646 milliseconds\n26 Jul 2023 16:04:12,629 com.ibm.cte.sdc.bpm.checkstyle.service.TWXFileEmbeddedChecker [INFO ] [pipelineBuild_513]: End invoking decision service. Count of check messages: 17.\n26 Jul 2023 16:04:12,839 com.ibm.cte.sdc.baw.statistic.BawStatServiceImpl [DEBUG] [pipelineBuild_513]: The case artifact file is null, skip the case artifact analysis!\n26 Jul 2023 16:04:12,951 com.ibm.cte.sdc.bpm.checkstyle.service.TWXFileEmbeddedChecker [INFO ] [pipelineBuild_513]: Report generated. BPM checkstyle ended\n26 Jul 2023 16:04:12,952 com.ibm.cte.sdc.bpm.checkstyle.executor.CheckstyleExecutor [DEBUG] [pipelineBuild_513]: Execute Checkstyle takes 14.7669343 seconds with parameters:  uploadPath:/var/ida/data\\twx, docId:socking1.fyre.ibm.com_9443\\2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0\\2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9.twx, styleRulePath:null, twx:\\var\\ida\\data\\twx\\socking1.fyre.ibm.com_9443\\2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0\\2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9.twx\n26 Jul 2023 16:04:12,953 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: End pipeline step execution.\n26 Jul 2023 16:04:12,978 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: Start to execute pipeline step(name: Test, type: Test) in stage(name: Development,type: DEV,toolkit: false,processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,snapshotId: 2064.d4a3ce98-fdd5-4c30-9dcd-95d6033e0c87), exeuctionParam(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,branchName: Main)\n26 Jul 2023 16:04:12,979 com.ibm.cte.sdc.bpm.testing.executor.pipeline.TestStepExecutor [INFO ] [pipelineBuild_513]: Start to run tests with args: projectName=Hiring Sample4934, BranchId=2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e, SnapshotId=null, Tip=true\n26 Jul 2023 16:04:19,213 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_513]: The tip snapshot id of appId 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0 with branchId 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e from server https://socking1.fyre.ibm.com:9443 is 2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9\n26 Jul 2023 16:04:24,521 com.ibm.cte.sdc.baw.analysis.icm.service.ContentEngineService [DEBUG] [pipelineBuild_513]: Folder /IBM Case Manager/Solutions/Hiring Sample/ not found.Failed to get the solution definition from bpmConfig https://socking1.fyre.ibm.com:9443 from object store dos, it is not a case solution project.\n26 Jul 2023 16:04:25,391 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_513]: The number of dependency toolkits is 3\n26 Jul 2023 16:04:25,682 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_513]: Start to load BPD item Standard HR Open New Position:25.c904b3b1-afc1-4698-bf5a-a20892c20275 diagram information from app 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, track 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e, snapshot 2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9\n26 Jul 2023 16:04:28,546 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_513]: Start to load service item Create Position Request CSHS:1.1bfbbe13-d8a5-4516-88b6-3d1f29f91af3 diagram information from app 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, track 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e, snapshot 2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9\n26 Jul 2023 16:04:29,169 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_513]: Start to load service item Requisition CV Validation:1.7ae7e89c-6f6f-4eb0-87ea-cd61531dfc54 diagram information from app 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, track 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e, snapshot 2064.567ef906-8525-48d8-9c8e-c2a6d6926dc9\n26 Jul 2023 16:04:30,597 com.ibm.cte.sdc.bpm.testing.executor.TestCaseExecutorService [DEBUG] [pipelineBuild_513]: Register thread pool SeleniumGrid_9_30_167_43_4444_edge, the pool size is 5\n26 Jul 2023 16:04:30,597 com.ibm.cte.sdc.bpm.testing.executor.TestCaseExecutorService [DEBUG] [pipelineBuild_513]: Update thread pool SeleniumGrid_9_30_167_43_4444_edge size to 5\n26 Jul 2023 16:04:31,172 com.ibm.cte.sdc.bpm.testing.service.TestCaseService [DEBUG] [pipelineBuild_513_testcase_170]: Running test case existCase\n26 Jul 2023 16:04:31,255 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: Start executing the test case with id 170 and name existCase\n26 Jul 2023 16:04:42,747 com.ibm.cte.sdc.bpm.testing.util.BpmUtils [INFO ] [pipelineBuild_513_testcase_170]: The BAW login url is https://socking1.fyre.ibm.com:9443/teamworks/login.jsp and the login command is LoginOnPrem\n26 Jul 2023 16:04:42,747 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [1], associate command [startProcess], parameters [{\"process\":\"Standard HR Open New Position\"}] and case data [null],\n26 Jul 2023 16:04:42,763 com.ibm.cte.sdc.bpm.testing.command.bpm.StartProcess [DEBUG] [pipelineBuild_513_testcase_170]: Starting the process Standard HR Open New Position with bpd id 25.c904b3b1-afc1-4698-bf5a-a20892c20275, app acronym HSS, app id 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, snapshot id , params null and is tip true\n26 Jul 2023 16:04:43,825 com.ibm.websphere.bpm.api.rest.RestAPIClient [DEBUG] [pipelineBuild_513_testcase_170]: Started the process with id 68189\n26 Jul 2023 16:04:43,825 com.ibm.cte.sdc.bpm.testing.command.bpm.StartProcess [DEBUG] [pipelineBuild_513_testcase_170]: Start an instance of the process Standard HR Open New Position with id 68189.\n26 Jul 2023 16:04:43,826 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [2], associate command [runTaskByDisplayName], parameters [{\"taskName\":\"Task: Create position request\"}] and case data [null],\n26 Jul 2023 16:04:46,370 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_513_testcase_170]: Wait until receiving task by name: Task: Create position request and instance id: 68189, filtering by current user bpmadmin.\n26 Jul 2023 16:04:46,931 com.ibm.cte.sdc.bpm.testing.command.bpm.RunTaskByDisplayName [DEBUG] [pipelineBuild_513_testcase_170]: URL: [https://socking1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D90116] returned when starting the human task: Task: Create position request for the instance: 68189\n26 Jul 2023 16:04:47,124 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_513_testcase_170]: previous logined BPM user: null, current BPM user: bpmadmin\n26 Jul 2023 16:04:50,293 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: Open url https://socking1.fyre.ibm.com:9443/teamworks/ibm_security_logout, the window handler is E8C26DD5A636D14F0861E10B191CF473\n26 Jul 2023 16:04:52,939 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: Open url https://socking1.fyre.ibm.com:9443/teamworks/process.lsw, the window handler is E8C26DD5A636D14F0861E10B191CF473\n26 Jul 2023 16:05:05,430 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: Open url https://socking1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D90116, the window handler is E8C26DD5A636D14F0861E10B191CF473\n26 Jul 2023 16:05:10,881 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [3], associate command [selectWindow], parameters [{\"info\":\"[\\\"window-MAIN\\\",\\\"iframe-0\\\"]\"}] and case data [null],\n26 Jul 2023 16:05:27,338 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [4], associate command [select], parameters [{\"value\":\"Full-time\",\"controlId\":\"Section1.Section4.Requisition_CV1.Section1.Single_Select1\",\"label\":\"Employment type\",\"elementId\":\"SSelect_div_1_1_1\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/select[1]\"}] and case data [null],\n26 Jul 2023 16:05:40,859 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/select[1], value: Full-time}\n26 Jul 2023 16:05:49,835 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [5], associate command [select], parameters [{\"value\":\"Marketing\",\"controlId\":\"Section1.Section4.Requisition_CV1.Section1.Single_Select2\",\"label\":\"Department\",\"elementId\":\"SSelect_div_1_1_2\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/select[1]\"}] and case data [null],\n26 Jul 2023 16:06:03,388 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/select[1], value: Marketing}\n26 Jul 2023 16:06:12,416 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [6], associate command [text], parameters [{\"value\":\"Jack\",\"controlId\":\"Section1.Section4.Requisition_CV1.Section1.Text2\",\"label\":\"Hiring manager\",\"elementId\":\"Text_div_1_1_3\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/input[1]\"}] and case data [null],\n26 Jul 2023 16:06:25,692 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [sendKey] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/input[1], value: Jack}\n26 Jul 2023 16:06:34,337 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [7], associate command [text], parameters [{\"value\":\"10\",\"controlId\":\"Section1.Section4.Requisition_CV1.Section1.Text3\",\"label\":\"Number of employees\",\"elementId\":\"Decimal_div_1_1_4\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[4]\\/div[1]\\/div[1]\\/input[1]\"}] and case data [null],\n26 Jul 2023 16:06:47,432 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [sendKey] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[4]/div[1]/div[1]/input[1], value: 10}\n26 Jul 2023 16:06:56,147 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [8], associate command [select], parameters [{\"value\":\"Existing\",\"controlId\":\"Section1.Section4.Position_CV1.Section1.Single_Select1\",\"label\":\"Position type\",\"elementId\":\"SSelect_div_2_1_1\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/select[1]\"}] and case data [null],\n26 Jul 2023 16:07:09,449 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/select[1], value: Existing}\n26 Jul 2023 16:07:18,359 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [9], associate command [select], parameters [{\"value\":\"Dallas\",\"controlId\":\"Section1.Section4.Position_CV1.Section1.Single_Select2\",\"label\":\"Location\",\"elementId\":\"SSelect_div_2_1_2\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/select[1]\"}] and case data [null],\n26 Jul 2023 16:07:31,694 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/select[1], value: Dallas}\n26 Jul 2023 16:07:40,614 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [10], associate command [text], parameters [{\"value\":\"Developer\",\"controlId\":\"Section1.Section4.Position_CV1.Section1.Text1\",\"label\":\"Title\",\"elementId\":\"Text_div_2_1_3\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/input[1]\"}] and case data [null],\n26 Jul 2023 16:07:54,292 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [sendKey] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/input[1], value: Developer}\n26 Jul 2023 16:08:03,008 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [11], associate command [select], parameters [{\"value\":\"[\\\"Bachelor of Architecture (B.Arch)\\\"]\",\"controlId\":\"Section1.Qualifications_CV1.Panel1.Tabs1.Vertical_Layout3.Multiple_Select2\",\"label\":\"Education\",\"elementId\":\"SSelect_div_3_1_1_1_1_1_1\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/select[1]\"}] and case data [null],\n26 Jul 2023 16:08:19,464 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/select[1], value: Bachelor of Architecture (B.Arch)}\n26 Jul 2023 16:08:28,418 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [12], associate command [select], parameters [{\"value\":\"[\\\"Bachelor of Architecture (B.Arch)\\\",\\\"Master of Science in Information Technology (MSc.IT)\\\"]\",\"controlId\":\"Section1.Qualifications_CV1.Panel1.Tabs1.Vertical_Layout3.Multiple_Select2\",\"label\":\"Education\",\"elementId\":\"SSelect_div_3_1_1_1_1_1_1\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/select[1]\"}] and case data [null],\n26 Jul 2023 16:08:44,451 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/select[1], value: Bachelor of Architecture (B.Arch)}\n26 Jul 2023 16:08:45,355 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/select[1], value: Master of Science in Information Technology (MSc.IT)}\n26 Jul 2023 16:08:55,301 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [13], associate command [click], parameters [{\"value\":\"Skills\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/ul[1]\\/li[2]\\/a[1]\"}] and case data [null],\n26 Jul 2023 16:09:05,495 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [click] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/ul[1]/li[2]/a[1], value: }\n26 Jul 2023 16:09:16,078 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [14], associate command [select], parameters [{\"value\":\"[\\\"Design Patterns\\\"]\",\"controlId\":\"Section1.Qualifications_CV1.Panel1.Tabs1.Vertical_Layout1.Multiple_Select1\",\"label\":\"Skills\",\"elementId\":\"SSelect_div_3_1_1_1_2_1_1\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/select[1]\"}] and case data [null],\n26 Jul 2023 16:09:32,883 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/select[1], value: Design Patterns}\n26 Jul 2023 16:09:42,320 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [15], associate command [select], parameters [{\"value\":\"[\\\"Design Patterns\\\",\\\"Data Structures\\\"]\",\"controlId\":\"Section1.Qualifications_CV1.Panel1.Tabs1.Vertical_Layout1.Multiple_Select1\",\"label\":\"Skills\",\"elementId\":\"SSelect_div_3_1_1_1_2_1_1\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/select[1]\"}] and case data [null],\n26 Jul 2023 16:09:59,120 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/select[1], value: Design Patterns}\n26 Jul 2023 16:10:00,036 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/select[1], value: Data Structures}\n26 Jul 2023 16:10:11,398 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [16], associate command [select], parameters [{\"value\":\"[\\\"Design Patterns\\\",\\\"Data Structures\\\",\\\"Analysis\\\"]\",\"controlId\":\"Section1.Qualifications_CV1.Panel1.Tabs1.Vertical_Layout1.Multiple_Select1\",\"label\":\"Skills\",\"elementId\":\"SSelect_div_3_1_1_1_2_1_1\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/select[1]\"}] and case data [null],\n26 Jul 2023 16:10:28,475 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/select[1], value: Design Patterns}\n26 Jul 2023 16:10:29,355 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/select[1], value: Data Structures}\n26 Jul 2023 16:10:30,255 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/select[1], value: Analysis}\n26 Jul 2023 16:10:40,489 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [17], associate command [click], parameters [{\"value\":\"Experience\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/ul[1]\\/li[3]\\/a[1]\"}] and case data [null],\n26 Jul 2023 16:10:50,537 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [click] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/ul[1]/li[3]/a[1], value: }\n26 Jul 2023 16:11:01,999 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [18], associate command [radio], parameters [{\"value\":\"1-2 years experience\",\"controlId\":\"Section1.Qualifications_CV1.Panel1.Tabs1.Vertical_Layout2.Radio_Buttons1\",\"label\":\"Experience\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[3]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/span[2]\\/input[1]\"}] and case data [null],\n26 Jul 2023 16:11:20,702 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [19], associate command [click], parameters [{\"value\":\"Next\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[4]\\/div[1]\\/div[1]\\/button[1]\"}] and case data [null],\n26 Jul 2023 16:11:31,325 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [click] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[4]/div[1]/div[1]/button[1], value: }\n26 Jul 2023 16:11:40,795 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [20], associate command [text], parameters [{\"value\":\"Comments\",\"controlId\":\"Section1.Horizontal_Layout1.Person_CV1.Section1.Text_Area1\",\"label\":\"Comments\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[4]\\/div[1]\\/div[1]\\/textarea[1]\"}] and case data [null],\n26 Jul 2023 16:11:53,945 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [sendKey] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[4]/div[1]/div[1]/textarea[1], value: Comments}\n26 Jul 2023 16:12:02,016 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [21], associate command [assertCoachControl], parameters [{\"label\":\"Given name\",\"expectedValue\":\"Bob\"}] and case data [null],\n26 Jul 2023 16:12:18,688 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [22], associate command [click], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/button[1]\",\"elementId\":\"button-button-Button2\",\"tagName\":\"button\",\"event\":\"mouseup\",\"command\":\"UI.click\",\"value\":\"Next\",\"type\":\"Button\"}] and case data [null],\n26 Jul 2023 16:12:30,874 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [clickButton] element {id:button-button-Button2, value: Next}\n26 Jul 2023 16:12:41,351 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [23], associate command [wait], parameters [{\"time\":\"10\"}] and case data [null],\n26 Jul 2023 16:12:51,367 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [24], associate command [click], parameters [{\"value\":\"Submit\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/button[1]\"}] and case data [null],\n26 Jul 2023 16:13:01,561 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [click] element {xpath:/html[1]/body[1]/div[1]/div[2]/div[1]/div[2]/button[1], value: }\n26 Jul 2023 16:13:21,134 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [25], associate command [runTaskByDisplayName], parameters [{\"taskName\":\"Task: Find job candidates\"}] and case data [null],\n26 Jul 2023 16:13:36,564 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_513_testcase_170]: Wait until receiving task by name: Task: Find job candidates and instance id: 68189, filtering by current user bpmadmin.\n26 Jul 2023 16:13:37,974 com.ibm.cte.sdc.bpm.testing.command.bpm.RunTaskByDisplayName [DEBUG] [pipelineBuild_513_testcase_170]: URL: [https://socking1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D90117] returned when starting the human task: Task: Find job candidates for the instance: 68189\n26 Jul 2023 16:13:38,176 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_513_testcase_170]: previous logined BPM user: bpmadmin, current BPM user: bpmadmin\n26 Jul 2023 16:13:49,657 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: Open url https://socking1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D90117, the window handler is E8C26DD5A636D14F0861E10B191CF473\n26 Jul 2023 16:13:57,375 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [26], associate command [click], parameters [{\"value\":\"Add candidates\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[2]\\/button[1]\"}] and case data [null],\n26 Jul 2023 16:14:07,546 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [click] element {xpath:/html[1]/body[1]/div[1]/div[2]/button[1], value: }\n26 Jul 2023 16:14:21,796 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [27], associate command [click], parameters [{\"value\":\"Add Row\",\"type\":\"Button\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[3]\\/div[4]\\/button[1]\\/span[1]\"}] and case data [null],\n26 Jul 2023 16:14:31,662 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: Unable find the element with xpath /html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[3]/div[4]/button[1]/span[1].\n26 Jul 2023 16:14:34,750 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [clickButton] element {null:null, value: Add Row}\n26 Jul 2023 16:14:48,004 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [28], associate command [text], parameters [{\"value\":\"Jim\",\"controlId\":\"Section1.Table2.Text2\",\"label\":\"Name\",\"elementId\":\"text-input-Table2:Text2[10]\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[3]\\/div[3]\\/div[1]\\/table[1]\\/tbody[1]\\/tr[3]\\/td[1]\\/div[1]\\/div[1]\\/div[1]\\/input[1]\"}] and case data [null],\n26 Jul 2023 16:14:56,977 com.ibm.cte.sdc.bpm.testing.command.coach.JsCommand [DEBUG] [pipelineBuild_513_testcase_170]: [UI.text] Found multiple coachViews by \"Section1.Table2.Text2\", will try to locate the coach view by label or xpath\n26 Jul 2023 16:15:01,171 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [sendKey] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[3]/div[1]/table[1]/tbody[1]/tr[3]/td[1]/div[1]/div[1]/div[1]/input[1], value: Jim}\n26 Jul 2023 16:15:13,632 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [29], associate command [select], parameters [{\"value\":\"[\\\"Bachelor of Science (BS)\\\",\\\"Bachelor of Engineering (B.Eng)\\\"]\",\"controlId\":\"Section1.Table2.Multiple_Select1\",\"label\":\"Education\",\"elementId\":\"multiselect-Table2:Multiple_Select1[10]\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[3]\\/div[3]\\/div[1]\\/table[1]\\/tbody[1]\\/tr[3]\\/td[2]\\/div[1]\\/div[1]\\/div[1]\\/select[1]\"}] and case data [null],\n26 Jul 2023 16:15:22,651 com.ibm.cte.sdc.bpm.testing.command.coach.JsCommand [DEBUG] [pipelineBuild_513_testcase_170]: [UI.select] Found multiple coachViews by \"Section1.Table2.Multiple_Select1\", will try to locate the coach view by label or xpath\n26 Jul 2023 16:15:29,581 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[3]/div[1]/table[1]/tbody[1]/tr[3]/td[2]/div[1]/div[1]/div[1]/select[1], value: Bachelor of Science (BS)}\n26 Jul 2023 16:15:30,462 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[3]/div[1]/table[1]/tbody[1]/tr[3]/td[2]/div[1]/div[1]/div[1]/select[1], value: Bachelor of Engineering (B.Eng)}\n26 Jul 2023 16:15:41,748 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [30], associate command [select], parameters [{\"value\":\"[\\\"Graphic Design\\\",\\\"Customer Service\\\"]\",\"controlId\":\"Section1.Table2.Multiple_Select2\",\"label\":\"Skills\",\"elementId\":\"multiselect-Table2:Multiple_Select2[10]\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[3]\\/div[3]\\/div[1]\\/table[1]\\/tbody[1]\\/tr[3]\\/td[3]\\/div[1]\\/div[1]\\/div[1]\\/select[1]\"}] and case data [null],\n26 Jul 2023 16:15:50,705 com.ibm.cte.sdc.bpm.testing.command.coach.JsCommand [DEBUG] [pipelineBuild_513_testcase_170]: [UI.select] Found multiple coachViews by \"Section1.Table2.Multiple_Select2\", will try to locate the coach view by label or xpath\n26 Jul 2023 16:15:58,552 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[3]/div[1]/table[1]/tbody[1]/tr[3]/td[3]/div[1]/div[1]/div[1]/select[1], value: Graphic Design}\n26 Jul 2023 16:15:59,435 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [select] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[3]/div[1]/table[1]/tbody[1]/tr[3]/td[3]/div[1]/div[1]/div[1]/select[1], value: Customer Service}\n26 Jul 2023 16:16:10,679 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [31], associate command [radio], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[1]\\/div[2]\\/div[1]\\/div[1]\\/div[2]\\/div[3]\\/div[1]\\/table[1]\\/tbody[1]\\/tr[3]\\/td[4]\\/div[1]\\/div[1]\\/div[1]\\/span[3]\\/input[1]\",\"elementId\":\"radiogroup-item-input-Table2:Radio_Buttons1[10][2]\",\"tagName\":\"input\",\"type\":\"radio\",\"event\":\"change\",\"command\":\"UI.radio\",\"value\":\"3-4 years experience\",\"controlId\":\"Section1.Table2.Radio_Buttons1\",\"label\":\"Experience\"}] and case data [null],\n26 Jul 2023 16:16:19,696 com.ibm.cte.sdc.bpm.testing.command.coach.JsCommand [DEBUG] [pipelineBuild_513_testcase_170]: [UI.radio] Found multiple coachViews by \"Section1.Table2.Radio_Buttons1\", will try to locate the coach view by label or xpath\n26 Jul 2023 16:16:30,419 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [32], associate command [click], parameters [{\"value\":\"Submit\",\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[2]\\/div[1]\\/div[2]\\/button[1]\"}] and case data [null],\n26 Jul 2023 16:16:40,539 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_513_testcase_170]: [click] element {xpath:/html[1]/body[1]/div[1]/div[2]/div[1]/div[2]/button[1], value: }\n26 Jul 2023 16:16:59,416 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [33], associate command [assertTaskStatus], parameters [{\"taskName\":\"Task: Find job candidates\",\"taskStatus\":\"Closed\"}] and case data [null],\n26 Jul 2023 16:17:00,765 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: [existCase]#ID:[170] - Running the case step with index [34], associate command [debug], parameters [{}] and case data [null],\n26 Jul 2023 16:17:00,768 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_513_testcase_170]: Debug log is: null\n26 Jul 2023 16:17:02,315 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_513_testcase_170]: End with executing the test case with id 170 and name existCase!\n26 Jul 2023 16:17:09,197 com.ibm.websphere.bpm.diagram.CalculateActualLines [DEBUG] [pipelineBuild_513_testcase_170]: The nodepaths size is empty or more than one, skip calculate actual line, the nodepaths size is 2\n26 Jul 2023 16:17:09,250 com.ibm.websphere.bpm.diagram.CalculateActualLines [DEBUG] [pipelineBuild_513_testcase_170]: The nodepaths size is empty or more than one, skip calculate actual line, the nodepaths size is 2\n26 Jul 2023 16:17:09,284 com.ibm.websphere.bpm.diagram.CalculateActualLines [DEBUG] [pipelineBuild_513_testcase_170]: The nodepaths size is empty or more than one, skip calculate actual line, the nodepaths size is 2\n26 Jul 2023 16:17:12,406 com.ibm.websphere.bpm.diagram.CalculateActualLines [DEBUG] [pipelineBuild_513_testcase_170]: The nodepaths size is empty or more than one, skip calculate actual line, the nodepaths size is 2\n26 Jul 2023 16:17:12,422 com.ibm.websphere.bpm.diagram.CalculateActualLines [DEBUG] [pipelineBuild_513_testcase_170]: The nodepaths size is empty or more than one, skip calculate actual line, the nodepaths size is 2\n26 Jul 2023 16:17:12,435 com.ibm.websphere.bpm.diagram.CalculateActualLines [DEBUG] [pipelineBuild_513_testcase_170]: The nodepaths size is empty or more than one, skip calculate actual line, the nodepaths size is 2\n26 Jul 2023 16:17:12,527 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: End pipeline step execution.\n26 Jul 2023 16:17:12,685 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: Start to execute pipeline step(name: Snapshot, type: Snapshot) in stage(name: Development,type: DEV,toolkit: false,processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,snapshotId: 2064.d4a3ce98-fdd5-4c30-9dcd-95d6033e0c87), exeuctionParam(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,branchName: Main)\n26 Jul 2023 16:17:15,430 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_513]: The last snapshot name is 0.00.1588 - HSS Main 20230726030001\n26 Jul 2023 16:17:15,431 com.ibm.websphere.bpm.util.StringUtils [DEBUG] [pipelineBuild_513]: nextVersion: 0.00.1589\n26 Jul 2023 16:17:15,431 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_513]: The next version is 0.00.1589\n26 Jul 2023 16:17:15,431 com.ibm.cte.sdc.bpm.testing.executor.pipeline.SnapshotStepExecutor [INFO ] [pipelineBuild_513]: Start to take snapshot with args: BranchId=2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e, snapshotName=0.00.1589 - HSS Main 20230726161713\n26 Jul 2023 16:17:19,575 com.ibm.cte.sdc.bpm.testing.service.PipelineService [DEBUG] [pipelineBuild_513]: update pipeline last trigger time: 2023-07-26T16:17:16.000+0800\n26 Jul 2023 16:17:19,576 com.ibm.cte.sdc.bpm.testing.executor.pipeline.SnapshotStepExecutor [INFO ] [pipelineBuild_513]: Run pipeline with a new snapshot: [0.00.1589 - HSS Main 20230726161713, 2064.eb0bf6ed-5cf2-4ac5-b9d7-864e18938567]\n26 Jul 2023 16:17:19,576 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: End pipeline step execution.\n26 Jul 2023 16:17:21,445 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [WARN ] [pipelineBuild_513]: Can't found snapshot configured in the stage(name: QA,type: QA,toolkit: false), executionParams(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchId: 2063.1a52abd6-b068-4f9e-91a9-ded9793eb34e,branchName: Main,snapshotAcronym: 0.00._6)\n26 Jul 2023 16:17:22,252 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: Start to execute pipeline step(name: Deployment, type: Deployment) in stage(name: QA,type: QA,toolkit: false), exeuctionParam(processAppId: 2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0,processAppAcronym: HSS,branchName: Main,snapshotAcronym: 0.00._6)\n26 Jul 2023 16:17:23,783 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [ERROR] [pipelineBuild_513]: Failed to get snapshot ID with bpmConfig:https://coupe1.fyre.ibm.com:9443, processAppAcronym:HSS, snapshotAcronym:0.00._6 due to: Bad Request, the respone code is 400 with method as GET,\n{\"error_number\":\"CWTBG0646E\",\"error_message\":\"CWTBG0646E: Snapshot '0.00._6' specified for parameter 'version' does not exist.\",\"error_message_parameters\":[\"0.00._6\",\"version\"]}\ncom.ibm.websphere.bpm.api.rest.ResponseFailException: Bad Request, the respone code is 400 with method as GET,\n{\"error_number\":\"CWTBG0646E\",\"error_message\":\"CWTBG0646E: Snapshot '0.00._6' specified for parameter 'version' does not exist.\",\"error_message_parameters\":[\"0.00._6\",\"version\"]}\nat com.ibm.websphere.bpm.api.rest.GenericClient.handleConnectFailed(GenericClient.java:691) ~[bpm-rest-api-23.0.6.jar:?]\nat com.ibm.websphere.bpm.api.rest.GenericClient.request(GenericClient.java:540) ~[bpm-rest-api-23.0.6.jar:?]\nat com.ibm.websphere.bpm.api.rest.GenericClient.request(GenericClient.java:472) ~[bpm-rest-api-23.0.6.jar:?]\nat com.ibm.websphere.bpm.api.rest.GenericClient.request(GenericClient.java:462) ~[bpm-rest-api-23.0.6.jar:?]\nat com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient.request(SwaggerClient.java:866) ~[bpm-rest-api-23.0.6.jar:?]\nat com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient.get(SwaggerClient.java:852) ~[bpm-rest-api-23.0.6.jar:?]\nat com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient.snapshot(SwaggerClient.java:701) ~[bpm-rest-api-23.0.6.jar:?]\nat com.ibm.cte.sdc.bpm.testing.service.ProcessAppService.getSnapshotByAcronym(ProcessAppService.java:1585) ~[classes/:?]\nat com.ibm.cte.sdc.bpm.testing.executor.pipeline.DeploymentStepExecutor.execute(DeploymentStepExecutor.java:106) ~[classes/:?]\nat com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService.stepExecution(PipelineExecutionService.java:326) ~[classes/:?]\nat com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService.executeExt(PipelineExecutionService.java:223) ~[classes/:?]\nat com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService.execute(PipelineExecutionService.java:135) ~[classes/:?]\nat com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService.executeAsync(PipelineExecutionService.java:123) ~[classes/:?]\nat com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService$$FastClassBySpringCGLIB$$b02b9fa2.invoke(<generated>) ~[classes/:?]\nat org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218) ~[spring-core-5.2.2.RELEASE.jar:5.2.2.RELEASE]\nat org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:769) ~[spring-aop-5.2.2.RELEASE.jar:5.2.2.RELEASE]\nat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163) ~[spring-aop-5.2.2.RELEASE.jar:5.2.2.RELEASE]\nat org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:747) ~[spring-aop-5.2.2.RELEASE.jar:5.2.2.RELEASE]\nat org.springframework.aop.interceptor.AsyncExecutionInterceptor.lambda$invoke$0(AsyncExecutionInterceptor.java:115) ~[spring-aop-5.2.2.RELEASE.jar:5.2.2.RELEASE]\nat java.util.concurrent.FutureTask.run(Unknown Source) [?:1.8.0_381]\nat java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source) [?:1.8.0_381]\nat java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source) [?:1.8.0_381]\nat java.lang.Thread.run(Unknown Source) [?:1.8.0_381]\n26 Jul 2023 16:17:25,349 com.ibm.cte.sdc.bpm.testing.executor.pipeline.DeploymentStepExecutor [INFO ] [pipelineBuild_513]: Start the online deployment with args: ProcessApp=HSS, snapshotName=0.00._6\n26 Jul 2023 16:17:25,349 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_513]: Start install processApp snapshot to remote process server, pc:https://socking1.fyre.ibm.com:9443, ps:De1ProcessServer, processAppAcronym:HSS, containerSnapshotAcronym:0.00._6, targetEnvironmentName:Workflow Default Target Environment\n26 Jul 2023 16:17:26,178 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [DEBUG] [pipelineBuild_513]: Installed processApp processAppAcronym:HSS snapshot snapshotAcronym:0.00._6 from pc:https://socking1.fyre.ibm.com:9443 to remote process server ps:De1ProcessServer, result:{description=Your request to install the snapshot was submitted. You can check the progress of the installation by calling the returned url., url=https://socking1.fyre.ibm.com:9443/ops/system/queue/2713?key=f4ff56b55bef18b35fc08ae5540de60b}\n26 Jul 2023 16:17:37,908 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_513]: Queue message: {state=success, result={container=HSS, server=De1ProcessServer, version=0.00._6}, last_modified=2023-07-26T08:17:37.396Z}\n26 Jul 2023 16:17:37,908 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [DEBUG] [pipelineBuild_513]: Start snapshot is installed check, the request will timeout in 600 seconds\n26 Jul 2023 16:17:40,018 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_513]: Start setting default snapshot for processAppAcronym:HSS, snapshotAcronym:0.00._6...\n26 Jul 2023 16:17:40,833 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [DEBUG] [pipelineBuild_513]: Set default snapshot snapshotAcronym:HSS for processAppAcronym:0.00._6, result:{version=0.00._6, id=2064.eb0bf6ed-5cf2-4ac5-b9d7-864e18938567, description=0.00.1589 - HSS Main 20230726161713, active=true, tip=true, branch=0.00.1589 - HSS Main 20230726161713, container=HSS, status=New, capability=Capability[Standard], archived=false, version_name=0.00.1589 - HSS Main 20230726161713, creation_date=2023-07-26T01:17:35z, creator_user_id=2048.9, creator_user_name=bpmadmin, branch_id=2063.148c3bc7-7ade-4abd-a63e-72348297f1f7, branch_name=0.00.1589 - HSS Main 20230726161713, container_id=2066.9ab0d0c6-d92c-4355-9ed5-d8a05acdc4b0, container_name=Hiring Sample, is_default=true}\n26 Jul 2023 16:18:10,837 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [DEBUG] [pipelineBuild_513]: 1 recheck the snapshot 0.00._6 set default result\n26 Jul 2023 16:18:12,170 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_513]: Start sync environment variables from source snapshot 0.00._4 to target snapshot 0.00._6 for processAppAcronym:HSS...\n26 Jul 2023 16:18:12,960 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [DEBUG] [pipelineBuild_513]: Synced Environment Variables by Swagger API: result: {description=Your request to synchronize the environment variables for the specified snapshot was submitted. You can check the progress of the synchronization by accessing the URL in the response., url=https://coupe1.fyre.ibm.com:9443/ops/system/queue/6445?key=eca08281963f7d073cbed3a899603057}\n26 Jul 2023 16:18:13,234 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_513]: Queue message: {state=success, result={Message=The environment variables of '0.00._6' target snapshot were successfully synchronized with '0.00._4' source snapshot., status=success}, last_modified=2023-07-26T08:18:13.137Z}\n26 Jul 2023 16:18:13,235 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_513]: Start sync EPVs from source snapshot 0.00._4 to target snapshot 0.00._6 for processAppAcronym:HSS...\n26 Jul 2023 16:18:14,019 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [DEBUG] [pipelineBuild_513]: Synced EPVs by Swagger API: result: {description=Your request to synchronize the EPVs for the specified snapshot was submitted. You can check the progress of the synchronization by accessing the URL in the response., url=https://coupe1.fyre.ibm.com:9443/ops/system/queue/6446?key=b23e3296d8b01ad643662984604c0b55}\n26 Jul 2023 16:18:14,336 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_513]: Queue message: {state=success, result={Message=The EPVs of '0.00._6' target snapshot were successfully synchronized with '0.00._4' source snapshot., status=success}, last_modified=2023-07-26T08:18:14.178Z}\n26 Jul 2023 16:18:14,336 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [INFO ] [pipelineBuild_513]: Start sync team bindings from source snapshot 0.00._4 to target snapshot 0.00._6 for processAppAcronym:HSS...\n26 Jul 2023 16:18:15,109 com.ibm.cte.sdc.bpm.deployment.service.DeploymentService [DEBUG] [pipelineBuild_513]: Synced Teams by Swagger API: result: {description=Your request to synchronize the team bindings for the specified snapshot was submitted. You can check the progress of the synchronization by calling the returned url., url=https://coupe1.fyre.ibm.com:9443/ops/system/queue/6447?key=acaf5bc83cbae605bd9aee9776d09f30}\n26 Jul 2023 16:18:15,392 com.ibm.cte.sdc.bpm.testing.rest.baw.SwaggerClient [DEBUG] [pipelineBuild_513]: Queue message: {state=success, result={Message='0.00._6' target snapshot was successfully synchronized with '0.00._4' source snapshot., status=success}, last_modified=2023-07-26T08:18:15.283Z}\n26 Jul 2023 16:18:15,392 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_513]: End pipeline step execution.\n",
  "errorMessage": null,
  "buildId": 513,
  "currentStage": "QA",
  "currentStep": "Deployment",
  "stages": [
    {
      "name": "Development",
      "status": "Success",
      "steps": [
        {
          "name": "Checkstyle",
          "artifacts": "28",
          "score": "10",
          "warnings": "17",
          "status": "SUCCESS",
          "startDate": "2023-07-26 16:03:30",
          "endDate": "2023-07-26 16:04:12",
          "duration": "42",
          "result": {
            "details": [
              {
                "tag": "Implementation",
                "artifactName": "The Activity Component <b>Notify hiring manager</b> of the Lane <b>System</b> of the Process <b>Standard HR Open New Position</b>",
                "ruleName": "check-bpd-phantom-steps",
                "symptom": "Phantom steps(no implementation on step).",
                "bestPractice": "If the activity is not necessary for the Process you should delete it. Otherwise, add implementaion to the activity.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Performance",
                "artifactName": "The Activity Component <b>Send escalation notice</b> of the Lane <b>System</b> of the Process <b>Standard HR Open New Position</b>",
                "ruleName": "check-delete-completed-task",
                "symptom": "The task is not set to delete on completion.",
                "bestPractice": "It's recommended that you enable <b>Delete Task on Completion</b> for tasks in a system swim lane, because large volumes of completed tasks can greatly impact the performance of instance migration.",
                "severityLevel": "CRITICAL",
                "referenceList": "RedBook:IBM BPM Performance Tuning and Best Practices;https://www.redbooks.ibm.com/redbooks/pdfs/sg248216.pdf@"
              },
              {
                "tag": "Redundant",
                "artifactName": "The Heritage Human Service <b>Human Service</b>",
                "ruleName": "check-app-unused-service",
                "symptom": "The service is not used.",
                "bestPractice": "Services should be used by other artifacts or defined as an exposed human service. Redundant services should be deleted.",
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
                "artifactName": "The Private Variable <b>skills</b> of the Client Side Human Service <b>Create Position Request CSHS</b>",
                "ruleName": "check-service-unused-variables",
                "symptom": "The variable is not used.",
                "bestPractice": "The unused variables should be deleted.",
                "severityLevel": "MAJOR",
                "referenceList": ""
              },
              {
                "tag": "Performance",
                "artifactName": "The Process <b>Standard HR Open New Position</b>",
                "ruleName": "check-auto-tracking-enable",
                "symptom": "The auto tracking is enabled.",
                "bestPractice": "<b>Auto-tracking</b> is enabled by default for Processs. This capability is important for many Processs because it enables the gathering, tracking, and reporting of key business metrics. However, an additional cost exists as a result of auto-tracking because the events are processed by the Performance Data Warehouse and persisted in the database. Disable auto tracking for Proesses that do not require tracking and reporting business metrics. This rule only applies to BAW on-prem, and can be ignored if you will deploy the app to BAW on Container.",
                "severityLevel": "MAJOR",
                "referenceList": "IBM Automation Community about best-practices-recommendations;https://www.ibm.com/community/automation/docs/baw/best-practices-recommendations/@RedBook:IBM BPM Performance Tuning and Best Practices;https://www.redbooks.ibm.com/redbooks/pdfs/sg248216.pdf@"
              }
            ]
          }
        },
        {
          "name": "Test",
          "status": "SUCCESS",
          "startDate": "2023-07-26 16:04:12",
          "endDate": "2023-07-26 16:17:12",
          "duration": "779",
          "result": {
            "testProjectId": 65,
            "testProjectName": "Hiring Sample4934",
            "testSuites": [
              {
                "testSuiteId": 450,
                "testSuiteName": "Standard HR Open New Position",
                "testSuiteExecutionStatus": "Passed",
                "testSuiteTimestamp": "20230726160431",
                "testCases": [
                  {
                    "testCaseStatus": "Passed",
                    "testCaseTimestamp": "20230726160431",
                    "testCaseId": 170,
                    "testCaseDesc": null,
                    "testCaseName": "existCase",
                    "testCaseEvidence": [
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/131d4444-999a-4321-937a-cf22aaebb1cb.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/37d3c71e-4b99-4b6e-b9a3-2d7127cd5e5f.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/a2e023f9-08bd-41f9-bd55-cd06892ad93f.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/02e16cbe-76f0-4d32-937c-b14cca0c4ee8.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/bc2de7fb-73d3-435e-80e0-467639e15eed.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/59be7d56-e68a-4d18-b240-30c6604fd702.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/5af9c9b6-a624-4fb1-9bac-09593e234ee1.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/2f17b54e-bce4-4f55-b0b0-5266db9a6a42.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/565fb3fb-bf7f-41a4-92a7-44135a601750.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/2d57b406-6eab-4a83-9a21-284d042837b6.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/d79d5b34-87cd-41a4-a57d-dc4353fd85cf.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/e3894f8e-011b-47d6-b4e3-4755d7f2f389.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/3c4b5c30-0894-48d4-aab0-77ac1cf30501.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/60091628-65bd-448a-a5a7-691f7b55d913.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/60d609dd-1a4f-4a68-9cd0-cd0baccdf6ee.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/d469d4df-0902-4b42-b4bd-1f1e61652daa.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/b5db92ed-c94d-49b7-b1db-77a9399d22ae.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/c957abcb-e51d-4532-9428-1550a9fd328c.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/4982d7c7-895b-4cb7-a00c-7cbc1766ee59.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/2ca5c4ea-7763-4fb5-9952-98478a819cf8.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/254fe516-b025-4fd8-a8c7-901c0ecb7315.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/7de879f2-c0a4-4b9e-93eb-17df7b7f55a6.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/67013a2c-84ce-49e4-aa8f-889ea1975236.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/5a0f27fc-bdc9-4928-a011-12ca8c8a08ac.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/fa369a04-4a34-4aed-b463-c5f1249b69be.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/487697eb-2eb7-40a3-bd3b-72a4d30f3b7f.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/7c5835c2-83cb-4a3c-bb6f-43306b05f42c.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/d53269d5-e582-4246-a722-ea5933043a13.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/331ef6de-1fa9-4af7-bc7c-5c030ad572f0.png",
                      "/pipeline/65/build_513/project-65-8d8bf103-4917-4555-a252-75e7a6300637/case-170/2487d0da-e7a1-43c7-baaf-d359a9c9ac16.png"
                    ]
                  }
                ]
              }
            ]
          }
        },
        {
          "name": "Snapshot",
          "snapshotId": "2064.eb0bf6ed-5cf2-4ac5-b9d7-864e18938567",
          "snapshotName": "0.00.1589 - HSS Main 20230726161713",
          "status": "SUCCESS",
          "startDate": "2023-07-26 16:17:12",
          "endDate": "2023-07-26 16:17:19",
          "duration": "6"
        }
      ]
    },
    {
      "name": "QA",
      "status": "Success",
      "steps": [
        {
          "name": "Deployment",
          "status": "SUCCESS",
          "startDate": "2023-07-26 16:17:22",
          "endDate": "2023-07-26 16:18:15",
          "duration": "53"
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
