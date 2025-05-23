---
title: "Migrating IDA Application"
category: installation
date: 2018-01-11 15:17:56
last_modified_at: 2025-04-02 16:44:00
---

# Migrating IDA Application

If you have previously installed IDA in your environment and now you want to update IDA to the new version, please read the following content.

## From 2.x to 21.0.0
For migrating IDA application from 2.x to 21.0.0, see references below:
 - [Migrating and Updating IDA Application v2.x](../references/references-migrating-and-updating-ida-application-v2.x.html)
 - [Migrating IDA from v2.7.x to v21.0.0](../references/references-migrating-ida-from-v2.7.x-to-v21.0.0.html)

## From 21.0.0+ to latest version
For migrating IDA application by release package, see references below. **This option can be used if you require DBA to execute database schema migration scripts to update database, before updating IDA application to the latest version.**
 - [Migrating IDA from v21.0.0+ by Release Package](../references/references-migrating-ida-from-v21.0.0-by-release-package.html)

## From v22.1.7+ to latest version
For migrating IDA application on IDA startup, see steps below. 

### Migrate database schema on IDA startup
Starting from version 24.0.3, IDA automatically checks for database schema migration requirements and redirects IDA admin user to the **Migrate Database Schema** page. If the **Database user** shown on the page has been granted schema change privileges, IDA admin user can then execute the migration scripts automatically by clicking **Execute Migration Scripts**. Otherwise, IDA admin user can download the migration scripts by clicking **Download Migration Scripts** and ask DBA to execute them manually. After the migration scripts are executed successfully, IDA admin user can restart IDA to complete database schema migration.

![][database_schema_migration_page]

### Preparing your migration

Compared to the previous version, the new version of IDA will have some changes in the database structure, so sometimes IDA updates require database migration. To prepare your migration, take the following steps:

1. Download the lastest IDA installation file. The migration scripts come from the installation file. The file name is ida-web-xxx.zip.(xxx is the IDA version)
2. Stop Libery server.  
3. Stop database server.  
4. Backup the database.  

### Step 1: Update IDA.war

You need to update IDA.war by following these steps:

1. [Configure Liberty server.xml](../installation/installation-installing-ida-application.html#installing-on-liberty).
2. Remove all the files from <LIBERTY_FOLDER>\usr\servers\default\apps folder.     
3. Copy the **ida-web.war** into the <LIBERTY_FOLDER>\usr\servers\default\apps folder.    
4. Start Liberty Server.

### Step 2: Update DB
Choose one of the following options to migrate database schema when necessary.

#### Option 1

1. Click **Execute Migration Scripts** to execute migration scripts automatically.

    ![][database_schema_migration_page_execute]
    ![][database_schema_migration_page_execute_result]

2. Restart IDA to complete database schema migration.


#### Option 2

1. Click **Download Migration Scripts** to download the migration scripts and send the migration scripts SQL file to DBA to execute them manually.

    ![][database_schema_migration_page_download]
    ![][database_schema_migration_page_downloaded_sql]

2. After migration scripts are exectued manually, restart IDA to complete database schema migration.

### Step 3: Update IDA BAW Toolkit

To update the IDA BAW Toolkit, take the following steps:

BAW Version | IDA Toolkit Version
     ----------------------|-------------------
      19.0.0.3 | IDA_Toolkit-8.6.1.19003.twx
      20.0.0.1 | IDA_Toolkit-8.6.2.20001.twx <br> **Due to product limitations, this version does not support [executeSQL](../references/references-test-command.html#executesql)**.
      20.0.0.2+ | IDA_Toolkit-8.6.2.20002.twx

1. Import the corresponding **IDA_Toolkit-8.6.x.x.twx** from [IDA Resources page](../administration/administration-resources.html) into your Process Center.

2. Open your process app by the web process designer from the Process Center.

3. Upgrade the toolkit.

    ![][toolkit-upgrade-1-v21]{:height="60%" width="60%"}

4. Delete the old **IDA Utility**.

    ![][toolkit-upgrade-2]{:height="60%" width="60%"}

5. Click **Services** below **IDA Toolkit**. Right-click the **IDA Utility** service flow and copy the item to your process app.

    ![][toolkit-upgrade-3-v21]{:height="60%" width="60%"}

    ![][toolkit-upgrade-4]{:height="30%" width="30%"}

[ida_version]: ../images/install/ida_version.png
[toolkit-upgrade-1-v21]: ../images/references/IDAbpmToolkitUpgrade_1-v21.png
[toolkit-upgrade-2]: ../images/references/IDAbpmToolkitUpgrade_2.png
[toolkit-upgrade-3-v21]: ../images/references/IDAbpmToolkitUpgrade_3-v21.png
[toolkit-upgrade-4]: ../images/install/ida_toolkit_copy_to_item.png
[database_schema_migration_page]: ../images/install/database_schema_migration_page.png
[database_schema_migration_page_execute]: ../images/install/database_schema_migration_page_execute.png
[database_schema_migration_page_execute_result]: ../images/install/database_schema_migration_page_execute_result.png
[database_schema_migration_page_download]: ../images/install/database_schema_migration_page_download.png
[database_schema_migration_page_downloaded_sql]: ../images/install/database_schema_migration_page_downloaded_sql.png
