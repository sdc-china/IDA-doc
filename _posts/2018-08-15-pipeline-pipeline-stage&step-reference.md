---
title: "Pipeline Stage & Step Reference"
category: pipeline
date: 2018-08-15 15:17:55
last_modified_at: 2024-03-25 15:55:00
---

# Pipeline Stage & Step Reference
***

## Pipeline stage reference

Pipeline stage is like a milestone which contains one or more pipeline steps. Each stage has a **Type** attribute, which impacts the supported pipeline steps. There are 3 types of stage, which is listed as below.

  |   Stage Type        | Supported Steps                          |  Description |
  | ---------------------- |---------------------------------------|---------------|    
  | Development         | Snapshot, Checkstyle, Test, Script       | The stage is associated to Workflow PC, where users can run Snapshot, Checkstyle, Test, Script. When you define the **Development** stage, you need to select the BAW server, ProcessApp, and Snapshot. The snapshot can be overridden if there is a **Snapshot** step in this Stage, or users specify another snapshot when running the pipeline. If is not overridden, this snapshot will be used for Checkstyle, Test and Deployment.|
  | Test, Stage, Production | Checkstyle, Test, Script             | The stage is associated to Workflow PS, where users can run Checkstyle, Test, Script. Please note that the Snapshot step can only be run from Development stage. If it is the first stage in pipeline, it means there is no associated PC environment thus no new snapshot will be created during the pipeline execution. So when you run the pipeline, you need to specify an existing snapshot name to execute Checkstyle, Test, and Deployment steps.|
  | Utility         | Script                 | The stage is not associated to Workflow environment. It is associated to IDA server, which you can run Script. |

## Pipeline step reference


  |   Step Name        | Parameters                          | Description                                                             |
  | ---------------------- |----------------------------------|---------------------------------------|                                          
  | Snapshot             |   **Naming Pattern**: the naming pattern for the created snapshot. | The Snapshot step is used to create a snpshot by specified naming pattern. This step is only available in Workflow DEV environment.|
  | Checkstyle             |   **Health Score Threshold**: the threshold to define the health score. If **Halt On Failure** is checked and the health score exceeds the threshold, the checkstyle step is considered to be failed and the pipeline is stopped. <br>**Warnings Threshold**: the threshold for the number of warnings. If **Halt On Failure** is checked and the number of warnings exceeds the threshold, the checkstyle step is considered to be failed and the pipeline is stopped.<br>**Ignore Empty Documentation**: indicate whether to ignore empty documentation.<br>**Ignore JS Coding Style Check**: indicate whether to ignore JS coding style check.<br>**Halt On Failure**: indicate whether to stop the pipeline if the checkstyle result exceeds the threshold.<br>**Tip**: indicate whether to run the checkstyle against TIP snapshot. | The Checkstyle step is used to run the checkstyle against a processApp.|
  | Test                  |  **Project**: the test project to run. <br>**Tip**: indicate whether to run the test against TIP snapshot. <br>**Include by labels**: indicate whether to include test cases by their labels. Once selected, all the test cases in the test project will be listed. User can select multiple labels in the select box shown below. Test cases must have **all** of the selected labels in order to be included in the test execution.<br>**Exclude test cases**: indicate whether to exclude test cases. Once selected, all the test cases in the test project will be listed. User can select one or more test cases that will be excluded from the test execution.<br>**Halt On Failure**: indicate whether to stop the pipeline if there are test case failures.|The Test step is used to run the testing project.|     
  | Deployment             |  **Synchronize Settings From Default Snapshot**: select Environment Variables, EPVs and Team Bindings to synchronize to the snapshot from the current default snapshot on process server.<br>**Ignore Validation Error**: indicate whether to ignore validation errors during deployment.<br>**Migrate Instances**: Migrate process application instances from the default snapshot. Migrate process application instances from the default snapshot. If Default Policy is selected, IDA will use the default migration policy. If Custom Policy is selected, IDA will try to download the migration policy from Workflow Center. If the migration policy does not exist, IDA will pause the build until the migration policy is created on Workflow Center(supported on BAW v22.x+).<br>**Clean Old Snapshots**: Clean the old snapshots without any running instances or completed tasks referenced by running instances, and the completed instances in the snapshots will be deleted as well.<br>**Offline Install** : indicates it is an offline deployment. <br>**Deploy From Local File System Of Process Server**: check when installation package on process server dir configures on [BAW Deployment Remote Dir].<br>**Online Install** : indicates it is an online deployment.|  The Deployment step is used to deploy the processApp snapshot to process server, either through onine or offline deployment. The step is only available in Workflow non-DEV environment(QA, STG, PROD). |
  | Script                   | **Script**: the script content to execute  |   The Script step is used to run a script in IDA server. Refer to [this] for more details about pipeline Script samples.|   

[this]: ../pipeline/pipeline-pipeline-script.html
[BAW Deployment Remote Dir]: ../administration/administration-settings-configuration.html#pipeline-configuration
