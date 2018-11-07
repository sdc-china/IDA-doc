---
layout: page
title: "Migrating and updating your Keter"
category: references
date: 2018-11-06 15:17:55
order: 5
---

## Migrating and updating Keter

### Preparing your migration

To prepare your migration, take the following steps:  

1. Download the lastested keter version.
2. Stop the libery server.  
3. Stop the mysql server.  
4. Backup the mysql db.    

### Step 1: Update DB

To update DB, take the following steps: 

1. Start the mysql Server.  
2. Find migrate-mysql.sql in the sql folder. Copy the corresponding version sql into clipboard.   

![][mysqlmigration]   

3. Connect to the MySQL server and use keter database.You can execute the script from the  clipboard. 

``` 
mysql> use keter ;   
mysql> paste your sql here   
```    

### Step 2: Update Keter.war   

To update Keter.war, take the following steps: 

1. Extract the application-prod.yml in the deployed keter.war.

![][yamlmigration] 

2. Replace the application-prod.yml in the new keter.war from build foler.     
3. Remove the deployed keter.war from wlp installation\usr\servers\default\apps folder.     
4. Copy the new keter.war into the wlp installation\usr\servers\default\apps folder.    
5. Start the Liberty Server.  

  

[yamlmigration]: ../images/install/productionyaml.png
[mysqlmigration]: ../images/install/mysqlmigration.png
