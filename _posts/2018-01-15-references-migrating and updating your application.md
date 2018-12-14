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

To update IDA.war, take the following steps: 

1. Find  ida.properties under conf folder in the previous version.
2. Find the previous version ida.properties property values and reconfigure  IDA.propertie in the currenct version.
3. Click the package.bat command to repackage the IDA.war file.
4. Remove the old IDA.war from wlp installation\usr\servers\default\apps folder.     
5. Copy the new IDA.war into the wlp installation\usr\servers\default\apps folder.    
6. Start the Liberty Server.  


### Step 3: Update Keter 1.3.x to IDA 2.0.0(optional)

If you want to migrate keter to to IDA version, take the following steps:     

1. Open the server.xml of liberty and make sure keter-web.war is changed to ida-web.war and application id and name is also changed 
to ida. If your liberty has setup keyStore password before,you don;t need to change defaultKeyStore password, just keep orignal one,otherwise you need to create a passowrd for the defaultKeyStore.            
   

```                     
    <!-- Automatically expand WAR files and EAR files -->
    <applicationManager autoExpand="true" startTimeout="360s" stopTimeout="120s"/> 
	<application type="war" id="ida" name="ida" location="${server.config.dir}/apps/ida-web.war">
		<classloader delegation="parentLast" />
    </application>
	
	<keyStore id="defaultKeyStore" password="idaAdmin" />

``` 
2. Use IDA toolkit to replace Keter toolkit for the BPM.Both toolkit are compatible for usage.      
3. Use latested chrome and fixfox plug-in.       

 **Notes**     
 Please not overwrite ida.properties from previous version since property values will change in some versions.   

[yamlmigration]: ../images/install/productionyaml.png
[mysqlmigration]: ../images/install/mysqlmigration.png
