---
layout: page
title: "Prerequisites"
category: installation
date: 2018-01-05 15:17:55
order: 1
---

### Supported Plaftforms

- Ubuntu
- CentOS
- Red Hat Enterprise Linux 
- Win7
- Win10

### Supported Softwares

#### JDK version

- JDK1.8 (64 bit)

#### Database

- MySQL 5.X

#### IBM BPM 

- BPM 8.5.x or above

#### IBM ODM

- ODM 8.5.x or above

#### Web Browser

* Firefox v52+ (64bit)
* Chrome  v57+ (64bit)

#### Application Server  

* [WAS Liberty 17.0.0.4](https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/wasdev/downloads/wlp/17.0.0.4/wlp-javaeeClient7-17.0.0.4.zip)

**Optional installation**  

* SMTP Server

  
### Installation Package
Extract the Keter Installation archive file to your temporary folder. After extraction, the installation package should have below:

*  **build** : contains the Keter war file that needs to be deployed in WAS Liberty.
*  **conf** : contains the Keter properties file.
*  **lib** : contains the required Java library for Keter packaging and setup.  
*  **sql** : contains the SQL files to create Keter database and tables.
*  **toolkit** : contains the Keter required Toolkit TWX file.
*  **package.bat** : Windows command to update Keter war file with client settings.
*  **package.sh** : Linux script to update Keter war file with client settings.
*  **README.html** : README file.
*  **ReleaseNotes.html** : Release notes.
