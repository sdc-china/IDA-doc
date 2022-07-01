---
title: "Database Installation and Configuration"
category: installation
date: 2018-09-19 15:17:55
last_modified_at: 2021-12-17 21:28:00
order: 2
---

# Database Installation and Configuration
***
## Install and Configure DB2

IDA supports DB2 v11.1+. Please refer to the following steps to setup DB2 environment. 

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

**Notes**:
- You will want to change [IDA_HOME]/sql/data-db2.sql script so that the organization matches your companies name. Please replace 'IDA' with your company name as outlined below.  The default IDA login name and password is "idaAdmin"/"idaAdmin".  


**Download DB2 Driver**  
You can download [JDBC for DB2 version 11.1 ](https://www-01.ibm.com/marketing/iwm/iwm/web/download.do?source=swg-idsdjs&pageType=urx&S_PKG=dl) 

## Install and Configure PostgreSQL DB

IDA supports PostgreSQL v14.3+. Download and install [PostgreSQL](https://www.postgresql.org/download/).  Please refer to the following steps to setup PostgreSQL environment. 

**Create Database**   

Connect to the PostgreSQL server and use psql command to create database. 
``` 
postgres=# create database ida;
```
**Execute DB Scripts**  

Connect to the PostgreSQL server and switch to the **ida** DB and execute DB scripts **schema-postgres.sql**, **data-postgres.sql** to create the database tables and populate data. These 2 SQL scripts can be found in the **sql** folder of IDA installation package.

You can execute the script with the PostgresSQL source command to execute script. Pls replace **yoursqlpath** to path of the SQL folder location.

``` 
postgres=# \c ida
ida=# \i 'yoursqlpath/schema-postgres.sql'
ida=# \i 'yoursqlpath/data-postgres.sql'
```

**Notes**:
- You will want to change [IDA_HOME]/sql/data-db2.sql script so that the organization matches your companies name. Please replace 'IDA' with your company name as outlined below.  The default IDA login name and password is "idaAdmin"/"idaAdmin".  

**Download PostgreSQL Driver**  
You can download JDBC for PostgreSQL version  from below link. We recommand you to use postgresql-42.2.8.jar since it is a tested verson.   

[postgresql-42.2.8.jar](https://jdbc.postgresql.org/download/postgresql-42.2.8.jar) 

## Install and Configure MySQL DB

IDA supports MySQL v5.7+. Download and install [MySQL](https://dev.mysql.com/downloads/mysql/).  Please refer to the following steps to setup MySQL environment. 

**Create Database**   

Connect to the MySQL server and use MySQL command to create database. 
``` 
mysql> create database IDA;
```  

**Execute DB Scripts**  

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

**Notes**:
- You will want to change [IDA_HOME]/sql/data-db2.sql script so that the organization matches your companies name. Please replace 'IDA' with your company name as outlined below.  The default IDA login name and password is "idaAdmin"/"idaAdmin".  

**Download mysql Driver**  
You can download JDBC for mysql version  from below link. We recommand you to use mysql-connector-java-5.1.44.jar since it is a tested verson.   

[mysql-connector-java-5.1.44.jar](http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.44/mysql-connector-java-5.1.44.jar) 

## Install and Configure Oracle

IDA supports Oracle Database Server 12c R2(v12.2.0.1 Enterprise Edition) and 19c(V19.3.0 Enterprise Edition). Please refer to the following steps to setup Oracle environment. 

**Create Database Instance**

Create a database instance named IDADB based on [doc](https://docs.oracle.com/database/121/ADMIN/create.htm#ADMIN002).

**Create Oracle User/Schema**   

Login into the Oracle database instance and execute below commands to create user/schema 'idaDbAdmin' with password 'idaDbAdmin'. You may use SQL*Plus and use command 'sqlplus SYS AS SYSDBA' to log into the database instance.
``` 
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER idaDbAdmin IDENTIFIED BY idaDbAdmin DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;
GRANT create session TO idaDbAdmin;
GRANT create table TO idaDbAdmin;
GRANT create view TO idaDbAdmin;
GRANT create sequence TO idaDbAdmin;
GRANT UNLIMITED TABLESPACE TO idaDbAdmin;
``` 

**Execute Oracle DB Scripts**  

Use SQL*Plus and command 'sqlplus idaDbAdmin' to log into the database instance, to switch to the **idaDbAdmin** DB Schema. Execute DB scripts **schema-oracle.sql**, **data-oracle.sql** to create the database tables and populate data. These 2 SQL scripts can be found in the **sql** folder of IDA installation package.

``` 
SQL > @/schema-oracle.sql
SQL > @/data-oracle.sql
```  

You can use DBeaver to verify database tables are created and populated with data. The Oracle DB connection info should be configured as follows(replace the Host with your Oracle DB host address):
![][dbeaver_oracle]

**Notes**:
- You will want to change [IDA_HOME]/sql/data-db2.sql script so that the organization matches your companies name. Please replace 'IDA' with your company name as outlined below.  The default IDA login name and password is "idaAdmin"/"idaAdmin".  

**Download Oracle Driver**  
You can download [Oracle Database 12.2.0.1 JDBC Driver](https://www.oracle.com/database/technologies/jdbc-ucp-122-downloads.html) or [Oracle Database 19c JDBC Driver](https://www.oracle.com/database/technologies/appdev/jdbc-ucp-19c-downloads.html)

[db2]: ../images/install/dbtable.png 
[db2driver]: ../images/install/db2driver.png 
[mysqldriver]: ../images/install/mysqldriver.png 
[dbeaver_oracle]: ../images/install/dbeaver_oracle.png  
