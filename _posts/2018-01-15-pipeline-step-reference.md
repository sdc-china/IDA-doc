---
layout: page
title: "Pipeline step reference"
category: pipeline
date: 2018-01-05 15:17:55
order: 6
---
### Pipeline step reference


  |   Step Name        | Parameters                          | Description                                                             |
  | ---------------------- |-------------------------------------------------------------------------|                                          
  | Snapshot             |   **Naming Pattern**: the naming pattern for the created snapshot. | The Snapshot step is used to create a snpshot by specified naming pattern. This step is only available in BPM DEV environment.|
  | Checkstyle             |   **Health Score Threshold**: the threshold to define the health score. If **Halt On Failure** is checked and the health score exceeds the threshold, the checkstyle step is considered to be failed and the pipeline is stopped. <br>**Warnings Threshold**: the threshold for the number of warnings. If **Halt On Failure** is checked and the number of warnings exceeds the threshold, the checkstyle step is considered to be failed and the pipeline is stopped.<br>**Ignore Empty Documentation**: indicate whether to ignore empty documentation.<br>**Ignore JS Coding Style Check**: indicate whether to ignore JS coding style check.<br>**Halt On Failure**: indicate whether to stop the pipeline if the checkstyle result exceeds the threshold.<br>**Tip**: indicate whether to run the checkstyle against TIP snapshot. | The Checkstyle step is used to run the checkstyle against a processApp.|
  | Test                  |  **Project**: the test project to run. <br>**Tip**: indicate whether to run the test against TIP snapshot. <br>**Exclude test cases**: indicate whether to exclude test cases. Once checked, all the test cases in the test project will be listed. User can select one or more test cases that will be excluded from the test execution. |The Test step is used to run the testing project.|     
  | Deployment             |  **Ignore Validation Error**: indicate whether to ignore validation errors during deployment.<br>**Offline Install** : indicates it is an offline deployment. <br>**Online Install** : indicates it is an online deployment.|  The Deployment step is used to deploy the processApp snapshot to process server, either through onine or offline deployment. The step is only available in BPM non-DEV environment(QA, STG, PROD). |
  | Script                   | **Script**: the script content to execute  |   The Script step is used to run a script in IDA server. Refer to [this] for more details about pipeline Script samples.|   

[this]: https://sdc-china.github.io/IDA-doc/pipeline/pipeline-script.html