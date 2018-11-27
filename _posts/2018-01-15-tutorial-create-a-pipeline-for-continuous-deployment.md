---
layout: page
title: "Task 4: Create a pipeline for continuous deployment"
category: tutorial
date: 2018-01-05 15:17:55
order: 4
---

IDA provides a build-incontinuous  integration  and deployment  pipeline orchestrate  testing, checkstyle,  snapshot  taking and deployment.
### About this task
  Before you start,make sure you have set up the test project. 
### Step 1: Create a pipeline

  We provide a web UI for users to  define the pipeline easily.
  
#### Procedure

  1. Click **Create Pipeline** button in pipeline page. Fill the values like below. Check the **unit test**, **Snapshot**, **Checkstyle** for the dev env configuration.
  
     ![][pipeline_define]  
  
 2. Do steps configuration. 
   
     ![][pipeline_configuration]
 
    In the **Unit Test** tab, choose the **Hiring Sample** as your test project.
    
    In the **Snapshot** tab, choose the snapshot naming convention to "AppName_YYYYMMDD".
    
    In the **Checkstyle** tab, check the "Ignore Empty Documentation".
    
    In the **Email** tab, enter your email address for failure notification.

###  Step 2: Run the pipeline

  You can run the pipeline.

#### Procedure
 1. In the pipeline page, click **Run** icon at the top right corner of the pipeline section.  
  
     ![][pipeline_build] 
  
     When you run the build, the pipeline build view will appear with every stage building status. Blue color means running, grey means waiting, green means success and red means failure.
     
     ![][pipeline_flow]   

     When you hover on **enlargement** icon of build step, you will see the build step details. It will include build time, duration etc information. 

     ![][pipeline_step]

  2. When the pipeline build is over, click the **build no** link to see the whole report. [Details of the report] .
  
  **[<Previous][1]**

[pipeline_define]: ../images/pipeline/pipeline_define.png
[pipeline_configuration]: ../images/pipeline/pipeline_stepconfiguration.png
[pipeline_run]: ../images/pipeline/pipeline_build.png
[pipeline_build]: ../images/pipeline/pipeline_build.png
[pipeline_step]: ../images/pipeline/pipeline_stepdetail.png
[pipeline_flow]: ../images/pipeline/pipeline_flow.png
[Details of the report]: ../pipeline/pipeline-report.html
[1]: ../tutorial/tutorial-set-up-checkstyle.html
