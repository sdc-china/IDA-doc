---
layout: page
title: "Deploy snapshot from PC to PS"
category: pipeline
date: 2018-01-05 15:17:55
order: 1
---

Keter pipeline allow you deploy your snapshot from PC to PS.Testers can easily test projects on PS side.Here we assume bpm server ip is 
192.168.0.10

### Create SSH Key

1. Login into the keter server and create the key pair on the Keter machine. 

    ```  
     $ssh-keygen -t rsa

    ```  
  
2. After key generation process, you can see below output.

   ![][pipeline_sshkey]
 
   The public key is now located in /root/.ssh/id_rsa.pub. The private key (identification) is now located in  /root/.ssh/id_rsa.


3. Copy the public key to the PC Server and PS Server. Copy id_rsa.pub file to BPM Server (PC/PS) /tmp folder,and execute below command.

    
   ```  
   cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys   

   ```
   ** Notes:
   
   ** The linux operator user should can execute “wsadmin.sh”.


4. Use cat ~/.ssh/id_rsa to print your private key.Copythis key content into your BPM PC ans PS configuration settings.Also you need to fill the  WAS admin command path.
 
    ![][pipeline_bpmconfiguration]

5. In PS Server configuraion, you need to fill the connect server name.

     ![][pipeline_servername]
     
### Vertify SSH Key

1. If you are in linux env, you can use below command to vertify the connection.Pls replace your ip address instead.

    ```  
   copy the id_rsa to /tmp folder.
   chmod 600 /tmp/id_rsa
   ssh -i /tmp/id_rsa root@192.168.0.10
   ```
2. If you are in windows env,you can use putty tools to vertify it.

   Putty: https://the.earth.li/~sgtatham/putty/latest/w32/putty.exe   
   Puttygen: https://the.earth.li/~sgtatham/putty/latest/w32/puttygen.exe    

   a. Open puttygen.exe
   b. Open Conversions -> Import Key

     ![][puttyKeyGen]   
   c. Select id_rsa file

     ![][PrivateKeyGen]   
   
   d. Click Save private key button, save as keter.ppk .   
   e. Open putty.exe, For example enter PC IP address 192.168.0.10     

     ![][putty]     
   f. Select category: Connection -> SSH -> Auth, and set the private key file, then click Open button.   

     ![][puttyAuth]
   
   g. You can find you can use ssh to login into that server,
     
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
[puttyKeyGen]: ../images/pipeline/PuttyKeyGen.png
[PrivateKeyGen]: ../images/pipeline/privateKey.png
[putty]: ../images/pipeline/putty.png
[puttyAuth]: ../images/pipeline/puttyAuth.png
