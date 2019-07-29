---
title: "System Requirement"
category: installation
date: 2018-09-18 15:17:55
last_modified_at: 2019-07-25 21:25:00
order: 1
---

### Supported Platforms

* Ubuntu
* CentOS
* Red Hat Enterprise Linux
* Windows 7
* Windows 10
* Docker


### Software Prerequisites

* [IBM® Business Process Manager 8.5.x,8.6.0](https://www.ibm.com/support/knowledgecenter/en/SSFPJS), [IBM® Business Automation Workflow V18.X](https://www.ibm.com/support/knowledgecenter/en/SS8JB4_18.0.0/com.ibm.wbpm.workflow.main.doc/kc-homepage-workflow.html) and [IBM® Business Automation Workflow V19.0.0.1](https://www.ibm.com/support/knowledgecenter/SS8JB4/com.ibm.wbpm.workflow.main.doc/kc-homepage-workflow.html) 
* [Open Liberty 18.0.0.3](https://public.dhe.ibm.com/ibmdl/export/pub/software/openliberty/runtime/release/2018-09-05_2337/openliberty-18.0.0.3.zip) or [IBM WebSphere Application Server Version  v9.x](https://www.ibm.com/support/knowledgecenter/en/SSAW57_9.0.0/com.ibm.websphere.nd.multiplatform.doc/ae/welcome_ndmp.html)
    - The appserver JDK is JDK v8+ (64-bit) 
* [IBM® Db2 v10.x+](https://www.ibm.com/analytics/us/en/db2/) 
or [MySQL 5.x+](https://dev.mysql.com/downloads/mysql/)  
* [Selenium v3.14+](https://sdc-china.github.io/IDA-doc/administration/administration-selenium-hub-configuration.html)


### Optional  

* A SMTP Server


### Browsers Support

* Firefox v52+ (64-bit)
* Chrome v57+ (64-bit)
* IE v11+ (Supports exection only)

### Minimal Hardware/VM/Docker Requirements
- 2 core CPU, 4 GB memory and 50 GB disk space.

### Recommended Hardware/VM/Docker Requirements
- 2 core CPU, 8 GB memory and 200 GB disk space.

### Install IDA Package
Extract the IDA Installation archive file to a specific location. The IDA archive file contains the following directories and artifacts: 

*  **build** : contains IDA war file that needs to be deployed in Open Liberty.
*  **conf** : contains properties file.
*  **lib** : contains the required Java library for IDA packaging and setup.  
*  **sql** : contains the SQL files to create  database and tables.
*  **toolkit** : contains a required Toolkit TWX file.
*  **workspace** : contains the Checkstyle rule projects, which is builded on IBM Operational Decision Manager.
*  **package.bat** : Windows command to update IDA war file with client settings.
*  **package.sh** : Linux script to update IDA war file with client settings.
*  **README.html** : README file.
*  **ReleaseNotes.html** : Release notes.
