---
layout: page
title: "Post Installation Setup"
category: installation
date: 2018-01-05 15:17:55
order: 5
---



### Selenium Grid

Keter integrates with remote testing automation based on Selenium Grid.

**Local installation**

[Selenium Grid setup guidance](https://github.com/SeleniumHQ/selenium/wiki/Grid2)  


1. [Download](http://selenium-release.storage.googleapis.com/3.7/selenium-server-standalone-3.7.1.jar ) Selenium Grid server jar.  
   [Download](https://www.seleniumhq.org/download/) selenium web driver and copy the selenium web driver to  selenium-java-3.7.1        folder.The file strcture shoule like below.

  ![][seleniumGrid]

2. Copy below script to startNode.bat file . 
   
```
java -Dwebdriver.gecko.driver="./selenium-java-3.7.1/geckodriver.exe" -Dwebdriver.chrome.driver="./selenium-java-3.7.1/chromedriver.exe" -Dwebdriver.ie.driver="./selenium-java-3.7.1/IEDriverServer.exe" -jar selenium-server-standalone-3.7.1.jar -role node -hub http://localhost:4444/grid/register/ -timeout 30 -browserTimeout 30   
```

3. Copy below script to startHub.bat file.  

```
java -jar selenium-server-standalone-3.7.1.jar -role hub -newSessionWaitTimeout 10 -timeout 30 -browserTimeout 30    
```

4.Run the startNode.bat and startHub.bat to start the Node and Hub.

**Notes:**

In order to use IE browser or chrome for replay the test case, you need to set the driver path for the selenium server.See below example.

java -Dwebdriver.ie.driver="C:\XXX\IEDriverServer.exe"
-Dwebdriver.chrome.driver="C:\XXX\chromedriver.exe" -jar 
selenium-server-standalone-3.7.1.jar -role node -hub http://localhost:4444/grid/register/ -port 4444

**Docker installation**

The below link is a step-by-step introduction to using the official Selenium Docker images using a basic hub/node configuration.

[How to get started selenium hub and node](https://github.com/SeleniumHQ/docker-selenium/wiki/Getting-Started-with-Hub-and-Nodes)

### Install Keter Toolkit

1. Import the Keter_Toolkit - 8.6.0_v1.0.twx from toolkit folder into the proces center.
2. Add this toolkit dependency for your Process App
3. Right click the "Keter Utility" service flow and copy item to your process app.  

   ![][toolkit]
4. Make sure the service is installed in your process app.  
   ![][service]
   
### Plug-in
If you use Chrome browser,pls follower the below steps.

Install the Chrome [plug-in](https://chrome.google.com/webstore/search/keter)

  
   ![][keter]


If you use Firefox browser,pls follower the below steps.
1. Install Firefox [Add-ons](https://addons.mozilla.org/en-US/firefox/addon/keter)
2. Open the Firefox browser and input the **about:config**
3. Make sure the preference name "dom.allow_scripts_to_close_windows" value is true.

  ![][firefox]



[toolkit]: ../images/install/toolkit.png 
[service]: ../images/install/service.png 
[keter]: ../images/install/keter.png 
[firefox]: ../images/install/firefox.png
[seleniumGrid]: ../images/install/seleniumGrid.png





