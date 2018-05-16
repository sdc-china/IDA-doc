---
layout: page
title: "Prerequisites"
category: installation
date: 2018-01-05 15:17:55
order: 1
---


### Prerequisites
    
* MySQL  5.x
* IBM BPM 8.5 or above
* [WAS Liberty 17.0.0.4](https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/wasdev/downloads/wlp/17.0.0.4/wlp-javaeeClient7-17.0.0.4.zip)

### Optional  

* SMTP Server
* IBM ODM 8.5 or above
  
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
