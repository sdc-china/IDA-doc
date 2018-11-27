---
layout: page
title: "Start and Stop IDA environment"
category: administration
date: 2018-01-05 15:17:55
order: 10
---

##	Starting your environment

### Start MySQL
Start the MySQL server by calling the following command:

- Linux: [MYSQL_HOME]/bin/mysqld

- Windows: [MYSQL_HOME]\bin\mysqld.exe

### Start Selenium Hub

Start the Selenium Hub by calling the following command:

- Linux: [JAVA_HOME]/bin/java -jar [SELENIUM_HOME]/selenium-server-standalone-3.14.0.jar -role hub -newSessionWaitTimeout 10 -timeout 30 -browserTimeout 30

- Windows: [JAVA_HOME]\bin\java.exe -jar [SELENIUM_HOME]\selenium-server-standalone-3.14.0.jar -role hub -newSessionWaitTimeout 10 -timeout 30 -browserTimeout 30


### Start Selenium Node
Start the Selenium Node by calling the following command:

- Linux: [JAVA_HOME]/bin/java -Dwebdriver.gecko.driver="[SELENIUM_HOME]/geckodriver.exe" -Dwebdriver.chrome.driver="[SELENIUM_HOME]/chromedriver.exe" -Dwebdriver.ie.driver="[SELENIUM_HOME]/IEDriverServer.exe" -jar [SELENIUM_HOME]/selenium-server-standalone-3.14.0.jar -role node -hub http://localhost:4444/grid/register/ -timeout 30 -browserTimeout 30   


- Windows: [JAVA_HOME]\bin\java.exe -Dwebdriver.gecko.driver="[SELENIUM_HOME]/geckodriver.exe" -Dwebdriver.chrome.driver="[SELENIUM_HOME]/chromedriver.exe" -Dwebdriver.ie.driver="[SELENIUM_HOME]/IEDriverServer.exe" -jar [SELENIUM_HOME]\selenium-server-standalone-3.14.0.jar -role node -hub http://localhost:4444/grid/register/ -timeout 30 -browserTimeout 30   



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
