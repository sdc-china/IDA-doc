---
title: "Create a Pipeline for Continuous Deployment"
category: pipeline
date: 2018-08-03 15:17:55
last_modified_at: 2024-09-26 10:00:00
---

# Create a Pipeline for Continuous Deployment
***

## Create a pipeline

1. Click the **Create Pipeline** button on the pipeline page.

   ![][pipeline_create]
   In the **Build Triggers** section, you can configure how to automatically trigger the pipeline build. Schedule the pipeline build at a specific time by setting the **Start Time** and schedule periodical builds by setting the **Repeat Pattern**. Select **Trigger By New Snapshot**, then a background job will periodically check for new snapshots on the PC server of the first stage (see steps below). If a new snapshot is created on the PC, a new pipeline build will start. The time interval for the background job to query for new snapshots can be set [in the Settings tab](../administration/administration-settings-configuration.html#pipeline-configuration).

 2. Click the ![][pipeline_add_stage] icon to add a new stage.

    ![][pipeline_first_stage]{:width="60%"}

	The fields to create a stage are explained below.

     |Label                  | Description
     |---------------------- |-------------
     |Name                   | The stage name
     |Type                   | The options are Development, Test, Stage, Production, and Utility
     |Server                 | The server environment based on the stage type (the Utility stage type doesn't have a server)
     |Process App            | Process apps of the selected server
     |Branch                 | The branch of the selected process app
     |Snapshot               | The snapshot of the selected branch


 3. Click the ![][pipeline_add_stage] icon below the stage step to add a new step in the stage.

    ![][pipeline_create_step]{:width="60%"}

    The fields to create a step are explained below.

     |Label                  | Description
     |---------------------- |-------------
     |Name                   | The stage name
     |Type                   | The options are Snapshot, Deployment, Checkstyle, Test, and Script.

    In the **Development** stage, you can choose the step type as **Snapshot**, **Checkstyle**, **Test**, and **Script**.

    In the stages of **Test**, **Stage**, and **Production**, you can choose the step type as **Deployment**, **Test**, and **Script**.

    In the **Utility** stage, you can only choose the step type as **Script**.

 4. Click the ![][pipeline_add_stage] icon to add more stages. Here's a typical stage's appearance.

    ![][pipeline_stages]{:width="80%"}

    For the first stage, it's not allowed to change the sequence. However, you can adjust other stages' sequences by dragging and dropping.


## Create a pipeline from a template

1. Click the **Create Pipeline** button on the pipeline page.

   ![][pipeline_create]

2. Click the ![][pipeline_import_stage] icon to create a pipeline from a template.

3. There are five built-in templates; you could choose one from the dropdown list.
    ![][pipeline_templates]

4. Input the missing values labeled by ![][pipeline_missing_value].

## Edit a pipeline

1. On the pipeline list page, click the ![][pipeline_edit_icon] button.

    ![][pipeline_build]

2. Update the pipeline form according to the table shown in the creation section.

## Delete a pipeline

On the pipeline list page, click the ![][pipeline_delete_icon] button.

## Run a pipeline

1. You have two ways to run the pipeline. Firstly, click the **Run** button at the top right corner of the pipeline section. Secondly, enter the pipeline dashboard page and click the **Build** button.

    ![][pipeline_dashboard]

    In the statistics section, you could view the average time for each build step and the ratio of completed pipeline builds.

    ![][pipeline_build_statistic]

    When you run the build, the pipeline build history section will appear with the building status for each stage. You could see the build status, running step, or failed step of each build.

    ![][pipeline_build_view]   

    Click the ![][pipeline_build_log_icon] at the end of each row to see the build logs in a pop-up dialog.

2. When the pipeline build is over, the summary information will appear in the pipeline dashboard. The failed step will not be running and won't have any report. You can click the **build name** link to see the whole report. [Details of the report]


## Perform deployment from Workflow PC server to PC server

**Note:**

IDA only supports deploying applications from a Workflow PC server to a PC server between the same versions.

1. Click the **Create Pipeline** button on the pipeline page.

   ![][p2p_create_pipeline]{:width="60%"}
   
 2. Click the ![][pipeline_add_stage] icon to add 'Stage1' and select the "Deployment" type.

    ![][p2p_stage_1]{:width="60%"}

 3. Click the ![][pipeline_add_stage] icon below the stage step to add the 'TakeSnapshot' step in the stage and select the "Snapshot" type.

    ![][p2p_takeSnapshot]{:width="60%"}

 4. Click the ![][pipeline_add_stage] icon to add 'Stage2' and select the "Deployment" type. You could select another Workflow PC server with the same version as 'Stage1'.

    ![][p2p_stage2]{:width="60%"}

 5. Click the ![][pipeline_add_stage] icon below the stage step to add the 'Deploy' step in the stage and select the 'Deployment' type.

    ![][p2p_deployment]{:width="60%"}

 6. Click the "Save" button, and then you could use the pipeline to make a deployment from the PC server to the PC server.

  [pipeline_create]: ../images/pipeline/pipeline_create.png
  [pipeline_templates]: ../images/pipeline/pipeline_templates.png
  [pipeline_add_stage]: ../images/pipeline/pipeline_add_stage.png
  [pipeline_import_stage]: ../images/pipeline/pipeline_import_stage.png
  [pipeline_templates]: ../images/pipeline/pipeline_templates.png
  [pipeline_missing_value]: ../images/pipeline/pipeline_missing_value.png
  [pipeline_first_stage]: ../images/pipeline/pipeline_first_stage.png
  [pipeline_create_step]: ../images/pipeline/pipeline_create_step.png
  [pipeline_build_logs]: ../images/pipeline/pipeline_build_logs.png
  [pipeline_stages]: ../images/pipeline/pipeline_stages.png
  [pipeline_zoom_in]: ../images/pipeline/pipeline_zoom_in.png
  [pipeline_pipeline_flow]: ../images/pipeline/pipeline_pipeline_flow.png
  [pipeline_steps_configuration]: ../images/pipeline/pipeline_steps_configuration.png
  [pipeline_edit_icon]: ../images/test/test_project_edit_button.PNG
  [pipeline_build]: ../images/pipeline/pipeline_build.png
  [pipeline_delete_icon]: ../images/test/test_project_delete_button.PNG
  [pipeline_dashboard]: ../images/pipeline/pipeline_dashboard.PNG
  [pipeline_step]: ../images/pipeline/pipeline_stepdetail.png
  [pipeline_build_view]: ../images/pipeline/pipeline_build_view.PNG
  [Details of the report]: ../pipeline/pipeline-pipeline-report.html
  [pipeline_build_log_icon]: ../images/pipeline/pipeline_build_log_icon.png
  [pipeline_build_statistic]: ../images/pipeline/pipeline_build_statistic.png
  [p2p_create_pipeline]: ../images/pipeline/p2p_create_pipeline.png
  [p2p_stage_1]: ../images/pipeline/p2p_stage_1.png
  [p2p_takeSnapshot]: ../images/pipeline/p2p_takeSnapshot.png
  [p2p_stage2]: ../images/pipeline/p2p_stage2.png
  [p2p_deployment]: ../images/pipeline/p2p_deployment.png
