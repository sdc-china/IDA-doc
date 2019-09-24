---
title: "REST APIs"
category: references
date: 2018-10-29 15:17:55
last_modified_at: 2019-07-29 16:44:00
order: 4
---

# REST APIs
***
IDA REST API reference.

### Swagger URL
    http://[serverhost]:[port]/ida/swagger-ui.html
    http://[serverhost]:[port]/ida/v2/api-docs

### Pipeline

- **[<code>POST /rest/v1/pipeline/build/id?pipelineId=:id</code>  Trigger build by ID](#trigger-build-by-id)**
- **[<code>POST /rest/v1/pipeline/build/name?pipelineName=:name</code>  Trigger build by name](#trigger-pipeline-build-by-name)**
- **[<code>GET /rest/v1/pipeline/builds/:buildId</code>  Get build status](#get-build-status)**


### **Trigger build by id**
___

**URL:**

```
/rest/v1/pipeline/build/id?pipelineId=:id
```

**Method:**  ```POST```


**Parameters:**

| Name | Required                        | Description        |
|----------------|------------|--------------|
| `pipelineId`   | yes          | Pipeline ID. <br>You could get the pipeline ID from the URL path of pipeline dashboard page. |
| `userToken`   | yes          | User token. <br>You could get the token from user profile page.|
| `snapshotAcronym`   | no          | BPM snapshot acronym name. <br>If it's set, pipeline build will bypass the Snapshot step, and the Test/Checkstyle/Deployment steps will use this snapshot. |
| `twxFileName`   | no          | The BPM installation package file name of Process APP.|

**Example:**

Request

	curl -X POST http://[serverhost]:[port]/ida/rest/v1/pipeline/build/id?pipelineId=1 -k --data-urlencode "snapshotAcronym=0.00.96" --data-urlencode "userToken=kBYf/PfN6B5aQsXyEZaNHBH/aIezRtwjm4w5EcEEqy+CfBmE/7OCQ6HGYnaSKBFw"


Response
``` json
{
    "buildId": 1314,
    "pipelineId": 1,
    "status": "RUNNING"
}
```

### **Trigger pipeline build by name**
___

**URL:**

```
/rest/v1/pipeline/build/name?pipelineName=:name
```

**Method:**  ```POST```


**Parameters:**

| Name | Required                        | Description        |
|----------------|------------|--------------|
| `pipelineName`   | yes          | Pipeline name. |
| `userToken`   | yes          | User token. <br>You could get the token from user profile page. |
| `snapshotAcronym`   | no     | BPM snapshot acronym name. <br>If it's set, pipeline build will bypass the Snapshot step, and the Test/Checkstyle/Deployment steps will use this snapshot. |
| `twxFileName`   | no          | The BPM installation package file name of Process APP.|

**Example:**

Request

    curl -X POST http://[serverhost]:[port]/ida/rest/v1/pipeline/build/name?pipelineName=pipeline%20sample -k --data-urlencode "snapshotAcronym=0.00.96" --data-urlencode "userToken=kBYf/PfN6B5aQsXyEZaNHBH/aIezRtwjm4w5EcEEqy+CfBmE/7OCQ6HGYnaSKBFw"


Response
``` json
{
    "pipelineName": "pipeline sample",
    "buildId": 1315,
    "status": "RUNNING"
}
```

### **Get build status**
___

**URL:**

```
/rest/v1/pipeline/builds/:buildId
```

**Method:**  ```GET```


**Parameter:**

| Name | Required                        | Description        |
|----------------|------------|--------------|
| `buildId`   | yes          | Build ID. <br>You could get the build Id from the reponse of pipeline build API. |


**Example:**

Request

    curl http://[serverhost]:[port]/ida/rest/v1/pipeline/builds/1314


Response
``` json
{
    "currentStep": "step1",
    "pipelineName": "TEST",
    "currentStage": "stage1",
    "report": "http://<SERVER>/ida/rest/v1/pipelines/1/builds/1314",
    "errorMessage": null,
    "buildId": 1314,
    "logs": "logs",
    "status": "RUNNING"
    "pipelineId": 24
}
```

### Response Status
Each response will be returned with one of the following status:

**Build Status:**
* `RUNNING` The pipeline build is running
* `FAILED` There was a problem with pipeline build (step failed, etc.)
* `SUCCESS` The pipeline build was successful

**Other Status:**
* `unauthorized` The token provided do not have permission to access the requested resource
* `pipeline not found` An attempt was made to access a pipeline that does not exist
* `build not found` An attempt was made to access a build that does not exist
