---
title: "Operation"
category: references
date: 2018-11-25 15:17:55
last_modified_at: 2020-06-16 15:17:55
---

# How to operate and maintain IDA Application?

## Check the liberty log
There are three primary log files for a server.You can find logs in /wlp/output/your ida server/logs directory.
console.log
messages.log
trace.log 

If you find log infomation is not detail,you can dynamic change ida log level in runtime.You can login into ida application url then click Administrator->Setting menu,adjust the 
trace level.   

## JVM setting
To maximize performance, configure JVM heap size in WebSphere Liberty.  
1. Open the jvm.options file in <install_root>/web/wlp/usr/servers/defaultServer.  
2. Edit the file to add JVM arguments. Remove # in front of #-Xmx1024m and save the file.  

## SSL setting

We use the default keystore for the ssl.If you want to add your own certification,pls follow  below link.
https://www.ibm.com/support/knowledgecenter/SSEQTP_liberty/com.ibm.websphere.wlp.doc/ae/twlp_add_trust_cert.html


## Backup

If you want to migrate a new ida version,you need to backup your liberty server and database data.

### Backup Server
To back up ida deploy server, copy the server files that you want to preserve to a safe location. The server files are in the $WLP_USER_DIR/servers/server_name directory and its subdirectories. 
To avoid locking problems when copying the files, stop the server before backing up its files.

### Backup DB
To backup mysql db you can use mysqldump to create SQL-format dump files.You can reference mysql offical document.https://dev.mysql.com/doc/mysql-backup-excerpt/5.7/en/mysqldump-sql-format.html .   
If you have shell or telnet access to your web server, you can backup your MySQL data by using the mysqldump command. This command connects to the MySQL server and creates an SQL dump file.
mysqldump --opt -u [uname] -p[pass] [dbname] > [backupfile.sql]

If you use other DB like db2 and oralce,pls consultant your dba.

