---
title: "Setup Selenium Grid on Redhat"
category: references
date: 2020-10-27 15:39:00
last_modified_at: 2020-10-27 15:39:00
order: 15
---

# Setup Selenium Grid on Redhat

## Install Latest Firefox

Please note that the old version firefox installed on Redhat may not support headless well, so we'd better to install the latest firefox.

```
sudo yum remove firefox
unlink /usr/bin/firefox

cd /usr/local
wget http://ftp.mozilla.org/pub/firefox/releases/81.0/linux-x86_64/en-US/firefox-81.0.tar.bz2
tar xvjf firefox-81.0.tar.bz2
sudo ln -s /usr/local/firefox/firefox /usr/bin/firefox

firefox --version
```

## Install Latest Chrome

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
yum -y install redhat-lsb libXScrnSaver
yum -y localinstall google-chrome-stable_current_x86_64.rpm

google-chrome --version
```

## Setup Selenium Grid server

### Download Selenium Grid JAR

```
wget https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar
```

### Create hubconfig.json:

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

### Create nodeconfig.json

```
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
```

### Create starthub.sh

```
java -jar selenium-server-standalone-3.141.59.jar -role hub -hubConfig hubconfig.json
```

### Create startnode.sh

Please note that I added an argument "-Dwebdriver.chrome.whitelistedIps=" that allows chrome driver to assign new port for webdriver.

```
java -Dwebdriver.chrome.whitelistedIps= -jar selenium-server-standalone-3.141.59.jar -role node -nodeConfig nodeconfig.json
```

### Download Firefox and Chrome webdriver

```
wget https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-linux64.tar.gz
tar -zxvf geckodriver-v0.27.0-linux64.tar.gz
chmod +x geckodriver

wget https://chromedriver.storage.googleapis.com/86.0.4240.22/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
chmod +x chromedriver
```

### Start Selenium Grid Server in background

```
chmod +x starthub.sh
nohup /root/selenium/starthub.sh > /root/selenium/hub.log 2>&1 &

chmod +x startnode.sh
nohup /root/selenium/startnode.sh > /root/selenium/node.log 2>&1 &
```

### Stop Selenium Grid Server

```
kill -9 $(ps -aux|grep hubconfig.json | grep -v grep| awk '{print $2}')
kill -9 $(ps -aux|grep nodeconfig.json| grep -v grep| awk '{print $2}')
```

## Configure Selenium Grid on IDA and enable headless mode.

### Firefox Selenium Grid Configuration

```
## Supports Firefox and Chrome
arguments:
- "--headless"
## Change windows szie
- "window-size=1920,1080"
```

### Chrome Selenium Grid Configuration

Please note that I add another argument "--no-sandbox" for chrome, as I run chrome by root user.

```
## Supports Firefox and Chrome
arguments:
- "--headless"
- "--no-sandbox"
## Change windows szie
- "window-size=1920,1080"
```
