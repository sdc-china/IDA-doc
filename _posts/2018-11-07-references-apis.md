---
title: "IDA REST APIs"
category: references
date: 2018-10-29 15:17:55
last_modified_at: 2022-05-26 16:44:00
order: 4
---

# IDA REST APIs
***

IDA REST APIs references.

## Swagger URL
    http://[serverhost]:[port]/ida/swagger-ui.html
    http://[serverhost]:[port]/ida/v2/api-docs

![][swagger_ui]

## Authentication

IDA REST APIs support basic authentication. 

## Pipeline
- **[<code>GET /rest/v2/pipelines</code> Get pipeline list.](#get-pipeline-list)**
- **[<code>GET /rest/v2/pipelines/metadata?pipelineId=:id(?pipelineName=:name)</code> Get pipeline metadata.](#get-pipeline-metadata)**
- **[<code>POST /rest/v2/pipelines/builds?pipelineId=:id(?pipelineName=:name)</code>  Trigger pipeline build.](#trigger-pipeline-build)**
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
            "haltOnFailure": false
          }
        },
        {
          "name": "Test",
          "params": {
            "testProjectId": 1,
            "tip": false
          }
        }
      ]
    },
    {
      "name": "QA",
      "steps": [
        {
          "name": "Test",
          "params": {
            "testProjectId": 1,
            "tip": false
          }
        }
      ]
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
| `pipelineId`   | No          | Pipeline id. <br>You could get the pipeline id from the [Get Pipeline List REST API](#get-pipeline-list). |
| `pipelineName` | No          | Pipeline name. <br>You could get the pipeline name from the [Get Pipeline List REST API](#get-pipeline-list). |
| `pipelineRestInput`   | No          |  Parameter used to overwrite some pipeline definition, for example: <br>**container:** the acronym of a process application/toolkit used to trigger a build.<br>**snapshotAcronym:** the snapshot acronym of the process app/toolkit.<br>**branchName:** the track name of the process app/toolkit. <br>Either snapshotAcronym or branchName can be specified. If branchName is specified, the latest snapshot on that branch will be used to start the build. If no **container**/**snapshotAcronym**/**branchName**, the snapshot configured in pipeline definition will be used to start the build.<br>**installFileName:**the Workflow installation package file name to be deployed.<br><br>For a Snapshot step, **namingConvention** can be overwritten.<br>For a Checkstyle step, all checkstyle options e.g. **tip**, **healthScoreThreshold**, **warningsThreshold**, **ignoreDocCheck**, **ignoreJsCheck**, **ignoreToolkitsCheck**, **haltOnFailure** can be overwritten.<br>For a Test step, **tip** and **testProjectId** can be overwritten. Specify a test project id of the triggering process app/toolkit.|

**Example:**

Request
```
	curl -X POST "https://[serverhost]:[port]/ida/rest/v2/pipelines/builds?pipelineId=1" -H "accept: application/json;charset=UTF-8" -H "Content-Type: application/json" -d "{ \"container\": \"ISA\", \"snapshotAcronym\": \"0.00.06\", \"branchName\": \"\", \"installFileName\": \"\", \"stages\": [ { \"name\": \"Development\", \"steps\": [ { \"name\": \"Snapshot\", \"params\": { \"namingConvention\": \"{MAJOR.MINOR.PATCH} - {APP_ACRONYM} {TRACK} {yyyyMMddHHmmss}\" } }, { \"name\": \"Checkstyle\", \"params\": { \"tip\": true, \"healthScoreThreshold\": 20, \"warningsThreshold\": 200, \"ignoreDocCheck\": true, \"ignoreJsCheck\": true, \"ignoreToolkitsCheck\": true, \"haltOnFailure\": false } }, { \"name\": \"Test\", \"params\": { \"testProjectId\": 65, \"tip\": false } } ] }, { \"name\": \"QA\", \"steps\": [ { \"name\": \"Test\", \"params\": { \"testProjectId\": 65, \"tip\": false } } ] } ]}"
```
  or
```
  curl -X POST "https://[serverhost]:[port]/ida/rest/v2/pipelines/builds?pipelineName=HSS%20Pipeline" -H "accept: application/json;charset=UTF-8" -H "Content-Type: application/json" -d "{ \"container\": \"ISA\", \"snapshotAcronym\": \"0.00.06\", \"branchName\": \"\", \"installFileName\": \"\", \"stages\": [ { \"name\": \"Development\", \"steps\": [ { \"name\": \"Snapshot\", \"params\": { \"namingConvention\": \"{MAJOR.MINOR.PATCH} - {APP_ACRONYM} {TRACK} {yyyyMMddHHmmss}\" } }, { \"name\": \"Checkstyle\", \"params\": { \"tip\": true, \"healthScoreThreshold\": 20, \"warningsThreshold\": 200, \"ignoreDocCheck\": true, \"ignoreJsCheck\": true, \"ignoreToolkitsCheck\": true, \"haltOnFailure\": false } }, { \"name\": \"Test\", \"params\": { \"testProjectId\": 65, \"tip\": false } } ] }, { \"name\": \"QA\", \"steps\": [ { \"name\": \"Test\", \"params\": { \"testProjectId\": 65, \"tip\": false } } ] } ]}"
```

Response
``` json
{
  "pipelineId": 1,
  "pipelineName": "HSS Pipeline",
  "buildId": 674,
  "teamName": "Private",
  "status": "RUNNING"
}
```


### **Get Pipeline Build Status**
___
Get a pipeline build status by build id.

**URL:**

```
/rest/v2/pipelines/builds/{buildId}
```

**Method:**  ```GET```


**Parameter:**

| Name | Required                        | Description        |
|----------------|------------|--------------|
| `buildId`   | Yes          | Build id. <br>You could get the build id from the reponse of the [Trigger Pipeline Build REST API](#trigger-pipeline-build). |
| `parts`   | No          | Specify value "all" to get detailed build status including detailed build logs and test case results.|


**Example:**

Request
```
  curl -X GET "https://[serverhost]:[port]/ida/rest/v2/pipelines/builds/674" -H "accept: application/json;charset=UTF-8"
```
Response
``` json
{
  "status": "SUCCESS",
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
  "status": "SUCCESS",
  "pipelineId": 1,
  "pipelineName": "HSS Pipeline",
  "triggerBy": "idaAdmin",
  "report": "https://[serverhost]:[port]/ida/pipelines/1/builds/674?standalone=true",
  "logs": "26 May 2022 16:23:20,399 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: ======Start to run pipeline======\n26 May 2022 16:23:20,705 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: Pipeline ID:1\n26 May 2022 16:23:20,706 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: Pipeline Name:HSS Pipeline\n26 May 2022 16:23:20,706 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: Trigger By:idaAdmin\n26 May 2022 16:23:20,759 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: Triggering pipelineRestInput:{\"PipelineRestInput\":{\"container\":\"ISA\",\"snapshotAcronym\":\"0.00.06\",\"installFileName\":\"\",\"branchName\":\"\",\"stages\":[{\"com.ibm.cte.sdc.bpm.testing.model.PipelineRestStage\":[{\"name\":\"Development\",\"steps\":[{\"com.ibm.cte.sdc.bpm.testing.model.PipelineRestStep\":[{\"name\":\"Snapshot\",\"params\":[{\"@class\":\"linked-hash-map\",\"entry\":{\"string\":[\"namingConvention\",\"{MAJOR.MINOR.PATCH} - {APP_ACRONYM} {TRACK} {yyyyMMddHHmmss}\"]}}]},{\"name\":\"Checkstyle\",\"params\":[{\"@class\":\"linked-hash-map\",\"entry\":[{\"string\":\"tip\",\"boolean\":true},{\"string\":\"healthScoreThreshold\",\"int\":20},{\"string\":\"warningsThreshold\",\"int\":200},{\"string\":\"ignoreDocCheck\",\"boolean\":true},{\"string\":\"ignoreJsCheck\",\"boolean\":true},{\"string\":\"ignoreToolkitsCheck\",\"boolean\":true},{\"string\":\"haltOnFailure\",\"boolean\":false}]}]},{\"name\":\"Test\",\"params\":[{\"@class\":\"linked-hash-map\",\"entry\":[{\"string\":\"testProjectId\",\"int\":65},{\"string\":\"tip\",\"boolean\":false}]}]}]}]},{\"name\":\"QA\",\"steps\":[{\"com.ibm.cte.sdc.bpm.testing.model.PipelineRestStep\":{\"name\":\"Test\",\"params\":[{\"@class\":\"linked-hash-map\",\"entry\":[{\"string\":\"testProjectId\",\"int\":65},{\"string\":\"tip\",\"boolean\":false}]}]}}]}]}]}}\n26 May 2022 16:23:20,805 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: Trigger Time:20220526162320\n26 May 2022 16:23:20,805 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: =================================\n26 May 2022 16:23:29,254 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: Start to execute pipeline step: name=Snapshot, type=Snapshot,\n26 May 2022 16:23:29,254 com.ibm.cte.sdc.bpm.testing.executor.pipeline.StepExecutor [INFO ] [pipelineBuild_674]: Set namingConvention to {MAJOR.MINOR.PATCH} - {APP_ACRONYM} {TRACK} {yyyyMMddHHmmss}\n26 May 2022 16:23:29,255 com.ibm.cte.sdc.bpm.testing.executor.pipeline.SnapshotStepExecutor [INFO ] [pipelineBuild_674]: Run pipeline with an exist snapshot: [0.00.06], bypass the taking snapshot step.\n26 May 2022 16:23:29,255 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: End pipeline step execution.\n26 May 2022 16:23:29,264 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: Start to execute pipeline step: name=Checkstyle, type=Checkstyle,\n26 May 2022 16:23:29,264 com.ibm.cte.sdc.bpm.testing.executor.pipeline.StepExecutor [INFO ] [pipelineBuild_674]: Set ignoreDocCheck to true\n26 May 2022 16:23:29,264 com.ibm.cte.sdc.bpm.testing.executor.pipeline.StepExecutor [INFO ] [pipelineBuild_674]: Set ignoreJsCheck to true\n26 May 2022 16:23:29,264 com.ibm.cte.sdc.bpm.testing.executor.pipeline.StepExecutor [INFO ] [pipelineBuild_674]: Set ignoreToolkitsCheck to true\n26 May 2022 16:23:29,264 com.ibm.cte.sdc.bpm.testing.executor.pipeline.StepExecutor [INFO ] [pipelineBuild_674]: Set healthScoreThreshold to 20\n26 May 2022 16:23:29,265 com.ibm.cte.sdc.bpm.testing.executor.pipeline.StepExecutor [INFO ] [pipelineBuild_674]: Set warningsThreshold to 200\n26 May 2022 16:23:29,265 com.ibm.cte.sdc.bpm.testing.executor.pipeline.StepExecutor [INFO ] [pipelineBuild_674]: Set tip to true\n26 May 2022 16:23:29,265 com.ibm.cte.sdc.bpm.testing.executor.pipeline.StepExecutor [INFO ] [pipelineBuild_674]: Set haltOnFailure to false\n26 May 2022 16:23:29,456 com.ibm.cte.sdc.bpm.testing.executor.pipeline.CheckstyleStepExecutor [INFO ] [pipelineBuild_674]: Start to run checkstyle with args: ProcessAppId=2066.bb7001c9-d96b-4fda-9760-fef7c4116429, BranchId=2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, SnapshotId=null, Tip=true\n26 May 2022 16:23:33,830 com.ibm.websphere.bpm.api.rest.GenericClient [DEBUG] [pipelineBuild_674]: 9.30.25.65_443_2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09_2064.86772be3-9d70-4e63-a435-62d16f0ebeaa.twx download completed!\n26 May 2022 16:23:33,886 com.ibm.websphere.bpm.checkstyle.TWXFileChecker [DEBUG] [pipelineBuild_674]: checkstyle.properties not found in WEB\n26 May 2022 16:23:34,118 com.ibm.cte.sdc.bpm.checkstyle.executor.CheckstyleExecutor [INFO ] [pipelineBuild_674]: Execute Checkstyle with uploadPath:/var/ida/data\\twx\\, docId:9.30.25.65_443_2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09_2064.86772be3-9d70-4e63-a435-62d16f0ebeaa.twx, styleRulePath:null, twx:\\var\\ida\\data\\twx\\9.30.25.65_443_2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09_2064.86772be3-9d70-4e63-a435-62d16f0ebeaa.twx\n26 May 2022 16:23:34,119 com.ibm.cte.sdc.bpm.checkstyle.service.TWXFileEmbeddedChecker [DEBUG] [pipelineBuild_674]: BPM checkstyle embedded started. Input twx = \\var\\ida\\data\\twx\\9.30.25.65_443_2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09_2064.86772be3-9d70-4e63-a435-62d16f0ebeaa.twx.\n26 May 2022 16:23:38,218 com.ibm.cte.sdc.bpm.checkstyle.service.TWXFileEmbeddedChecker [INFO ] [pipelineBuild_674]: End invoking decision service. Count of check messages: 144.\n26 May 2022 16:23:38,349 com.ibm.cte.sdc.baw.statistic.BawStatServiceImpl [DEBUG] [pipelineBuild_674]: The case artifact file is null, skip the case artifact analysis!\n26 May 2022 16:23:38,645 com.ibm.cte.sdc.bpm.checkstyle.service.TWXFileEmbeddedChecker [INFO ] [pipelineBuild_674]: Report generated. BPM checkstyle ended\n26 May 2022 16:23:38,647 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: End pipeline step execution.\n26 May 2022 16:23:38,681 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: Start to execute pipeline step: name=Test, type=Test,\n26 May 2022 16:23:38,682 com.ibm.cte.sdc.bpm.testing.executor.pipeline.StepExecutor [INFO ] [pipelineBuild_674]: Set tip to false\n26 May 2022 16:23:39,915 com.ibm.cte.sdc.bpm.testing.executor.pipeline.TestStepExecutor [INFO ] [pipelineBuild_674]: Start to run tests with args: projectName=IDA Sample-BAW 20002 Regress Traditional, BranchId=2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, SnapshotId=2064.ba74cb40-1937-49a4-a324-5b45993b0fdd, Tip=false\n26 May 2022 16:24:01,010 com.ibm.cte.sdc.baw.analysis.icm.service.ContentEngineService [DEBUG] [pipelineBuild_674]: Folder /IBM Case Manager/Solutions/IDA Sample App/ not found.Failed to get the solution definition from bpmConfig https://9.30.25.65 from object store dos, it is not a case solution project.\n26 May 2022 16:24:02,003 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_674]: The number of dependency toolkits is 5\n26 May 2022 16:24:02,004 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item Adhoc Process:25.1896bb58-3cba-4e81-a299-6347067cd248 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:03,238 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item HR Open New Position:25.073dcdf8-0f71-45fe-8202-aeb203726262 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:04,388 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item HR Process with Parameter:25.801cf7b2-8744-4f7b-b51f-7b848d97eb8e diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:05,561 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item UCA Process:25.127b7d47-2bfb-4ca6-aed8-7bad1257239c diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:06,472 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item 25.26880e50-d515-4168-ac5e-929971d30119:25.26880e50-d515-4168-ac5e-929971d30119 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:07,028 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item HR Open New Position:25.073dcdf8-0f71-45fe-8202-aeb203726262 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:08,220 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load service item Coach Test:1.473f7f50-3d5a-4121-bff2-02463fb5e0b6 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:08,507 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load service item Ajax Service Test:1.37ea77f8-8e70-409b-8c39-7230750d08ce diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:08,791 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load service item System Service Test:1.61de3c36-93bc-4133-99e2-2a2215c098bf diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:09,069 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load service item Intergration Service Test:1.37d655f5-9542-4773-b465-deba7dd71cb6 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:09,359 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load service item Populate ApprovalList:1.dee4ccec-fac0-4bce-ad0a-d062e49a4996 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:09,631 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item 25.26880e50-d515-4168-ac5e-929971d30119:25.26880e50-d515-4168-ac5e-929971d30119 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:24:11,350 com.ibm.cte.sdc.bpm.testing.service.TestCaseService [DEBUG] [pipelineBuild_674]: Running test case adhocTask\n26 May 2022 16:24:11,511 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: Start executing the test case with id 65 and name adhocTask\n26 May 2022 16:24:11,634 com.ibm.cte.sdc.bpm.testing.service.TestCaseService [DEBUG] [pipelineBuild_674]: Running test case normalTestCase\n26 May 2022 16:24:11,806 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: Start executing the test case with id 74 and name normalTestCase\n26 May 2022 16:24:16,469 com.ibm.cte.sdc.bpm.testing.util.BpmUtils [INFO ] [pipelineBuild_674]: The BAW login url is https://9.30.25.65/teamworks/login.jsp and the login type ONPREM\n26 May 2022 16:24:16,469 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [1], associate command [startProcess], parameters [{\"params\":\"{\\n\\\"person\\\":\\n    {\\n    \\\"lastName\\\":\\\"\\\",\\n    \\\"firstName\\\":\\\"\\\",\\n    \\\"payType\\\":\\\"\\\",\\n    \\\"notes\\\":\\\"\\\",\\n    \\\"payLevel\\\":\\\"\\\",\\n    \\\"supervisor\\\":\\\"\\\",\\n    \\\"startDate\\\":\\\"2018-10-30T00:00:00Z\\\"\\n    }\\n}\",\"process\":\"Adhoc Process\",\"toolkitName\":\"\"}] and case data [null],\n26 May 2022 16:24:17,224 com.ibm.cte.sdc.bpm.testing.util.BpmUtils [INFO ] [pipelineBuild_674]: The BAW login url is https://9.30.25.65/teamworks/login.jsp and the login type ONPREM\n26 May 2022 16:24:17,224 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [normalTestCase]#ID:[74] - Running the case step with index [1], associate command [startHumanService], parameters [{\"service\":\"Custom Coach Test\",\"params\":\"{\\r\\n\\\"input1\\\":\\\"2020-03-31T00:00:00Z\\\",\\r\\n\\\"input2\\\":\\\"2020-03-31T00:00:00Z\\\"\\r\\n}\",\"expectedOutput\":null}] and case data [null],\n26 May 2022 16:24:18,918 com.ibm.cte.sdc.bpm.testing.command.bpm.StartProcess [DEBUG] [pipelineBuild_674]: Starting the process Adhoc Process with bpd id 25.1896bb58-3cba-4e81-a299-6347067cd248, app acronym ISA, app id 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, snapshot id 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd, params {\n\"person\":\n{\n\"lastName\":\"\",\n\"firstName\":\"\",\n\"payType\":\"\",\n\"notes\":\"\",\n\"payLevel\":\"\",\n\"supervisor\":\"\",\n\"startDate\":\"2018-10-30T00:00:00Z\"\n}\n} and is tip false\n26 May 2022 16:24:19,941 com.ibm.websphere.bpm.api.rest.RestAPIClient [DEBUG] [pipelineBuild_674]: Started the process with id 14530\n26 May 2022 16:24:19,942 com.ibm.cte.sdc.bpm.testing.command.bpm.StartProcess [DEBUG] [pipelineBuild_674]: Start an instance of the process Adhoc Process with id 14530.\n26 May 2022 16:24:19,942 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [2], associate command [openInstanceDetail], parameters [{}] and case data [null],\n26 May 2022 16:24:20,463 com.ibm.cte.sdc.bpm.testing.command.bpm.StartHumanService [DEBUG] [pipelineBuild_674]: Open human service url: https://9.30.25.65:443/teamworks/redirect-login.jsp?j_forward=executecf%3FmodelID%3D1.d6e24976-3979-4f39-b2b9-1087a46e8c53%26snapshotID%3D2064.ba74cb40-1937-49a4-a324-5b45993b0fdd%26tw.local.input1%3D2020-03-31T00%3A00%3A00Z%26tw.local.input2%3D2020-03-31T00%3A00%3A00Z&credentials=YWRtaW4%3D%3ASUJNNGFsbCE%3D.\n26 May 2022 16:24:20,464 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: previous BPM user: null, current BPM user: bpmadmin\n26 May 2022 16:24:23,510 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: previous BPM user: null, current BPM user: bpmadmin\n26 May 2022 16:24:37,413 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://9.30.25.65/teamworks/login.jsp, the window handler is 4294967297\n26 May 2022 16:24:40,157 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://9.30.25.65/teamworks/login.jsp, the window handler is 4294967297\n26 May 2022 16:24:55,106 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://9.30.25.65:443/teamworks/redirect-login.jsp?j_forward=executecf%3FmodelID%3D1.d6e24976-3979-4f39-b2b9-1087a46e8c53%26snapshotID%3D2064.ba74cb40-1937-49a4-a324-5b45993b0fdd%26tw.local.input1%3D2020-03-31T00%3A00%3A00Z%26tw.local.input2%3D2020-03-31T00%3A00%3A00Z&credentials=YWRtaW4%3D%3ASUJNNGFsbCE%3D, the window handler is 4294967297\n26 May 2022 16:24:55,107 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [normalTestCase]#ID:[74] - Running the case step with index [2], associate command [selectWindow], parameters [{\"info\":\"[\\\"window-MAIN\\\",\\\"iframe-0\\\"]\"}] and case data [null],\n26 May 2022 16:25:00,157 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://9.30.25.65/ProcessPortal/launchInstanceUI?instanceId=14530, the window handler is 4294967297\n26 May 2022 16:25:04,917 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [3], associate command [assertProcessInstanceStatus], parameters [{\"instanceStatus\":\"Active\"}] and case data [null],\n26 May 2022 16:25:09,104 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [4], associate command [startAdHoc], parameters [{\"adHocName\":\"Adhoc_Start\"}] and case data [null],\n26 May 2022 16:25:09,561 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [normalTestCase]#ID:[74] - Running the case step with index [3], associate command [customText], parameters [{\"value\":\"custom text value\",\"id\":\"customText\"}] and case data [null],\n26 May 2022 16:25:12,645 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [5], associate command [runTaskByActivityName], parameters [{\"taskName\":\"Submit Adhoc User Task\"}] and case data [null],\n26 May 2022 16:25:15,502 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Wait until receiving task by name: Submit Adhoc User Task and instance id: 14530, filtering by current user admin.\n26 May 2022 16:25:16,057 com.ibm.cte.sdc.bpm.testing.command.bpm.RunTaskByActivityName [DEBUG] [pipelineBuild_674]: URL:[https://9.30.25.65:443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D15476&credentials=YWRtaW4%3D%3ASUJNNGFsbCE%3D] returned when starting the human task: Submit Adhoc User Task for the instance: 14530\n26 May 2022 16:25:16,057 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: previous BPM user: bpmadmin, current BPM user: bpmadmin\n26 May 2022 16:25:18,108 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [normalTestCase]#ID:[74] - Running the case step with index [4], associate command [assertInputText], parameters [{\"controlId\":\"\",\"label\":\"Custom Text:\",\"elementId\":\"customText\",\"elementCss\":\"\",\"xpath\":\"\",\"expectedValue\":\"custom text value\",\"expectedMaxLength\":\"\"}] and case data [null],\n26 May 2022 16:25:32,069 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://9.30.25.65:443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D15476&credentials=YWRtaW4%3D%3ASUJNNGFsbCE%3D, the window handler is 4294967297\n26 May 2022 16:25:35,734 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [6], associate command [assertTaskNotGenerated], parameters [{\"taskName\":\"View Adhoc User Task\"}] and case data [null],\n26 May 2022 16:25:38,147 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [normalTestCase]#ID:[74] - Running the case step with index [5], associate command [debug], parameters [{}] and case data [null],\n26 May 2022 16:25:39,922 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [7], associate command [assertTaskAssignmentByUser], parameters [{\"taskName\":\"Submit Adhoc User Task\"}] and case data [null],\n26 May 2022 16:25:42,607 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Debug log is: null\n26 May 2022 16:25:43,504 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [8], associate command [selectWindow], parameters [{\"info\":\"[\\\"window-MAIN\\\"]\"}] and case data [null],\n26 May 2022 16:25:44,852 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: End with executing the test case with id 74 and name normalTestCase!\n26 May 2022 16:25:52,650 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [9], associate command [text], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[2]\\/div[2]\\/div[3]\\/input[1]\",\"elementId\":\"dijit_form_ComboBox_0\",\"tagName\":\"input\",\"type\":\"text\",\"event\":\"blur\",\"command\":\"UI.text\",\"value\":\"Mike_task1\",\"controlId\":\"Text2\",\"label\":\"Name\"}] and case data [null],\n26 May 2022 16:26:01,985 com.ibm.cte.sdc.bpm.testing.util.StringUtils [DEBUG] [pipelineBuild_674]: [sendKey] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[2]/div[2]/div[3]/input[1], value: Mike_task1}\n26 May 2022 16:26:05,711 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [10], associate command [click], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[2]\\/button[1]\",\"elementId\":\"\",\"tagName\":\"button\",\"event\":\"mouseup\",\"command\":\"UI.click\",\"value\":\"OK\",\"type\":\"Button\"}] and case data [null],\n26 May 2022 16:26:13,888 com.ibm.cte.sdc.bpm.testing.util.StringUtils [DEBUG] [pipelineBuild_674]: [clickButton] element {xpath:/html[1]/body[1]/div[1]/div[2]/button[1], value: OK}\n26 May 2022 16:26:17,642 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [11], associate command [assertTaskData], parameters [{\"taskName\":\"Submit Adhoc User Task\",\"expectedValue\":\"{\\n\\\"person\\\":\\n    {\\n    \\\"lastName\\\":\\\"\\\",\\n    \\\"firstName\\\":\\\"Mike_task1\\\",\\n    \\\"supervisor\\\":\\\"\\\",\\n    \\\"startDate\\\":\\\"2018-10-30T00:00:00.000Z\\\",\\n    \\\"payLevel\\\":\\\"\\\",\\n    \\\"payType\\\":\\\"\\\",\\n    \\\"notes\\\":\\\"\\\"\\n    },\\n\\\"name\\\":\\\"Mike_task1\\\"\\n}\"}] and case data [null],\n26 May 2022 16:26:20,462 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Wait until receiving task by name: Submit Adhoc User Task and instance id: 14530, filtering by current user admin.\n26 May 2022 16:27:29,066 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [12], associate command [debug], parameters [{}] and case data [null],\n26 May 2022 16:27:30,524 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Can't swith to default content. Try again with the main window handler.\n26 May 2022 16:27:31,119 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Failed to get window with error: Session [d468276e-a768-4000-8e04-95cd01c8c4f9] was terminated due to TIMEOUT\nBuild info: version: '3.141.59', revision: 'e82be7d358', time: '2018-11-14T08:17:03'\nSystem info: host: 'LAPTOP-K2LAAOLD', ip: '9.200.44.61', os.name: 'Windows 10', os.arch: 'amd64', os.version: '10.0', java.version: '1.8.0_191'\nDriver info: org.openqa.selenium.remote.RemoteWebDriver\nCapabilities {acceptInsecureCerts: true, browserName: firefox, browserVersion: 67.0.1, javascriptEnabled: true, moz:accessibilityChecks: false, moz:buildID: 20190529130856, moz:geckodriverVersion: 0.24.0, moz:headless: false, moz:processID: 28693, moz:profile: /tmp/rust_mozprofile.YXJGCt..., moz:shutdownTimeout: 60000, moz:useNonSpecCompliantPointerOrigin: false, moz:webdriverClick: true, pageLoadStrategy: normal, platform: LINUX, platformName: LINUX, platformVersion: 4.15.0-176-generic, rotatable: false, setWindowRect: true, strictFileInteractability: false, timeouts: {implicit: 0, pageLoad: 300000, script: 30000}, unhandledPromptBehavior: dismiss and notify, webdriver.remote.sessionid: d468276e-a768-4000-8e04-95c...}\nSession ID: d468276e-a768-4000-8e04-95cd01c8c4f9\n26 May 2022 16:27:31,410 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [DEBUG] [pipelineBuild_674]: Driver has quit. Try to inialize the driver again.\n26 May 2022 16:27:37,436 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Debug log is: null\n26 May 2022 16:27:37,437 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [13], associate command [runTaskByActivityName], parameters [{\"taskName\":\"Edit Adhoc User Task by Adhoc Event\"}] and case data [null],\n26 May 2022 16:27:40,295 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Wait until receiving task by name: Edit Adhoc User Task by Adhoc Event and instance id: 14530, filtering by current user admin.\n26 May 2022 16:27:41,684 com.ibm.cte.sdc.bpm.testing.command.bpm.RunTaskByActivityName [DEBUG] [pipelineBuild_674]: URL:[https://9.30.25.65:443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D15477&credentials=YWRtaW4%3D%3ASUJNNGFsbCE%3D] returned when starting the human task: Edit Adhoc User Task by Adhoc Event for the instance: 14530\n26 May 2022 16:27:41,685 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: previous BPM user: null, current BPM user: bpmadmin\n26 May 2022 16:27:58,289 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://9.30.25.65/teamworks/login.jsp, the window handler is 4294967297\n26 May 2022 16:28:15,360 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://9.30.25.65:443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D15477&credentials=YWRtaW4%3D%3ASUJNNGFsbCE%3D, the window handler is 4294967297\n26 May 2022 16:28:19,019 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [14], associate command [text], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[2]\\/div[2]\\/div[3]\\/input[1]\",\"elementId\":\"dijit_form_ComboBox_0\",\"tagName\":\"input\",\"type\":\"text\",\"event\":\"blur\",\"command\":\"UI.text\",\"value\":\"Mike_Adhoc\",\"controlId\":\"Text2\",\"label\":\"Name\"}] and case data [null],\n26 May 2022 16:28:28,334 com.ibm.cte.sdc.bpm.testing.util.StringUtils [DEBUG] [pipelineBuild_674]: [sendKey] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[2]/div[2]/div[3]/input[1], value: Mike_Adhoc}\n26 May 2022 16:28:32,243 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [15], associate command [click], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[2]\\/button[1]\",\"elementId\":\"\",\"tagName\":\"button\",\"event\":\"mouseup\",\"command\":\"UI.click\",\"value\":\"OK\",\"type\":\"Button\"}] and case data [null],\n26 May 2022 16:28:40,449 com.ibm.cte.sdc.bpm.testing.util.StringUtils [DEBUG] [pipelineBuild_674]: [clickButton] element {xpath:/html[1]/body[1]/div[1]/div[2]/button[1], value: OK}\n26 May 2022 16:28:44,123 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [16], associate command [fireTimer], parameters [{\"token\":\"Adhoc Timer - Adhoc Process\"}] and case data [null],\n26 May 2022 16:28:46,924 com.ibm.cte.sdc.bpm.testing.command.bpm.FireTimer [DEBUG] [pipelineBuild_674]: Args token? Adhoc Timer - Adhoc Process,processInstanceId:14530\n26 May 2022 16:28:48,036 com.ibm.cte.sdc.bpm.testing.command.bpm.FireTimer [DEBUG] [pipelineBuild_674]: Args node:Adhoc Timer.\n26 May 2022 16:28:48,037 com.ibm.websphere.bpm.api.rest.RestAPIClient [DEBUG] [pipelineBuild_674]: Fire timer tokenId 9, for instanceId14530\n26 May 2022 16:28:48,616 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [17], associate command [runTaskByActivityName], parameters [{\"taskName\":\"View Adhoc User Task\"}] and case data [null],\n26 May 2022 16:28:51,617 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Wait until receiving task by name: View Adhoc User Task and instance id: 14530, filtering by current user admin.\n26 May 2022 16:28:52,187 com.ibm.cte.sdc.bpm.testing.command.bpm.RunTaskByActivityName [DEBUG] [pipelineBuild_674]: URL:[https://9.30.25.65:443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D15479&credentials=YWRtaW4%3D%3ASUJNNGFsbCE%3D] returned when starting the human task: View Adhoc User Task for the instance: 14530\n26 May 2022 16:28:52,188 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: previous BPM user: bpmadmin, current BPM user: bpmadmin\n26 May 2022 16:29:08,154 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://9.30.25.65:443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D15479&credentials=YWRtaW4%3D%3ASUJNNGFsbCE%3D, the window handler is 4294967297\n26 May 2022 16:29:11,868 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [18], associate command [selectWindow], parameters [{\"info\":\"[\\\"window-MAIN\\\"]\"}] and case data [null],\n26 May 2022 16:29:20,447 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [19], associate command [assertOutputText], parameters [{\"controlId\":\"\",\"label\":\"Name\",\"elementId\":\"\",\"elementCss\":\"\",\"xpath\":\"\",\"expectedValue\":\"Mike_Adhoc\"}] and case data [null],\n26 May 2022 16:29:29,158 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [20], associate command [click], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[2]\\/div[2]\\/div[1]\\/button[1]\",\"elementId\":\"\",\"tagName\":\"button\",\"event\":\"mouseup\",\"command\":\"UI.click\",\"value\":\"Close\",\"type\":\"Button\"}] and case data [null],\n26 May 2022 16:29:37,539 com.ibm.cte.sdc.bpm.testing.util.StringUtils [DEBUG] [pipelineBuild_674]: [clickButton] element {xpath:/html[1]/body[1]/div[2]/div[2]/div[1]/button[1], value: Close}\n26 May 2022 16:29:41,153 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [21], associate command [assertProcessInstanceData], parameters [{\"expectedValue\":\"{\\n\\\"person\\\":\\n    {\\n    \\\"lastName\\\":\\\"\\\",\\n    \\\"firstName\\\":\\\"Mike_Adhoc\\\",\\n    \\\"supervisor\\\":\\\"\\\",\\n    \\\"startDate\\\":\\\"2018-10-30T00:00:00.000Z\\\",\\n    \\\"payLevel\\\":\\\"\\\",\\n    \\\"payType\\\":\\\"\\\",\\n    \\\"notes\\\":\\\"\\\"\\n    }\\n}\"}] and case data [null],\n26 May 2022 16:29:45,412 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [22], associate command [debug], parameters [{}] and case data [null],\n26 May 2022 16:29:48,074 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Debug log is: null\n26 May 2022 16:29:48,075 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [23], associate command [assertProcessInstanceStatus], parameters [{\"instanceStatus\":\"Completed\"}] and case data [null],\n26 May 2022 16:29:53,234 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: End with executing the test case with id 65 and name adhocTask!\n26 May 2022 16:29:54,813 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: End pipeline step execution.\n26 May 2022 16:29:54,946 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: Start to execute pipeline step: name=Deploy, type=Deployment,\n26 May 2022 16:29:56,891 com.ibm.cte.sdc.bpm.testing.executor.pipeline.DeploymentStepExecutor [INFO ] [pipelineBuild_674]: The snapshot 0.00.06 is already installed for process app ISA, skip snapshot installation!\n26 May 2022 16:29:56,892 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: End pipeline step execution.\n26 May 2022 16:29:56,901 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: Start to execute pipeline step: name=Test, type=Test,\n26 May 2022 16:29:56,902 com.ibm.cte.sdc.bpm.testing.executor.pipeline.StepExecutor [INFO ] [pipelineBuild_674]: Set tip to false\n26 May 2022 16:29:57,710 com.ibm.cte.sdc.bpm.testing.executor.pipeline.TestStepExecutor [INFO ] [pipelineBuild_674]: Start to run tests with args: projectName=IDA Sample-BAW 20002 Regress Traditional, BranchId=2063.95211e23-0de4-4e7d-ae71-3e934d0e1f09, SnapshotId=2064.ba74cb40-1937-49a4-a324-5b45993b0fdd, Tip=false\n26 May 2022 16:30:03,309 com.ibm.cte.sdc.baw.analysis.icm.service.ContentEngineService [DEBUG] [pipelineBuild_674]: Folder /IBM Case Manager/Solutions/IDA Sample App/ not found.Failed to get the solution definition from bpmConfig https://emblems1.fyre.ibm.com:9443 from object store dos, it is not a case solution project.\n26 May 2022 16:30:04,183 com.ibm.cte.sdc.bpm.testing.service.ProcessAppService [DEBUG] [pipelineBuild_674]: The number of dependency toolkits is 5\n26 May 2022 16:30:04,184 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item Adhoc Process:25.1896bb58-3cba-4e81-a299-6347067cd248 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:05,370 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item HR Open New Position:25.073dcdf8-0f71-45fe-8202-aeb203726262 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:06,653 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item HR Process with Parameter:25.801cf7b2-8744-4f7b-b51f-7b848d97eb8e diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:07,567 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item UCA Process:25.127b7d47-2bfb-4ca6-aed8-7bad1257239c diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:08,217 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item 25.26880e50-d515-4168-ac5e-929971d30119:25.26880e50-d515-4168-ac5e-929971d30119 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:08,822 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item HR Open New Position:25.073dcdf8-0f71-45fe-8202-aeb203726262 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:09,706 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load service item Coach Test:1.473f7f50-3d5a-4121-bff2-02463fb5e0b6 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:10,074 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load service item Ajax Service Test:1.37ea77f8-8e70-409b-8c39-7230750d08ce diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:10,410 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load service item System Service Test:1.61de3c36-93bc-4133-99e2-2a2215c098bf diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:10,739 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load service item Intergration Service Test:1.37d655f5-9542-4773-b465-deba7dd71cb6 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:11,027 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load service item Populate ApprovalList:1.dee4ccec-fac0-4bce-ad0a-d062e49a4996 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:11,317 com.ibm.websphere.bpm.diagram.ReloadProcessConfigFactory [DEBUG] [pipelineBuild_674]: Start to load BPD item 25.26880e50-d515-4168-ac5e-929971d30119:25.26880e50-d515-4168-ac5e-929971d30119 diagram information from app 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, track 2063.c1024e90-af25-4b53-9c6c-49fccc8e54fb, snapshot 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd\n26 May 2022 16:30:13,026 com.ibm.cte.sdc.bpm.testing.service.TestCaseService [DEBUG] [pipelineBuild_674]: Running test case adhocTask\n26 May 2022 16:30:13,111 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: Start executing the test case with id 65 and name adhocTask\n26 May 2022 16:30:13,302 com.ibm.cte.sdc.bpm.testing.service.TestCaseService [DEBUG] [pipelineBuild_674]: Running test case normalTestCase\n26 May 2022 16:30:13,402 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: Start executing the test case with id 74 and name normalTestCase\n26 May 2022 16:30:18,635 com.ibm.cte.sdc.bpm.testing.util.BpmUtils [INFO ] [pipelineBuild_674]: The BAW login url is https://emblems1.fyre.ibm.com:9443/teamworks/login.jsp and the login type ONPREM\n26 May 2022 16:30:18,635 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [1], associate command [startProcess], parameters [{\"params\":\"{\\n\\\"person\\\":\\n    {\\n    \\\"lastName\\\":\\\"\\\",\\n    \\\"firstName\\\":\\\"\\\",\\n    \\\"payType\\\":\\\"\\\",\\n    \\\"notes\\\":\\\"\\\",\\n    \\\"payLevel\\\":\\\"\\\",\\n    \\\"supervisor\\\":\\\"\\\",\\n    \\\"startDate\\\":\\\"2018-10-30T00:00:00Z\\\"\\n    }\\n}\",\"process\":\"Adhoc Process\",\"toolkitName\":\"\"}] and case data [null],\n26 May 2022 16:30:18,716 com.ibm.cte.sdc.bpm.testing.util.BpmUtils [INFO ] [pipelineBuild_674]: The BAW login url is https://emblems1.fyre.ibm.com:9443/teamworks/login.jsp and the login type ONPREM\n26 May 2022 16:30:18,716 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [normalTestCase]#ID:[74] - Running the case step with index [1], associate command [startHumanService], parameters [{\"service\":\"Custom Coach Test\",\"params\":\"{\\r\\n\\\"input1\\\":\\\"2020-03-31T00:00:00Z\\\",\\r\\n\\\"input2\\\":\\\"2020-03-31T00:00:00Z\\\"\\r\\n}\",\"expectedOutput\":null}] and case data [null],\n26 May 2022 16:30:20,919 com.ibm.cte.sdc.bpm.testing.command.bpm.StartProcess [DEBUG] [pipelineBuild_674]: Starting the process Adhoc Process with bpd id 25.1896bb58-3cba-4e81-a299-6347067cd248, app acronym ISA, app id 2066.bb7001c9-d96b-4fda-9760-fef7c4116429, snapshot id 2064.ba74cb40-1937-49a4-a324-5b45993b0fdd, params {\n\"person\":\n{\n\"lastName\":\"\",\n\"firstName\":\"\",\n\"payType\":\"\",\n\"notes\":\"\",\n\"payLevel\":\"\",\n\"supervisor\":\"\",\n\"startDate\":\"2018-10-30T00:00:00Z\"\n}\n} and is tip false\n26 May 2022 16:30:21,303 com.ibm.cte.sdc.bpm.testing.command.bpm.StartHumanService [DEBUG] [pipelineBuild_674]: Open human service url: https://emblems1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=executecf%3FmodelID%3D1.d6e24976-3979-4f39-b2b9-1087a46e8c53%26snapshotID%3D2064.ba74cb40-1937-49a4-a324-5b45993b0fdd%26tw.local.input1%3D2020-03-31T00%3A00%3A00Z%26tw.local.input2%3D2020-03-31T00%3A00%3A00Z&credentials=YnBtYWRtaW4%3D%3AUGFzc3cwcmQ%3D.\n26 May 2022 16:30:21,304 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: previous BPM user: null, current BPM user: bpmadmin\n26 May 2022 16:30:22,208 com.ibm.websphere.bpm.api.rest.RestAPIClient [DEBUG] [pipelineBuild_674]: Started the process with id 505\n26 May 2022 16:30:22,208 com.ibm.cte.sdc.bpm.testing.command.bpm.StartProcess [DEBUG] [pipelineBuild_674]: Start an instance of the process Adhoc Process with id 505.\n26 May 2022 16:30:22,208 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [2], associate command [openInstanceDetail], parameters [{}] and case data [null],\n26 May 2022 16:30:24,658 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: previous BPM user: null, current BPM user: bpmadmin\n26 May 2022 16:30:37,993 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://emblems1.fyre.ibm.com:9443/teamworks/login.jsp, the window handler is 4294967297\n26 May 2022 16:30:41,333 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://emblems1.fyre.ibm.com:9443/teamworks/login.jsp, the window handler is 4294967297\n26 May 2022 16:30:54,794 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://emblems1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=executecf%3FmodelID%3D1.d6e24976-3979-4f39-b2b9-1087a46e8c53%26snapshotID%3D2064.ba74cb40-1937-49a4-a324-5b45993b0fdd%26tw.local.input1%3D2020-03-31T00%3A00%3A00Z%26tw.local.input2%3D2020-03-31T00%3A00%3A00Z&credentials=YnBtYWRtaW4%3D%3AUGFzc3cwcmQ%3D, the window handler is 4294967297\n26 May 2022 16:30:54,794 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [normalTestCase]#ID:[74] - Running the case step with index [2], associate command [selectWindow], parameters [{\"info\":\"[\\\"window-MAIN\\\",\\\"iframe-0\\\"]\"}] and case data [null],\n26 May 2022 16:30:59,662 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://emblems1.fyre.ibm.com:9443/ProcessPortal/launchInstanceUI?instanceId=505, the window handler is 4294967297\n26 May 2022 16:31:03,865 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [3], associate command [assertProcessInstanceStatus], parameters [{\"instanceStatus\":\"Active\"}] and case data [null],\n26 May 2022 16:31:07,013 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [normalTestCase]#ID:[74] - Running the case step with index [3], associate command [customText], parameters [{\"value\":\"custom text value\",\"id\":\"customText\"}] and case data [null],\n26 May 2022 16:31:07,882 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [4], associate command [startAdHoc], parameters [{\"adHocName\":\"Adhoc_Start\"}] and case data [null],\n26 May 2022 16:31:11,415 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [5], associate command [runTaskByActivityName], parameters [{\"taskName\":\"Submit Adhoc User Task\"}] and case data [null],\n26 May 2022 16:31:14,270 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Wait until receiving task by name: Submit Adhoc User Task and instance id: 505, filtering by current user bpmadmin.\n26 May 2022 16:31:14,855 com.ibm.cte.sdc.bpm.testing.command.bpm.RunTaskByActivityName [DEBUG] [pipelineBuild_674]: URL:[https://emblems1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D659&credentials=YnBtYWRtaW4%3D%3AUGFzc3cwcmQ%3D] returned when starting the human task: Submit Adhoc User Task for the instance: 505\n26 May 2022 16:31:14,856 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: previous BPM user: bpmadmin, current BPM user: bpmadmin\n26 May 2022 16:31:15,653 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [normalTestCase]#ID:[74] - Running the case step with index [4], associate command [assertInputText], parameters [{\"controlId\":\"\",\"label\":\"Custom Text:\",\"elementId\":\"customText\",\"elementCss\":\"\",\"xpath\":\"\",\"expectedValue\":\"custom text value\",\"expectedMaxLength\":\"\"}] and case data [null],\n26 May 2022 16:31:29,500 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [normalTestCase]#ID:[74] - Running the case step with index [5], associate command [debug], parameters [{}] and case data [null],\n26 May 2022 16:31:30,948 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://emblems1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D659&credentials=YnBtYWRtaW4%3D%3AUGFzc3cwcmQ%3D, the window handler is 4294967297\n26 May 2022 16:31:33,968 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Debug log is: null\n26 May 2022 16:31:34,551 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [6], associate command [assertTaskNotGenerated], parameters [{\"taskName\":\"View Adhoc User Task\"}] and case data [null],\n26 May 2022 16:31:36,183 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: End with executing the test case with id 74 and name normalTestCase!\n26 May 2022 16:31:38,612 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [7], associate command [assertTaskAssignmentByUser], parameters [{\"taskName\":\"Submit Adhoc User Task\"}] and case data [null],\n26 May 2022 16:31:42,106 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [8], associate command [selectWindow], parameters [{\"info\":\"[\\\"window-MAIN\\\"]\"}] and case data [null],\n26 May 2022 16:31:50,535 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [9], associate command [text], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[2]\\/div[2]\\/div[3]\\/input[1]\",\"elementId\":\"dijit_form_ComboBox_0\",\"tagName\":\"input\",\"type\":\"text\",\"event\":\"blur\",\"command\":\"UI.text\",\"value\":\"Mike_task1\",\"controlId\":\"Text2\",\"label\":\"Name\"}] and case data [null],\n26 May 2022 16:31:59,723 com.ibm.cte.sdc.bpm.testing.util.StringUtils [DEBUG] [pipelineBuild_674]: [sendKey] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[2]/div[2]/div[3]/input[1], value: Mike_task1}\n26 May 2022 16:32:03,429 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [10], associate command [click], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[2]\\/button[1]\",\"elementId\":\"\",\"tagName\":\"button\",\"event\":\"mouseup\",\"command\":\"UI.click\",\"value\":\"OK\",\"type\":\"Button\"}] and case data [null],\n26 May 2022 16:32:11,853 com.ibm.cte.sdc.bpm.testing.util.StringUtils [DEBUG] [pipelineBuild_674]: [clickButton] element {xpath:/html[1]/body[1]/div[1]/div[2]/button[1], value: OK}\n26 May 2022 16:32:15,555 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [11], associate command [assertTaskData], parameters [{\"taskName\":\"Submit Adhoc User Task\",\"expectedValue\":\"{\\n\\\"person\\\":\\n    {\\n    \\\"lastName\\\":\\\"\\\",\\n    \\\"firstName\\\":\\\"Mike_task1\\\",\\n    \\\"supervisor\\\":\\\"\\\",\\n    \\\"startDate\\\":\\\"2018-10-30T00:00:00.000Z\\\",\\n    \\\"payLevel\\\":\\\"\\\",\\n    \\\"payType\\\":\\\"\\\",\\n    \\\"notes\\\":\\\"\\\"\\n    },\\n\\\"name\\\":\\\"Mike_task1\\\"\\n}\"}] and case data [null],\n26 May 2022 16:32:18,411 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Wait until receiving task by name: Submit Adhoc User Task and instance id: 505, filtering by current user bpmadmin.\n26 May 2022 16:33:34,041 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [12], associate command [debug], parameters [{}] and case data [null],\n26 May 2022 16:33:35,532 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Can't swith to default content. Try again with the main window handler.\n26 May 2022 16:33:36,133 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Failed to get window with error: Session [7893fe36-a811-48f5-bae0-aaade127f971] was terminated due to TIMEOUT\nBuild info: version: '3.141.59', revision: 'e82be7d358', time: '2018-11-14T08:17:03'\nSystem info: host: 'LAPTOP-K2LAAOLD', ip: '9.200.44.61', os.name: 'Windows 10', os.arch: 'amd64', os.version: '10.0', java.version: '1.8.0_191'\nDriver info: org.openqa.selenium.remote.RemoteWebDriver\nCapabilities {acceptInsecureCerts: true, browserName: firefox, browserVersion: 67.0.1, javascriptEnabled: true, moz:accessibilityChecks: false, moz:buildID: 20190529130856, moz:geckodriverVersion: 0.24.0, moz:headless: false, moz:processID: 28591, moz:profile: /tmp/rust_mozprofile.hDRFBs..., moz:shutdownTimeout: 60000, moz:useNonSpecCompliantPointerOrigin: false, moz:webdriverClick: true, pageLoadStrategy: normal, platform: LINUX, platformName: LINUX, platformVersion: 4.15.0-176-generic, rotatable: false, setWindowRect: true, strictFileInteractability: false, timeouts: {implicit: 0, pageLoad: 300000, script: 30000}, unhandledPromptBehavior: dismiss and notify, webdriver.remote.sessionid: 7893fe36-a811-48f5-bae0-aaa...}\nSession ID: 7893fe36-a811-48f5-bae0-aaade127f971\n26 May 2022 16:33:36,418 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [DEBUG] [pipelineBuild_674]: Driver has quit. Try to inialize the driver again.\n26 May 2022 16:33:42,606 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Debug log is: null\n26 May 2022 16:33:42,607 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [13], associate command [runTaskByActivityName], parameters [{\"taskName\":\"Edit Adhoc User Task by Adhoc Event\"}] and case data [null],\n26 May 2022 16:33:45,481 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Wait until receiving task by name: Edit Adhoc User Task by Adhoc Event and instance id: 505, filtering by current user bpmadmin.\n26 May 2022 16:33:46,622 com.ibm.cte.sdc.bpm.testing.command.bpm.RunTaskByActivityName [DEBUG] [pipelineBuild_674]: URL:[https://emblems1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D660&credentials=YnBtYWRtaW4%3D%3AUGFzc3cwcmQ%3D] returned when starting the human task: Edit Adhoc User Task by Adhoc Event for the instance: 505\n26 May 2022 16:33:46,622 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: previous BPM user: null, current BPM user: bpmadmin\n26 May 2022 16:34:03,396 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://emblems1.fyre.ibm.com:9443/teamworks/login.jsp, the window handler is 4294967297\n26 May 2022 16:34:20,618 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://emblems1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D660&credentials=YnBtYWRtaW4%3D%3AUGFzc3cwcmQ%3D, the window handler is 4294967297\n26 May 2022 16:34:24,272 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [14], associate command [text], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[1]\\/div[2]\\/div[2]\\/div[3]\\/input[1]\",\"elementId\":\"dijit_form_ComboBox_0\",\"tagName\":\"input\",\"type\":\"text\",\"event\":\"blur\",\"command\":\"UI.text\",\"value\":\"Mike_Adhoc\",\"controlId\":\"Text2\",\"label\":\"Name\"}] and case data [null],\n26 May 2022 16:34:33,242 com.ibm.cte.sdc.bpm.testing.util.StringUtils [DEBUG] [pipelineBuild_674]: [sendKey] element {xpath:/html[1]/body[1]/div[1]/div[1]/div[2]/div[2]/div[3]/input[1], value: Mike_Adhoc}\n26 May 2022 16:34:36,741 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [15], associate command [click], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[1]\\/div[2]\\/button[1]\",\"elementId\":\"\",\"tagName\":\"button\",\"event\":\"mouseup\",\"command\":\"UI.click\",\"value\":\"OK\",\"type\":\"Button\"}] and case data [null],\n26 May 2022 16:34:44,577 com.ibm.cte.sdc.bpm.testing.util.StringUtils [DEBUG] [pipelineBuild_674]: [clickButton] element {xpath:/html[1]/body[1]/div[1]/div[2]/button[1], value: OK}\n26 May 2022 16:34:48,034 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [16], associate command [fireTimer], parameters [{\"token\":\"Adhoc Timer - Adhoc Process\"}] and case data [null],\n26 May 2022 16:34:50,795 com.ibm.cte.sdc.bpm.testing.command.bpm.FireTimer [DEBUG] [pipelineBuild_674]: Args token? Adhoc Timer - Adhoc Process,processInstanceId:505\n26 May 2022 16:34:51,968 com.ibm.cte.sdc.bpm.testing.command.bpm.FireTimer [DEBUG] [pipelineBuild_674]: Args node:Adhoc Timer.\n26 May 2022 16:34:51,969 com.ibm.websphere.bpm.api.rest.RestAPIClient [DEBUG] [pipelineBuild_674]: Fire timer tokenId 9, for instanceId505\n26 May 2022 16:34:52,591 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [17], associate command [runTaskByActivityName], parameters [{\"taskName\":\"View Adhoc User Task\"}] and case data [null],\n26 May 2022 16:34:55,291 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Wait until receiving task by name: View Adhoc User Task and instance id: 505, filtering by current user bpmadmin.\n26 May 2022 16:34:55,886 com.ibm.cte.sdc.bpm.testing.command.bpm.RunTaskByActivityName [DEBUG] [pipelineBuild_674]: URL:[https://emblems1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D661&credentials=YnBtYWRtaW4%3D%3AUGFzc3cwcmQ%3D] returned when starting the human task: View Adhoc User Task for the instance: 505\n26 May 2022 16:34:55,886 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: previous BPM user: bpmadmin, current BPM user: bpmadmin\n26 May 2022 16:35:11,818 com.ibm.cte.sdc.bpm.testing.driver.SeleniumDriver [DEBUG] [pipelineBuild_674]: Open url https://emblems1.fyre.ibm.com:9443/teamworks/redirect-login.jsp?j_forward=process.lsw%3FzWorkflowState%3D1%26zTaskId%3D661&credentials=YnBtYWRtaW4%3D%3AUGFzc3cwcmQ%3D, the window handler is 4294967297\n26 May 2022 16:35:15,348 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [18], associate command [selectWindow], parameters [{\"info\":\"[\\\"window-MAIN\\\"]\"}] and case data [null],\n26 May 2022 16:35:23,642 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [19], associate command [assertOutputText], parameters [{\"controlId\":\"\",\"label\":\"Name\",\"elementId\":\"\",\"elementCss\":\"\",\"xpath\":\"\",\"expectedValue\":\"Mike_Adhoc\"}] and case data [null],\n26 May 2022 16:35:31,974 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [20], associate command [click], parameters [{\"xpath\":\"\\/html[1]\\/body[1]\\/div[2]\\/div[2]\\/div[1]\\/button[1]\",\"elementId\":\"\",\"tagName\":\"button\",\"event\":\"mouseup\",\"command\":\"UI.click\",\"value\":\"Close\",\"type\":\"Button\"}] and case data [null],\n26 May 2022 16:35:39,969 com.ibm.cte.sdc.bpm.testing.util.StringUtils [DEBUG] [pipelineBuild_674]: [clickButton] element {xpath:/html[1]/body[1]/div[2]/div[2]/div[1]/button[1], value: Close}\n26 May 2022 16:35:43,493 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [21], associate command [assertProcessInstanceData], parameters [{\"expectedValue\":\"{\\n\\\"person\\\":\\n    {\\n    \\\"lastName\\\":\\\"\\\",\\n    \\\"firstName\\\":\\\"Mike_Adhoc\\\",\\n    \\\"supervisor\\\":\\\"\\\",\\n    \\\"startDate\\\":\\\"2018-10-30T00:00:00.000Z\\\",\\n    \\\"payLevel\\\":\\\"\\\",\\n    \\\"payType\\\":\\\"\\\",\\n    \\\"notes\\\":\\\"\\\"\\n    }\\n}\"}] and case data [null],\n26 May 2022 16:35:47,305 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [22], associate command [debug], parameters [{}] and case data [null],\n26 May 2022 16:35:49,910 com.ibm.cte.sdc.bpm.testing.command.BaseCommand [DEBUG] [pipelineBuild_674]: Debug log is: null\n26 May 2022 16:35:49,910 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: [adhocTask]#ID:[65] - Running the case step with index [23], associate command [assertProcessInstanceStatus], parameters [{\"instanceStatus\":\"Completed\"}] and case data [null],\n26 May 2022 16:35:55,516 com.ibm.cte.sdc.bpm.testing.executor.DefaultCommandExecutor [INFO ] [pipelineBuild_674]: End with executing the test case with id 65 and name adhocTask!\n26 May 2022 16:35:57,027 com.ibm.cte.sdc.bpm.testing.service.PipelineExecutionService [INFO ] [pipelineBuild_674]: End pipeline step execution.\n",
  "errorMessage": null,
  "buildId": 674,
  "currentStage": "QA",
  "currentStep": "Test",
  "testResult": [
    {
      "testProjectId": 65,
      "testProjectName": "IDA Sample-BAW 20002 Regress Traditional",
      "testSuites": [
        {
          "testSuiteId": 491,
          "testSuiteName": "Custom_Coach_Test",
          "testSuiteExecutionStatus": "Passed",
          "testSuiteTimestamp": "20220526162411",
          "testCases": [
            {
              "testCaseStatus": "Passed",
              "testCaseTimestamp": "20220526162411",
              "testCaseId": 74,
              "testCaseDesc": null,
              "testCaseName": "normalTestCase",
              "testCaseEvidence": [
                "/pipeline/Project-65-Build-674-a64617d5-9139-4d13-a860-0edc47f4734a/case-74/be777cdf-13f1-4467-8ea7-3cca255f3269.png",
                "/pipeline/Project-65-Build-674-a64617d5-9139-4d13-a860-0edc47f4734a/case-74/66915444-1176-48bf-9ff0-57660d47a536.png"
              ]
            }
          ]
        },
        {
          "testSuiteId": 494,
          "testSuiteName": "Adhoc_Process",
          "testSuiteExecutionStatus": "Passed",
          "testSuiteTimestamp": "20220526162411",
          "testCases": [
            {
              "testCaseStatus": "Passed",
              "testCaseTimestamp": "20220526162411",
              "testCaseId": 65,
              "testCaseDesc": null,
              "testCaseName": "adhocTask",
              "testCaseEvidence": [
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/7866fe4f-752a-47ff-8665-6bb7e9513cab.png",
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/f39fe29f-eb20-4cf0-814b-5c89b5860127.png",
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/779f9caf-a168-490d-a758-addcee6cff5c.png",
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/e63255b7-e87d-459c-918c-f716cf277c98.png",
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/4560bde8-104d-4031-910f-96d4cb32b827.png",
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/1eb8d925-afac-4447-8822-83eed41919c3.png",
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/89bb4c30-0156-4210-8196-593cd2bc493d.png",
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/4c6845ae-0d8e-448e-9bbf-f7d3552f3cb1.png",
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/2c86c1e9-1ee8-4ae2-917c-36dd71a70dd6.png",
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/1dae908b-9966-400e-9c86-a7667a5cdffb.png",
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/1c87cffe-608d-4397-8e55-f90270cbfc26.png",
                "/pipeline/Project-65-Build-674-2185e747-4a49-4eae-b08d-693f3bd10841/case-65/4413936c-4c04-4db9-a240-dfcffa3bb87e.png"
              ]
            }
          ]
        }
      ]
    },
    {
      "testProjectId": 65,
      "testProjectName": "IDA Sample-BAW 20002 Regress Traditional",
      "testSuites": [
        {
          "testSuiteId": 502,
          "testSuiteName": "Custom_Coach_Test",
          "testSuiteExecutionStatus": "Passed",
          "testSuiteTimestamp": "20220526163013",
          "testCases": [
            {
              "testCaseStatus": "Passed",
              "testCaseTimestamp": "20220526163013",
              "testCaseId": 74,
              "testCaseDesc": null,
              "testCaseName": "normalTestCase",
              "testCaseEvidence": [
                "/pipeline/Project-65-Build-674-6f3b22b2-631a-4e98-91c4-4433e631a6b1/case-74/a8a3b8e0-0630-44ec-b1b0-06ddc230ce2a.png",
                "/pipeline/Project-65-Build-674-6f3b22b2-631a-4e98-91c4-4433e631a6b1/case-74/6454abeb-5e1a-4439-8d22-6a8c0558ff04.png"
              ]
            }
          ]
        },
        {
          "testSuiteId": 507,
          "testSuiteName": "Adhoc_Process",
          "testSuiteExecutionStatus": "Passed",
          "testSuiteTimestamp": "20220526163013",
          "testCases": [
            {
              "testCaseStatus": "Passed",
              "testCaseTimestamp": "20220526163013",
              "testCaseId": 65,
              "testCaseDesc": null,
              "testCaseName": "adhocTask",
              "testCaseEvidence": [
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/d5814798-0f49-4605-a219-1c3ed82e4792.png",
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/848a541a-a9ed-46e4-a3c3-b8c27f7bfb01.png",
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/d941df1f-6002-43d3-88ef-289613ffecad.png",
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/ac5591d2-a68c-4b75-8c4e-22a608b98646.png",
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/17acd3e4-a31c-4cbd-a65f-797c892bd5eb.png",
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/48533b0b-647b-4feb-a0a0-93b911fbbf4e.png",
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/63c82e42-3e7e-4b5f-bb00-5c6ad1b2fdad.png",
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/39557fa7-c4f0-403e-befe-a4317a1c6fd7.png",
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/7b989851-597d-4647-b96d-5c0b1340b7b8.png",
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/284a5c59-8012-413e-8af4-1c9cbc15e196.png",
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/b01a33c6-87d8-42ac-97d2-4ab0c386190d.png",
                "/pipeline/Project-65-Build-674-c6599183-8f19-4faa-b06d-3cdb6aa8d60d/case-65/801fa2d5-d777-4387-af45-4572416dd839.png"
              ]
            }
          ]
        }
      ]
    }
  ]
}
```

### Response Status
The [Trigger Pipeline Build](#trigger-pipeline-build) and [Get Pipeline Build Status](#get-pipeline-build-status) REST APIs' response will be returned with one of the following status:

**Build Status:**
* `RUNNING` The pipeline build is running
* `FAILED` There was a problem with pipeline build (step failed, etc.)
* `SUCCESS` The pipeline build was successful


**Other Status:**
* `unauthorized` The REST API caller does not have permission to access the requested resource
* `pipeline not found` An attempt was made to access a pipeline that does not exist
* `build not found` An attempt was made to access a build that does not exist
* `ERROR` Error occured during the REST API call


[swagger_ui]: ../images/references/swagger_ui.png 