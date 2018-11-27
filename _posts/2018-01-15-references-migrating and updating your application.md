---
layout: page
title: "Migrating and updating IDA Application"
category: references
date: 2018-11-06 15:17:55
order: 6
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
2. Find migrate-mysql.sql in the sql folder. Copy the corresponding version sql into clipboard.   

![][mysqlmigration]   

3. Connect to the MySQL server and use IDA database.You can execute the script from the  clipboard. 

``` 
mysql> use IDA ;   
mysql> paste your sql here   
```    

### Step 2: Update IDA.war   

To update IDA.war, take the following steps: 

1. Find  ida.properties under conf folder in the previous version.
2. Find the previous version ida.properties property values and reconfigure  IDA.propertie in the currenct version.
3. Click the package.bat command to repackage the IDA.war file.
4. Remove the old IDA.war from wlp installation\usr\servers\default\apps folder.     
5. Copy the new IDA.war into the wlp installation\usr\servers\default\apps folder.    
6. Start the Liberty Server.  

 **Notes**     
 Please not overwrite ida.properties from previous version since property values will change in some versions.   

[yamlmigration]: ../images/install/productionyaml.png
[mysqlmigration]: ../images/install/mysqlmigration.png
