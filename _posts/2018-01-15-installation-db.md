---
layout: page
title: "DB Configuration"
category: installation
date: 2018-01-05 15:17:55
order: 2
---
### Install MySQL

We use MySQL as our default database. You can install mysql community edition based on the below link.  

[MySQL download](https://dev.mysql.com/downloads/mysql/)
   

**Create DB**   

Connect to the MySQL server and use MySQL command to create database. 
``` 
mysql> create database keter;
```  

**Execute DB scripts**  

Connect to the mysql server and switch to the **keter** DB and execute DB scripts **schema-mysql.sql**, **data-mysql.sql** to create the database tables and populate data.

You can execute the script with the mysql source command to execute script.Pls replace **yoursqlpath** to path of the sql folder location.

``` 
mysql> use keter ;
mysql> source yoursqlpath\schema-mysql.sql;
mysql> source yoursqlpath\data-mysql.sql;
```  

In MySQL 8.0, the default authentication plugin has changed from **mysql_native_password** to **caching_sha2_password**, and the 'root'@'localhost' administrative account uses caching_sha2_password by default. Please execute below script to use the previous default authentication plugin (**mysql_native_password**) in order to work with Keter.

``` 
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

**Notes:**   

You might need to change **data-mysql.sql** script for the your organization name. Please  replace 'keter' to your company name occur in the below script.The default keter login name and password is "KeterAdmin"/"KeterAdmin".Pls don't change this username and password in the sql file.

``` 
INSERT INTO organization (company_name, active) VALUES ('keter', true);
INSERT INTO user (user_name, password, role, active, organization_id) 
VALUES ('keterAdmin', '12d9f16eff974ae7730525b0dda228e2', 'ADMIN', true, (SELECT id FROM organization where company_name = 'keter'));
```  

### Install DB2

Keter also support DB2.If customer has db2 license,he can install Keter with DB2 10.X.  The following commands are based on you hava already 
create DB2 instance.

**Create DB**   

Login into the DB2 server and use DB2 command to create database. 
``` 
db2 create database KETER automatic storage yes using codeset UTF-8 territory US pagesize 32768
db2 connect to KETER
db2 CREATE BUFFERPOOL BP32K IMMEDIATE ALL DBPARTITIONNUMS SIZE AUTOMATIC NUMBLOCKPAGES 0 PAGESIZE 32 K
``` 

**Execute DB scripts**  

Start DB2 server and switch to the **keter** DB and execute DB scripts **schema-db2.sql**, **data-db2.sql** to create the database tables and populate data.You can change the schema name in the  **schema-db2.sql** if your db2 schema name is not same with the provided schema name you can change the corresponding schema name for your script.


``` 
db2 connect to KETER
db2 -stvf schema-db2.sql
db2 -stvf data-db2.sql
db2 connect reset
```  

You can use DB2 client tool(Data Studio) to vertify db table and data is in the database or not.
![][db2]   

**DB2 Driver**  
Differenct DB2 version has differenct driver.You can download jdbc version from below links.
http://www-01.ibm.com/support/docview.wss?uid=swg21363866
The IBM Data Server Driver for JDBC and SQLJ package includes two JDBC drivers:
db2jcc.jar - This driver is based on the JDBC 3 specification
db2jcc4.jar - This driver is based on the JDBC 4 or later specifications

In Keter deployment we only need  db2jcc4.jar.Copy the db2jcc4.jar from specfied driver package to the release package lib folder.When you run the package.bat it will copy this lib into the keter-web.war lib folder.

![][db2driver]  

[db2]: ../images/install/dbtable.png 
[db2driver]: ../images/install/db2driver.png 
