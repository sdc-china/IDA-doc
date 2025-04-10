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
## Unlink previous version of firefox
unlink /usr/bin/firefox

wget http://ftp.mozilla.org/pub/firefox/releases/137.0.1/linux-x86_64/en-US/firefox-137.0.1.tar.xz
tar xvf firefox-137.0.1.tar.xz -C /usr/local/
sudo ln -s /usr/local/firefox/firefox /usr/bin/firefox

firefox --version
```

## Install specific Chrome version for testing

Search Chrome install package by version from [https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json](https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json). We suggest to install the latest version of Chrome.

Use Chrome v134.0.6998.165 as example:

```
## Unlink previous version of google
unlink /usr/bin/google-chrome

wget https://storage.googleapis.com/chrome-for-testing-public/134.0.6998.165/linux64/chrome-linux64.zip
unzip chrome-linux64.zip -d /usr/local/
sudo ln -s /usr/local/chrome-linux64/chrome /usr/bin/google-chrome

google-chrome --version
```

## Setup Selenium Grid Server

### Create folder for Selenium Grid Server
We use **~/selenium** folder as an example, you can change it to any other folder.

```
mkdir ~/selenium
cd ~/selenium
```

### Download Selenium Grid JAR

```
wget https://github.com/SeleniumHQ/selenium/releases/download/selenium-3.141.59/selenium-server-standalone-3.141.59.jar
```

### Create hubconfig.json

```
cat > hubconfig.json<< EOF
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
cat > nodeconfig.json<< EOF
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

### Create starthub.sh

```
echo "java -jar selenium-server-standalone-3.141.59.jar -role hub -hubConfig hubconfig.json" > starthub.sh
```

### Create startnode.sh

```
echo "java -jar selenium-server-standalone-3.141.59.jar -role node -nodeConfig nodeconfig.json" > startnode.sh
```

### Download Firefox and Chrome WebDriver
The Firefox and Chrome driver version should align with the installed browser version.

For Firefox, you can download the latest firefox driver version from the link: [https://github.com/mozilla/geckodriver/releases](https://github.com/mozilla/geckodriver/releases)

For Chrome, you can search the installed Chrome version in the JSON ([https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json](https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json)), then download the corresponding chrome driver version.

Below is the example scripts to download Firefox geckodriver v0.36.0 and Chrome driver v134.0.6998.165.

```
wget https://github.com/mozilla/geckodriver/releases/download/v0.36.0/geckodriver-v0.36.0-linux64.tar.gz
tar -zxvf geckodriver-v0.36.0-linux64.tar.gz -C ~/selenium/

wget https://storage.googleapis.com/chrome-for-testing-public/134.0.6998.165/linux64/chromedriver-linux64.zip
unzip chromedriver-linux64.zip
mv chromedriver-linux64/chromedriver ~/selenium/
```

### Start Selenium Grid Server in Background

```
chmod +x starthub.sh
nohup ~/selenium/starthub.sh > ~/selenium/hub.log 2>&1 &

chmod +x startnode.sh
nohup ~/selenium/startnode.sh > ~/selenium/node.log 2>&1 &
```

### Stop Selenium Grid Server

```
kill -9 $(ps -aux|grep hubconfig.json | grep -v grep| awk '{print $2}')
kill -9 $(ps -aux|grep nodeconfig.json| grep -v grep| awk '{print $2}')
```

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
