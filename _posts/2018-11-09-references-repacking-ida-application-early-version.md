---
title: "Repacking IDA Application (v3.x, v2.x)"
category: references
date: 2018-11-09 15:17:56
last_modified_at: 2021-12-10 21:34:00
---

# Repacking IDA Application (v3.x, v2.x)
***

## Properties Configuration

**Configure IDA properties**

Edit [IDA_HOME]/conf/**ida.properties** under the **conf** folder.

This properties file contains three main sections. Please set spring.datasource.driver-class-name, spring.datasource.url, spring.datasource.username, spring.datasource.password fields. If you want to encode your database password, please refer to Notes 2 below.

**Note 1:** Please add JNDI or Datasource configuration. Only one type of configuration is needed, and please comment out the other configuration. We recommend using JNDI configuration, and the JNDI datasource name should be configured on your application server. See the sample JNDI datasource configuration in the Liberty server in the [installation doc](../installation/installation-installing-ida-application.html#installing-on-liberty).

**JNDI Configuration**

*  **spring.datasource.jndi-name**: JNDI NAME

**Datasource Configuration**

*  **spring.datasource.driver-class-name**: Driver Class Name
*  **spring.datasource.url**: Datasource URL
*  **spring.datasource.username**: User Name
*  **spring.datasource.password**: Password

**Jasypt Configuration**

*  **jasypt.encryptor.password**: Jasypt secret key for encrypting datasource passwords

**Note 2:**
If you want to use an encrypted database password in **spring.datasource.password**, you need to generate the encrypted password. There are two ways to generate it. The secret key is defined in **jasypt.encryptor.password**.
You can use the [online web tool](https://www.devglan.com/online-tools/jasypt-online-encryption-decryption) to generate an encrypted password.

![][onlineencrypt]

[onlineencrypt]: ../images/install/online.png

Also, you can use the command-line tool from [jasypt](http://www.jasypt.org/download.html) to generate it.

## Repacking IDA-web with configuration

The purpose of repacking is to update your application-product.yaml in the war to ensure it loads the recent configuration. Once all the properties in [IDA_HOME]/conf/ida.properties have been updated, you can then re-package the [IDA_HOME]/build/**ida-web.war** file.

Before running the [IDA_HOME]/**package.bat** or [IDA_HOME]/**package.sh**, you will need to set the JAVA_HOME environment variable and ensure that [JAVA_HOME]/bin is included in the PATH variable. Once the environment variable is set, you can then execute the package shell command to repackage the **ida-web.war**.

# Repacking IDA v2.x Application

## Properties Configuration

Edit [IDA_HOME]/conf/**ida.properties** under the **conf** folder.

This properties file contains three main sections.

**Application Configuration**

*  **spring.datasource.username**: Database connection username
*  **spring.datasource.password**: Database connection password
*  **spring.datasource.url**: Database connection URL. If you want to configure a specific data schema for DB2, change your URL like this:
    ```
    # for DB2
    spring.datasource.url:jdbc:db2://[ip]:[port]/[database-name]?currentSchema=[schema-name]
    ```
*  **server.host**: IDA server IP or hostname
*  **server.context-path**: Default is "/ida"
*  **http.port**: Liberty HTTP port defined in the server.xml
*  **https.port**: Liberty HTTPS port defined in the server.xml
*  **engine-config.connection-timeout**: Page load timeout
*  **engine-config.wait-timeout**: Default wait timeout, used in waitTextPresent and waitElement commands
*  **engine-config.default-retry-times**: The default retry times for the failed command. Can be overwritten by project properties.
*  **engine-config.default-retry-interval**: The default interval time between retries. If not set, the default is 3. Can be overwritten by project properties.
*  **engine-config.data-dir**: Temp folder to keep resources like screenshots, checkstyle, twx, etc.
*  **engine-config.installation-package-remote-dir**: Temp folder to keep exported installation packages in PC/PS server
*  **smtp.host**: SMTP host
*  **smtp.port**: SMTP port
*  **email.from**: Sender Email address
*  **spring.activemq.broker-url**: IP and Port of embedded ActiveMQ. It is only needed when you integrate IDA with BAW DEF[1] to have the monitoring feature. By default, this property is commented out. You can leave it as-is if you don't need the monitoring feature. If you need it, you can uncomment it and replace localhost with the actual IP address of the IDA deployment server.
*  **deployment.timeout**: The timeout in seconds for REST API calls to check if a snapshot is installed on PS and set as the default snapshot
*  **deployment.interval**: The interval in seconds for REST API calls to check if a snapshot is installed on PS and set as the default snapshot
*  **jasypt.encryptor.password**: Default value password
*  **enable_case_history**: Enable saving test case history function, default value is true.
*  **max_case_history**: Set the maximum number of latest test case histories for each test case, default value is 100.

**Note**
If you want to use an encrypted database password in **spring.datasource.password**, you need to generate the encrypted password. There are two ways to generate it. The secret key is defined in **jasypt.encryptor.password**.
You can use the [online web tool](https://www.devglan.com/online-tools/jasypt-online-encryption-decryption) to generate an encrypted password.

![][onlineencrypt]

[onlineencrypt]: ../images/install/online.png

Also, you can use the command-line tool from [jasypt](http://www.jasypt.org/download.html) to generate it.

![][offlineencrypt]

[offlineencrypt]: ../images/install/offline.png

Once you get the encrypted password, you need to change spring.datasource.password to the following format. As a general rule, jasypt expects encrypted configuration parameters to appear surrounded by "ENC(...)".
spring.datasource.password: ENC(Yasd1hzrpo05EdNTzlifQ22+8LUNAgcT)

**LDAP Properties Configuration**

*  **ldap.enable**: If set to true, it will authenticate the IDA users by LDAP protocol.
*  **ldap.url**: Set the LDAP server URL.
*  **ldap.username**: Set the LDAP server login username.
*  **ldap.password**: Set the LDAP server login user password.
*  **ldap.basedn**: Set the LDAP server base DN.
*  **ldap.user.filter**: Set the LDAP server user filter pattern, use '#' to split multiple user filter patterns.
*  **ldap.default.role**: Set the default LDAP user role name.
*  **ldap.username.case-insensitive**: Set whether the LDAP server is case-insensitive or not.

**Note**

- If you enable LDAP authentication configuration, you cannot add users by idaAdmin.
- When a user signs in to IDA for the first time, the user does not belong to any teams. The user needs to ask the idaAdmin to assign them to a team, then the user can create projects and pipelines.
- Do not create a user named idaAdmin (case-insensitive) in the LDAP server because it is a reserved user.

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
Your LDAP server configuration may look like this:

```
#Ldap Server configuration
#If set to true, it will authenticate the IDA users by LDAP protocol
ldap.enable: true
#Ldap server URL
ldap.url: "ldap://<IP_Address>:<port>/"
#Ldap server username
ldap.username: "cn=admin,dc=example,dc=org"
#Ldap server user password
ldap.password: "admin"
#The root of data information trees
ldap.basedn: "dc=example,dc=org"
#Ldap user filter pattern, use '#' to split multiple user filter patterns. If you want to use "uid=ben,ou=people,dc=example,dc=org" to login to IDA, just input "ben" for the username field and input the corresponding password field on the login form.

#Specify the organization information when verifying the user.
ldap.user.filter: "uid={0},ou=people"
#Do not specify the organization information when verifying the user.
ldap.user.filter: "uid={0}"

#Set the default role
ldap.default.role: User
#Ldap server is case-insensitive or not.
ldap.username.case-insensitive: true
```

**Checkstyle Properties Configuration**

*  **checkstyle.engine**: The checkstyle engine property can be EMBEDDED or ODM. By default, it's *EMBEDDED*. You need to configure the following ODM server and rules configuration if you use ODM as the checkstyle engine.
*  **resUser**: Rule execution server username
*  **resPassword**: Rule execution server password
*  **resUrl**: Rule execution server URL
*  **resPort**: Rule execution server port
*  **restUrl**: The checkstyle rule ODM REST URL

**Monitoring Properties Configuration (For BAW Monitoring purpose)**

*  **event_type**: Event types to be stored in the IDA database
*  **track_serviceflow**: Default is true

It is only needed when you want to configure monitoring[1] to have the monitoring feature. If you don't need it, you can leave them as-is.

**Datasource Properties Configuration**
You can uncomment the DB2 property configuration and comment out the MySQL property configuration.

![][db2config]

[db2config]: ../images/install/db2configuration.png

**Note**

If you want your IDA to support Latin alphabets on pages, you need to add **useUnicode=yes&characterEncoding=UTF-8** at the end of the JDBC URL.

## Repacking IDA-web with configuration

The purpose of repacking is to update your application-product.yaml in the war to ensure it loads the recent configuration. Once all the properties in [IDA_HOME]/conf/ida.properties have been updated, you can then re-package the [IDA_HOME]/build/**ida-web.war** file.

Before running the [IDA_HOME]/**package.bat** or [IDA_HOME]/**package.sh**, you will need to set the JAVA_HOME environment variable and ensure that [JAVA_HOME]/bin is included in the PATH variable. Once the environment variable is set, you can then execute the package shell command to repackage the **ida-web.war**.

![][package]

[package]: ../images/install/package.png