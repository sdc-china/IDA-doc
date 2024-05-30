---
title: "SSH Configuration"
category: administration
date: 2018-10-03 15:18:55
last_modified_at: 2023-06-09 17:31:00
---

# SSH Configuration
***
For BAW server with version prior to v18.0.0.2, it needs to configure an SSH key to establish the communication between IDA and the BAW server, so that the IDA pipeline can deploy snapshots from Workflow Center to Workflow Server by wsadmin script.

## Create SSH Key

1. Log in to the IDA server and create the key pair on the IDA server.

    ```  
     ssh-keygen -m PEM -t rsa
    ```  

2. After the key generation process, you can see the following output.

   ![][pipeline_sshkey]

   The public key is now located in /root/.ssh/id_rsa.pub. The private key (identification) is now located in /root/.ssh/id_rsa.

3. Add the public key to the authorized_keys of both the Workflow Center and Workflow Server.

   ```  
   cat /root/.ssh/id_rsa.pub | ssh root@BAW_SERVER_HOST "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
   ```
  **Notes:**

   **The Linux operator user should have the permission to run "wsadmin.sh"**

4. Use `cat ~/.ssh/id_rsa` to print your private key. Copy this key content to your BAW configuration in IDA. Also, you need to fill in the WAS admin command path.

    ![][pipeline_bpmconfiguration]

5. For a connected process server, please also fill in the connected Workflow Server server.

     ![][pipeline_servername]

## Verify SSH Key

1. If you are in a Linux environment, you can use the following command to verify the connection.

    ```     
   ssh -i /root/.ssh/id_rsa root@BAW_SERVER_HOST
   ```
2. If you are in a Windows environment, you can use the PuTTY tool to verify it.

   PuTTY: https://the.earth.li/~sgtatham/putty/latest/w32/putty.exe   
   PuTTYgen: https://the.earth.li/~sgtatham/putty/latest/w32/puttygen.exe    

   a. Open puttygen.exe

   b. Open Conversions -> Import Key

     ![][puttyKeyGen]   
   c. Select the id_rsa file

     ![][PrivateKeyGen]   

   d. Click the Save private key button, save as IDA.ppk .   
   e. Open putty.exe, for example, enter the BAW Server IP address 192.168.0.10     

     ![][putty]     
   f. Select category: Connection -> SSH -> Auth, and set the private key file, then click the Open button.   

     ![][puttyAuth]

   g. You can find that you can use SSH to log in to that server.

## Known Limitations     

The IDA machine, Workflow Center Server, and Workflow Server server should be Linux servers.  

[pipeline_sshkey]: ../images/pipeline/pipeline_sshkey.png
[pipeline_bpmconfiguration]: ../images/pipeline/pipeline_bpmconfiguration.png
[pipeline_servername]: ../images/pipeline/pipeline_serverName.png
[puttyKeyGen]: ../images/pipeline/PuttyKeyGen.png
[PrivateKeyGen]: ../images/pipeline/privateKey.png
[putty]: ../images/pipeline/putty.png
[puttyAuth]: ../images/pipeline/puttyAuth.png