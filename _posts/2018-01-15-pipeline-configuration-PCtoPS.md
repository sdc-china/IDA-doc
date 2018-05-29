---
layout: page
title: "Deploy snapshot from PC to PS"
category: pipeline
date: 2018-01-05 15:17:55
order: 1
---

Keter pipeline allow you deploy your snapshot from PC to PS.Testers can easily test projects on PS side.

### Create SSH Key

1. Login into the keter server and create the key pair on the Keter machine. 

    ```  
     $ssh-keygen -t rsa

    ```  
  
2. After key generation process, you can see below output.

   ![][pipeline_sshkey]
 
   The public key is now located in /root/.ssh/id_rsa.pub. The private key (identification) is now located in  /root/.ssh/id_rsa.


3. Copy the public key to the PC Server and PS Server.You can copy the public key into PC&PS machine's authorized_keys file with the ssh-copy-id command. Make sure to replace the  username and IP address below.

   ```  
    $ssh-copy-id root@your pc/ps server ip    

   ```  

4. Use cat ~/.ssh/id_rsa to print your private key.Copythis key content into your BPM PC ans PS configuration settings.Also you need to fill the  WAS admin command path.
 
    ![][pipeline_bpmconfiguration]

5. In PS Server configuraion, you need to fill the connect server name.

     ![][pipeline_servername]
     
### Define pipeline from PC to PS

1. Define the pipeline for deployment snapshot from PC to PS.

   ![][pipeline_pstops]
   
2. Choose the snapshot naming convention then save the pipeline.

   ![][pipeline_snapshotnaming]
  
3. Run the pipeline,you can check the pipeline build status.If sucessful,it means the snapshot is deployed from PC to PS side.

   ![][pipeline_pcdeployps]

 **Known Limitions:**     
     
 Keter machine,PC Server,PS server should be linux server.  

[pipeline_sshkey]: ../images/pipeline/pipeline_sshkey.png
[pipeline_bpmconfiguration]: ../images/pipeline/pipeline_bpmconfiguration.png
[pipeline_pstops]: ../images/pipeline/pipeline_pctops.png
[pipeline_snapshotnaming]: ../images/pipeline/pipeline_snapshotnaming.png
[pipeline_pcdeployps]: ../images/pipeline/pipeline_pcdeployps.png
[pipeline_servername]: ../images/pipeline/pipeline_serverName.png
