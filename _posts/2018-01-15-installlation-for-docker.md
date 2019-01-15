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


### Procedure

IDA supports Docker installatopm.Download docker script from the [Link](https://github.com/sdc-china/IDA-ondocker/blob/master/IDADockerScript.zip)          
1. Unzip the docker package into your machine.  

2. Manually copy the [mysql-connector-java-5.1.44.jar](http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.44/mysql-connector-java-5.1.44.jar) into the ida-web.war\WEB-INF\lib\ folder.You can get ida-web.war from the release package build folder.  

3. Copy the ida-web.war into the web folder from the docker package.   

 ![dockerpackage]
 
4. Into the selenium folder ,adjust the Selenium hub node number update "docker-compose.yml",. The default setting is start one Selenium Hub with 5 Firefox nodes and 5 Chrome nodes.Run below command to setup the selenium  gird.  

``` 
cd selenium
docker-compose up -d
```  
After that, open the browser http://dockerhostIP:4444/grid/console to check selenium grid/node installation status.  

![seleniumNode] 

5. Update docker environment variable.Open the "docker-compose.yml" replace the environment variables SERVER_HOST, HTTP_PORT and HTTPS_PORT with your actaul values.    

![dockerEnv]   
 
6. Run Docker compose build command,after that check docker images are generated or not.          

``` 
docker-compose build
```  

7. Start the IDA   

``` 
docker-compose up -d
```  
You can launch the url for https://yourip:yourhttpsport/ida       
You can stop the ida use docker-compose down command.   

``` 
docker-compose down -d
```  

[dockerpackage]: ../images/install/dockerpackage.png 
[seleniumNode]: ../images/install/selenium_node.png
[dockerEnv]: ../images/install/dockerenv.png

