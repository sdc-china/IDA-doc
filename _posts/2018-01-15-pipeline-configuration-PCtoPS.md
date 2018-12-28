---
layout: page
title: "Deploy snapshot from PC to PS"
category: pipeline
date: 2018-01-05 15:17:55
order: 3
---

IDA pipeline allows you to deploy your snapshot from PC to PS, either through online or offline deployment. Testers can easily test projects on PS side. To deploy snapshot from PC to PS by IDA, there are some configurations needed. In below instruction, we assume the BPM server IP is 192.168.0.10.

### Create SSH Key

1. Login into the IDA server and create the key pair on the IDA machine. 

    ```  
     $ssh-keygen -t rsa

    ```  
  
2. After key generation process, you can see below output.

   ![][pipeline_sshkey]
 
   The public key is now located in /root/.ssh/id_rsa.pub. The private key (identification) is now located in  /root/.ssh/id_rsa.


3. Copy the public key to the PC Server and PS Server. Copy id_rsa.pub file to BPM Server (PC/PS) /tmp folder, and execute below command.

    
   ```  
   cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys   

   ```
   #### Notes:
   
   **The Linux operator user should can execute “wsadmin.sh”**


4. Use cat ~/.ssh/id_rsa to print your private key. Copy this key content into your BPM PC ans PS configuration settings. Also you need to fill the  WAS admin command path.
 
    ![][pipeline_bpmconfiguration]

5. In PS Server configuraion, you need to fill the connect server name.

     ![][pipeline_servername]
     
### Verify SSH Key

1. If you are in Linux environment, copy the id_rsa to BPM server /tmp folder. You can use below command to vertify the connection. Please replace your IP address accordingly.

    ```     
   chmod 600 /tmp/id_rsa
   ssh -i /tmp/id_rsa root@192.168.0.10
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
     
### Define pipeline from PC to PS through online deployment

1. Define the pipeline for deployment snapshot from PC to an online PS.

   ![][pipeline_pstops]
   
2. For the Deloyment step, you need to select **Online Install** for it.

   ![][pipeline_online_deploy]
   
3. Run the pipeline, you will be prompted with a popup window to provide the snapshot acronym, which is a optional field. If the snapshot acronym is empty, the snapshot created in DEV (PC) stage will be installed to online PS. If the snapshot acronym is provided, it means the existing snapshot in DEV (PC) will be located by snapshot acronym and installed to online PS.

   ![][pipeline_run_online_deploy]
     
4. After the pipeline is started, then you can check the pipeline build status. If sucessful, it means the snapshot is deployed from PC to online PS.

   ![][pipeline_pcdeployps]
   
### Define pipeline from PC to PS through offline deployment

1. Define the pipeline for deployment snapshot from PC to an offline PS.

   ![][pipeline_pc_to_ps_offline]
   
2. For the Deloyment step, you need to select **Offline Install** for it.

   ![][pipeline_offline_deploy]
   
3. Run the pipeline, you will be prompted with a popup window to provide the snapshot acronym, which is a optional field. If the snapshot acronym is empty, the snapshot created in DEV (PC) stage will be installed to offline PS. If the snapshot acronym is provided, it means the existing snapshot in DEV (PC) will be located by snapshot acronym and installed to offline PS.

   ![][pipeline_run_online_deploy]
     
4. After the pipeline is started, then you can check the pipeline build status. If sucessful, it means the snapshot is deployed from PC to offline PS.

   ![][pipeline_pcdeployps_offline]

 **Known Limitions:**     
     
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
