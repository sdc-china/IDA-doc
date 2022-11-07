---
title: "Post Installation Setup"
category: installation
date: 2018-01-09 15:17:55
last_modified_at: 2022-04-22 16:39:00
---

# Post Installation Setup

IDA integrates with remote testing automation framework based on Selenium Grid. IDA supports both version 4 and version 3 of Selenium Grid.

## Selenium Grid v4

**Notes**

Selenium Grid 4 can be set up in the serveral modes: Standalone/Hub and Node/Distributed/Docker. For varied configuration details, please check Selenium documentation below.

- [Selenium Grid TOML configuration options](https://www.selenium.dev/documentation/grid/configuration/toml_options/)

**Local installation**

1. Download the latest Selenium server jar [selenium-server-4.x.x.jar](https://www.selenium.dev/downloads/).
2. Download Selenium web drivers and put them under the same folder of the Selenium server jar file.
   - [Firefox Driver](https://github.com/mozilla/geckodriver/releases)
   - [Chrome Driver](https://chromedriver.storage.googleapis.com/index.html)
   - [IE Driver](https://www.selenium.dev/downloads/)
   - [Edge Driver](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/)
3. To quickly start Selenium 4 in standalone mode with default configurations, run the command below. This will setup a 1-node hub with auto-detected webdrivers in the same folder as the jar file.
    ```
      java -jar selenium-server-4.x.x.jar standalone
    ```
    ![][selenium_4_standalone]
4. To start Selenium 4 in Hub and Node mode with customized node configuration,
  - create a config.toml file with configuration below.
  ```
  [node]
  detect-drivers = false
  [[node.driver-configuration]]
  display-name = "Firefox"  
  max-sessions = 5
  stereotype = "{\"browserName\": \"firefox\"}"
  [[node.driver-configuration]]
  display-name = "Chrome"
  max-sessions = 5
  stereotype = "{\"browserName\": \"chrome\"}"
  ```
  - Run commands below in different commandlines.
  ```
    java -jar selenium-server-4.x.x.jar hub
    java -jar selenium-server-4.x.x.jar node --config config.toml
  ```
  ![][selenium_4_hub_node]

**Docker installation**

The following link provides detailed instructions on how to run Selenium 4 using Selenium Docker images: https://github.com/SeleniumHQ/docker-selenium. 

Docker Compose is the simplest way to start a Grid. 

1. Download [docker-compose-v3.yml](https://github.com/SeleniumHQ/docker-selenium/blob/trunk/docker-compose-v3.yml), and check the execution instructions on top of each file. You can also edit the file to add more nodes by adding replicas. An example as follows:

```
version: "3"
services:
  chrome:
    image: selenium/node-chrome:4.1.1-20211217
    shm_size: 2gb
    depends_on:
      - selenium-hub
    deploy:
        replicas: 5
    restart: always
    environment:
      - SE_EVENT_BUS_HOST=selenium-hub
      - SE_EVENT_BUS_PUBLISH_PORT=4442
      - SE_EVENT_BUS_SUBSCRIBE_PORT=4443
      - SE_NODE_MAX_SESSIONS=2
      - SE_NODE_OVERRIDE_MAX_SESSIONS=true

  firefox:
    image: selenium/node-firefox:4.1.1-20211217
    shm_size: 2gb
    depends_on:
      - selenium-hub
    deploy:
        replicas: 5
    restart: always
    environment:
      - SE_EVENT_BUS_HOST=selenium-hub
      - SE_EVENT_BUS_PUBLISH_PORT=4442
      - SE_EVENT_BUS_SUBSCRIBE_PORT=4443
      - SE_NODE_MAX_SESSIONS=2
      - SE_NODE_OVERRIDE_MAX_SESSIONS=true

  selenium-hub:
    image: selenium/hub:4.1.1-20211217
    container_name: selenium-hub
    ports:
      - "4442:4442"
      - "4443:4443"
      - "4444:4444"
    restart: always
```

2. Run commands below to start / stop Selenium Grid 4.

```
docker-compose -f docker-compose-v3.yml up
docker-compose -f docker-compose-v3.yml down
```

![][selenium_4_hub_node_docker]

## Selenium Grid v3

**Notes**

Below is the reference link for how to setup selenium grid. It includes the detail parameter setting explanation.

- [Selenium Grid Setup Guidance](https://github.com/SeleniumHQ/selenium/wiki/Grid2)
- [Internet Explorer Driver Required Configuration](https://github.com/SeleniumHQ/selenium/wiki/InternetExplorerDriver#user-content-required-configuration)

**Local installation**

1. Download [Selenium Grid 3.141.59](https://github.com/SeleniumHQ/selenium/releases/download/selenium-3.141.59/selenium-server-standalone-3.141.59.jar)

2. Download Selenium web drivers and put them under the same folder of the Selenium Jar file.

   - [IE Driver](https://www.selenium.dev/downloads/)
   - [Firefox Driver Win64](https://github.com/mozilla/geckodriver/releases)
   - [Firefox Driver Linux64](https://github.com/mozilla/geckodriver/releases)
   - [Chrome Driver Win32](https://sites.google.com/a/chromium.org/chromedriver/)
   - [Chrome Driver Linux64](https://sites.google.com/a/chromium.org/chromedriver/)

3. Start the Hub
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
        "capabilities": [
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
        "servlets": [],
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

You can do the below command mutiple times,it will create mutiple chrome/firefox node for the grid remote testing. It can provide you to run the selenium tesing parallel in the Grid.We recommand you to create above 5 node number for chrome/firefox each.

```
docker run -d -P --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm selenium/node-chrome:3.141.59-palladium
docker run -d -P --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm selenium/node-firefox:3.141.59-palladium

```

After that you can open the browser http://dockerhostIP:4444/grid/console to check selenium grid/node installation status.

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
[selenium_4_standalone]: ../images/install/selenium_4_standalone.png
[selenium_4_hub_node]: ../images/install/selenium_4_hub_node.png
[selenium_4_hub_node_docker]: ../images/install/selenium_4_hub_node_docker.png
