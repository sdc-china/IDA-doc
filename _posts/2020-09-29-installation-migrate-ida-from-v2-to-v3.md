---
title: "Migrate IDA from V2.7.x to v3.0.0"
category: installation
date: 2020-09-29 15:17:55
last_modified_at: 2020-09-29 15:17:55
order: 10
---

IDA support JNDI and Datasource to connect a database from v3.0.0.

# 1. Migrate IDA with a datasource connection

## 1.1 Edit [IDA_HOME]/conf/**ida.properties** under **conf** folder. 

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

## 1.2 Repacking ida-web.war with configuration

The purpose of repackage  is to update your application-product.yaml in the war to make sure it loads the recent configuration.Once all the properties in [IDA_HOME]/conf/ida.properties file have been updated, you can then re-package the [IDA_HOME]/build/**ida-web.war** file.  

Before running the [IDA_HOME]/**package.bat** or [IDA_HOME]/**package.sh** you will need to set the JAVA_HOME environment variable and make ensure that [JAVA_HOME]/bin is included in the variable.  Once the environment variable is set , you can then execute the package shell command to repackage the **ida-web.war**.

## 1.3 Stop your running IDA Application

For example:
```
./server stop SERVER_NAME
```

## 1.4 Execute migrate-<DATABASE_TYPE>-v2.7.x-v3.0.0.sql

## 1.5 Replace ida-web.war and Restart your server.

## 1.6 Migrate the values form your old conf/ida.properties to 'Settings' page. The below table lists all the filed need to be migrated:

|conf/ida.properties | Settings page|
--- | ---
server.host | Removed
server.servlet.context-path | Removed
http.port | Removed
https.port | Removed
jasypt.encryptor.password | Removed
event_type  | Removed
track_serviceflow | Removed
engine-config.connection-timeout| Test -> Connection Timeout(seconds)
engine-config.wait-timeout | Test -> Wait Timeout(seconds)
engine-config.default-retry-times | Test -> Default Retry Times
engine-config.default-retry-interval | Test -> Default Retry Interval(seconds)
engine-config.data-dir | Test -> Data Path
engine-config.installation-package-remote-dir | Pipeline -> Installation Package Remote Dir
smtp.host | Pipeline -> Host
smtp.port | Pipeline -> Port
email.from | Pipeline -> Sender Email
deployment.timeout | Pipeline -> Deployment Timeout(seconds)
deployment.interval | Pipeline -> Deployment Check Interval(seconds)
loggerLevel | General -> Trace Level
checkstyle.engine | Checkstyle -> Engine
resUser | Checkstyle -> Decision Server Username
resPassword | Checkstyle -> Decision Server Password
resUrl | Checkstyle -> Decision Server URL
resPort | Checkstyle -> Decision Server Port
restUrl | Checkstyle -> Rest Url
enable_case_history | Test -> Enable Test Case History
max_case_history | Test -> Max Number of Test Case History
default_total_case | Test -> Threshold of New Test Case
ldap.enable | General -> Enable LDAP Authentication
ldap.url | General -> Url
ldap.username | General -> User Name
ldap.password | General -> Password
ldap.basedn | General -> Base DN
ldap.user.filter | General -> User Filter
ldap.default.role | General -> Default Role
ldap.username.case-insensitive | General -> User Name Case Insensitive
pipeline.snapshot.trigger.interval | Pipeline -> Interval for Trigger by New Snapshot(seconds)

## 1.7 Restart IDA server to make your changes effective.

# 2. Migrate IDA with a JNDI datasource connection

## 2.1 Please refer to section 1.1 to edit [IDA_HOME]/conf/**ida.properties** under **conf** folder.

## 2.2 Please refer to 1.2 to repack ida-web.war

## 2.3 Please refer to 1.3 to stop your running IDA Application

## 2.4 Please refer to the doc [Installing IDA Application][2] to config the server.xml file.

## 2.5 Please copy you database driver to the folder according the configuration in server.xml.

## 2.6 Replace ida-web.war and Restart your server.

## 2.7 Please refer to 1.6 to migrate conf/ida.properties old values to 'Settings' page

## 2.8 Restart IDA server to make your changes effective.





[1]: ../installation/installation-ida-repacking.html
[2]: ..installation/installation-ida-installing.html