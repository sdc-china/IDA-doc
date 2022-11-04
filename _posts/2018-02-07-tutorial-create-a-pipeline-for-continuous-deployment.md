---
title: "Task 4: Create a pipeline for continuous deployment"
category: tutorial
date: 2018-02-07 15:17:55
last_modified_at: 2019-07-26 16:14:00
order: 4
---

# Task 4: Create a pipeline for continuous deployment
***

IDA provides a build-in continuous  integration  and deployment  pipeline to orchestrate  testing, checkstyle,  snapshot  taking and deployment.
## About this task
  Before you start,make sure you have set up the test project. 
## Step 1: Create a pipeline

  We provide a web UI for users to  define the pipeline easily.
  
### Procedure

  1. Click **Create Pipeline** button in pipeline page. Fill in the pipeline name and choose the visibility.
  
     ![][pipeline_define]{:width="100%"}
     
  2. Click ![][pipeline_add_stage] button. Then fill in **Create Stage** form like the screenshot and **Submit**. Remember to select the first option under snapshot column as it's the latest snapshot.  

     ![][pipeline_create_stage]{:height="40%" width="40%"}
     
     More details of the parameters in the table, pls see **[Create a pipeline for continuous deployment][2]**.
  
  3. Click ![][pipeline_add_stage] button shown below. 
  
     ![][pipeline_add_step]{:height="20%" width="20%"}
     
     Fill in the form like below and **Submit**.
     
     ![][pipeline_create_test_step]{:height="40%" width="40%"}
 
  4. Repeat the step 3 to add **Snapshot** and **Checkstyle** step and fill out the forms according to the table below. The ![][pipeline_add_stage] button clicked is the one below the stage step.
  
     |    |Snapshot               | Checkstyle|
     |----|---------------------- |-------------|
     |Name |Snapshot               | Checkstyle|
     |Type |Snapshot               | Checkstyle|
     |Naming Pattern|{MAJOR_MINOR.PATCH}-{APP_ACRONYM}{TRACK}{yyyyMMddHHmmss}|N/A|
     |Health Score Threshold|N/A   |20|
     |Warnings Threshold|N/A|200|
     |Ignore Empty Documentation|N/A| Check|
     
     Finally, the stage will be like this.
     
     ![][pipeline_stages_tutorial]{:height="20%" width="20%"}
     
  5. Click **Save** button.

## Step 2: Run the pipeline

  Now you can run the pipeline.

### Procedure
 1. In the pipeline list page, click **Run** icon.  
  
     ![][pipeline_build]{:height="90%" width="90%"}

  2. When the pipeline build is over, click the pipeline build result link to see the whole report. 
     
     ![][pipeline_build_link]{:height="90%" width="90%"}

     The report is like this:

     ![][pipeline_report]{:height="90%" width="90%"}

     If you want know the details of the pipeline report, you can refer to this link. [Details of the report] .
  
  <!-- **[<Previous][1]** -->

[pipeline_define]: ../images/pipeline/pipeline_define.png
[pipeline_add_stage]: ../images/pipeline/pipeline_add_stage.png
[pipeline_create_stage]: ../images/pipeline/pipeline_create_stage.png
[pipeline_add_step]: ../images/pipeline/pipeline_add_step.png
[pipeline_create_test_step]: ../images/pipeline/pipeline_create_test_step.png
[pipeline_stages_tutorial]: ../images/pipeline/pipeline_stages_tutorial.png
[pipeline_add_step_below_test]: ../images/pipeline/pipeline_add_step_below_test.png
[pipeline_build]: ../images/pipeline/pipeline_build.png
[pipeline_report]: ../images/tutorial/tutorial_pipeline_result.png
[pipeline_build_link]: ../images/tutorial/tutorial_pipeline_build_link.png

[Details of the report]: ../pipeline/pipeline-report.html
[1]: ../tutorial/tutorial-set-up-checkstyle.html
[2]: ../pipeline/pipeline-create-a-pipeline-for-continuous-deployment.html
