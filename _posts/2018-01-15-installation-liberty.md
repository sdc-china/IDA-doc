---
layout: page
title: "Installing on WebSphere Liberty"
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
*  **server.context-path** : default as  "/keter"  
*  **server.full-context-path** :
    "https://keterServerip:port/keter", this should be the HTTPS URL for users to access Keter web application. Please update it with the actual Keter server ip, Keter server port and context URI.
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
*  **resPort** : rule execution server port  
*  **restUrl** : business rule service execution REST url  
*  **ruleExecutionMode**: rule execution mode, there are 2 choices: **0**  Ruleset executed using local rule engine; **2**  Ruleset executed by invoking REST rule service.

It is only needed when you want to have BPM Checkstyle feature. If you don't need it, you can leave them as-is.

Please note that to enable BPM Checkstyle feature, you need to have IBM ODM installed because the BPM Checkstyle feature is running against ODM rule engine. You need to locate the **jrules-engine.jar** in your ODM installation and copy it to **lib** folder, before executing **package.bat**.

**#monitoring.properties (For BPM Monitoring purpose)**
	
*  **event_type** : event types to be stored in Keter database  
*  **track_serviceflow** : default as true  

It is only needed when you want to configure monitoring[1] to have the monitoring feature. If you don't need it, you can leave them as-is.

When you finish updating the properties, run **package.bat** to update the Keter war (e,g, *keter-web.war*) file under **build** folder. You need to define the **JAVA_HOME** variable and add the **$JAVA_HOME/bin** directory to your path before executing **package.bat**.

**Create a Liberty server manually** 

You can create a server from the command line.

* Open a command line, then change directory to the wlp/bin directory.
Where path_to_liberty is the location you installed Liberty on your operating system.

``` 
cd path_to_liberty/wlp/bin
``` 
* Run the following command to create a server. If you do not specify a server name, defaultServer is used.
Where server_name is the name you want to give your server.

  Windows  
``` 
server create server_name  
``` 
  Linux  
``` 
./server create server_name  
``` 
server_name must use only Unicode alphanumeric (for example, 0-9, a-z, A-Z), underscore (_), dash (-), plus (+), and period (.) characters. The name cannot begin with a dash or period. Your file system, operating system, or compressed file directory might impose more restrictions.

If the server is created successfully, you receive message: Server server_name created.
	
**Configure WAS Liberty**  

* Edit **server.xml** from *wlp/usr/servers/servername* folder.  Please ensure both **httpPort** and **httpsPort** are unique.

```    
 <!-- Enable features -->
    <featureManager>
        <feature>servlet-3.1</feature>
		<feature>ssl-1.0</feature>
        <feature>websocket-1.1</feature>
    </featureManager>

    <!-- This template enables security. To get the full use of all the capabilities, a keystore and user registry are required. -->
    
    <!-- For the keystore, default keys are generated and stored in a keystore. To provide the keystore password, generate an 
         encoded password using bin/securityUtility encode and add it below in the password attribute of the keyStore element. 
         Then uncomment the keyStore element. -->
    <!--
    <keyStore password=""/> 
    -->
    <webContainer invokeFlushAfterService="false"/>
    
    <!--For a user registry configuration, configure your user registry. For example, configure a basic user registry using the
        basicRegistry element. Specify your own user name below in the name attribute of the user element. For the password, 
        generate an encoded password using bin/securityUtility encode and add it in the password attribute of the user element. 
        Then uncomment the user element. -->
    <basicRegistry id="basic" realm="BasicRealm"> 
        <!-- <user name="yourUserName" password="" />  --> 
    </basicRegistry>
    
    <!-- To access this server from a remote client add a host attribute to the following element, e.g. host="*" -->
    <httpEndpoint id="defaultHttpEndpoint"
				  host="*"
                  httpPort="9081"
                  httpsPort="9443" />
				  

                  
    <!-- Automatically expand WAR files and EAR files -->
    <applicationManager autoExpand="true" startTimeout="360s" stopTimeout="120s"/> 
	<application type="war" id="keter" name="keter" location="${server.config.dir}/apps/keter-web.war">
		<classloader delegation="parentLast" />
    </application>
	
	<keyStore id="defaultKeyStore" password="keterAdmin" />

```  
    

* Copy **keter-web.war** application into the /usr/servers/*yourservername*/apps directory.

* Start Liberty server and visit the url like http://serverip:port/keter (port is defined in the server.xml).

For example:  
In Liberty installation bin folder you can use below command to start the server
**server start default** (default is your server name).

[1]: ../installation/installation-integrate-def.html






