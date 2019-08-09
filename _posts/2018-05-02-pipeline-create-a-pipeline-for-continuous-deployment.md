---
title: "Create a pipeline for continuous deployment"
category: pipeline
date: 2018-10-11 15:17:55
last_modified_at: 2019-07-29 15:51:00
order: 2
---

# Create a pipeline for continuous deployment
***
### Create a pipeline

1. Click **Create Pipeline** button in pipeline page.

   ![][pipeline_create]

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

    In **Development** type of stage, you can choose the step type as **Snapshot**, **Checkstyle**, **Test** and **Script**.

    In **Test**, **Stage** and **Production** type of stages, you can choose the step type as **Deployment**, **Test** and **Script**.

    In **Utility** type of stage, you can only choose the step type as **Script**.

 4. Click ![][pipeline_add_stage] icon to add more stages, a typical stage looks like below.

    ![][pipeline_stages]

    You can't change the sequence of the first stage, but you can adjust the other stages sequence by drag and drop.

    You can adjust the steps sequence in a stage by drag and drop.


### Edit a pipeline

1. In the pipeline list page, click ![][pipeline_edit_icon] button.

    ![][pipeline_build]

2. Update pipeline form according to the table showed in creating session.

### Delete a pipeline

In the pipeline list page, click ![][pipeline_delete_icon] button.

### Run a pipeline

1. You have two ways to run the pipeline. Firstly, click **Run** button at the top right corner of the pipeline section. Secondly, enter the pipeline dashboard page, click **Build now** button.

    ![][pipeline_dashboard]

    When you run the build, the pipeline build view will appear with every stage building status. Blue color means running, grey means waiting, green means success and red means failure.

   ![][pipeline_build_view]   

    Click the build time text in first block, you will see the build logs in popup dialog.

   ![][pipeline_build_logs]

    Click ![][pipeline_zoom_in] icon of the build step, you will see the build step details. It will include build time, duration etc information.

   ![][pipeline_step]

2. When the pipeline build is over, the summary information will appear in pipeline dashboard. The step which is failed will not run and there is not report. You can click the **build no** link to see the whole report. [Details of the report]


  [pipeline_create]: ../images/pipeline/pipeline_create.png
  [pipeline_add_stage]: ../images/pipeline/pipeline_add_stage.png
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
