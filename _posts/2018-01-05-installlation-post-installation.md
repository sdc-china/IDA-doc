---
title: "Post Installation Setup"
category: installation
date: 2018-09-22 15:17:55
last_modified_at: 2019-07-25 21:39:00
order: 5
---

# Post Installation Setup
***
### Selenium Grid

IDA integrates with remote testing automation framework based on Selenium Grid.

##### Notes

Below is the reference link for how to setup selenium grid.It includes the detail parameter setting explanation.   
- [Selenium Grid Setup Guidance](https://github.com/SeleniumHQ/selenium/wiki/Grid2)  
- [Internet Explorer Driver Required Configuration](https://github.com/SeleniumHQ/selenium/wiki/InternetExplorerDriver#user-content-required-configuration)       

**Local installation**

1. Download [Selenium Latest](https://www.selenium.dev/downloads/)  

2. Download Selenium web drivers and put them under the same folder of the Selenium Jar file.

	- [IE Driver](https://www.selenium.dev/downloads/)
	- [Firefox Driver Win64](https://github.com/mozilla/geckodriver/releases)
	- [Firefox Driver Linux64](https://github.com/mozilla/geckodriver/releases)
	- [Chrome Driver Win32](https://sites.google.com/a/chromium.org/chromedriver/)  
	- [Chrome Driver Linux64](https://sites.google.com/a/chromium.org/chromedriver/) 
   
3. Start the Hub

[Setting up your own Grid](https://www.selenium.dev/documentation/en/grid/setting_up_your_own_grid/)

	- Create hubconfig.json
		```
		{
		  "port": 4444,
		  "newSessionWaitTimeout": 10000,
		  "servlets" : [],
		  "withoutServlets": [],
		  "custom": {},
		  "capabilityMatcher": "org.openqa.grid.internal.utils.DefaultCapabilityMatcher",
		  "registry": "org.openqa.grid.internal.DefaultGridRegistry",
		  "throwOnCapabilityNotPresent": true,
		  "cleanUpCycle": 5000,
		  "role": "hub",
		  "debug": false,
		  "browserTimeout": 60,
		  "timeout": 60
		}
		```
	- Run the command
		```
		java -jar selenium-server-standalone-3.141.59.jar -role hub -hubConfig hubconfig.json
		```

4. Start the Node  

	- Create nodeconfig.json
		```
		{
		  "capabilities":
		  [
		    {
		      "browserName": "firefox",
		      "marionette": true,
		      "maxInstances": 5,
		      "seleniumProtocol": "WebDriver",
			    "version": 67
		    },
		    {
		      "browserName": "chrome",
		      "maxInstances": 5,
		      "seleniumProtocol": "WebDriver",
			  "version": 75
		    },
		    {
		      "browserName": "internet explorer",
		      "platform": "WINDOWS",
		      "maxInstances": 1,
		      "seleniumProtocol": "WebDriver",
			  "version": 11
		    }
		  ],
		  "proxy": "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
		  "maxSession": 5,
		  "port": -1,
		  "register": true,
		  "registerCycle": 5000,
		  "hub": "http://localhost:4444",
		  "nodeStatusCheckTimeout": 5000,
		  "nodePolling": 5000,
		  "role": "node",
		  "unregisterIfStillDownAfter": 60000,
		  "downPollingLimit": 2,
		  "debug": false,
		  "servlets" : [],
		  "withoutServlets": [],
		  "custom": {},
		  "browserTimeout": 60,
		  "timeout": 60
		}
		```
	- Run the command
		```
		java -jar selenium-server-standalone-3.141.59.jar -role node -nodeConfig nodeconfig.json
		```
  **Notes:**
  To see the parameters meanings, you could run scripts:

    ```
    java -jar .\selenium-server-standalone-3.141.59.jar -role node -help
    java -jar .\selenium-server-standalone-3.141.59.jar -role hub -help
    ```



**Docker installation**

The followingThe below link is shows a step-by-step introduction to using the official Selenium Docker images using a basic Selemium Hub and Selenium Node configuration.

[Selenium: Getting-Started-with-Hub-and-Nodes](https://github.com/SeleniumHQ/docker-selenium/wiki/Getting-Started-with-Hub-and-Nodes)

You can follow below script to install Selenium Hub and Node on docker.We recommand you to install debug image version so you can visually see what the browser is doing.

``` 
docker pull selenium/hub:3.141.59-palladium    
docker pull selenium/node-firefox:3.141.59-palladium
docker pull selenium/node-chrome:3.141.59-palladium   


docker network create grid
docker run -d -p 4444:4444 --net grid --name selenium-hub selenium/hub:3.141.59-palladium    
docker run -d -P --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm selenium/node-chrome:3.141.59-palladium
docker run -d -P --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm selenium/node-firefox:3.141.59-palladium

``` 
You can do the below command mutiple times,it will create mutiple chrome/firefox node for the grid remote testing. It can provide you to run the  selenium tesing parallel in the Grid.We recommand you to create above  5 node number for chrome/firefox each.   

``` 
docker run -d -P --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm selenium/node-chrome:3.141.59-palladium
docker run -d -P --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm selenium/node-firefox:3.141.59-palladium 

``` 
After that you can open the browser http://dockerhostIP:4444/grid/console to check selenium grid/node  installation status.    

  ![][selenium_node]


   
   [error]: ../images/install/installation_self_signed_sertificates_error.png 
   [tool]: ../images/install/installation_self_signed_sertificates_tool.png 
   [security_tab]: ../images/install/installation_self_signed_sertificates_security_tab.png
   [servers_tab]: ../images/install/installation_self_signed_sertificates_servers_tab.png
   [add_security]: ../images/install/installation_self_signed_sertificates_add_security.png
   [success]: ../images/install/installation_self_signed_sertificates_success.png 
   [chrome_error]: ../images/install/installation_self_signed_sertificates_chrome_error.png
   [proceed]: ../images/install/installation_self_signed_sertificates_proceed.png
   [selenium_node]: ../images/install/selenium_node.png

### Monitoring configuration (Optional)

You could refer to [Monitoring configuration](../administration/administration_monitoring configuration.html) to enable monitoring feature of IDA.
