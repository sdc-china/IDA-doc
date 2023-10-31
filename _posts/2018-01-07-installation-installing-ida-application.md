---
title: "Installing IDA Application"
category: installation
date: 2018-01-07 15:17:55
last_modified_at: 2023-09-28 13:32:00
---

# Installing IDA Application

Below are steps to install IDA application. For installing applications of early versions of IDA, see [Installing IDA Application(v3.x, v2.x)](../references/references-installing-ida-application-early-version.html)

There are three components for IDA application we need install and configure, included
- *IDA web application*
- *IDA Browser Plugin*  
- *IDA BAW toolkit*

## Step 1: Installing IDA Web Application

IDA Web Application can be installed on WebSphere Application Server (WAS), liberty, Docker or Openshift. 

### Installing on Liberty


**1. Create a Liberty server**

You can create a server from the command line.

* Unzip the liberty installation package. Open a command line, then path to the wlp/bin directory.
Where <path_to_liberty> is the location you installed Liberty on your operating system.  

* Run the following command to create a server.

```
<path_to_liberty>/wlp/bin/server create <SERVER_NAME>
```

The 'SERVER_NAME' must use only Unicode alphanumeric (for example, 0-9, a-z, A-Z), underscore (_), dash (-), plus (+), and period (.) characters. The name cannot begin with a dash or period. Your file system, operating system, or compressed file directory might impose more restrictions.

If the server is created successfully, you receive message: Server SERVER_NAME created.

**2. Configure server.xml**  

Edit **server.xml** from *<path_to_liberty>/wlp/usr/servers/<SERVER_NAME>* folder. You could use the below sample server.xml to override your  **server.xml** and update *httpPort*, *httpsPort* and *keyStore password* and enable *features ssl,websocket*.


IDA Supports JNDI datasource, You can configure a data source and JDBC provider for database connectivity.

1\. In the server.xml file, define a shared library that points to the location of your JDBC driver JAR or compressed files.
For example:

```
  <library id="DBLib">
      <fileset dir="${shared.config.dir}/lib" includes="*.jar"/>
  </library>
```

2\. Configure attributes for the data source, such as JDBC vendor properties and connection pooling properties.
For example:

```
  <dataSource jndiName="jdbc/ida">
      <connectionManager maxPoolSize="50"/>
      <jdbcDriver libraryRef="DBLib" />
      <properties.postgresql serverName="localhost" portNumber="5432"
        databaseName="IDADB" user="postgres" password="password" />
  </dataSource>
```
3\. Support for X-Forwarded-* and Forwarded headers

Add below config in server.xml, support for X-Forwarded-* and Forwarded headers in Liberty means better integration with front end HTTP load balancers and web servers.

```
  <httpEndpoint id="defaultHttpEndpoint"
                        host="*" httpPort="9080"
                        httpsPort="9443">
      <remoteIp useRemoteIpInAccessLog="true"/>
  </httpEndpoint>
```

**Here is a sample server.xml**

Please update the fields host, httpPort and httpsPort, library and dataSource.  More information about configuring relational database connectivity in Liberty, please refer to [Data Source Configuration](https://www.ibm.com/support/knowledgecenter/SSD28V_liberty/com.ibm.websphere.wlp.core.doc/ae/twlp_dep_configuring_ds.html).

For example:

```
<?xml version="1.0" encoding="UTF-8"?>
<server description="new server">

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

    <keyStore id="defaultKeyStore" password="idaAdmin" />

    <!-- There's an issue using jdk 8 with TLSv1.3, enable TLSv1.2 as below to work around the issue. -->
    <ssl id="defaultSSLConfig" keyStoreRef="defaultKeyStore" trustDefaultCerts="true" sslProtocol="TLSv1.2"/>

    <webContainer invokeFlushAfterService="false"/>

    <!--For a user registry configuration, configure your user registry. For example, configure a basic user registry using the
        basicRegistry element. Specify your own user name below in the name attribute of the user element. For the password,
        generate an encoded password using bin/securityUtility encode and add it in the password attribute of the user element.
        Then uncomment the user element. -->
    <basicRegistry id="basic" realm="BasicRealm">
        <!-- <user name="yourUserName" password="" />  -->
    </basicRegistry>

    <!-- To access this server from a remote client add a host attribute to the following element, e.g. host="*" -->
    <httpSession cookieSameSite="None"/>

    <httpEndpoint id="defaultHttpEndpoint"
                        host="*" httpPort="9080"
                        httpsPort="9443">
      <remoteIp useRemoteIpInAccessLog="true"/>
    </httpEndpoint>
    <!-- Automatically expand WAR files and EAR files -->
    <applicationManager autoExpand="true" startTimeout="360s" stopTimeout="120s"/>
	  <application type="war" id="ida" name="ida" location="${server.config.dir}/apps/ida-web.war">
      <classloader delegation="parentLast" />
    </application>

	<!-- <keyStore id="defaultKeyStore" password="idaAdmin" /> -->

  <!-- Shared libraries
    https://www.ibm.com/support/knowledgecenter/SSEQTP_liberty/com.ibm.websphere.wlp.doc/ae/cwlp_sharedlibrary.html
    -->
  <!-- JNDI data source confiduration -->


  <!-- Define a shared library pointing to the location of the JDBC driver JAR or compressed files. For example:  -->

  <!-- PostgreSQL Example-->
  <library id="PostgresSQLLib">
      <fileset dir="${shared.config.dir}/lib/global" includes="postgresql-42.2.8.jar"/>
  </library>

  <!-- Configure attributes for the data source, such as JDBC vendor properties and connection pooling properties. For example:  -->
  <dataSource jndiName="jdbc/ida">
      <connectionManager maxPoolSize="50"/>
      <jdbcDriver libraryRef="PostgresSQLLib" />
      <properties.postgresql serverName="localhost" portNumber="5432"
        databaseName="IDADB" user="postgres" password="password" />
  </dataSource>
  <!-- PostgreSQL Example End-->

  <!-- DB2 Example-->
  <library id="DB2Lib">
      <fileset dir="${shared.config.dir}/lib/global" includes="db2jcc4-11.1.jar"/>
  </library>
  <dataSource jndiName="jdbc/ida" statementCacheSize="60" id="DB2DataSource"
          isolationLevel="TRANSACTION_READ_COMMITTED" type="javax.sql.DataSource" transactional="true">
    <connectionManager maxPoolSize="50"/>
    <jdbcDriver libraryRef="DB2Lib"/>
    <properties.db2.jcc databaseName="${env.DATABASE_NAME}" currentSchema="${env.DATABASE_IDA_SCHEMA}"
                serverName="${env.DATABASE_SERVER_NAME}" portNumber="${env.DATABASE_PORT_NUMBER}"
                user="${env.DATABASE_USER}" password="${env.DATABASE_PASSWORD}"/>
  </dataSource>
  <!-- DB2 Example End-->

  <!-- Oracle Example-->
  <library id="ORACLELib">
      <fileset dir="${shared.config.dir}/lib/global" includes="ojdbc8-12.2.0.1.jar"/>
  </library>
  <dataSource jndiName="jdbc/ida" statementCacheSize="60" id="OracleDataSource" isolationLevel="TRANSACTION_READ_COMMITTED" type="javax.sql.DataSource" transactional="true">
    <connectionManager maxPoolSize="50"/>
    <jdbcDriver libraryRef="ORACLELib"/>
    <properties.oracle url="${env.DATABASE_URL}"
          user="${env.DATABASE_USER}" password="${env.DATABASE_PASSWORD}"/>
  </dataSource>
  <!-- Oracle Example END-->

  <!-- Mysql Example-->
  <library id="MYSQLLib">
      <fileset dir="${shared.config.dir}/lib/global" includes="mysql-connector-java-8.0.18.jar"/>
  </library>

  <!-- Configure attributes for the data source, such as JDBC vendor properties and connection pooling properties. For example:  -->
  <dataSource jndiName="jdbc/ida" statementCacheSize="60" id="DefaultDataSource"
          isolationLevel="TRANSACTION_READ_COMMITTED" type="javax.sql.DataSource" transactional="true">
    <connectionManager maxPoolSize="50"/>
    <jdbcDriver libraryRef="MYSQLLib"/>
    <properties databaseName="<DATABASE_NAME>"
                serverName="<SERVER_NAME>" portNumber="<SERVER_PORT>"
                user="<USER_NAME>" password="<PASSWORD>"/>
  </dataSource>
  <!-- Mysql Example End-->
</server>
```
We found an issue using jdk 8 with TLSv1.3, which can cause very high CPU usage of IDA. To fix the issue, use TLSv1.2 by adding below configuration to server.xml.
```
<ssl id="defaultSSLConfig" keyStoreRef="defaultKeyStore" trustDefaultCerts="true" sslProtocol="TLSv1.2"/>
```

Liberty supports Advanced Encryption Standard (AES) encryption for passwords that are stored in the server.xml file. In Liberty installation bin folder you can use **securityUtility** command to encrypt your password.
```
./securityUtility encode password
```
More information about encrypt, please refer to [SecurityUtility Command](https://www.ibm.com/support/knowledgecenter/SSEQTP_liberty/com.ibm.websphere.wlp.doc/ae/rwlp_command_securityutil.html).

If the database requires SSL connection, set it in the datasource prop, for example, for DB2:
```
 <properties.db2.jcc databaseName="${env.DATABASE_NAME}" currentSchema="${env.DATABASE_IDA_SCHEMA}"
                serverName="${env.DATABASE_SERVER_NAME}" portNumber="${env.DATABASE_PORT_NUMBER}"
                user="${env.DATABASE_USER}" password="${env.DATABASE_PASSWORD}" sslConnection="true"/>
```
Refer to [Database connections with TLS](https://openliberty.io/blog/2021/06/04/database-ssl-primer.html).


**3. Configure jvm.options**

Create **jvm.options** from *<path_to_liberty>/wlp/usr/servers/<SERVER_NAME>* directory.

Set the maximum heap size to 8192m, If the heap size is not big enough, IDA checkstyle may crash with out-of-memory exception throwed, increase the heap size and restart server can fix this issue.

```
-Xms512m
-Xmx8192m
```
You might also need to set proxy server, then add the following lines to **jvm.options** based on your acutal proxy setting.

```
-Dhttps.proxyHost=host     
-Dhttps.proxyPort=port     
-Dhttps=proxyUser=user     
-Dhttps.proxyPassword=your password
```

**4. Configure server.env**

Create **server.env** from *<path_to_liberty>/wlp/usr/servers/<SERVER_NAME>* directory.

The default IDA data folder is **/var/ida/data**. If the default value is not applicable, then add the following environment variable to change the default IDA data folder:

```
ENGINE_CONFIG_DATA_DIR=<your_ida_data_path>
```

**5. Copy the ida-web.war to apps directory**

Copy the **ida-web.war** to *<path_to_liberty>/wlp/usr/servers/<SERVER_NAME>/apps* directory.

**6. Start liberty server**

```
<path_to_liberty>/wlp/bin/server start SERVER_NAME
```

[1]: ../installation/installation-integrate-def.html

### Installing on WAS V9

**Check the WAS version**

IDA uses Spring Boot websocket feature, which is not supported by WebSphere v8.5.5. It's recommended to install IDA on WebSphere **v9.0.5.4+**.
1. Login the WAS console, in the **Welcome** part, you can see the version of WAS.
![][wasversion]
2. If the WAS version is below **9.0.5.4**, you should install the Fix Packs 9.0.5.4+, here is the minimum fix pack version:
- [9.0.5.4: WebSphere Application Server traditional Version 9.0.5 Fix Pack 4](https://www.ibm.com/support/pages/node/6220158)

3. Following instructions on [this page](https://www.ibm.com/support/knowledgecenter/SSAW57_9.0.5/com.ibm.websphere.installation.nd.doc/ae/tins_upgrade.html) to install the fix pack.

4. When finished the fix packs installation, the version will changed to 9.0.5.4.

**Update Session Management on WAS Console**
1. Login to the WebSphere Integrated Solutions Console as an administrator (URL: https://host:port/ibm/console/login.do?action=secure).

2. In left navigation bar, click the **Servers > Server Types > WebSphere application servers > server_name > Session management**

   ![][wassessionmgr1]

3. Add the 'CookieSameSite' custom property and set the value to 'None'.

   ![][wassessionmgr2]

   ![][wassessionmgr3]

4. Make sure the host ports have been added to the **Environment > Virtual hosts > default_host**.

   ![][was_server_port]

   ![][was_virtual_hosts]

**Setting environment entries on WAS Console (Optional)**

1. In left navigation bar, click the **Servers >  Server Types > WebSphere application servers > server_name > Java and Process Management > Process Definition > Environment Entries > New**

   ![][wasenv1]

2. Add entries to the Name/Value pairs.

    ```
    # IDA working directory data path
    # Ensure the path exists and the user running IDA has read/write permissions on the folder.
    ENGINE_CONFIG_DATA_DIR=/var/ida/data
    ```
  ![][wasenv2]

3. Click OK to save changes and restart server.


**Confige the JNDI**

1. In left navigation bar, click the **Resource > JDBC > Data sources**

2. Create a new data source, we use db2 as an example.

   ![][data_source1]

   ![][data_source2]

   ![][data_source3]

   ![][data_source4]

   ![][was_db2_user]

   ![][data_source5]

 3. Test connection for this data source, make sure this connection is successful.

  ![][was_data_source_test_connection]


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


### Installing on Docker platform
Refer to [ida-docker](https://github.com/sdc-china/ida-docker) for deployment steps.

### Installing on Openshift
Refer to [ida-operator](https://github.com/sdc-china/ida-operator) for deployment steps.

## Step 2: Installing IDA BAW Toolkit
The testing capability can only launch the exposed Business Processes, Human Services and AJAX Services. If you wish to test other services such as system services, integration services or business processes which are not exposed directly, you need to install the IDA Toolkit.


BAW Version | IDA Toolkit Version  
     ----------------------|-------------------
      19.0.0.3 |  IDA_Toolkit - 8.6.0_v1.5.twx
      20.0.0.1 | IDA_Toolkit - 8.6.2.20001_TC.twx <br> **Due to product limitations, this version does not support [excuteSQL](../references/references-test-command.html#executesql)**.
      above 20.0.0.1 |IDA_Toolkit - 8.6.2.0_TC.twx


1. Import corresponding **IDA_Toolkit - 8.6.x.x.twx** which is below folder /toolkit of release package into your process center.      

2. Open your process app by web process designer from process center.

3. Click **+** button after Toolkits.

	![][click_add_button]

4. Type **ida** in the search box and select **8.6.x.0** below IDA Toolkit. Then the dependency **IDA Toolkit(8.6.x.0)** is added.

	![][ida_toolkit_search]

5. Click **Services** below **IDA Toolkit(8.6.x.0)**. Right click the **IDA Utility** service flow and copy the item to your process app.

	![][ida_toolkit_copy]

	![][ida_toolkit_copy_to_item]

6. If **IDA Utility** is in the Services of your Process appp, the service is installed successfully.

	![][service]

7. Modify toolkit access permission (Optional)

	For security concern, we suggest to disable the toolkit in BAW production environment.
	It allows user to modify the toolkit access permission by setting up the environment variable "IDA_ACCESS". (true means enable the access, false means disable the access)

	By default, the toolkit can only be invoked on Development, Test and Stage environments:
	    ![][default_toolkit_setting]

	You can define the same environment variable "IDA_ACCESS" in your BAW application which will override the default setting in toolkit, for example:
	    ![][custom_toolkit_setting]





## Step 3: Installing IDA Browser Plug-in

### Chrome plugin
- Open the url <a href="https://chrome.google.com/webstore/search/IDA%20IBM" target="_blank">https://chrome.google.com/webstore/search/IDA%20IBM</a>
- Click "Add to Chrome" button to install plug-in.
- The Chrome plugin offline installation package. [IDA-23.5.crx](https://github.com/sdc-china/IDA-plugin/raw/master/chrome/IDA-23.5.crx)
- For Chrome plugin to work on IDA web version >= 22.1.1, please configure the cookieSameSite attribute of http session on liberty server.xml or WAS console. See docs above.
  
### Edge plugin
- The same IDA Chrome plugin can also be installed in Edge.
- Enable "Allow extensions from other stores." in the Edge Extensions settings page.
- Open the url <a href="https://chrome.google.com/webstore/search/IDA%20IBM" target="_blank">https://chrome.google.com/webstore/search/IDA%20IBM</a>
- Click "Get" button, then click "Add extension" button to install plug-in.

### Firefox plugin
- Download Firefox plugin [ida-23.5-fx.xpi](https://github.com/sdc-china/IDA-plugin/raw/master/firefox/ida-23.5-fx.xpi)
- Drag the downloaded plugin file into firefox window.
- Click "Add" button.

### Plug-in Configuration

To make the plug-in work, you must login IDA server in the plugin login page.

- Click the IDA plugin icon in the browser extension toolbar, then it will popup the login window.

- Enter the IDA server url, username and password.

  ![][plugin_login]

- Click "Sign in" button, then you will see the screenshot as below.

  ![][plugin_welcome]

- If you see below sign in errors, please open the server url in your web browser to verify that IDA web can be accessed. If IDA web shows an HTTPS/SSL certifcate warning, you must accept the warning manually by clicking "Proceed to ..." and then sign in the IDA plugin.

  ![][plugin_login_error]

  ![][ida_web_cert_error]

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
[wassessionmgr1]: ../images/install/wassessionmgr1.png
[wassessionmgr2]: ../images/install/wassessionmgr2.png
[wassessionmgr3]: ../images/install/wassessionmgr3.png
[wasenv1]: ../images/install/wasenv1.png
[wasenv2]: ../images/install/wasenv2.png
[firefox_custom_setting]: ../images/install/firefox_custom_setting.png

## Self-Signed SSL Certificates Installation

The IDA recorder plugin can't support website with self sign certification by default. In this case, a warning like this:

![][error]

   This warning will block the recording of test case. To resolve this problem, we need to make the browsers to accept self-signed certificate.    

### FireFox - Add a Security Exception

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

### Chrome - Visit in unsafe mode

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
   [plugin_welcome]: ../images/install/plugin_welcome.png
   [plugin_login]: ../images/install/plugin_login.png
   [plugin_login_error]: ../images/install/plugin_login_error.png
   [ida_web_cert_error]: ../images/install/ida_web_cert_error.png
   [data_source1]: ../images/install/was_data_source1.png
   [data_source2]: ../images/install/was_data_source2.png
   [data_source3]: ../images/install/was_data_source3.png
   [data_source4]: ../images/install/was_data_source4.png
   [data_source5]: ../images/install/was_data_source5.png
   [was_db2_user]: ../images/install/was_db2_user.png
   [was_data_source_test_connection]: ../images/install/was_data_source_test_connection.png
   [was_server_port]: ../images/install/was_server_port.png
   [was_virtual_hosts]: ../images/install/was_virtual_hosts.png
