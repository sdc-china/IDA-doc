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
 

## Case project configuration for the first deployment

### Case Object Store configuration

Before deploying using IDA, please make sure you have configured Case Object Store on Workflow Center and Workflow Server in IDA BAW Configuration.

please reference the [Add Case Object Store configuration to a BAW server](https://sdc-china.github.io/IDA-doc/administration/administration-baw-configuration.html#add-case-object-store-configuration-to-a-baw-server)

### Manage Roles

If you are using a case project and deploying for the first time, you need to manager roles for the case project.

1. Log in to **Case Client** Console: https://[Server URL]:[Port]/navigator/?desktop=baw

2. From the list of available solutions, expand your solution, and click **Manage Roles**.

   ![][case_manager_roles_warning]{:height="90%" width="90%"}
   ![][case_manager_roles]{:height="90%" width="90%"}

### Security Configuration

If you are using a case project and deploying for the first time, the following prompt message may appears when add a new case in the Workflow Server environment：
 
  ![][case_insufficient_message]{:height="60%" width="60%"}
  
You need to configure **Security Configuration** in your Workflow Server environment.

1. Login to the **Case administration** Console: https://[Server URL]:[Port]/navigator/?desktop=bawadmin

2. Open the project you want to configure in the Design Object Store, click **Action** -> **Manage** -> **Security Configuration**

   ![][case_administration_security_configuration]{:height="90%" width="90%"}
  
3. You can import the **Security Configuration** which exported from the Workflow Center server, or create a new **Security Configuration**.

   ![][case_security_configuration_add]{:height="90%" width="90%"}
  
  
4. Configure/Modify the role permissions.

   ![][case_security_configuration_role]{:height="90%" width="90%"}
  
5. Associate users and groups with roles.
  
   ![][case_security_configuration_users]{:height="90%" width="90%"}
   
   **Notes：After this step is executed, you don’t need to configure Manager Roles, but after the Manager Roles are configured, this step still needs to be configured.**
  
6. Save and Apply this configuration. 

7. Deploy **Security Configuration** to Target Object Store.

   ![][case_ps_deploy]{:height="90%" width="90%"}
   
More information please reference the [Configuring the target environment after solution deployment](https://www.ibm.com/support/knowledgecenter/SS8JB4_19.x/com.ibm.casemgmt.design.doc/acmdc054.html)
 
## Known Limitions     

 IDA machine, Workflow Center Server, Workflow Server server should be Linux server.  

[pipeline_pstops]: ../images/pipeline/pipeline_pctops.png
[pipeline_pcdeployps]: ../images/pipeline/pipeline_pcdeployps.png
[pipeline_online_deploy]: ../images/pipeline/pipeline_online_deployment.png
[pipeline_offline_deploy]: ../images/pipeline/pipeline_offline_deployment.png
[pipeline_run_online_deploy]: ../images/pipeline/pipeline_run_online_deploy.png
[pipeline_run_offline_deploy]: ../images/pipeline/pipeline_run_offline_deploy.png
[pipeline_pc_to_ps_offline]: ../images/pipeline/pipeline_pc_to_ps_offline.png
[pipeline_pcdeployps_offline]: ../images/pipeline/pipeline_pcdeployps_offline.png
[case_insufficient_message]: ../images/pipeline/case_insufficient_message.png
[case_administration_security_configuration]: ../images/pipeline/case_administration_security_configuration.png
[case_security_configuration_add]: ../images/pipeline/case_security_configuration_add.png
[case_security_configuration_role]: ../images/pipeline/case_security_configuration_role.png
[case_security_configuration_users]: ../images/pipeline/case_security_configuration_users.png
[case_ps_deploy]: ../images/pipeline/case_ps_deploy.png
[case_manager_roles_warning]: ../images/pipeline/case_manager_roles_warning.png
[case_manager_roles]: ../images/pipeline/case_manager_roles.png
