---
title: "Toolkit Deployment"
category: pipeline
date: 2018-08-13 16:55:50
last_modified_at: 2020-03-27 16:55:50
---

# How to Deploy a Toolkit by Group Pipeline
***

## 1. Create a test project, we will test the toolkit with the project
Please refer to [Create a test project and generate test cases][1] to create a test project. 

  1. Here is a project named "Test Dep APP" that uses the toolkit to be deployed.

     ![][create-test-project]{:width="60%"}


## 2. Create a pipeline, we will take a snapshot for the toolkit before testing it
Please refer to [Create a Pipeline for Continuous Deployment][2] to create a pipeline. Here we have created a pipeline named "_Create Toolkit Snapshot Pipeline".

  1. Below is the pipeline overview.

     ![][create-toolkit-snapshot-pipeline-overview]{:width="60%"}


  2. In the "Dev" stage, we input the toolkit and corresponding snapshot information.

     ![][create-edit-dev-stage]{:width="60%"}


  3. In the "Take Snapshot" step, fill in the "Type" and "Name Pattern" fields.

     ![][create-takesnapshot-step]{:width="60%"}


## 3. Create another pipeline, we will update the toolkit dependency then test it
Here we have created a pipeline named "_Update Toolkit Dep Pipeline".

  1. Below is the pipeline overview.

     ![][update-toolkit-dep-pipeline-overview]


  2. In the "Development" stage, input the test project name "Test Dep APP" and some other information.

     ![][update-edit-dev-stage]{:width="60%"}


  3. Input "Type" and "Toolkit" in the "update" step.

     ![][update-updatedependence-step]{:width="60%"}


  4. In the "Test" step, select the test project that we use to test the toolkit.

     ![][update-test-step]{:width="60%"}


  5. Take a snapshot for the project after testing.

     ![][update-takesnapshot_step]{:width="60%"}


## 4. Create a group pipeline to run "_Create Toolkit Snapshot Pipeline" and "_Update Toolkit Dep Pipeline" sequentially

  1. Go to the "Define" page, input the pipeline name and select the "Pipeline Group" checkbox.

     ![][create-group-pipeline]


  2. Click the "+" button beside the "Stage Configuration" and select the pipeline you have created from the dropdown.

     ![][select-sub-pipeline]


Run the group pipeline, you could deploy a toolkit by it.





[1]: ../tutorial/tutorial-create-a-test-project-and-generate-test-cases.html
[2]: ../pipeline/pipeline-create-a-pipeline-for-continuous-deployment.html
[create-test-project]: ../images/pipeline/create-test-project.png
[create-a-pipeline]: ../images/pipeline/create-a-pipeline.png
[create-toolkit-snapshot-pipeline-overview]: ../images/pipeline/create-toolkit-snapshot-pipeline-overview.png
[create-edit-dev-stage]: ../images/pipeline/create-edit-dev-stage.png
[create-takesnapshot-step]: ../images/pipeline/create-takesnapshot-step.png
[update-toolkit-dep-pipeline-overview]: ../images/pipeline/update-toolkit-dep-pipeline-overview.png
[update-updatedependence-step]: ../images/pipeline/update-updatedependence-step.png
[update-test-step]: ../images/pipeline/update-test-step.png
[update-takesnapshot_step]: ../images/pipeline/update-takesnapshot_step.png
[create-group-pipeline]: ../images/pipeline/create-group-pipeline.png
[select-sub-pipeline]: ../images/pipeline/select-sub-pipeline.png
[update-edit-dev-stage]: ../images/pipeline/update-edit-dev-stage.png