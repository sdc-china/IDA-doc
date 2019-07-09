---
layout: page
title: "Migrating and updating IDA Application"
category: references
date: 2018-11-06 15:17:55
order: 5
---

### Preparing your migration

To prepare your migration, take the following steps:  

1. Download the lastested IDA version.
2. Stop the libery server.  
3. Stop the mysql server.  
4. Backup the mysql db.    

### Step 1: Update DB

To update DB, take the following steps: 

1. Start the mysql Server.  
2. You can find migrate-mysql*.sql in the sql\migrate\mysql folder. Copy the corresponding version upgrade sql into clipboard.     
For example: If your previous version is v2.2.2.You need to pick below sql script to run one by one.Make sure the migrate sql version name is bigger than your previous version.
* migrate-mysql-v2.2.2-v2.2.3.sql
* migrate-mysql-v2.2.3-v2.2.4.sql
* migrate-mysql-v2.3.0-v2.3.1.sql
* migrate-mysql-v2.3.1-v2.3.2.sql


![][mysqlmigration]   

3. Connect to the MySQL server and use IDA database. Execute the script for each consecutive version.
``` 
mysql> use IDA ;   
mysql> paste your sql here   
```    

### Step 2: Update IDA.war   

For IDA version migration,you need to update IDA.war, take the following steps: 

1. Find  ida.properties under conf folder in the previous version.
2. Reconfigure  ida.properties file in the new version.Make sure you have copy the every propertie value from old version to new version. After you finish the properties value changes,you need to double check these properties values are set in new version files.   
3.Click the package.bat command to repackage the ida-web.war file.It will update application-prod.yml
4. Remove all the files from wlp installation location\usr\servers\default\apps folder.     
5. Copy the ida-web.war (which generated in step3) into the wlp installation\usr\servers\default\apps folder.    
6. Start the Liberty Server.  

 **Notes**     
 Please not overwrite ida.properties from previous version, since we might add new some new property name  in some versions.  
 You can check the application-prod.yml in ida-web.war to make sure these setting are applied.

[yamlmigration]: ../images/install/productionyaml.png
[mysqlmigration]: ../images/install/mysqlmigration.png
[teampermission]: ../images/install/teampermission.png
[teamproject]: ../images/install/teamproject.png
[sqlfolder]: ../images/reference/sql-folder.png
[migration-sql]: ../images/reference/migration-sql-example.png
