---
title: "Start and Stop IDA environment"
category: administration
date: 2018-10-23 15:17:55
last_modified_at: 2019-07-29 16:23:00
order: 10
---

# Start and Stop IDA environment
***

##	Starting your environment

### Start MySQL
Start the MySQL server by calling the following command:

- Linux: [MYSQL_HOME]/bin/mysqld

- Windows: [MYSQL_HOME]\bin\mysqld.exe




### Start WebSphere Liberty
Start the WebSphere Liberty server by calling the following command:

- Linux: [IDA_HOME]/bin/server start [SERVER_NAME]


- Windows: [IDA_HOME]\bin\server.bat start [SERVER_NAME]   


##	Stopping your environment

###	Stop WebSphere Liberty
Stop the WebSphere Liberty server by calling the following command:

- Linux: [IDA_HOME]/bin/server stop [SERVER_NAME]


- Windows: [IDA_HOME]\bin\server.bat stop [SERVER_NAME]   

###	Stop Selenium Node
Stop the Selenium Node by terminating the corresponding java process.


###	Stop Selenium Hub

Stop the Selenium Grid by terminating the corresponding java process

###	Stop MySQL
Stop the MySQL server by calling the following command:

- Linux: [MYSQL_HOME]/bin/mysqladmin -uroot  shutdown

- Windows: [MYSQL_HOME]\bin\mysqladmin.exe -uroot  shutdown
