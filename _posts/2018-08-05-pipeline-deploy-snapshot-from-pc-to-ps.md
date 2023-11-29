---
title: "Deploy Snapshot from Workflow Center to Workflow Server"
category: pipeline
date: 2018-08-05 15:17:55
last_modified_at: 2023-06-09 17:31:00
---

# Deploy Snapshot from Workflow Center to Workflow Server
***

IDA pipeline allows you to deploy your snapshot from Workflow Center to Workflow Server, either through online or offline deployment.

## Define pipeline from Workflow Center to Workflow Server through online deployment

1. Define the pipeline for deployment snapshot from Workflow Center to an online Workflow Server.

   ![][pipeline_pstops]

2. For the Deloyment step, you need to select **Online Install** for it.

   ![][pipeline_online_deploy]{:width="60%"}

3. Run the pipeline, you will be prompted with a popup window to provide the snapshot acronym, which is a optional field. If the snapshot acronym is empty, the snapshot created in DEV (Workflow Center) stage will be installed to online Workflow Server. If the snapshot acronym is provided, it means the existing snapshot in DEV (Workflow Center) will be located by snapshot acronym and installed to online Workflow Server.

   ![][pipeline_run_online_deploy]{:width="60%"}

4. After the pipeline is started, then you can check the pipeline build status. If sucessful, it means the snapshot is deployed from Workflow Center to online Workflow Server.

   ![][pipeline_pcdeployps]

## Define pipeline from Workflow Center to Workflow Server through offline deployment

1. Define the pipeline for deployment snapshot from Workflow Center to an offline Workflow Server.

   ![][pipeline_pc_to_ps_offline]

2. For the Deloyment step, you need to select **Offline Install** for it.

   ![][pipeline_offline_deploy]{:width="60%"}

   The fields to create a step is explained as below.

     |Label                  | Description
     |---------------------- |-------------
     |Deploy From Local File System Of Process Server                   | Jump over the export step and use the package in Workflow Server server directly
     |Clean Old Snapshots | Clean the old snapshots without any running instances or completed tasks referenced by running instances, and the completed instances in the snapshots will be deleted as well.   
     
3. Run the pipeline, you will be prompted with a popup window to provide the snapshot acronym, which is a optional field. If the snapshot acronym is empty, the snapshot created in DEV (Workflow Center) stage will be installed to offline Workflow Server. If the snapshot acronym is provided, it means the existing snapshot in DEV (Workflow Center) will be located by snapshot acronym and installed to offline Workflow Server.

   ![][pipeline_run_online_deploy]

4. After the pipeline is started, then you can check the pipeline build status. If sucessful, it means the snapshot is deployed from Workflow Center to offline Workflow Server.

    ![][pipeline_pcdeployps_offline]
 
[pipeline_pstops]: ../images/pipeline/pipeline_pctops.png
[pipeline_pcdeployps]: ../images/pipeline/pipeline_pcdeployps.png
[pipeline_online_deploy]: ../images/pipeline/pipeline_online_deployment.png
[pipeline_offline_deploy]: ../images/pipeline/pipeline_offline_deployment.png
[pipeline_run_online_deploy]: ../images/pipeline/pipeline_run_online_deploy.png
[pipeline_run_offline_deploy]: ../images/pipeline/pipeline_run_offline_deploy.png
[pipeline_pc_to_ps_offline]: ../images/pipeline/pipeline_pc_to_ps_offline.png
[pipeline_pcdeployps_offline]: ../images/pipeline/pipeline_pcdeployps_offline.png
