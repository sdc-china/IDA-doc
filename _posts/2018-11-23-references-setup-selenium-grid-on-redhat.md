---
title: "Setup Selenium Grid on RedHat"
category: references
date: 2018-11-23 15:39:00
last_modified_at: 2020-10-27 15:39:00
---

# Setup Selenium Grid on RedHat

## Install specific Firefox version for testing

Search Firefox install package by version from [http://ftp.mozilla.org/pub/firefox/releases/](http://ftp.mozilla.org/pub/firefox/releases/). We suggest to install the latest version of Firefox.

Use Firefox v137.0.1 as example:

```
## Unlink previous version of Firefox
unlink /usr/bin/firefox

## Download Firefox installation package
wget http://ftp.mozilla.org/pub/firefox/releases/137.0.1/linux-x86_64/en-US/firefox-137.0.1.tar.xz

## Uncompress installation package to /usr/local/ folder
tar xvf firefox-137.0.1.tar.xz -C /usr/local/

## Create link for Firefox binary file
sudo ln -s /usr/local/firefox/firefox /usr/bin/firefox

## Firefox Dependency
yum install gtk3 -y

## Check Firefox version
firefox --version
```

## Install specific Chrome version for testing

Search Chrome install package by version from [https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json](https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json). We suggest to install the latest version of Chrome.

Use Chrome v134.0.6998.165 as example:

```
## Unlink previous version of Chrome
unlink /usr/bin/google-chrome

## Download Chrome installation package
wget https://storage.googleapis.com/chrome-for-testing-public/134.0.6998.165/linux64/chrome-linux64.zip

## Uncompress installation package to /usr/local/ folder
unzip chrome-linux64.zip -d /usr/local/

## Create link for Chrome binary file
sudo ln -s /usr/local/chrome-linux64/chrome /usr/bin/google-chrome

## Chrome Dependencies for Redhat 8.10
yum install at-spi2-atk -y
yum install mesa-libgbm -y
yum install alsa-lib -y

## Check Chrome version
google-chrome --version

## Test Chrome
google-chrome --headless --disable-gpu --dump-dom https://www.chromestatus.com/
```

## Install Latest Chrome by RPM

```
## Download latest Chrome RPM installation package
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

## Install Chrome by RPM
yum -y localinstall google-chrome-stable_current_x86_64.rpm

## Check Chrome version
google-chrome --version

## Test Chrome
google-chrome --headless --disable-gpu --dump-dom https://www.chromestatus.com/
```

## Setup Selenium Grid Server

### Create folder for Selenium Grid Server
We use **/opt/selenium** folder as an example, you can change it to any other folder.

```
mkdir -p /opt/selenium
cd /opt/selenium
mkdir -p /opt/selenium/conf
mkdir -p /opt/selenium/logs
```

### Download Selenium Grid Jar

Selenium Grid Server v3.141.59 Jar can be download from the link: [https://github.com/SeleniumHQ/selenium/releases/download/selenium-3.141.59/selenium-server-standalone-3.141.59.jar](https://github.com/SeleniumHQ/selenium/releases/download/selenium-3.141.59/selenium-server-standalone-3.141.59.jar)

Please download the Jar file to the folder **/opt/selenium**.

### Download Firefox and Chrome WebDrivers

The Firefox and Chrome driver version should align with the installed browser version.

For Firefox, you can download the latest firefox driver version from the link: [https://github.com/mozilla/geckodriver/releases](https://github.com/mozilla/geckodriver/releases)

Eg: Firefox geckodriver v0.36.0 download link: [https://github.com/mozilla/geckodriver/releases/download/v0.36.0/geckodriver-v0.36.0-linux64.tar.gz](https://github.com/mozilla/geckodriver/releases/download/v0.36.0/geckodriver-v0.36.0-linux64.tar.gz)

For Chrome, you can search the installed Chrome version in the JSON ([https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json](https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json)), then download the corresponding chrome driver version.

Eg: Chrome driver v134.0.6998.165 download link: [https://storage.googleapis.com/chrome-for-testing-public/134.0.6998.165/linux64/chromedriver-linux64.zip](https://storage.googleapis.com/chrome-for-testing-public/134.0.6998.165/linux64/chromedriver-linux64.zip)

Please download and uncompress the webdriver files(the file names are **geckodriver** and **chromedriver**) to the folder **/opt/selenium**.

### Create hubconfig.json

```
cat > /opt/selenium/conf/hubconfig.json<< EOF
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
EOF
```

### Create nodeconfig.json

```
cat > /opt/selenium/conf/nodeconfig.json<< EOF
{
  "capabilities":
  [
    {
      "browserName": "firefox",
      "marionette": true,
      "maxInstances": 5,
      "seleniumProtocol": "WebDriver"
    },
    {
      "browserName": "chrome",
      "maxInstances": 5,
      "seleniumProtocol": "WebDriver"
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
EOF
```

### Create start/stop shell scripts

```
cat > /opt/selenium/start.sh<< EOF
#!/bin/bash
BASEDIR="\$( cd "\$(dirname "\$0")" ; pwd -P )"
mkdir -p \${BASEDIR}/logs
nohup java -jar \${BASEDIR}/selenium-server-standalone-3.141.59.jar -role hub -hubConfig \${BASEDIR}/conf/hubconfig.json > \${BASEDIR}/logs/hub.log 2>&1 &
nohup java -jar \${BASEDIR}/selenium-server-standalone-3.141.59.jar -role node -nodeConfig \${BASEDIR}/conf/nodeconfig.json > \${BASEDIR}/logs/node.log 2>&1 &
EOF

chmod +x /opt/selenium/start.sh

cat > /opt/selenium/stop.sh<< EOF
#!/bin/bash
kill -9 \$(ps -aux|grep hubconfig.json | grep -v grep| awk '{print \$2}')
kill -9 \$(ps -aux|grep nodeconfig.json| grep -v grep| awk '{print \$2}')
EOF

chmod +x /opt/selenium/stop.sh
```

### Start Selenium Grid Server Hub and Node in Background

```
/opt/selenium/start.sh
```

### Stop Selenium Grid Server Hub and Node

```
/opt/selenium/stop.sh
```

### The full example of the selenium server scripts

You can download the full example of the selenium server scripts from [https://github.com/sdc-china/IDA-doc/releases/download/25.0.3/selenium-server-linux64-3.141.59.zip](https://github.com/sdc-china/IDA-doc/releases/download/25.0.3/selenium-server-linux64-3.141.59.zip)

## Configure Selenium Grid on IDA and Enable Headless Mode

### Firefox Selenium Grid Configuration

```
## Supports Firefox and Chrome
arguments:
- "--headless"
## Change windows size
- "window-size=1920,1080"
```

![][references-firefox-conf]

### Chrome Selenium Grid Configuration

Please note that the argument **--no-sandbox** is added for Chrome, which allows running Chrome by the root user.

```
## Supports Firefox and Chrome
arguments:
- "--headless"
- "--no-sandbox"
## Change windows size
- "window-size=1920,1080"
```

![][references-chrome-conf]

[references-firefox-conf]: ../images/references/firefox_selenium_grid_conf.png
[references-chrome-conf]: ../images/references/chrome_selenium_grid_conf.png
