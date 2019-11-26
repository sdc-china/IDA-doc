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

    curl http://[serverhost]:[port]/ida/rest/v1/pipeline/builds/11844


Response
``` json
{
  "pipelineName": "Testing",
  "currentStep": "step1",
  "currentStage": "stage1",
  "report": "http://[serverhost]:[port]/ida/rest/v1/pipelines/[pipelineid]/builds/11844",
  "errorMessage": null,
  "buildId": 11844,
  "triggerBy": "idaAdmin",
  "testResult": [
    {
      "testProjectId": 10957,
      "testSuites": [
        {
          "testCases": [
            {
              "testCaseStatus": "Passed",
              "testCaseDesc": null,
              "testCaseEvidence": [
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/a283b630-d452-42bb-ac53-2da144f4f754.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/40048ffc-f050-4ffc-9347-b647f298fe80.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/1416d844-fd20-4f90-b1ec-1def576e7f0d.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/d4049d57-60b1-41b9-bbb5-b871cca19e7b.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/fa0d2ee2-cbd0-442c-a53e-9cc1313f9098.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/2555fba0-d618-42a8-a17f-18357c902110.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/8813538a-26d1-499c-93a4-73486cf2bfbd.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/c31752f9-5ba9-45ea-9341-9e4618f80a4c.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/c3eaa22f-a051-46ed-8fe4-bb657170fdbf.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/1129c288-154c-49d7-abbc-63100abb7092.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/97519274-8a9a-452b-a3fa-f61d983b42a8.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/ce17089a-cb1c-4d9f-b254-c207828e6595.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/2d686393-e85b-4589-96ed-540f053638a4.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/70f95bd5-2aff-493d-a8c3-cafb653addc8.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/9eeb785c-1844-44d8-8f5b-2179c0bf44ee.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/adbd2596-d372-4149-8f05-40ada5b2c7ea.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/9af4c2f4-6c9a-4c4a-8985-e2bb96d245dc.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/917d1d97-f435-45e6-9ac7-a1090f5e85e7.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/ef500f27-0907-4845-be5b-6bda0b5162ab.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/5bab72da-267c-495b-9f58-1390486ab264.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/b00654c9-ce98-42fd-aad1-7758d8b3d0cc.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/25ce60ab-81f3-47ba-8b08-4982923207ff.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/9afe59f6-3355-46cc-ad4c-e3ad37043996.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/3bb5e1c3-ee13-4427-ac70-bfe636897e22.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/2907693a-6270-4ac0-87cc-2f89b3db0ed9.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/ef1dfde2-db1f-4c9d-a17c-2bc255446928.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/f8745a41-5877-4550-a4d2-fe98c41509e8.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/99be216b-fd20-41ba-88c0-56a4bcb84e5d.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/ab8c1672-cd76-4b16-a18a-6d5b0b349a1d.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/9819105d-7516-4869-88b2-0e73e75f4e7b.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/1ff6e70f-0801-41b6-8a46-c4899ec47f88.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/d6def623-9b6f-4363-becd-b8319886b5cc.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/42414331-ff28-4e81-8d51-d0691763de37.png",
                "/pipeline/Project-10957-Build-11844-8ff52436-8977-405f-9f92-3b1db64daa06/case-10985/96f89e81-f0c0-412c-a866-625dc1532917.png"
              ],
              "testCaseTimestamp": "20191028061931",
              "testCaseName": "approveCase",
              "testCaseId": 10985
            },
            {
              "testCaseStatus": "Passed",
              "testCaseDesc": null,
              "testCaseEvidence": [
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/d8eaf57a-f6af-4e20-b9a7-c6ae1c87207a.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/94ccf81e-472f-470c-8d92-5ff302da0eab.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/5741dbf9-772d-4e27-aa1d-78d0192f2cc7.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/2418afbd-f5a5-476f-acfa-55358049ca02.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/87fa5190-4cb5-4252-989a-48105f07505f.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/1ec2f31d-1deb-459a-87ff-bddfa217184e.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/28abc694-1911-4459-a701-6a360f88574b.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/85ee8d5f-2c5f-4f5e-a13e-96e522c18e1c.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/c55a764d-e7dc-4e58-86d1-dbf7976b063e.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/ccb3aea3-4ce3-4b56-8785-7bf51848172d.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/4966adb7-1b73-4e48-aa4b-977b6a75b533.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/0cb3bc42-e489-447e-abc6-6ee333cda35a.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/ca2c0f29-e840-4b84-a27d-dce59b0e107f.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/1bd88ca3-0857-4671-a6f0-767baaca3e32.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/8032a582-6b66-45d4-9a8e-24da8bd94528.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/bcd1f16e-edd5-4998-89d0-8d773fe3be03.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/7c79f9ea-0498-4d6e-897c-338d244b517b.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/9e208028-78a6-42ce-bc0e-bbafc478b4b0.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/90e600bb-8d39-4c2e-a74f-8c743fbe402d.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/a6aea5c8-c2b2-4433-84ab-5489c53e9f54.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/161d2759-086a-4d25-913f-4a5299a34586.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/ce32e589-d142-40ec-8139-f941bc0960c3.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/cc880e9f-c7c6-4db7-aa3f-56d4f74f726f.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/dbabcf81-0165-4a17-8c42-50dcbaaeae9f.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/cca2b81f-0bfc-40dd-aaca-65cb5997a514.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/41c7086f-fa64-40cf-9c45-41d575497b28.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/a2f4d9d1-2cfc-4548-a1c5-3ec0f04eee59.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/934d406e-fc34-4e4b-8d96-66a8ee8112b7.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/9b0f0c0a-7b0f-4f5d-b360-44fee475cfb1.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/82b15fc4-0f74-4c16-968e-c286f8e3c43b.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/5b6007aa-8e33-4bcb-8a9a-49606d56330e.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/896a36da-b460-4966-8461-f5390410f484.png",
                "/pipeline/Project-10957-Build-11844-87fd29c8-c3b0-42d9-87d0-3134280c142f/case-11024/528ebf9e-6329-4e81-9c4f-67638f57fd98.png"
              ],
              "testCaseTimestamp": "20191028061931",
              "testCaseName": "existCase",
              "testCaseId": 11024
            },
            {
              "testCaseStatus": "Passed",
              "testCaseDesc": null,
              "testCaseEvidence": [
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/8764c71b-2111-4457-ba41-a8a076e48608.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/bfde5660-d2f7-4138-87c1-aba641e824fb.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/69db0bba-54ed-4892-9f7e-cca4e0e9f7da.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/221c0a1c-b499-496d-beeb-137b008ca76d.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/fbf56f0d-3488-4935-a792-73fdff3f4a15.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/53e8439e-bfcb-492d-bc55-91ebe1bc5b7b.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/1d9fad5b-251f-4377-834b-a9febf3e74d8.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/99416628-f20d-4b7d-9124-bce1ebae9dbe.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/cad068d6-57b9-4888-ba57-8302b39da7cc.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/a07dafab-dd34-4f4e-8d83-0c898b9bf592.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/1ba6def5-e165-4819-a7c4-8a8f4da34f2a.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/a3d2705f-f1fa-4d13-b60b-8776d379f465.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/61e3c66d-c64f-40d3-9f7a-ef5cba77d104.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/5d727e4c-64a9-430c-a01f-90eb69cf828b.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/66c2192b-e037-46b8-bd55-6110ae7f9117.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/255dedef-7597-41bb-8929-7fdd9661ab91.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/d5756c37-bc77-438e-b0e3-6982493ebe8e.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/f16239fd-318a-446a-a5ec-f4741b90bc79.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/b8b2c7d1-2126-451a-a8af-559154de8912.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/e3b98fd2-e94a-4266-82dc-744b08994050.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/3332b471-32e2-4193-9aa0-4e1fa7df8f69.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/9a4fb4b0-c0f6-4331-8c71-be178da79c51.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/560605f9-360d-4db2-a3eb-14fe28496bcf.png",
                "/pipeline/Project-10957-Build-11844-a2a29514-868b-4b77-887a-2ef2950692fc/case-11061/594f4751-b713-4a70-8a3a-61bf342caa7c.png"
              ],
              "testCaseTimestamp": "20191028061931",
              "testCaseName": "rejectCase",
              "testCaseId": 11061
            }
          ],
          "testSuiteName": "Standard HR Open New Position",
          "testSuiteId": 11888,
          "testSuiteExecutionStatus": "Passed",
          "testSuiteTimestamp": "20191028061931"
        },
        {
          "testCases": [
            {
              "testCaseStatus": "Passed",
              "testCaseDesc": null,
              "testCaseEvidence": [
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/7f7a6e72-16c5-4a67-87dd-85f4dea1e7f5.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/2a606fb5-6d3a-4208-bf6e-4e0646638154.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/c10e0c07-438e-4f7a-94f8-b41bfab7ec5c.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/55879707-ba34-471b-8ef0-400a4ff121b6.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/6b699196-f7ad-4ba9-ab42-f80f6ea02b45.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/62723061-355d-40e2-a6ed-3d127451eec7.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/4f4ee05e-ac8a-4975-b6b9-4bb4e38f49e5.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/32acae98-b273-44c8-8997-ad1f833811ed.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/aae18c3d-23a9-4d99-b0da-e0ffb2390d89.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/dbbb082b-a5f6-4f02-81ab-e6be4837f562.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/ed0f8060-2e68-4c26-bbd7-38aafd842ee3.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/2a6330ec-ec42-4245-ad28-f8673a171843.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/c31e4b51-be8d-437f-9029-0c2a671c33df.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/56d7a5c7-73ae-45fb-b404-dfb6b9cc1010.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/b97c9eda-ef50-42fa-babe-e413d774b048.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/7a1b581d-b445-45c5-a9b0-7b06bbea5553.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/4f34b590-ae4a-4b98-9822-9ed0d9ec3b14.png",
                "/pipeline/Project-10957-Build-11844-c0541f48-6f5c-46fe-b082-cf7bafae13a6/case-10959/89d30077-1886-4783-ba9e-4901b1fe8ea3.png"
              ],
              "testCaseTimestamp": "20191028061931",
              "testCaseName": "case1",
              "testCaseId": 10959
            }
          ],
          "testSuiteName": "Create Position Request CSHS",
          "testSuiteId": 11864,
          "testSuiteExecutionStatus": "Passed",
          "testSuiteTimestamp": "20191028061931"
        },
        {
          "testCases": [
            {
              "testCaseStatus": "Passed",
              "testCaseDesc": null,
              "testCaseEvidence": [],
              "testCaseTimestamp": "20191028061931",
              "testCaseName": "case1",
              "testCaseId": 10981
            }
          ],
          "testSuiteName": "Requisition_CV_Validation",
          "testSuiteId": 11858,
          "testSuiteExecutionStatus": "Passed",
          "testSuiteTimestamp": "20191028061931"
        }
      ],
      "testProjectName": "Hiring Sample5855"
    }
  ],
  "logs": "No logs available.",
  "status": "SUCCESS",
  "pipelineId": 11841
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
