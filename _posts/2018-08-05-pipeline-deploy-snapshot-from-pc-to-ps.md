---
title: "Deploy Snapshot from PC to PS"
category: pipeline
date: 2018-08-05 15:17:55
last_modified_at: 2019-07-29 15:52:00
---

# Deploy Snapshot from PC to PS
***

IDA pipeline allows you to deploy your snapshot from PC to PS, either through online or offline deployment. Testers can easily test projects on PS side. To deploy snapshot from PC to PS by IDA, there are some configurations needed. In below instruction, we assume the Workflow Process Center IP is 192.168.0.10.

## Configure SSH Key
 
### Create SSH Key

1. Login into the IDA server and create the key pair in IDA server.

    ```  
     $ssh-keygen -m PEM -t rsa

    ```  

2. After key generation process, you can see below output.

   ![][pipeline_sshkey]

   The public key is now located in /root/.ssh/id_rsa.pub. The private key (identification) is now located in  /root/.ssh/id_rsa.


3. Add the public key to the BAW Server's authorized_keys.


   ```  
   cat /root/.ssh/id_rsa.pub | ssh root@BAW_HOST "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"

   ```
  **Notes:**

   **The Linux operator user should have the permission to run "wsadmin.sh"**


4. Use cat ~/.ssh/id_rsa to print your private key. Copy this key content to your Workflow PC and PS configuration in IDA. Also you need to fill the  WAS admin command path.

    ![][pipeline_bpmconfiguration]

5. For connected process server, please also fill the connected PS server.

     ![][pipeline_servername]

### Verify SSH Key

1. If you are in Linux environment, you can use below command to vertify the connection. Please replace your IP address accordingly.

    ```     
   ssh -i /root/.ssh/id_rsa root@BAW_SERVER
   ```
2. If you are in Windows environment, you can use Putty tool to vertify it.

   Putty: https://the.earth.li/~sgtatham/putty/latest/w32/putty.exe   
   Puttygen: https://the.earth.li/~sgtatham/putty/latest/w32/puttygen.exe    

   a. Open puttygen.exe

   b. Open Conversions -> Import Key

     ![][puttyKeyGen]   
   c. Select id_rsa file

     ![][PrivateKeyGen]   

   d. Click Save private key button, save as IDA.ppk .   
   e. Open putty.exe, For example enter PC IP address 192.168.0.10     

     ![][putty]     
   f. Select category: Connection -> SSH -> Auth, and set the private key file, then click Open button.   

     ![][puttyAuth]

   g. You can find you can use ssh to login into that server.

## Define pipeline from PC to PS through online deployment

1. Define the pipeline for deployment snapshot from PC to an online PS.

   ![][pipeline_pstops]

2. For the Deloyment step, you need to select **Online Install** for it.

   ![][pipeline_online_deploy]{:width="60%"}

3. Run the pipeline, you will be prompted with a popup window to provide the snapshot acronym, which is a optional field. If the snapshot acronym is empty, the snapshot created in DEV (PC) stage will be installed to online PS. If the snapshot acronym is provided, it means the existing snapshot in DEV (PC) will be located by snapshot acronym and installed to online PS.

   ![][pipeline_run_online_deploy]{:width="60%"}

4. After the pipeline is started, then you can check the pipeline build status. If sucessful, it means the snapshot is deployed from PC to online PS.

   ![][pipeline_pcdeployps]

## Define pipeline from PC to PS through offline deployment

1. Define the pipeline for deployment snapshot from PC to an offline PS.

   ![][pipeline_pc_to_ps_offline]

2. For the Deloyment step, you need to select **Offline Install** for it.

   ![][pipeline_offline_deploy]{:width="60%"}

   The fields to create a step is explained as below.

     |Label                  | Description
     |---------------------- |-------------
     |Deploy From Local File System Of Process Server                   | Jump over the export step and use the package in PS server directly
     
3. Run the pipeline, you will be prompted with a popup window to provide the snapshot acronym, which is a optional field. If the snapshot acronym is empty, the snapshot created in DEV (PC) stage will be installed to offline PS. If the snapshot acronym is provided, it means the existing snapshot in DEV (PC) will be located by snapshot acronym and installed to offline PS.

   ![][pipeline_run_online_deploy]

4. After the pipeline is started, then you can check the pipeline build status. If sucessful, it means the snapshot is deployed from PC to offline PS.

    ![][pipeline_pcdeployps_offline]
 
## Case project configuration after the first deployment in the PS

More information please reference the [Configuring the target environment after solution deployment](https://www.ibm.com/support/knowledgecenter/SS8JB4_19.x/com.ibm.casemgmt.design.doc/acmdc054.html)

### Manage Roles

1. Log in to **Case Client** Console: https://[Server URL]:[Port]/navigator/?desktop=baw

2. From the list of available solutions, expand your solution, and click **Manage Roles**.

   ![][case_manager_roles_warning]{:height="90%" width="90%"}
   ![][case_manager_roles]{:height="90%" width="90%"}

### Security Configuration

If you are using a case project and deploying for the first time, the following prompt message may appears when add a new case in the PS environment：
 
  ![][case_insufficient_message]{:height="60%" width="60%"}
  
You need to configure **Security Configuration** in your PS environment.

1. Login to the **Case administration** Console: https://[Server URL]:[Port]/navigator/?desktop=bawadmin

2. Open the project you want to configure in the Design Object Store, click **Action** -> **Manage** -> **Security Configuration**

   ![][case_administration_security_configuration]{:height="90%" width="90%"}
  
3. You can import the **Security Configuration** which exported from the PC server, or create a new **Security Configuration**.

   ![][case_security_configuration_add]{:height="90%" width="90%"}
  
  
4. Configure/Modify the role permissions.

   ![][case_security_configuration_role]{:height="90%" width="90%"}
  
5. Associate users and groups with roles.
  
   ![][case_security_configuration_users]{:height="90%" width="90%"}
   
   **Notes：After this step is executed, you don’t need to configure Manager Roles, but after the Manager Roles are configured, this step still needs to be configured.**
  
6. Save and Apply this configuration. 

7. Deploy **Security Configuration** to Target Object Store.

   ![][case_ps_deploy]{:height="90%" width="90%"}
 
## Known Limitions     

 IDA machine, PC Server, PS server should be Linux server.  

[pipeline_sshkey]: ../images/pipeline/pipeline_sshkey.png
[pipeline_bpmconfiguration]: ../images/pipeline/pipeline_bpmconfiguration.png
[pipeline_pstops]: ../images/pipeline/pipeline_pctops.png
[pipeline_pcdeployps]: ../images/pipeline/pipeline_pcdeployps.png
[pipeline_servername]: ../images/pipeline/pipeline_serverName.png
[puttyKeyGen]: ../images/pipeline/PuttyKeyGen.png
[PrivateKeyGen]: ../images/pipeline/privateKey.png
[putty]: ../images/pipeline/putty.png
[puttyAuth]: ../images/pipeline/puttyAuth.png
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
