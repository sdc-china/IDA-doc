---
title: "Installing IDA Application"
category: installation
date: 2018-09-21 15:17:55
last_modified_at: 2019-07-25 21:37:00
order: 4
---

# Installing IDA Application
***
## Installing IDA Application Components
There are three components for IDA application we need install and configure, included (1) *IDA web application*, (2) *IDA Browser Plugin* and (3) *IDA BPM toolkit*.


# Step 1: Installing IDA Web Application

IDA Web Application can be installed on WebSphere Application Server (WAS), liberty or Docker. First, let's introduce the way to install IDA on liberty.

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
        <feature>jdbc-4.2</feature>
        <feature>jndi-1.0</feature>
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
  <!-- JNDI data source confiduration -->
  <!-- Define a shared library pointing to the location of the JDBC driver JAR or compressed files. For example:  -->
  <library id="MySQLLib">
      <fileset dir="${shared.config.dir}/lib/global" includes="*.jar"/>
  </library> 
  <!-- Configure attributes for the data source, such as JDBC vendor properties and connection pooling properties. For example:  -->
  <dataSource jndiName="jdbc/mysql" statementCacheSize="60" id="mysql"
          isolationLevel="TRANSACTION_READ_COMMITTED" type="javax.sql.DataSource" transactional="true">
    <jdbcDriver libraryRef="MySQLLib"/>
    <properties databaseName="SAMPLEDB" 
                serverName="localhost" portNumber="3306" 
                user="user1" password="pwd1"/>
  </dataSource>
  

```  
    

* Copy **IDA-web.war** application into the /usr/servers/*yourservername*/apps directory.

* Start Liberty server and visit the url like http://serverip:port/ida (port is defined in the server.xml).

For example:  
In Liberty installation bin folder you can use below command to start the server.
**server start default** (default is your server name).

### Customizing the Liberty environment with jvm.optioins - optional
Customize JVM options by using jvm.options files.

* Create a text file named jvm.options. Copy it to path_to_liberty/wlp/usr/servers/*yourservername* directory.      

**Update heap size setting**

Add below to jvm.options. e.g set the maximum heap size to 1024m

* -Xmx1024m

If the heap size is not big enough, IDA checkstyle may crash with out-of-memory exception throwed, increase the heap size and restart server can fix this issue.

**Support http proxy**

We might need proxy server to visit the application,the proxy settings can be passd to the runtime via the JAVA_OPTS environment variable.
* Add following lines to jvm.options based on your acutal proxy setting. You can change https to http as well.    
-Dhttps.proxyHost=host     
-Dhttps.proxyPort=port     
-Dhttps=proxyUser=user     
-Dhttps.proxyPassword=your password  

[1]: ../installation/installation-integrate-def.html

 with remote testing automation framework based on Selenium Grid.

**Notes**

Below is the reference link for how to setup selenium grid.It includes the detail parameter setting explanation.   
- [Selenium Grid Setup Guidance](https://github.com/SeleniumHQ/selenium/wiki/Grid2)  

## Installing on WAS V9

**Check the WAS version** 

If the WAS version is **9.0** (not 9.0.0.7, 9.0.0.8, 9.0.0.9), it may occur some problems when install the IDA web application, so fisrtly, we should check the WAS version. 
1. Login the WAS console, in the **Welcome** part, you can see the version of WAS. 
![][wasversion]
2. If the WAS version is 9.0, you should install the Fix Packs, here are the available fix packs:
- [9.0.0.7: WebSphere Application Server traditional V9.0 Fix Pack 7](http://www-01.ibm.com/support/docview.wss?uid=swg24044620)
- [9.0.0.8: WebSphere Application Server traditional V9.0 Fix Pack 8](http://www-01.ibm.com/support/docview.wss?uid=swg24044965)

3. When finished the fix packs installation, the version will changed to 9.0.0.7, 9.0.0.8 or 9.0.0.9.

**Deploy a New Application on WAS**

After finishing the installation of the fix packs, the next step is to deploy the IDA war to WAS.

1. Login to the WebSphere Integrated Solutions Console as an administrator (URL: https://host:port/ibm/console/login.do?action=secure).

2. In left navigation bar, click the **New Application>>New Enterprise Application**.

   ![][wasappnew]

3. In the **Path to the new application** section, check the **Local file system** and select the ida-web.war in your local file system. When the war package is uploaded, click **Next** button.

   ![][wasselectapp]  

4. Choose the **Fast Path** option.  click **Next** button.

5. Now the current page is used to specify options for installing enterprise application and modules. In step 1, you can change the application name, click **Next** button after changing the application name. 

   ![][waschangeappname]

6. There is nothing to change in step 2 and step3. And step 4 is used to configure values for contexts root in web modules, we should set the **Context Root** as **/ida** as shown below.

   ![][wassetcontextroot]

7. There is nothing to change in step 5. In step 6, click **finish** button and wait for the server to complete the installation of IDA web application. When finished, click the **WebSphere enterprise application** in left navigation bar, you can see that the IDA web application is in Enterprise Applications table. 

   ![][wasapplist]

**Confige the Class Loader Order** 

1. Click the link of the **ida-web** in the table and go to the app confiugration page. 

2. Click the **Class loading and update detection** link as shown below.

   ![][wasclassloadlink]

3. Change the class loader order to **Classes loaded with local class loader first (parent last)**.

   ![][wasclassloadorder]

4. Then go back to the configuration page, and then click the **Manage Modules** link.

   ![][wasmanagemodules]

5. Click the link of **ida-web.war**, in the configuration page, change the class loader order to  **Classes loaded with local class loader first (parent last)**.

   ![][wasmoduleclassloadorder]

6. Save the changes and start the IDA web applicaiton. when the status of the IDA web applicaiton changes to **started**, you can visit the url like http://serverip:port/ida to access IDA web application.

   ![][wasstartapp]


## Deploy IDA on websphere v8.5.5.16 with was liberty profile

**Install websphere liberty and configure your applications**

1\. Download wlp-webProfile7-java8-linux-x86_64-19.0.0.2.zip from here:

https://ak-delivery04-mul.dhe.ibm.com/sar/CMA/WSA/084l4/0/wlp-webProfile7-java8-linux-x86_64-19.0.0.2.zip

2\. Unzip it and move wlp dir to /opt/ibm/bpm/
```
unzip wlp-webProfile7-java8-linux-x86_64-19.0.0.2.zip 
mv ./wlp /opt/ibm/bpm/
```

3\. Create a new liberty server, for example: was-liberty

```
cd /opt/ibm/bpm/wlp/bin
./server create was-liberty 
```

4\. Put the ida-web.war in the /opt/ibm/bpm/wlp/usr/servers/was-liberty/apps

5\. Edit the server.xml, please update the fields: host, httpPort and httpsPort, for example: 

```
<?xml version="1.0" encoding="UTF-8"?>
<server description="Default server">

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
                                  host="<YOUR_HOST_IP>"
                  httpPort="9680"
                  httpsPort="9643" />



    <!-- Automatically expand WAR files and EAR files -->
    <applicationManager autoExpand="true" startTimeout="360s" stopTimeout="120s"/>
        <application type="war" id="ida" name="ida" location="${server.config.dir}/apps/ida-web.war">
                <classloader delegation="parentLast" />
    </application>

        <keyStore id="defaultKeyStore" password="idaAdmin" />

</server>
```

**Create a Liberty profile server from websphere console page**

1\. Select "Server Types -> Liberty profile servers" from left menu.  

	![][create-server]  
2\. In the step 2, input the server name.

	![][create-server-2]  
3\. There is nothing to change in step 3, step 4 and step 5, then click finish button.  

4\. Click the "was-liberty" in the table, we need to make some configuration.

5\. In the Configuration tab, input your favourite http and https ports. Please make sure they are same with your server.xml.

	![][liberty-configure-1]  
6\. In the External Configuration tab, Select your configuration file from the dropdown. Click retrieve button to view file contents. Click apply button if you make some changes.  

	![][liberty-configure-2]  
7\. Back to Liberty profile servers page and select was-liberty, click Start button to run the server.  

	![][liberty-configure-3]
8\. You could visit the url like http://serverip:port/ida to access IDA web application.


## Installing on Docker platform
Refer to [IDA-ondocker](https://github.com/sdc-china/IDA-ondocker) for deployment steps.

# Step 2: Installing IDA BPM Toolkit
The testing capability can only launch the exposed Business Processes, Human Services and AJAX Services. If you wish to test other services such as system services, integration services or business processes which are not exposed directly, you need to install the IDA Toolkit.

1. Import **IDA_Toolkit - 8.6.0_v1.1.twx** which is below forder /toolkit of release package into your process center.

2. Open your process app by web process designer from process center.

3. Click **+** button after Toolkits.

	![][click_add_button]
	
4. Type **ida** in the search box and select **8.6.0 V1.1** below IDA Toolkit. Then the dependency **IDA Toolkit(8.6.0 v1.1)** is added. 

	![][ida_toolkit_search]
	
5. Click **Services** below **IDA Toolkit(8.6.0 v1.1)**. Right click the **IDA Utility** service flow and copy the item to your process app. 

	![][ida_toolkit_copy]
	
	![][ida_toolkit_copy_to_item]
	
6. If **IDA Utility** is in the Services of your Process appp, the service is installed successfully.

	![][service]

7. Modify toolkit access permission (Optional)

	For security concern, we suggest to disable the toolkit in BPM production environment. 
	It allows user to modify the toolkit access permission by setting up the environment variable "BPMTAT_ACCESS". (true means enable the access, false means disable the access)
	
	By default, the toolkit can only be invoked on Development and Test environment:
	    ![][default_toolkit_setting]
	
	You can define the same environment variable "BPMTAT_ACCESS" in your BPM application which will override the default setting in toolkit, for example:
	    ![][custom_toolkit_setting]




   
# Step 3: Installing IDA Browser Plug-in

### Chrome plugin
- Open the url <a href="https://chrome.google.com/webstore/search/IDA%20IBM" target="_blank">https://chrome.google.com/webstore/search/IDA%20IBM</a>
- Click "Add to Chrome" button to install plug-in

### Firefox plugin
- Download firefox plugin [ida-1.47-fx.xpi](https://github.com/sdc-china/IDA-plugin/raw/master/firefox/ida-1.47-fx.xpi)
- Drag the "ida-1.47-fx.xpi" file into firefox window
- Click "Add" button

**Plug-in Configuration**

If you want to use the checkstyle and codereivew feature on web PD, then you need to set the IDA url and user credentials for the plug-in options. 
the IDA URL: https://9.30.255.220:9443/IDA   
the username: the IDA login username 
the password: the IDA login password.   

   ![][IDAOption]

**Notes**

If you want to install chrome plug-in offline,you can use online https://chrome-extension-downloader.com/  tools,then enter the url
https://chrome.google.com/webstore/detail/ida/mjfjiglcnojlicbkomcoohndhpceflbp to download crx ,then install crx.  

[toolkit]: ../images/install/toolkit.png 
[default_toolkit_setting]: ../images/install/default_toolkit_setting.png  
[custom_toolkit_setting]: ../images/install/custom_toolkit_setting.png  
[service]: ../images/install/service.png 
[IDA]: ../images/install/IDA.png 
[firefox]: ../images/install/firefox.png
[seleniumGrid]: ../images/install/seleniumGrid.png
[webDriver]: ../images/install/webdriver.png
[IDAOption]: ../images/install/idaOption.png
[wasversion]: ../images/install/wasversion.png 
[wasappnew]: ../images/install/wasappnew.png 
[wasselectapp]: ../images/install/wasselectapp.png 
[waschangeappname]: ../images/install/waschangeappname.png 
[wassetcontextroot]: ../images/install/wassetcontextroot.png 
[wasapplist]: ../images/install/wasapplist.png 
[wasclassloadlink]: ../images/install/wasclassloadlink.png 
[wasclassloadorder]: ../images/install/wasclassloadorder.png 
[wasmanagemodules]: ../images/install/wasmanagemodules.png 
[wasmoduleclassloadorder]: ../images/install/wasmoduleclassloadorder.png 
[wasstartapp]: ../images/install/wasstartapp.png 
[create-server]: ../images/install/create-server.png 
[create-server-2]: ../images/install/create-server-2.png 
[liberty-configure-1]: ../images/install/liberty-configure-1.png 
[liberty-configure-2]: ../images/install/liberty-configure-2.png 
[liberty-configure-3]: ../images/install/liberty-configure-3.png 

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
   [click_add_button]: ../images/install/click_add_button.PNG
   [ida_toolkit_search]: ../images/install/ida_toolkit_search.PNG
   [ida_toolkit_copy]: ../images/install/ida_toolkit_copy.png
   [ida_toolkit_copy_to_item]: ../images/install/ida_toolkit_copy_to_item.png
  




