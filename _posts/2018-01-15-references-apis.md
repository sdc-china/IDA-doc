---
layout: page
title: "APIs"
category: references
date: 2018-11-15 15:17:55
order: 8
---

IDA REST API reference.

### Pipeline

- **[<code>POST /rest/v1/pipeline/build?pipelineId=:id</code>  Trigger build by ID](#trigger-build-by-id)**
- **[<code>POST /rest/v1/pipeline/build?pipelineName=:name</code>  Trigger build by name](#trigger-pipeline-build-by-name)**
- **[<code>GET /rest/v1/builds/:buildId</code>  Get build status](#get-build-status)**

### **Trigger build by id**
___

#### **URL:** 

```
/rest/v1/pipeline/build?pipelineId=:id
```

#### **Method:**  ```POST```


#### **Parameters:**

| Name | Required                        | Description        |
|----------------|------------|--------------|
| `pipelineId`   | yes          | Pipeline ID. <br>You could get the pipeline ID from the URL path of pipeline dashboard page. |
| `userToken`   | yes          | User token. <br>You could get the token from user profile page.|
| `snapshotAcronym`   | no          | Snapshot acronym name |


#### **Example:**

**Request**

	curl -X POST http://<SERVER>/keter/rest/v1/pipeline/build?pipelineId=1 --data-urlencode "snapshotAcronym=0.00.96" --data-urlencode "userToken=kBYf/PfN6B5aQsXyEZaNHBH/aIezRtwjm4w5EcEEqy+CfBmE/7OCQ6HGYnaSKBFw"


**Response**
``` json
{
    "buildId": 1314,
    "pipelineId": 1,
    "status": "RUNNING"
}
```

### **Trigger pipeline build by name**
___

#### **URL:** 

```
/rest/v1/pipeline/build?pipelineName=:name
```

#### **Method:**  ```POST```


#### **Parameters:**

| Name | Required                        | Description        |
|----------------|------------|--------------|
| `pipelineName`   | yes          | Pipeline name. |
| `userToken`   | yes          | User token. <br>You could get the token from user profile page. |
| `snapshotAcronym`   | no          | Snapshot acronym name |


#### **Example:**

**Request**

    curl -X POST http://<SERVER>/keter/rest/v1/pipeline/build?pipelineName=pipeline%20sample --data-urlencode "snapshotAcronym=0.00.96" --data-urlencode "userToken=kBYf/PfN6B5aQsXyEZaNHBH/aIezRtwjm4w5EcEEqy+CfBmE/7OCQ6HGYnaSKBFw"


**Response**
``` json
{
    "pipelineName": "pipeline sample",
    "buildId": 1315,
    "status": "RUNNING"
}
```

### **Get build status**
___

#### **URL:** 

```
/rest/v1/builds/:buildId
```

#### **Method:**  ```GET```


#### **Parameter:**

| Name | Required                        | Description        |
|----------------|------------|--------------|
| `buildId`   | yes          | Build ID. <br>You could get the build Id from the reponse of pipeline build API. |


#### **Example:**

**Request**

    curl http://<SERVER>/keter/rest/v1/builds/1314


**Response**
``` json
{
    "report": "http://<SERVER>/keter/rest/v1/pipelines/1/builds/1314",
    "buildId": 1314,
    "status": "RUNNING"
}
```

