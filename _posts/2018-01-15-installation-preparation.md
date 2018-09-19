---
layout: page
title: "Prerequisites"
category: installation
date: 2018-09-18 15:17:55
order: 1
---


### Prerequisites

* IBM BPM 8.5.x or 8.6.0
* [IBM WAS Liberty 17.0.0.4](https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/wasdev/downloads/wlp/17.0.0.4/wlp-javaeeClient7-17.0.0.4.zip)
* [MySQL 5.x or above](https://dev.mysql.com/downloads/mysql/) or [DB2] (#) 
* [Selenium](https://sdc-china.github.io/keter-doc/administration/administration-selenium-hub-configuration.html)

### Optional  

* SMTP Server
* IBM ODM 8.5 or above

**Notes:**  

IBM ODM license is needed to use the Checkystyle feature.
  
### Installation Package
Extract the Keter Installation archive file to your temporary folder. After extraction, the installation package should have below:

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
