---
title: "Migrating IDA from v2.7.x to v21.0.0"
category: references
date: 2018-10-30 15:17:56
last_modified_at: 2021-12-10 09:17:55
order: 10
---

**Important:** If you run IDA with WAS, please refer to [Installing IDA Application][2] to check your WAS version. IDA may occur some problems if the WAS version is below 9.0.5.4!

# 1. Migrating IDA with a datasource connection

**Important:** Please backup your database before migration!

### 1.1 Edit [IDA_HOME]/conf/**ida.properties** under **conf** folder. 

This properties file contains three main sections. Please set **spring.datasource.driver-class-name**, **spring.datasource.url**, **spring.datasource.username**, **spring.datasource.password** field. If you want to encode your database password. Please refer to [Repacking IDA Application][1].

**Important:** Please comment spring.datasource.jndi-name if you do not use a JNDI datasource.

**JNDI Configuration**

*  **spring.datasource.jndi-name** : JNDI NAME


**Datasource Configuration**

*  **spring.datasource.driver-class-name** : Dirver Class Name
*  **spring.datasource.url** : Datasource url
*  **spring.datasource.username** : User Name
*  **spring.datasource.password** : Password

**Jasypt Configuration**

*  **jasypt.encryptor.password** : Jasypt secret key for Encrypt datasource passwords

### 1.2 Repacking ida-web.war with configuration

The purpose of repackage is to update your application-product.yaml in the war to make sure it loads the recent configuration.Once all the properties in [IDA_HOME]/conf/ida.properties file have been updated, you can then re-package the [IDA_HOME]/build/**ida-web.war** file. 

Before running the [IDA_HOME]/**package.bat** or [IDA_HOME]/**package.sh** you will need to set the JAVA_HOME environment variable and make ensure that [JAVA_HOME]/bin is included in the variable. Once the environment variable is set , you can then execute the package shell command to repackage the **ida-web.war**.

### 1.3 Stop your running IDA Application

For example:
```
./server stop SERVER_NAME
```

### 1.4 Execute migrate-\<DATABASE_TYPE\>-v2.7.x-v21.0.0.sql
**Notes:** Please execute ```call sysproc.admin_cmd('reorg table <TABLE_NAME>');``` after altering a table in DB2 database.

### 1.5 Add ```<httpSession cookieSameSite="None"/>``` to server.xml

### 1.6 Replace ida-web.war and Restart your server.
**Notes:** Please refer the doc [references-migrating-and-updating-your-application][3].

### 1.7 Migrate the values from your old conf/ida.properties to 'Settings' page. The below table lists all the filed need to be migrated:

- General Settings: 
  
    ![][General]

    Settings -> General | conf/ida.properties
    --- | ---
    General -> Trace Level | loggerLevel 
    General -> Enable LDAP Authentication | ldap.enable 
    General -> Url | ldap.url 
    General -> User Name | ldap.username 
    General -> Password | ldap.password 
    General -> Base DN | ldap.basedn 
    General -> User Filter | ldap.user.filter 
    General -> Default Role | ldap.default.role 
    General -> User Name Case Insensitive | ldap.username.case-insensitive 

- Testing Settings: 
  
    ![][Test]

    Settings -> Test | conf/ida.properties
    --- | ---
    Test -> Connection Timeout(seconds) | engine-config.connection-timeout
    Test -> Wait Timeout(seconds) | engine-config.wait-timeout 
    Test -> Default Retry Times | engine-config.default-retry-times 
    Test -> Default Retry Interval(seconds) | engine-config.default-retry-interval
    Test -> Data Path | engine-config.data-dir
    Test -> Enable Test Case History | enable_case_history
    Test -> Max Number of Test Case History | max_case_history
    Test -> Threshold of New Test Case | default_total_case

- Checkstyle Settings: 

    ![][Checkstyle]

    Settings -> Checkstyle | conf/ida.properties
    --- | ---
    Checkstyle -> Engine | checkstyle.engine
    Checkstyle -> Decision Server Username | resUser
    Checkstyle -> Decision Server Password | resPassword
    Checkstyle -> Decision Server URL | resUrl
    Checkstyle -> Decision Server Port | resPort
    Checkstyle -> Rest Url | restUrl

- Pipeline Settings: 

    ![][Pipeline]

    Settings -> Pipeline | conf/ida.properties
    --- | ---
    Pipeline -> Installation Package Remote Dir | engine-config.installation-package-remote-dir
    Pipeline -> Host | smtp.host
    Pipeline -> Port | smtp.port
    Pipeline -> Sender Email | email.from
    Pipeline -> Deployment Timeout(seconds) | deployment.timeout
    Pipeline -> Deployment Check Interval(seconds) | deployment.interval
    Pipeline -> Interval for Trigger by New Snapshot(seconds) | pipeline.snapshot.trigger.interval


### 1.7 Restart IDA server

Restart IDA server to make your changes effective.



# 2. Migrating IDA with a JNDI datasource connection

**Important:** Please backup your database before migration!

### 2.1 Please refer to section 1.1 to edit [IDA_HOME]/conf/**ida.properties** under **conf** folder.

**Notes:** Please comment spring.datasource.driver-class-name, spring.datasource.url, spring.datasource.username, spring.datasource.password and jasypt.encryptor.password fileds.

### 2.2 Please refer to 1.2 to repack ida-web.war
**Notes:** Please refer the doc [references-migrating-and-updating-your-application][3].

### 2.3 Please refer to 1.3 to stop your running IDA Application

### 2.4 Please refer to the doc [Installing IDA Application][2] to config the server.xml file.

### 2.5 Please copy you database driver to the folder according the library field configuration in server.xml.

### 2.6 Execute migrate-\<DATABASE_TYPE\>-v2.7.x-v21.0.0.sql
**Notes:** Please execute ```call sysproc.admin_cmd('reorg table <TABLE_NAME>');``` after altering a table in DB2 database.

### 2.7 Replace ida-web.war and Restart your liberty server.

### 2.8 Add ```<httpSession cookieSameSite="None"/>``` to server.xml

### 2.9 Please refer to 1.6 to migrate conf/ida.properties old values to 'Settings' page

### 3.0 Restart IDA server to make your changes effective.


[1]: ../installation/installation-ida-repacking.html
[2]: ../installation/installation-ida-installing.html#installing-on-was-v9
[3]: ../references/references-migrating-and-updating-your-application.html
[General]: ../images/references/General.jpg
[Test]: ../images/references/Test.jpg
[Pipeline]: ../images/references/Pipeline.jpg
[Checkstyle]: ../images/references/Checkstyle.jpg