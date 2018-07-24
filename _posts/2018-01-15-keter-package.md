---
layout: page
title: "Update Deployment Configuration"
category: installation
date: 2018-01-05 15:17:55
order: 3
---

   
### Deployment


**Configure Keter parameters** 
 
Edit **keter.properties** under **conf** folder. This properties file contains three sections.

**#application-prod.yml**   
*  **spring.datasource.username** : MySQL username  
*  **spring.datasource.password** : MySQL password  
*  **spring.datasource.url** : MySQL database connection URL
*  **server.host** :  the Keter server ip or name
*  **server.context-path** : default as  "/keter"  
*  **http.port** : the liberty http port define in the server.xml,default 9080
*  **https.port** : the liberty https port define in the server.xml, default 9443
*  **engineConfig.screenshotDir** :  screenshot folder
*  **engineConfig.tempDir** :  temp folder for Keter internal use 
*  **smtp.host** ：your SMTP host    
*  **smtp.port** ：your SMTP port    
*  **email.from** ：sender Email address 
*  **spring.activemq.broker-url** ：the IP and Port of embedded ActiveMQ. It is only needed when you integrate Keter with BPM DEF[1] to have the monitoring feature. By default this property is commented out. You can leave it as-is if you don't need the monitoring feature. If you need it, you can uncomment it and replace the localhost with the actual IP address of the Keter deployment server.

 For the other properties, you can leave them as default values.
 
**#checkstyle.properties (For BPM Checkstyle purpose)**
	
*  **resUser** : rule execution server username  
*  **resPassword** : rule execution server password  
*  **resUrl** : rule execution server url  
*  **resPort** : rule execution server port 
*  **ruleExecutionMode**: rule execution mode, there are 2 choices: **0**  Ruleset executed using local rule engine; **2**  Ruleset executed by invoking REST rule service.

It is only needed when you want to have BPM Checkstyle feature. If you don't need it, you can leave them as-is.

Please note that to enable BPM Checkstyle feature, you need to have IBM ODM installed because the BPM Checkstyle feature is running against ODM rule engine. You need to locate the **jrules-engine.jar** in your ODM installation and copy it to **lib** folder, before executing **package.bat**.

**#monitoring.properties (For BPM Monitoring purpose)**
	
*  **event_type** : event types to be stored in Keter database  
*  **track_serviceflow** : default as true  

It is only needed when you want to configure monitoring[1] to have the monitoring feature. If you don't need it, you can leave them as-is.

When you finish updating the properties, run **package.bat** to update the Keter war (e,g, *keter-web.war*) file under **build** folder. You need to define the **JAVA_HOME** variable and add the **$JAVA_HOME/bin** directory to your path before executing **package.bat**.
