---
title: "Migrating and updating IDA Application"
category: references
date: 2018-10-30 15:17:55
last_modified_at: 2019-07-29 16:44:00
order: 5
---

# Migrating and updating IDA Application
***
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
 
 
### Step 3: Update IDA BPM Toolkit    

To update IDA BPM Toolkit, take the following steps:

1. Import **IDA_Toolkit - 8.6.0_v1.4.twx** which is below forder /toolkit of release package into your process center.
2. Open your process app by web process designer from process center.  
3. Upgrade the toolkit.
![][toolkit-upgrade-1]
4. Delete the old **IDA Utility**.
![][toolkit-upgrade-2] 
5. Click **Services** below **IDA Toolkit(8.6.0 v1.4)**. Right click the **IDA Utility** service flow and copy the item to your process app.
![][toolkit-upgrade-3]
![][toolkit-upgrade-4]
   

[yamlmigration]: ../images/install/productionyaml.png
[mysqlmigration]: ../images/install/mysqlmigration.png
[teampermission]: ../images/install/teampermission.png
[teamproject]: ../images/install/teamproject.png
[sqlfolder]: ../images/references/sql-folder.png
[migration-sql]: ../images/references/migration-sql-example.png
[toolkit-upgrade-1]: ../images/references/IDAbpmToolkitUpgrade_1.png
[toolkit-upgrade-2]: ../images/references/IDAbpmToolkitUpgrade_2.png
[toolkit-upgrade-3]: ../images/references/IDAbpmToolkitUpgrade_3.png
[toolkit-upgrade-4]: ../images/install/ida_toolkit_copy_to_item.png