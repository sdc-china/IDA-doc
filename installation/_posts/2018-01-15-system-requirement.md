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


### Software Prerequisites

* IBM BPM 8.5.x or 8.6.0
* [Open Liberty 18.0.0.3](https://public.dhe.ibm.com/ibmdl/export/pub/software/openliberty/runtime/release/2018-09-05_2337/openliberty-18.0.0.3.zip)
* [MySQL 5.x or above](https://dev.mysql.com/downloads/mysql/) or [DB2] (#) 
* [Selenium](https://sdc-china.github.io/keter-doc/administration/administration-selenium-hub-configuration.html)

### Optional  

* SMTP Server
* IBM ODM 8.5 or above

**Notes:**  

The BPM Checkstyle tool can only be used if you have a license for IBM Operational Decision Manager

### Browser Support

* Firefox v52+ (64-bit)
* Chrome v57+ (64-bit)


### Install Keter Package
Extract the Keter Installation archive file to a specific location.  The Keter archive file contains the following directories and artifacts: 

*  **build** : contains Keter war file that needs to be deployed in WAS Liberty.
*  **conf** : contains Keter properties file.
*  **lib** : contains the required Java library for Keter packaging and setup.  
*  **sql** : contains the SQL files to create Keter database and tables.
*  **toolkit** : contains Keter required Toolkit TWX file.
*  **workspace** : contains the Checkstyle rule projects.
*  **package.bat** : Windows command to update Keter war file with client settings.
*  **package.sh** : Linux script to update Keter war file with client settings.
*  **README.html** : README file.
*  **ReleaseNotes.html** : Release notes.
