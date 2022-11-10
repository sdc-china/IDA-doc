---
title: "Migrating and Updating IDA Application v2.x"
category: references
date: 2018-11-13 15:17:55
last_modified_at: 2020-04-30 16:44:00
---

# Migrating and Updating IDA Application v2.x
***

## Preparing your migration

To prepare your migration, take the following steps:  

1. Download the lastest IDA version. The migration scripts come from the installation file. The file name is ida-web-xxx.zip.
2. Stop the libery server.  
3. Stop the MySQL server.  
4. Backup the MySQL db.    

## Step 1: Update DB

To update DB, take the following steps:

1. Get the previous version of IDA from the left cornor of the IDA home page.
   
   ![][ida_version_old]{:height="100%" width="100%"}   

2. Determine which migration scripts need to be run. 
   
   You can find migrate-mysql*.sql in the **sql\migrate\mysql** folder. There are two version numbers in the file name of each SQL file. The first version represents the previous IDA database version, and the latter one represents the IDA database version will be migrated to after executing this SQL file.

   For example, if the SQL name is **migrate-mysql-v2.2.2-v2.2.3.sql**, it means that this file will update IDA database version from **v2.2.2** to **v2.2.3**. 

   So if the pervious version is **v2.2.2**, and the new IDA installation file version is **v2.3.2**, then you need to execute these five SQL files one by one. 
   
   * migrate-mysql-v2.2.2-v2.2.3.sql
   * migrate-mysql-v2.2.3-v2.2.4.sql
   * migrate-mysql-v2.2.4-v2.3.0.sql
   * migrate-mysql-v2.3.0-v2.3.1.sql
   * migrate-mysql-v2.3.1-v2.3.2.sql
   
   ![][mysqlmigration]{:height="40%" width="40%"}   


3. Start the MySQL Server.  

4. Connect to the MySQL server and use IDA database. Execute the SQL scripts mentioned in the step 2 in order.
```
mysql> use IDA;
mysql> paste your sql here   
```

## Step 2: Update IDA.war   

For IDA version migration, you need to update IDA.war, take the following steps:

1. Find  **ida.properties** under conf folder in the previous version.
2. Reconfigure  **ida.properties** file in the new version. Make sure you have copy the every propertie value from old version to new version. After you finish the properties value changes, you need to double check these properties values are set in new version files.   
3. Copy database jar to **lib** folder.
    
     Database              | jar       
     ----------------------|-------------------
     DB2                   | db2jcc4.jar    
     mysql                 | mysql-connector-java.jar
     Oracle                | ojdbc8.jar
     
4. Run **package.bat/package.sh** command to repackage the **ida-web.war** file.It will update application-prod.yml.
5. Remove all the files from wlp installation location\usr\servers\default\apps folder.     
6. Copy the **ida-web.war** (which generated in step3) into the wlp installation\usr\servers\default\apps folder.    
7. Start the Liberty Server.  

 **Notes**     
 Please not overwrite ida.properties from previous version, since we might add new some new property name in some versions.  
 You can check the application-prod.yml in ida-web.war to make sure these setting are applied.
 
 
## Step 3: Update IDA BAW Toolkit    

To update IDA BAW Toolkit, take the following steps:

1. Import **IDA_Toolkit - 8.6.0_v1.4.twx** which is below forder /toolkit of release package into your process center.
2. Open your process app by web process designer from process center.  
3. Upgrade the toolkit.

   ![][toolkit-upgrade-1]{:height="60%" width="60%"}

4. Delete the old **IDA Utility**.

   ![][toolkit-upgrade-2]{:height="60%" width="60%"} 

5. Click **Services** below **IDA Toolkit(8.6.0 v1.4)**. Right click the **IDA Utility** service flow and copy the item to your process app.

   ![][toolkit-upgrade-3]{:height="60%" width="60%"}

   ![][toolkit-upgrade-4]{:height="30%" width="30%"}
   
[ida_version_old]: ../images/install/ida_version_old.png
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