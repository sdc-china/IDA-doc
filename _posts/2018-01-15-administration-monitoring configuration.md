---
layout: page
title: "Monitoring Configuration"
category: administration
date: 2018-01-05 15:17:55
order: 20
---

### About this task

In this task, you will integration BPM DEF with ActiveMQ embedded in IDA, so that IDA monitor can receive BPM performance data and present as chart to IDA users.

### Prerequisite
To integrate BPM DEF with with ActiveMQ embedded in IDA,  the version of IBM BPM should be **8.6 CF2017.12** or above.

### Integrate BPM with IDA

  1. Copy below three jar files from  IDA release  **lib** folder to **%BPM_HOME%/lib/ext** folder. 
  
     ![][op_def_mq_lib] 
  
  2. Access IBM BPM Websphere Application Server Administrative Console in web browse and navigate to **Resources -> JMS -> JMS providers**. 
  3. Click **New** button and enter *ActiveMQ* as **Name**, *org.apache.activemq.jndi.ActiveMQInitialContextFactory* as **External initial context factory**, and *tcp://mqhost:61616* as **External provider URL**.  
     
     Name             | Value       
     ----------------------|-------------------
     Name          |ActiveMQ
     External initial context factory	|org.apache.activemq.jndi.ActiveMQInitialContextFactory
     External provider URL           |tcp://mqhost:61616
   
     **Please replace mqhost with the actual IP address where IDA is deployed.**
  
       ![][op_def_mq_provider] 
  
  4. Click **Custom properties** in **Additional Properties** panel then click **New** button to add a new property *xa=true* as String type.
      
       ![][op_def_mq_provider_prop] 

  5. Click OK button to complete the JMS provider creation.
  6. Navigate to Resources -> JMS -> Queue Connection Factories and create a new one.
  
     Name             | Value       
     ----------------------|-------------------
     Provider		|ActiveMQ
     Name          |myQCF 
     JNDI Name	|jms/myQueueConnectionFactory
     External JNDI Name           |QueueConnectionFactory

       ![][op_def_queue_conn_factory] 
        
  7. Navigate to Resources -> JMS -> Queues and create a new one.
  
     Name             | Value       
     ----------------------|-------------------
     Provider		|ActiveMQ
     Name          |myQueue 
     JNDI Name	|queue/myQueue
     External JNDI Name           |dynamicQueues/myQueue

     ![][op_def_queue] 
	 
   8. In BPM server, from the *install_root/profiles/Dmgr01/bin* directory, run the following command.
   
     wsadmin -lang jython -f <Install_Root>/BPM/Lombardi/tools/def/SampleConfigureJSONEventsToJMS.py
	 
	 
   9. In BPM server, from the *install_root/profiles/Dmgr01/bin* directory, run the following command.
   
     wsadmin -lang jython -f <Install_Root>/BPM/Lombardi/tools/def/SampleReloadDEF.py
	 
	 
   10. After you run the sample script, a **defconfig.xml** file is created in the *dmgr_profile_home/config/cells/cellName* directory. Edit this file to update the value of *JMS_QUEUE_JNDI* to **queue/myQueue**, and the value of *JMS_QUEUE_CF_JNDI* to **jms/myQueueConnectionFactory**. Please note that the **jms/myQueueConnectionFactory** and **queue/myQueue** are the JDNI name created in step #6 and #7.
   
   
   11. In BPM WAS Administrative console, from System administration -> Nodes, select all nodes then click **Full Resynchronize** button to synchronize the changes to node profiles.
   
   
   12. Restart BPM.
   
  
[op_def_mq_lib]: ../images/operation/operation_def_mq_lib.PNG
[op_def_mq_provider]: ../images/operation/operation_def_mq_provider.PNG
[op_def_mq_provider_prop]: ../images/operation/operation_def_mq_provider_custom_prop.PNG
[op_def_queue_conn_factory]: ../images/operation/operation_def_queue_conn_factory.PNG
[op_def_queue]: ../images/operation/operation_def_queue.PNG
