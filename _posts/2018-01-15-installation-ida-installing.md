---
layout: page
title: "Installing IDA Application"
category: installation
date: 2018-01-05 15:17:55
order: 4
---
# Installing IDA Application components
There are three components for IDA application we need install and configure, included (1) *IDA web application*, (2) *IDA Browser Plugin* and (3) *IDA BPM toolkit*.


# Step 1: Installing IDA web application

## Installing on Liberty


**Create a Liberty server manually** 

You can create a server from the command line.

* Unzip the liberty installation package.Open a command line, then change directory to the wlp/bin directory.
Where path_to_liberty is the location you installed Liberty on your operating system.  

``` 
cd path_to_liberty/wlp/bin
``` 

* Run the following command to create a server. If you do not specify a server name, defaultServer is used.
Where server_name is the name you want to give your server.  

*Windows*

``` 
server create server_name  
``` 
*Linux*

``` 
./server create server_name  
``` 
server_name must use only Unicode alphanumeric (for example, 0-9, a-z, A-Z), underscore (_), dash (-), plus (+), and period (.) characters. The name cannot begin with a dash or period. Your file system, operating system, or compressed file directory might impose more restrictions.

If the server is created successfully, you receive message: Server server_name created.
	
**Configure WAS Liberty**  

* Edit **server.xml** from *wlp/usr/servers/servername* folder.  Please ensure both **httpPort** and **httpsPort** are unique and not same with BPM server port.If found port conflict，pls change the  **httpPort** and **httpsPort** address.  

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
	<application type="war" id="ida" name="ida" location="${server.config.dir}/apps/ida-web.war">
		<classloader delegation="parentLast" />
    </application>
	
	<keyStore id="defaultKeyStore" password="idaAdmin" />

```  
    

* Copy **IDA-web.war** application into the /usr/servers/*yourservername*/apps directory.

* Start Liberty server and visit the url like http://serverip:port/ida (port is defined in the server.xml).

For example:  
In Liberty installation bin folder you can use below command to start the server.
**server start default** (default is your server name).

**Support http proxy(optional)**   
We might need proxy server to visit the application,the proxy settings can be passd to the runtime via the JAVA_OPTS environment variable.See below procedure.  

* Create a text file named jvm.options.Put it under path_to_liberty/wlp/usr/servers/*yourservername* directory.      
* Add following lines based on your acutal proxy setting. You can change https to http as well.    
-Dhttps.proxyHost=host     
-Dhttps.proxyPort=port     
-Dhttps=proxyUser=user     
-Dhttps.proxyPassword=password    

[1]: ../installation/installation-integrate-def.html

 with remote testing automation framework based on Selenium Grid.

##### Notes

Below is the reference link for how to setup selenium grid.It includes the detail parameter setting explanation.   
- [Selenium Grid Setup Guidance](https://github.com/SeleniumHQ/selenium/wiki/Grid2)  




# Step 2: Installing IDA bBPM Toolkit
The testing capability can only start exposed Business Process, Human Services and AJAX Services.  If you wish to directly test other services such as system services, integration services or business processes which are not exposed then you need to install the IDA Toolkit.

1. Import the IDA_Toolkit - 8.6.0_v1.1.twx from IDA toolkit folder into the proces center.
2. Add the IDA toolkit as a this toolkit dependency for within your process application.
3. Right click the "IDA Utility" service flow and copy the item to your process app.  

   ![][toolkit]
4. Make sure the service is installed in your process app.  
   ![][service]
   
# Step 3: Installing IDA browser Plug-in

#### Chrome
- Open the url <a href="https://chrome.google.com/webstore/search/IDA%20IBM" target="_blank">https://chrome.google.com/webstore/search/IDA%20IBM</a>
- Click "Add to Chrome" button to install plug-in

#### Firefox
- Download firefox plugin [ida-1.25-fx.xpi](../plugins/ida-1.25-fx.xpi)
- Drag the "ida-1.25-fx.xpi" file into firefox window
- Click "Add" button

**Plug-in Configuration**

If you want to use the checkstyle and codereivew feature on web PD, then you need to set the IDA url and user credentials for the plug-in options. 
the IDA URL: https://9.30.255.220:9443/IDA   
the username: the IDA login username 
the password: the IDA login password.   

   ![][IDAOption]


[toolkit]: ../images/install/toolkit.png 
[service]: ../images/install/service.png 
[IDA]: ../images/install/IDA.png 
[firefox]: ../images/install/firefox.png
[seleniumGrid]: ../images/install/seleniumGrid.png
[webDriver]: ../images/install/webdriver.png
[IDAOption]: ../images/install/IDAOption.png

### Self-Signed SSL Certificates Installation

The IDA recorder plugin can't support website with self sign certification by default. In this case, a warning like this:
   
![][error]
   
   This warning will block the recording of test case. To resolve this problem, we need to make the browsers to accept self-signed certificate.    
   
#### FireFox - Add a Security Exception

1. In FireFox, go to Tools -> Options.

    ![][tool]

2. Click the **Privaty & Security** tab,  then the **View Certificates** button.

    ![][security_tab]
    
3. Go to the **Services** tab and press the **Add Exception** button.
    
    ![][servers_tab]
    
4.  Enter the host and port in **Add Security Exception** dialog, press  **Get Certificate** button, check the box near the bottom **Permanently store this exception** and press **Confirm Security Exception** .

     ![][add_security]
     
    From this point on, FireFox won't show SSL-related errors. when visiting the website, it will like this:
    
    ![][success]
    
#### Chrome - Visit in unsafe mode

Chrome browsers can save your data for a short time, and the warning page will not appear and block recording if you visit the testing website in unsafe mode before recording.

1. Click **ADVANCE** in warning page.

    ![][chrome_error]
    
2. Click **Proceed to 9.30.160.68(unsafe)**.

    ![][proceed]
     



   
   [error]: ../images/install/installation_self_signed_sertificates_error.png 
   [tool]: ../images/install/installation_self_signed_sertificates_tool.png 
   [security_tab]: ../images/install/installation_self_signed_sertificates_security_tab.png
   [servers_tab]: ../images/install/installation_self_signed_sertificates_servers_tab.png
   [add_security]: ../images/install/installation_self_signed_sertificates_add_security.png
   [success]: ../images/install/installation_self_signed_sertificates_success.png 
   [chrome_error]: ../images/install/installation_self_signed_sertificates_chrome_error.png
   [proceed]: ../images/install/installation_self_signed_sertificates_proceed.png
  




