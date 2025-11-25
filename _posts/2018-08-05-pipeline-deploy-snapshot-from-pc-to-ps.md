---
title: "Deploy Snapshot from Workflow Center to Workflow Server"
category: pipeline
date: 2018-08-05 15:17:55
last_modified_at: 2025-11-25 12:00:00
---

# Deploy Snapshot from Workflow Center to Workflow Server
***

IDA pipeline allows you to deploy your snapshot from Workflow Center to Workflow Server, either through online or offline deployment.

## Define pipeline from Workflow Center to Workflow Server through online deployment

1. Define the pipeline for deploying a snapshot from Workflow Center to an online Workflow Server.

   ![][pipeline_pstops]

2. For the Deployment step, you need to select **Online Install** for it.

   ![][pipeline_online_deploy]{:width="60%"}

3. Run the pipeline, and you will be prompted with a pop-up window to provide the snapshot acronym, which is an optional field. If the snapshot acronym is empty, the snapshot created in the DEV (Workflow Center) stage will be installed to the online Workflow Server. If the snapshot acronym is provided, it means the existing snapshot in the DEV (Workflow Center) will be located by the snapshot acronym and installed to the online Workflow Server.

   ![][pipeline_run_online_deploy]{:width="60%"}

4. After the pipeline is started, you can check the pipeline build status. If successful, it means the snapshot has been deployed from Workflow Center to the online Workflow Server.

## Define pipeline from Workflow Center to Workflow Server through offline deployment

1. Define the pipeline for deploying a snapshot from Workflow Center to an offline Workflow Server.

   ![][pipeline_pc_to_ps_offline]

2. For the Deployment step, you need to select **Offline Install** for it.

   ![][pipeline_offline_deploy]{:width="60%"}

   The fields to create a step are explained as below.

     |Label                  | Description
     |---------------------- |-------------
     |Deploy From Local File System Of Process Server                   | Jump over the export step and use the package in the Workflow Server server directly
     |Clean Old Snapshots | Clean the old snapshots without any running instances or completed tasks referenced by running instances, and the completed instances in the snapshots will be deleted as well.   
     
3. Run the pipeline, and you will be prompted with a pop-up window to provide the snapshot acronym, which is an optional field. If the snapshot acronym is empty, the snapshot created in the DEV (Workflow Center) stage will be installed to the offline Workflow Server. If the snapshot acronym is provided, it means the existing snapshot in the DEV (Workflow Center) will be located by the snapshot acronym and installed to the offline Workflow Server.

   ![][pipeline_run_online_deploy]

4. After the pipeline is started, you can check the pipeline build status. If successful, it means the snapshot has been deployed from Workflow Center to the offline Workflow Server.

 
[pipeline_pstops]: ../images/pipeline/pipeline_pctops.png
[pipeline_online_deploy]: ../images/pipeline/pipeline_online_deployment.png
[pipeline_offline_deploy]: ../images/pipeline/pipeline_offline_deployment.png
[pipeline_run_online_deploy]: ../images/pipeline/pipeline_run_online_deploy.png
[pipeline_run_offline_deploy]: ../images/pipeline/pipeline_run_offline_deploy.png
[pipeline_pc_to_ps_offline]: ../images/pipeline/pipeline_pc_to_ps_offline.png