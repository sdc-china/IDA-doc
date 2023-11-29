---
title: "SSH Configuration"
category: administration
date: 2018-08-05 15:17:55
last_modified_at: 2023-06-09 17:31:00
---

# SSH Configuration
***
For BAW server with version prior to v18.0.0.2, it needs to configure SSH key to establish the commuication between IDA and BAW server. 
So that IDA pipeline can deploy snapshot from Workflow Center to Workflow Server by wasadmin script.

## Create SSH Key

1. Login into the IDA server and create the key pair in IDA server.

    ```  
     ssh-keygen -m PEM -t rsa

    ```  

2. After key generation process, you can see below output.

   ![][pipeline_sshkey]

   The public key is now located in /root/.ssh/id_rsa.pub. The private key (identification) is now located in  /root/.ssh/id_rsa.


3. Add the public key to the both of the Workflow Center and Workflow Server's authorized_keys.


   ```  
   cat /root/.ssh/id_rsa.pub | ssh root@BAW_SERVER_HOST "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"

   ```
  **Notes:**

   **The Linux operator user should have the permission to run "wsadmin.sh"**


4. Use cat ~/.ssh/id_rsa to print your private key. Copy this key content to your BAW configuration in IDA. Also you need to fill the WAS admin command path.

    ![][pipeline_bpmconfiguration]

5. For connected process server, please also fill the connected Workflow Server server.

     ![][pipeline_servername]

## Verify SSH Key

1. If you are in Linux environment, you can use below command to vertify the connection.

    ```     
   ssh -i /root/.ssh/id_rsa root@BAW_SERVER_HOST
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
   e. Open putty.exe, For example enter BAW Server IP address 192.168.0.10     

     ![][putty]     
   f. Select category: Connection -> SSH -> Auth, and set the private key file, then click Open button.   

     ![][puttyAuth]

   g. You can find you can use ssh to login into that server.

## Known Limitions     

 IDA machine, Workflow Center Server, Workflow Server server should be Linux server.  

[pipeline_sshkey]: ../images/pipeline/pipeline_sshkey.png
[pipeline_bpmconfiguration]: ../images/pipeline/pipeline_bpmconfiguration.png
[pipeline_servername]: ../images/pipeline/pipeline_serverName.png
[puttyKeyGen]: ../images/pipeline/PuttyKeyGen.png
[PrivateKeyGen]: ../images/pipeline/privateKey.png
[putty]: ../images/pipeline/putty.png
[puttyAuth]: ../images/pipeline/puttyAuth.png
