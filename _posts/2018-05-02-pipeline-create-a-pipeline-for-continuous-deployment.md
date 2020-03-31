---
title: "Create a pipeline for continuous deployment"
category: pipeline
date: 2018-10-11 15:17:55
last_modified_at: 2020-01-08 15:51:00
order: 2
---

# Create a pipeline for continuous deployment
***
### Create a pipeline

1. Click **Create Pipeline** button in pipeline page.

   ![][pipeline_create]
   In the **Build Triggers** section, you can configure how to automatically trigger the pipeline build. Select ***Build Periodically*** to configure a timer to trigger the pipeline build. Select ***Trigger By New Snapshot***, then a background job will periodically check new snapshots on PC server of the first stage (see steps below). If a new snapshot is created on PC, a new pipeline build will start. The time interval for the background job to query for new snapshots can be set [in Settings tab](../administration/administration-settings-configuration.html#set-interval-for-trigger-by-new-snapshot.html#set-interval-for-trigger-by-new-snapshot).

 2. Click ![][pipeline_add_stage] icon to add a new stage.

    ![][pipeline_first_stage]

	The fields to create a stage is explained as below.

     |Label                  | Description
     |---------------------- |-------------
     |Name                   | The stage name
     |Type                   | The options are Development, Test, Stage, Production and Utility
     |Server                 | The server environment based on the stage type, the Utility stage type doesn't have server
     |Process App            | Process apps of the selected server
     |Branch                 | The branch of the selected process app
     |Snapshot               | The snapshot of the selected branch


 3. Click ![][pipeline_add_stage] icon below the stage step to add a new step in the stage.

    ![][pipeline_create_step]

    The fields to create a step is explained as below.

     |Label                  | Description
     |---------------------- |-------------
     |Name                   | The stage name
     |Type                   | The options are Snapshot, Deployment, Checkstyle, Test and Script.

    In **Development** stage, you can choose the step type as **Snapshot**, **Checkstyle**, **Test** and **Script**.

    In the stages of **Test**, **Stage** and **Production**, you can choose the step type as **Deployment**, **Test** and **Script**.

    In **Utility** stage, you can only choose the step type as **Script**.

 4. Click ![][pipeline_add_stage] icon to add more stages, here's a typical stage's look.

    ![][pipeline_stages]

    For the first stage, it's not allowed to chenge the sequence. However, you can adjust other stages' sequence by dragging and dropping.


### Create a pipeline from template

1. Click **Create Pipeline** button in pipeline page.

   ![][pipeline_create]

2. Click ![][pipeline_import_stage] icon to create a pipeline from a template.

3. There are five build-in templates, you could choose one from the dropdown list.
    ![][pipeline_create]

4. Input the missing value labeled by  ![][pipeline_missing_value].

### Edit a pipeline

1. In the pipeline list page, click ![][pipeline_edit_icon] button.

    ![][pipeline_build]

2. Update pipeline form according to the table shown in creation session.

### Delete a pipeline

In the pipeline list page, click ![][pipeline_delete_icon] button.

### Run a pipeline

1. You have two ways to run the pipeline. Firstly, click **Run** button at the top right corner of the pipeline section. Secondly, enter the pipeline dashboard page, click **Build** button.

    ![][pipeline_dashboard]

    In the statistics section, you could view each build step avg time and ratio of the pipeline completed builds.

    ![][pipeline_build_statistic]

    When you run the build, the pipeline build history section will appear with building status for each stage. You could see the build status, running step or failed step of each build.

    ![][pipeline_build_view]   

    Click the ![][pipeline_build_log_icon] at the ending of each row, you will see the build logs in popup dialog.

2. When the pipeline build is over, the summary information will be appeared in pipeline dashboard. The failed step will not be running and won't have any report. You can click the **build name** link to see the whole report. [Details of the report]


### Perform deployment from BPM PC server to PC server

**Note:**

IDA only support to deploy applications from BPM PC server to PC server between same version.

1. Click **Create Pipeline** button in pipeline page.

   ![][p2p_create-pipeline]
   
 2. Click ![][pipeline_add_stage] icon to add 'Stage1' and select "Deployment" type.

    ![][p2p_stage_1]

 3. Click ![][pipeline_add_stage] icon below the stage step to add 'takeSnapshot' step in the stage.

    ![][p2p_takeSnapshot]

 4. Click ![][pipeline_add_stage] icon to add 'Stage2' and select "Deployment" type, you could select another BPM PC server with same version of 'Stage1'.

    ![][p2p_stage2]

 5. Click ![][pipeline_add_stage] icon below the stage step to add 'Deploy' step in the stage and select 'Deployment' type.

    ![][p2p_deployment]

 6. Click "Save" button and then you could use the pipeline to make a deployment from PC server to PC server.


  [pipeline_create]: ../images/pipeline/pipeline_create.png
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
  [Details of the report]: ../pipeline/pipeline-report.html
  [pipeline_build_log_icon]: ../images/pipeline/pipeline_build_log_icon.png
  [pipeline_build_statistic]: ../images/pipeline/pipeline_build_statistic.png
  [p2p_create-pipeline]: ../images/pipeline/p2p_create-pipeline.png
  [p2p_stage_1]: ../images/pipeline/p2p_stage_1.png
  [p2p_takeSnapshot]: ../images/pipeline/p2p_takeSnapshot.png
  [p2p_stage2]: ../images/pipeline/p2p_stage2.png
  [p2p_deployment]: ../images/pipeline/p2p_deployment.png
