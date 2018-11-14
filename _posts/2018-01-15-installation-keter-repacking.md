---
layout: page
title: "Repacking Keter Application"
category: installation
date: 2018-01-05 15:17:55
order: 3
---

   
### Properties Configuration


**Configure Keter properties** 
 
Edit [KETER_HOME]/conf/**keter.properties** under **conf** folder. This properties file contains three main sections.

**#application-prod.yml**   
*  **spring.datasource.username** : Database connection username  
*  **spring.datasource.password** : Database connection password  
*  **spring.datasource.url** : Database connection URL
*  **server.host** :  Keter server IP or host name
*  **server.context-path** : default as  "/keter"  
*  **http.port** : Liberty http port defined in the server.xml
*  **https.port** : Liberty https port defined in the server.xml
*  **engineConfig.dataDir** :  Temp folder to keep resouces like screenshot,checkstyle,twx etc
*  **smtp.host** ：SMTP host    
*  **smtp.port** ：SMTP port    
*  **email.from** ：Sender Email address 
*  **spring.activemq.broker-url** ：IP and Port of embedded ActiveMQ. It is only needed when you integrate Keter with BPM DEF[1] to have the monitoring feature. By default this property is commented out. You can leave it as-is if you don't need the monitoring feature. If you need it, you can uncomment it and replace the localhost with the actual IP address of the Keter deployment server.
*  **jasypt.encryptor.password** : default value password

**Notes** 
If you want to use encrypt database password in the **spring.datasource.password**.You need to generate the encrypt password.There are two ways to generate it.The secret key is define in the **jasypt.encryptor.password**.
You can use online web or tools to generated encrypted password.    
https://www.devglan.com/online-tools/jasypt-online-encryption-decryption    

![][onlineencrypt]

[onlineencrypt]: ../images/install/online.png

Also you can use offline tool from jasypt offical site to generate.
http://www.jasypt.org/download.html    

![][offlineencrypt]

[offlineencrypt]: ../images/install/offline.png

Once you get the encrypt password,you need to change spring.datasource.password like below format.As a general rule, jasypt expects encrypted configuration parameters to appear surrounded by "ENC(...)".    
spring.datasource.password: ENC(Yasd1hzrpo05EdNTzlifQ22+8LUNAgcT)     

 
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

**Notes** 

If you want to use DB2 as Keter database, you can uncomment DB2 property configuration and comment MySQL property configuration.

![][db2config]

[db2config]: ../images/install/db2configuration.png

#### Repacking keter-web with configuration

Once all the properties in [KETER_HOME]/conf/keter.properties file have been update you can then re-package the [KETER_HOME]/build/**keter-web.war** file.  

Before running the [KETER_HOME]/**package.bat** or [KETER_HOME]/**package.sh** you will need to set the environment variable for JAVA_HOME and ensure that [JAVA_HOME]/bin is included in the variable.  Once the environment variable is set and your path contains the [JAVA_HOME]/bin diectory you can then execute the package script.
