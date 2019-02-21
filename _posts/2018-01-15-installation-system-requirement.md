---
layout: page
title: "System Requirement"
category: installation
date: 2018-09-18 15:17:55
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

* [IBM® Business Process Manager](https://www.ibm.com/support/knowledgecenter/SSFTBX_8.5.7/com.ibm.wbpm.main.doc/topics/ibmbmp_overview.html) V8.5.x+ or [IBM® Business Automation Workflow V18.X](https://www.ibm.com/support/knowledgecenter/en/SS8JB4_18.0.0/com.ibm.wbpm.workflow.main.doc/kc-homepage-workflow.html) 
* [Open Liberty 18.0.0.3](https://public.dhe.ibm.com/ibmdl/export/pub/software/openliberty/runtime/release/2018-09-05_2337/openliberty-18.0.0.3.zip) or [IBM WebSphere Application Server Version  v9.x](https://www.ibm.com/support/knowledgecenter/en/SSAW57_9.0.0/com.ibm.websphere.nd.multiplatform.doc/ae/welcome_ndmp.html)
* [IBM® Db2 v10.x+](https://www.ibm.com/analytics/us/en/db2/) 
or [MySQL 5.x+](https://dev.mysql.com/downloads/mysql/)  
* [Selenium v3.14+](https://sdc-china.github.io/IDA-doc/administration/administration-selenium-hub-configuration.html)
* JDK v8+

### Optional  

* A SMTP Server


### Browsers Support

* Firefox v52+ (64-bit)
* Chrome v57+ (64-bit)
* IE v11+ (Supports exection only)

### Minimal Hardware/VM/Docker Requirements
- 2 core CPU, 4 GB memory and 10 GB disk space.

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
