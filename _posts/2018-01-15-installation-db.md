---
title: "Database Installation and Configuration"
category: installation
date: 2018-01-05 15:17:55
order: 2
permalink: /installation/installation-db.html
---


### Install and Configure DB2

IDA supports DB2 v10.x+. Please refer to the following steps to setup DB2 environment. 

**Create DB Database**   

Login into the DB2 server and execute below DB2 commands to create database. 
``` 
db2 create database IDA automatic storage yes using codeset UTF-8 territory US pagesize 32768
db2 connect to IDA
db2 CREATE BUFFERPOOL BP32K IMMEDIATE ALL DBPARTITIONNUMS SIZE AUTOMATIC NUMBLOCKPAGES 0 PAGESIZE 32 K
``` 

**Execute DB Scripts**  


Start DB2 server and switch to the **IDA** DB and execute DB scripts **schema-db2.sql**, **data-db2.sql** to create the database tables and populate data. These 2 SQL scripts can be found in the **sql** folder of IDA installation package.


``` 
db2 connect to IDA
db2 -stvf schema-db2.sql
db2 -stvf data-db2.sql
db2 connect reset
```  

You can use DB2 client tool (Data Studio) to verify database tables are created and populated with data.

![][db2]   

##### Notes:
- You will want to change [IDA_HOME]/sql/data-db2.sql script so that   the organization matches your companies name. Please replace ‘IDA’ with your company name as outlined below.  The default IDA login name and password is “idaAdmin”/”idaAdmin”.  



**Download DB2 Driver**  
You can download [JDBC for DB2 version 11.1 ](https://www-01.ibm.com/marketing/iwm/iwm/web/download.do?source=swg-idsdjs&pageType=urx&S_PKG=dl) 

After download, extract the **db2jcc4.jar** from driver package and copy it to the lib folder of IDA installation package. Please note that you can also get the **db2jcc4.jar** from your DB2 server.

![][db2driver]  


### Install and Configure MySQL DB

IDA supports MySQL v8.0. Download and install [MySQL](https://dev.mysql.com/downloads/mysql/).  Please refer to the following steps to setup MySQL environment. 

**Create Database**   

Connect to the MySQL server and use MySQL command to create database. 
``` 
mysql> create database IDA;
```  

**Execute DB Scripts**  

##### Notes:
- You will want to change [IDA_HOME]/sql/data-mysql.sql script so that  the organization matches your companies name. Please replace ‘IDA’ with your company name as outlined below.  The default IDA login name and password is “idaAdmin”/”idaAdmin”.  


Connect to the MySQL server and switch to the **IDA** DB and execute DB scripts **schema-mysql.sql**, **data-mysql.sql** to create the database tables and populate data. These 2 SQL scripts can be found in the **sql** folder of IDA installation package.

You can execute the script with the MySQL source command to execute script. Pls replace **yoursqlpath** to path of the SQL folder location.

``` 
mysql> use IDA ;
mysql> source yoursqlpath\schema-mysql.sql;
mysql> source yoursqlpath\data-mysql.sql;
```  

In MySQL 8.0, the default authentication plugin has changed from **mysql_native_password** to **caching_sha2_password**, and the 'root'@'localhost' administrative account uses caching_sha2_password by default. Please execute below script to use the previous default authentication plugin (**mysql_native_password**) in order to work with IDA.

``` 
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

**Notes:**   

You might need to change **data-mysql.sql** script for the your organization name. Please  replace 'IDA' to your company name occur in the below script. The default IDA login name and password is "idaAdmin"/"idaAdmin". Please don't change this username and password in the SQL file.

``` 
INSERT INTO organization (company_name, active) VALUES ('IDA', true);
INSERT INTO user (user_name, password, role, active, organization_id) 
VALUES ('idaAdmin', 'b1d2e11b343783a14f6f8362b294bb22', 'ADMIN', true, (SELECT id FROM organization where company_name = 'IDA'));
```  
**Download mysql Driver**  
You can download JDBC for mysql version  from below link. We recommand you to use mysql-connector-java-5.1.44.jar since it is a tested verson.   

[mysql-connector-java-5.1.44.jar](http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.44/mysql-connector-java-5.1.44.jar) 

After download,  copy mysql-connector-java-5.1.44.jar to the lib folder of IDA installation package.      

![][mysqldriver]    

[db2]: ../images/install/dbtable.png 
[db2driver]: ../images/install/db2driver.png 
[mysqldriver]: ../images/install/mysqldriver.png 
