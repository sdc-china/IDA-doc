
---
title: "Operations"
category: references
date: 2018-11-25 15:17:55
last_modified_at: 2020-06-16 15:17:55
---

# How to Operate and Maintain IDA Application?

## Check the Liberty Log
There are three primary log files for a server. You can find logs in the /wlp/output/your-ida-server/logs directory.
- console.log
- messages.log
- trace.log

If you find that the log information is not detailed enough, you can dynamically change the IDA log level at runtime. You can log in to the IDA application URL, then click Administrator -> Settings menu, and adjust the trace level.

## JVM Settings
To maximize performance, configure the JVM heap size in WebSphere Liberty.
1. Open the jvm.options file in <install_root>/web/wlp/usr/servers/defaultServer.
2. Edit the file to add JVM arguments. Remove # in front of #-Xmx1024m and save the file.

## SSL Settings
We use the default keystore for SSL. If you want to add your own certification, please follow the link below.
https://www.ibm.com/support/knowledgecenter/SSEQTP_liberty/com.ibm.websphere.wlp.doc/ae/twlp_add_trust_cert.html

## Backup
If you want to migrate to a new IDA version, you need to back up your Liberty server and database data.

### Backup Server
To back up the IDA deployment server, copy the server files that you want to preserve to a safe location. The server files are in the $WLP_USER_DIR/servers/server_name directory and its subdirectories. To avoid locking problems when copying the files, stop the server before backing up its files.

### Backup DB
To back up the MySQL database, you can use mysqldump to create SQL-format dump files. You can reference the official MySQL documentation: https://dev.mysql.com/doc/mysql-backup-excerpt/5.7/en/mysqldump-sql-format.html.

If you have shell or telnet access to your web server, you can back up your MySQL data by using the mysqldump command. This command connects to the MySQL server and creates an SQL dump file.
mysqldump --opt -u [username] -p[password] [database_name] > [backupfile.sql]

If you use other databases like DB2 and Oracle, please consult your DBA.