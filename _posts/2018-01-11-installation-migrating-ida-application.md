---
title: "Migrating IDA Application"
category: installation
date: 2018-01-11 15:17:56
last_modified_at: 2021-12-10 16:44:00
---

# Migrating IDA Application

If you have previously installed IDA in your environment and now you want to update IDA to the new version, please read the following content. 

Below are example steps to migrate IDA application from v21.0.0 to latest version. For migrating applications from early versions of IDA, see [Migrating and Updating IDA Application v2.x](../references/references-migrating-and-updating-ida-application-v2.x.html) and [Migrating IDA from v2.7.x to v21.0.0](../references/references-migrating-ida-from-v2.7.x-to-v21.0.0.html)

***

## Preparing your migration

Compared to the previous version, the new version of IDA will have some changes in database structure, so sometimes IDA updates require database migration. To prepare your migration, take the following steps:  

1. Download the lastest IDA installation file. The migration scripts come from the installation file. The file name is ida-web-xxx.zip.(xxx is the IDA version)
2. Stop Libery server.  
3. Stop MySQL server.  
4. Backup the MySQL database.    

## Step 1: Update DB

Below steps are appplicable to MySQL database. For other types of database, steps are similar. To update DB, take the following steps:
1. Get the previous version of IDA from the **Database Version** under the **Settings** page.
   
   ![][ida_version]{:width="100%"}

2. Determine which migration scripts need to be run. 
   
   You can find migrate-mysql*.sql in the **sql\migrate\mysql** folder. There are two version numbers in the file name of each SQL file. The first version represents the previous IDA database version, and the latter one represents the IDA database version will be migrated to after executing this SQL file.

   For example, if the SQL name is **migrate-mysql-v21.3.2-v21.3.3.sql**, it means that this file will update IDA database version from **v21.3.2** to **v21.3.3**. 

   So if the pervious version is **v21.2.0**, and the new IDA installation file version is **v21.3.3**, then you need to execute these 4 SQL files one by one. 

   ![][mysqlmigration-v21]{:height="100%" width="100%"}

   If the pervious version is **v21.2.0**, and the new IDA installation file version is **v22.1.2**, then you need to execute these 6 SQL files one by one. You do not need to execute **migrate-mysql-v22.1.1-v22.1.3.sql**. Because the database structure has not changed between the **v22.1.1** and **v22.1.2**. The database structure is the same in **v22.1.1** and **v22.1.2**.

   ![][mysqlmigration-v22]{:height="100%" width="100%"}

3. Start the MySQL Server.   

4. Connect to the MySQL server and use IDA database. Execute the SQL scripts mentioned in the step 2 in order.
```
mysql> use IDA ;   
mysql> source yoursqlpath\migrate-mysql-v21.2.0-v21.3.0.sql
mysql> source yoursqlpath\migrate-mysql-v21.3.0-v21.3.1.sql
mysql> source yoursqlpath\migrate-mysql-v21.3.1-v21.3.2.sql
mysql> source yoursqlpath\migrate-mysql-v21.3.2-v21.3.3.sql
```    

## Step 2: Update IDA.war

You need to update IDA.war by the following steps:

1. [Configure Liberty server.xml](../installation/installation-installing-ida-application.html#installing-on-liberty).
2. Remove all the files from <LIBERTY_FOLDER>\usr\servers\default\apps folder.     
3. Copy the **ida-web.war** into the <LIBERTY_FOLDER>\usr\servers\default\apps folder.    
4. Start Liberty Server.  
 
## Step 3: Update IDA BAW Toolkit    

To update IDA BAW Toolkit, take the following steps:

BAW Version | IDA Toolkit Version  
     ----------------------|-------------------
      19.0.0.3 |  IDA_Toolkit - 8.6.0_v1.5.twx
      20.0.0.1 | IDA_Toolkit - 8.6.2.20001_TC.twx <br> **Due to product limitations, this version does not support [excuteSQL](../references/references-test-command.html#executesql)**.
      above 20.0.0.1 |IDA_Toolkit - 8.6.2.0_TC.twx

1. Import corresponding **IDA_Toolkit - 8.6.x.x.twx** which is below forder /toolkit of release package into your process center.

2. Open your process app by web process designer from process center. 
 
3. Upgrade the toolkit.

    ![][toolkit-upgrade-1-v21]{:height="60%" width="60%"}

4. Delete the old **IDA Utility**.

    ![][toolkit-upgrade-2]{:height="60%" width="60%"}

5. Click **Services** below **IDA Toolkit**. Right click the **IDA Utility** service flow and copy the item to your process app.

    ![][toolkit-upgrade-3-v21]{:height="60%" width="60%"}

    ![][toolkit-upgrade-4]{:height="30%" width="30%"}
   
[ida_version]: ../images/install/ida_version.png
[yamlmigration]: ../images/install/productionyaml.png
[mysqlmigration-v21]: ../images/install/mysqlmigration-v21.png
[mysqlmigration-v22]: ../images/install/mysqlmigration-v22.png
[teampermission]: ../images/install/teampermission.png
[teamproject]: ../images/install/teamproject.png
[sqlfolder]: ../images/references/sql-folder.png
[migration-sql]: ../images/references/migration-sql-example.png
[toolkit-upgrade-1-v21]: ../images/references/IDAbpmToolkitUpgrade_1-v21.png
[toolkit-upgrade-2]: ../images/references/IDAbpmToolkitUpgrade_2.png
[toolkit-upgrade-3-v21]: ../images/references/IDAbpmToolkitUpgrade_3-v21.png
[toolkit-upgrade-4]: ../images/install/ida_toolkit_copy_to_item.png
