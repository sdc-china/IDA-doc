---
layout: page
title: "PC to PS pipeline configuration"
category: pipeline
date: 2018-01-05 15:17:55
order: 1
---

Keter pipeline allow you deploy your snapshot from PC to PS.So testers can easily automate their test case projects on ps side to do the testing.

### Create SSH Key

1. Login into the keter server.The first step is to create the key pair on the Keter machine. 

   ```  
    $ssh-keygen -t rsa

   ```   
  
2. Accect the default setting you can see below output.

   ![][pipeline_sshkey]
 
   The public key is now located in /root/.ssh/id_rsa.pub. The private key (identification) is now located in  /root/.ssh/id_rsa.


3. Copy the public key to the PC Server and PS.You can copy the public key into the new machine's authorized_keys file with the ssh-copy-id command. Make sure to replace the  username and IP address below.

   ```  
    $ssh-copy-id root@your pc/ps server ip    

   ```  

4. Use cat ~/.ssh/id_rsa to print your private key.Copythis key content into your BPM PC ans PS configuration settings.Also you need to fill the  WAS admin command path.
 
     ![][pipeline_bpmconfiguration]





[pipeline_sshkey]: ../images/pipeline/pipeline_sshkey.png
[pipeline_bpmconfiguration]: ../images/pipeline/pipeline_bpmconfiguration.png
