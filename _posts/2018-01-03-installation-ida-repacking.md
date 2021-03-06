---
title: "Repacking IDA Application"
category: installation
date: 2018-09-20 15:17:55
last_modified_at: 2020-09-15 21:34:00
order: 3
---

# Repacking IDA v3.x Application
***


## Properties Configuration

**Configure IDA properties** 

### Edit [IDA_HOME]/conf/**ida.properties** under **conf** folder. 

This properties file contains three main sections. Please set spring.datasource.driver-class-name, spring.datasource.url, spring.datasource.username, spring.datasource.password field. If you want to encode your database password. Please refer to [Repacking IDA Application][1].

**Notes:** Please comment spring.datasource.jndi-name if you do not use a JNDI datasource.

**JNDI Configuration**

*  **spring.datasource.jndi-name** : JNDI NAME


**Datasource Configuration**

*  **spring.datasource.driver-class-name** : Dirver Class Name
*  **spring.datasource.url** : Datasource url
*  **spring.datasource.username** : User Name
*  **spring.datasource.password** : Password

**Jasypt Configuration**

*  **jasypt.encryptor.password** : Jasypt secret key for Encrypt datasource passwords

**Notes** 
If you want to use encrypt database password in the **spring.datasource.password**.You need to generate the encrypt password.There are two ways to generate it.The secret key is define in the **jasypt.encryptor.password**.
You can use [online web tool](https://www.devglan.com/online-tools/jasypt-online-encryption-decryption) to generate encrypted password.    

![][onlineencrypt]

[onlineencrypt]: ../images/install/online.png

Also you can use command line tool from [jasypt](http://www.jasypt.org/download.html) to generate.

## Repacking IDA-web with configuration

The purpose of repackage  is to update your application-product.yaml in the war to make sure it loads the recent configuration.Once all the properties in [IDA_HOME]/conf/ida.properties file have been updated, you can then re-package the [IDA_HOME]/build/**ida-web.war** file.  

Before running the [IDA_HOME]/**package.bat** or [IDA_HOME]/**package.sh** you will need to set the JAVA_HOME environment variable and make ensure that [JAVA_HOME]/bin is included in the variable.  Once the environment variable is set , you can then execute the package shell command to repackage the **ida-web.war**.

# Repacking IDA v2.x Application

## Properties Configuration


### Edit [IDA_HOME]/conf/**ida.properties** under **conf** folder. 

This properties file contains three main sections.
 
**application configuration**
   
*  **spring.datasource.username** : Database connection username  
*  **spring.datasource.password** : Database connection password  
*  **spring.datasource.url** : Database connection URL. If you want to configure specific data schema to db2, change your url like this: 
	```
	# for DB2
	spring.datasource.url:jdbc:db2://[ip]:[port]/[database-name]?currentSchema=[schema-name]
	
	```
*  **server.host** :  IDA server IP or host name
*  **server.context-path** : default as  "/ida"  
*  **http.port** : Liberty http port defined in the server.xml
*  **https.port** : Liberty https port defined in the server.xml
*  **engine-config.connection-timeout** :  page load timeout
*  **engine-config.wait-timeout** :  default wait timeout, used in waitTextPresent and waitElement commands    
*  **engine-config.default-retry-times** :  the default retry times of the failed command. Can be overwritten by project properties.
*  **engine-config.default-retry-interval** : the default interval time between the retry. If not be set, the default is 3. Can be overwritten by project properties.    
*  **engine-config.data-dir** :  Temp folder to keep resouces like screenshot,checkstyle,twx etc 
*  **engine-config.installation-package-remote-dir** :  Temp folder to keep exported installation packages in PC/PS server
*  **smtp.host** : SMTP host    
*  **smtp.port** : SMTP port    
*  **email.from** : Sender Email address 
*  **spring.activemq.broker-url** : IP and Port of embedded ActiveMQ. It is only needed when you integrate IDA with BPM DEF[1] to have the monitoring feature. By default this property is commented out. You can leave it as-is if you don't need the monitoring feature. If you need it, you can uncomment it and replace the localhost with the actual IP address of the IDA deployment server.
*  **deployment.timeout** : The timeout in seconds for REST API call to check if snapshot is installed on PS and set as default snapshot
*  **deployment.interval** : The interval in seconds for REST API call to check if snapshot is installed on PS and set as default snapshot
*  **jasypt.encryptor.password** : default value password  
*  **enable_case_history** : Enable save test case history function, default value is true.  
*  **max_case_history** : Set latest test case history max number of each test case, default value is 100.    


**Notes** 
If you want to use encrypt database password in the **spring.datasource.password**.You need to generate the encrypt password.There are two ways to generate it.The secret key is define in the **jasypt.encryptor.password**.
You can use [online web tool](https://www.devglan.com/online-tools/jasypt-online-encryption-decryption) to generate encrypted password.    

![][onlineencrypt]

[onlineencrypt]: ../images/install/online.png

Also you can use command line tool from [jasypt](http://www.jasypt.org/download.html) to generate.


![][offlineencrypt]

[offlineencrypt]: ../images/install/offline.png

Once you get the encrypt password,you need to change spring.datasource.password like below format.As a general rule, jasypt expects encrypted configuration parameters to appear surrounded by "ENC(...)".    
spring.datasource.password: ENC(Yasd1hzrpo05EdNTzlifQ22+8LUNAgcT)   


**LDAP properties configuration**

*  **ldap.enable** : If set flag to true, it will authenticate the ida users by ldap protocol.    
*  **ldap.url** : Set LDAP server url.    
*  **ldap.username** : Set LDAP server login user name.    
*  **ldap.password** : Set LDAP server login user password.    
*  **ldap.basedn** : Set LDAP server base dn.    
*  **ldap.user.filter** : Set LDAP server user fileter pattern, use '#' to split multiple user filter patterns.   
*  **ldap.default.role** : Set the default LDAP user role name.  
*  **ldap.username.case-insensitive** : Set LDAP server is case insensitive or not.

**Notes** 

- If you enable LDAP authencation configuration, You could not add users by idaAdmin.    
- When a user sign in IDA at the first time, the user is not belong to any teams. The user need to ask the idaAdmin to assign him/her to a team, then the user could create projects and pipelines.  
- Do not create user idaAdmin(case insensitive) in LDAP server because it is a reserved user.

**LDAP Configuration Example**

An example entry as displayed in the LDIF (LDAP Data Interchange Format) would look something like this:

```
dn: uid=ben,ou=people,dc=example,dc=org
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: person
objectClass: top
cn: Ben Alex
sn: Alex
uid: ben
```
You LDAP server configuration may like this:

```
#Ldap Server configuration
#If set flag to true, it will authenticate the ida users by ldap protocol
ldap.enable: true
#Ldap server url
ldap.url: "ldap://<IP_Address>:<port>/"
#Ldap server user name
ldap.username: "cn=admin,dc=example,dc=org"   
#Ldap server user password
ldap.password: "admin"
#The root of data information trees
ldap.basedn: "dc=example,dc=org"
#Ldap user filter pattern, use '#' to split multiple user filter pattern. If you want to use "uid=ben,ou=people,dc=example,dc=org" to login IDA. Just input "ben" for the username field and input the corresponding password field on the login form.

#Specify the organization information when verifying user.
ldap.user.filter: "uid={0},ou=people"
#Don not specify the organization information when verifying user.
ldap.user.filter: "uid={0}"

#Set default 
ldap.default.role: User
#Ldap server is case insensitive or not.
ldap.username.case-insensitive: true
```

 
**checkstyle properties configuration**

*  **checkstyle.engine**: The checkstyle engine property can be EMBEDDED or ODM. By default, it's *EMBEDDED*. You need configure the following ODM server and rules configuration if you use ODM as checkstyle engine.
*  **resUser** : rule execution server username  
*  **resPassword** : rule execution server password  
*  **resUrl** : rule execution server url  
*  **resPort** : rule execution server port 
*  **restUrl** : The checkstyle rule ODM REST url

**monitoring properties configuration (For BPM Monitoring purpose)**
	
*  **event_type** : event types to be stored in IDA database  
*  **track_serviceflow** : default as true  

It is only needed when you want to configure monitoring[1] to have the monitoring feature. If you don't need it, you can leave them as-is.

**Datasource properties configuration**
You can uncomment DB2 property configuration and comment MySQL property configuration.

![][db2config]

[db2config]: ../images/install/db2configuration.png

**Notes**   

If you want your IDA support Latin alphabet in page,you need to add **useUnicode=yes&characterEncoding=UTF-8** at the end of jdbc url.

## Repacking IDA-web with configuration

The purpose of repackage  is to update your application-product.yaml in the war to make sure it loads the recent configuration.Once all the properties in [IDA_HOME]/conf/ida.properties file have been updated, you can then re-package the [IDA_HOME]/build/**ida-web.war** file.  

Before running the [IDA_HOME]/**package.bat** or [IDA_HOME]/**package.sh** you will need to set the JAVA_HOME environment variable and make ensure that [JAVA_HOME]/bin is included in the variable.  Once the environment variable is set , you can then execute the package shell command to repackage the **ida-web.war**.

![][package]

[package]: ../images/install/package.png
