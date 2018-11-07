---
layout: page
title: "Migrating and updating your Keter"
category: installation
date: 2018-11-06 15:17:55
order: 6
---

## Migrating and updating Keter

Before you want to migrate your keter into a new version,please make sure you have stop the libery server and mysql server.  

**Update DB** 

Backup the mysql db.  
Start the mysql Server.  
Find migrate-mysql.sql in the sql folder.    

![][mysqlmigration]   

Connect to the MySQL server and use keter database.You can execute the script with the MySQL source command to execute script. Pls replace yoursqlpath to path of the SQL folder location.      

``` 
mysql> use keter ;
mysql> source yoursqlpath\migrate-mysql.sql;
```  

**Update Keter.war**     

Extract the  application-prod.yml in the deployed keter.war.

![][yamlmigration] 

Replace the  application-prod.yml in the new deployed keter.war from build foler.     
Remove the deployed war from wlp installation\usr\servers\default\apps folder.     
Copy the new keter.war into the wlp installation\usr\servers\default\apps folder.    
Start the Liberty Server.  

**Notes:**   

You might need to change the application-prod.yml manully if new property is added in a new version.   

[yamlmigration]: ../images/install/productionyaml.png
[mysqlmigration]: ../images/install/mysqlmigration.png
