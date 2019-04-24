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
2. Find migrate-mysql.sql in the sql folder. Copy the corresponding version sql into clipboard.   

![][mysqlmigration]   

3. Connect to the MySQL server and use IDA database.You can execute the script from the  clipboard. 

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


### Step 3: Update IDA v2.1.1 to IDA v2.2 

If you want to migrate IDA v2.1.1 to to IDA v2.2 version, you need to first create team then configure the team permission.        

1. Navigation to the Administration tab and click the *Team Configuration* link then click the add button to reate a team name and description.        
2. Select the team and click the button to set the appropriate permission setting for users,processApp,selenium grid.   

![][teampermission]     

3. After create the team permission,you can use this team to create project.          

### Update IDA v2.2 to v2.2.1 or higher version

If you want to migrate IDA v2.2 to to the newer version, e.g. v2.2.1 You could check the sql file in release package. See figure below,
![][sqlfolder]  
Then you could find migrate-mysql.sql, search version number (2.2.2) and then execute migration sql script for each consecutive version.
![][migration-sql]  

[yamlmigration]: ../images/install/productionyaml.png
[mysqlmigration]: ../images/install/mysqlmigration.png
[teampermission]: ../images/install/teampermission.png
[teamproject]: ../images/install/teamproject.png
[sqlfolder]: ../images/reference/sql-folder.png
[migration-sql]: ../images/reference/migration-sql-example.png
