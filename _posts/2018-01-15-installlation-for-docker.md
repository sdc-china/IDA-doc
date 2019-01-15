---
layout: page
title: "Install IDA on Docker"
category: installation
date: 2018-01-05 15:17:55
order: 5
---



### Supported Platforms

* Ubuntu    
* CentOS  
* Red Hat Enterprise Linux  
* Windows 10  
* MAC OS  

### Software Prerequisites

* [Docker CE](https://docs.docker.com/install/)   
* [Docker Compose](https://docs.docker.com/compose/install/)  
* Docker Script   
* IDA release package
##### Notes:
- Your installation need to access internet. 
- IDA Docker installation only for DEV testing purpose.       
- We map the mysql volumn for the /var/mysql/demo_data directory for customer to backup the mysql database.     

### Procedure

IDA supports Docker installatopm.Download docker script from the [Link](https://github.com/sdc-china/IDA-ondocker/raw/master/IDADockerScript.zip)          
1. Unzip the docker package IDADockerScript.zip into your machine.  

2. Manually copy the [mysql-connector-java-5.1.44.jar](http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.44/mysql-connector-java-5.1.44.jar) into the ida-web.war\WEB-INF\lib\ folder.You can get ida-web.war from the release package build folder.  

3. Copy the ida-web.war into the web folder from the docker package.   

    ![dockerpackage]
 
4. Into the selenium folder ,adjust the Selenium hub node number update "docker-compose.yml",. The default setting is start one Selenium Hub with 5 Firefox nodes and 5 Chrome nodes.Run below command to setup the selenium  gird.  

``` 
cd selenium
docker-compose up -d
```  
5. After that, open the browser http://dockerhostIP:4444/grid/console to check selenium grid/node installation status.    

    ![seleniumNode]  
    
6. Update docker environment variable.Open the "docker-compose.yml" replace the environment variables SERVER_HOST, HTTP_PORT and HTTPS_PORT with your actaul values.    

     ![dockerEnv]   
 
7. Run Docker compose build command,after that check docker images are generated or not.          

``` 
docker-compose build
```  

8. Start the IDA   

``` 
docker-compose up -d
```  
After start the You can launch the ida application through the url for https://yourip:yourhttpsport/ida     

9. Stop the IDA   
  
You can stop the ida use docker-compose down command.   

``` 
docker-compose down -d
```  
### Debug Selenium Container with RealVNC Viewer

1. You can download the [real-vnc](https://www.realvnc.com/en/connect/download/viewer). and Install as per your operating system.  
2. Check  the selenium container we should verify the Container Process and Port Details. Use below command to check selenium port.

``` 
docker ps|grep  selenium
```  
   ![seleniumPort]   
You can acquire the port by looking at the container details Like from the Image above we can see the VNC server is listening on the Port No: 5906  
  
3. Open real VNC viewer,connect with docker ip and port no to connect.

    ![vncviewer]  
4. When you are prompted for the password pls eneter secret.     
5. Running Our Test on the correct Port number will Open the Google in our Container and We can see the Browser running in our VNC Server.   
    ![vncviewerbrowser] 
    
[dockerpackage]: ../images/install/dockerpackage.png 
[seleniumNode]: ../images/install/selenium_node.png
[dockerEnv]: ../images/install/dockerenv.png
[seleniumPort]: ../images/install/seleniumgrid.png
[vncviewer]: ../images/install/vncviewer.png
[vncviewerbrowser]: ../images/install/vnc-view-browser.png