---
title: "Post Installation Setup"
category: installation
date: 2018-01-09 15:17:55
last_modified_at: 2024-08-23 16:39:00
---

# Post Installation Setup

## Installing IDA BAW Toolkit
The testing capability can only launch the exposed Business Processes, Human Services, and AJAX Services. If you wish to test other services such as system services, integration services, or business processes which are not exposed directly, you need to install the IDA Toolkit.


BAW Version | IDA Toolkit Version  
     ----------------------|-------------------
      19.0.0.3 | IDA_Toolkit-8.6.1.19003.twx
      20.0.0.1 | IDA_Toolkit-8.6.2.20001.twx <br> **Due to product limitations, this version does not support [executeSQL](../references/references-test-command.html#executesql)**.
      20.0.0.2+ | IDA_Toolkit-8.6.2.20002.twx


1. Import the corresponding **IDA_Toolkit-8.6.x.x.twx** from [IDA Resources page](../administration/administration-resources.html) into your process center.      

2. Open your process app by the web process designer from the process center.

3. Click the **+** button after Toolkits.

  ![][click_add_button]

4. Type **ida** in the search box and select **8.6.x.0** below IDA Toolkit. Then the dependency **IDA Toolkit(8.6.x.0)** is added.

  ![][ida_toolkit_search]

5. Click **Services** below **IDA Toolkit(8.6.x.0)**. Right-click the **IDA Utility** service flow and copy the item to your process app.

  ![][ida_toolkit_copy]

  ![][ida_toolkit_copy_to_item]

6. If **IDA Utility** is in the Services of your Process app, the service is installed successfully.

  ![][service]

7. Modify toolkit access permission (Optional)

  For security concerns, we suggest disabling the toolkit in the BAW production environment.
  It allows the user to modify the toolkit access permission by setting up the environment variable "IDA_ACCESS". (true means enable the access, false means disable the access)

  By default, the toolkit can only be invoked on Development, Test, and Stage environments:
      ![][default_toolkit_setting]

  You can define the same environment variable "IDA_ACCESS" in your BAW application which will override the default setting in the toolkit, for example:
      ![][custom_toolkit_setting]

[click_add_button]: ../images/install/click_add_button.PNG
[ida_toolkit_search]: ../images/install/ida_toolkit_search.PNG
[ida_toolkit_copy]: ../images/install/ida_toolkit_copy.png
[ida_toolkit_copy_to_item]: ../images/install/ida_toolkit_copy_to_item.png
[default_toolkit_setting]: ../images/install/default_toolkit_setting.png  
[custom_toolkit_setting]: ../images/install/custom_toolkit_setting.png  
[service]: ../images/install/service.png

## Installing IDA Browser Plug-in

### Chrome plugin
Chrome plugin v3
- Open the url <a href="https://chromewebstore.google.com/detail/ida3/okfjgkfpccchnedafbkkijfjbfhhjkdf" target="_blank">https://chromewebstore.google.com/detail/ida3/okfjgkfpccchnedafbkkijfjbfhhjkdf</a>
- Click "Add to Chrome" button to install plug-in.
- The Chrome plugin offline installation package: **ida3-25.1.crx** can be downloaded from [IDA Resources page](../administration/administration-resources.html).
- For Chrome plugin to work on IDA web version >= 22.1.1, please configure the cookieSameSite attribute of http session on liberty server.xml or WAS console. See docs above.

Chrome plugin v2
- Open the url <a href="https://chromewebstore.google.com/search/IBM%20IDA" target="_blank">https://chromewebstore.google.com/search/IBM%20IDA</a>
- Click "Add to Chrome" button to install plug-in.
- The Chrome plugin offline installation package: **ida-25.1.crx** can be downloaded from [IDA Resources page](../administration/administration-resources.html).
- For Chrome plugin to work on IDA web version >= 22.1.1, please configure the cookieSameSite attribute of http session on liberty server.xml or WAS console. See docs above.
  
### Edge plugin
- The same IDA Chrome plugin can also be installed in Edge.
- Enable "Allow extensions from other stores." in the Edge Extensions settings page.
- Open the url <a href="https://chromewebstore.google.com/detail/ida3/okfjgkfpccchnedafbkkijfjbfhhjkdf" target="_blank">https://chromewebstore.google.com/detail/ida3/okfjgkfpccchnedafbkkijfjbfhhjkdf</a>(for plugin v3) or <a href="https://chromewebstore.google.com/search/IBM%20IDA" target="_blank">https://chromewebstore.google.com/search/IBM%20IDA</a>(for plugin v2)
- Click "Get" button, then click "Add extension" button to install plug-in.

### Firefox plugin
- Download Firefox plugin **ida-25.1.xpi** from [IDA Resources page](../administration/administration-resources.html).
- Drag the downloaded plugin file into firefox window.
- Click "Add" button.

### Plug-in Configuration

To make the plug-in work, you must log in to the IDA server in the plugin login page.

- Click the IDA plugin icon in the browser extension toolbar, then it will pop up the login window.

- Enter the IDA server URL, username, and password.

  ![][plugin_login]

- Click the "Sign in" button, then you will see the screenshot as below.

  ![][plugin_welcome]

- If you see the below sign-in errors, please open the server URL in your web browser to verify that IDA web can be accessed. If IDA web shows an HTTPS/SSL certificate warning, you must accept the warning manually by clicking "Proceed to ..." and then sign in to the IDA plugin.

  ![][plugin_login_error]

  ![][ida_web_cert_error]

[plugin_welcome]: ../images/install/plugin_welcome.png
[plugin_login]: ../images/install/plugin_login.png
[plugin_login_error]: ../images/install/plugin_login_error.png
[ida_web_cert_error]: ../images/install/ida_web_cert_error.png

## Installing Selenium Grid Server

IDA integrates with a remote testing automation framework based on Selenium Grid. IDA supports both version 4 and version 3 of Selenium Grid.

### Selenium Grid Sizes

Choosing a Grid role depends on what operating systems and browsers need to be supported, how many parallel sessions need to be executed, the number of available machines, and how powerful (CPU, RAM) those machines are.

Creating sessions concurrently relies on the available processors to the Distributor. For example, if a machine has 4 CPUs, the Distributor will only be able to create up to 4 sessions concurrently.

By default, the maximum number of concurrent sessions a Node supports is limited by the number of CPUs available. For example, if the Node machine has 8 CPUs, it can run up to 8 concurrent browser sessions (with the exception of Safari, which is always one). Additionally, it is expected that each browser session should use around 1GB RAM.

In general, it is recommended to have Nodes as small as possible. Instead of having a machine with 32 CPUs and 32GB RAM to run 32 concurrent browser sessions, it is better to have 32 small Nodes in order to better isolate processes. With this, if a Node fails, it will do so in an isolated manner. Docker is a good tool to achieve this approach.

Note that the default values (**1 CPU/1GB RAM per browser**) are a recommendation and may not apply to your context. It is recommended to use them as a reference, but measuring performance continuously will help determine the ideal values for your environment.

Grid sizes are relative to the number of supported concurrent sessions and the number of Nodes, and there is no "one size fits all." It is suggested to start with a small grid size, which contains 5 or fewer nodes. More nodes can be added in the future according to actual requirements.

### Installing Selenium Grid v4

**Notes**

Selenium Grid 4 can be set up in several modes: Standalone/Hub and Node/Distributed/Docker. For varied configuration details, please check the Selenium documentation below.

- [Selenium Grid TOML configuration options](https://www.selenium.dev/documentation/grid/configuration/toml_options/)

**Local installation**

1. Download the Selenium server jar [selenium-server-4.10.0.jar](https://github.com/SeleniumHQ/selenium/releases/download/selenium-4.10.0/selenium-server-4.10.0.jar).
2. Download Selenium web drivers and put them under the same folder as the Selenium server jar file.
   - [Firefox Driver](https://github.com/mozilla/geckodriver/releases)
   - [Chrome Driver](https://developer.chrome.com/docs/chromedriver/downloads)([Versions older than 114](https://chromedriver.storage.googleapis.com/index.html))
   - [Edge Driver](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver)
   - [IE Driver](https://www.selenium.dev/downloads/)
3. To quickly start Selenium 4 in standalone mode with default configurations, run the command below. This will set up a 1-node hub with auto-detected web drivers in the same folder as the jar file.
    ```
    java -jar selenium-server-4.10.0.jar standalone
    ```
    ![][selenium_4_standalone]
4. To start Selenium 4 in Hub and Node mode with customized node configuration,
  - create a config.toml file with the configuration below.

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

   [[node.driver-configuration]]
   display-name = "Edge"
   max-sessions = 5
   stereotype = "{\"browserName\": \"MicrosoftEdge\"}"
   ```

  - Run the commands below in different command lines.
   ```
   java -jar selenium-server-4.10.0.jar standalone --config config.toml
   ```

  ![][selenium_4_hub_node]

**Docker installation**

The following link provides detailed instructions on how to run Selenium 4 using Selenium Docker images: https://github.com/SeleniumHQ/docker-selenium. 

Docker Compose is the simplest way to start a Grid. 

1. Download [docker-compose-v3.yml](https://github.com/SeleniumHQ/docker-selenium/blob/trunk/docker-compose-v3.yml), and check the execution instructions at the top of each file. You can also edit the file to add more nodes by adding replicas. An example is as follows:

```
version: "3"
services:
  chrome:
    image: selenium/node-chrome:4.10.0
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
      - SE_NODE_MAX_SESSIONS=5
      - SE_NODE_OVERRIDE_MAX_SESSIONS=true

  firefox:
    image: selenium/node-firefox:4.10.0
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
      - SE_NODE_MAX_SESSIONS=5
      - SE_NODE_OVERRIDE_MAX_SESSIONS=true

  edge:
    image: selenium/node-edge:4.10.0
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
      - SE_NODE_MAX_SESSIONS=5
      - SE_NODE_OVERRIDE_MAX_SESSIONS=true

  selenium-hub:
    image: selenium/hub:4.10.0
    container_name: selenium-hub
    ports:
      - "4442:4442"
      - "4443:4443"
      - "4444:4444"
    restart: always
```

2. Start Selenium Grid 4.

```
docker-compose -f docker-compose-v3.yml up -d
```

3. Stop Selenium Grid 4.

```
docker-compose -f docker-compose-v3.yml down
```

![][selenium_4_hub_node_docker]

### Installing Selenium Grid v3

**Notes**

Below are the reference links for how to set up Selenium Grid. They include detailed parameter setting explanations.

- [Selenium Grid Setup Guidance](https://github.com/SeleniumHQ/selenium/wiki/Grid2)
- [Internet Explorer Driver Required Configuration](https://github.com/SeleniumHQ/selenium/wiki/InternetExplorerDriver#user-content-required-configuration)

**Local installation**

1. Download [Selenium Grid 3.141.59](https://github.com/SeleniumHQ/selenium/releases/download/selenium-3.141.59/selenium-server-standalone-3.141.59.jar)

2. Download Selenium web drivers and put them under the same folder as the Selenium Jar file.

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
         "maxInstances": 5
       },
       {
         "browserName": "chrome",
         "maxInstances": 5
       },
       {
         "browserName": "internet explorer",
         "platform": "WINDOWS",
         "maxInstances": 1
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
   To see the parameter meanings, you could run these scripts:

   ```
   java -jar .\selenium-server-standalone-3.141.59.jar -role node -help
   java -jar .\selenium-server-standalone-3.141.59.jar -role hub -help
   ```

**Docker installation**

The following link shows a step-by-step introduction to using the official Selenium Docker images with a basic Selenium Hub and Selenium Node configuration.

[Selenium: Getting-Started-with-Hub-and-Nodes](https://github.com/SeleniumHQ/docker-selenium/wiki/Getting-Started-with-Hub-and-Nodes)

You can follow the script below to install the Selenium Hub and Node on Docker. We recommend you install the debug image version so you can visually see what the browser is doing.

```
docker pull selenium/hub:3.141.59
docker pull selenium/node-firefox:3.141.59
docker pull selenium/node-chrome:3.141.59

docker network create grid
docker run -d -p 4444:4444 --net grid --name selenium-hub selenium/hub:3.141.59
docker run -d -P --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm selenium/node-chrome:3.141.59
docker run -d -P --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm selenium/node-firefox:3.141.59
```

You can run the command below multiple times; it will create multiple Chrome/Firefox nodes for the grid remote testing. It can provide you the ability to run Selenium testing in parallel on the Grid. We recommend creating more than 5 nodes for Chrome/Firefox each.

```
docker run -d -P --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm selenium/node-chrome:3.141.59
docker run -d -P --net grid -e HUB_HOST=selenium-hub  -v /dev/shm:/dev/shm selenium/node-firefox:3.141.59
```

After that, you can open the browser http://dockerhostIP:4444/grid/console to check the Selenium Grid/Node installation status.

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
