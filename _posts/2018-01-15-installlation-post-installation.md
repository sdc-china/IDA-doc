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

Selenium Grid setup guidance:  
https://github.com/SeleniumHQ/selenium/wiki/Grid2  

1. [Download](http://selenium-release.storage.googleapis.com/3.7/selenium-server-standalone-3.7.1.jar ) Selenium Grid server jar.  

2. Start Selenium Grid Hub   
java -jar selenium-server-standalone-3.7.1.jar -role hub -port 4444  

3. Start Selenium Grid Node  
java -jar selenium-server-standalone-3.7.1.jar -role node -hub http://localhost:4444/grid/register/ -port 4444

**Docker installation**

The below link is a step-by-step introduction to using the official Selenium Docker images using a basic hub/node configuration.

[How to get started selenium hub and node](https://github.com/SeleniumHQ/docker-selenium/wiki/Getting-Started-with-Hub-and-Nodes)

### Install BPM Testing Asset Toolkit

1. Import the Keter_Toolkit - 8.6.0_v1.0.twx from toolkit folder into the proces center.
2. Add this toolkit dependency for your Process App
3. Right click the "Keter Utility" service flow and copy item to your process app.  

   ![][toolkit]
4. Make sure the service is installed in your process app.  
   ![][service]
   
### Plug-in
You need to install this plug-in to record the UI.By now we only support chrome browser to record test case.

1. Download the recorder plug-in from Keter Home page.
2. Open the chrome browser and input the **chrome://extensions/**
3. Drag and drop the .CRX file onto the chrome extension page
4. Click the **Add extension** button in the prompt at the bottom of the screen
  
[toolkit]: ../images/install/toolkit.png 
[service]: ../images/install/service.png 





