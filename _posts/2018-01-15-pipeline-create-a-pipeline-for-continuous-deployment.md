---
layout: page
title: "Create a pipeline for continuous deployment"
category: pipeline
date: 2018-01-05 15:17:55
order: 1
---

### Create a pipeline

1. Click **Create Pipeline** button in pipeline page. 

   ![][pipeline_create]
  
2. Fill pipeline configurable parameters values according to following table.

     |Parameter              | Description
     |---------------------- |-------------
     |Process Center         | Process center server environment
     |Description            | The description of pipeline
     |Process App            | Process apps of the selected server
     |QA Process Server      | The server environment of QA process
     |Branch                 | The branch of selected process app
     |Staging Process Server | The server environment of staging process 
     |Schedule               | The crob job time setting
     |Stage Configuration    | Constituent steps of pipeline flow check  
     
 3. Select steps for pipeline flow.
 
    In **Dev**, you can select **Unit**, **Snapshot** and **checkstyle**.
    
    In **QA** and **Staging**, you can choose **Deployment** and **Functional Test**. However, you must fill the **QA Process Server** or **Staging Process Server** filed and check the **Snapshot** before. 
    
    In **Post Actions**, you can decide whether to make an email notification if pipeline build fail.
    
    If you check all, the pipe flow will be as follows.
    
    ![][pipeline_pipeline_flow]
    
 4. Do steps configuration.
 
    ![][pipeline_steps_configuration]
    
    In the **Unit Test**, **Functional Test(QA)**, and **Functional Test(Staging)** tab, choose the test project.
    
    In the **Snapshot** tab, select the snapshot for functional test.
    
    In the **Checkstyle** tab, include **Ignore Empty Documentation** and **Ignore JS Coding Style Check**. If check, it will ignore empty document or JS coding style when perform checkstyle in building pipeline.
    
    In the **Email** tab, enter your email address for failure notification.
    
    
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

    When you hover on **enlargement** icon of build step, you will see the build step details. It will include build time, duration etc information. 

   ![][pipeline_step]

2. When the pipeline build is over, the summary information will appear in pipeline dashboard. The step which is failed will not run and there is not report. You can click the **build no** link to see the whole report. [Details of the report] 

  
  [pipeline_create]: ../images/pipeline/pipeline_create.png
  [pipeline_pipeline_flow]: ../images/pipeline/pipeline_pipeline_flow.png
  [pipeline_steps_configuration]: ../images/pipeline/pipeline_steps_configuration.png
  [pipeline_edit_icon]: ../images/test/test_project_edit_button.PNG
  [pipeline_build]: ../images/pipeline/pipeline_build.png
  [pipeline_delete_icon]: ../images/test/test_project_delete_button.PNG
  [pipeline_dashboard]: ../images/pipeline/pipeline_dashboard.PNG
  [pipeline_step]: ../images/pipeline/pipeline_stepdetail.png
  [pipeline_build_view]: ../images/pipeline/pipeline_build_view.PNG
  [Details of the report]: ../pipeline/pipeline-report.html


