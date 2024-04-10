---
title: "Settings Configuration"
category: administration
date: 2018-10-17 15:17:55
last_modified_at: 2024-03-07 11:28:00
---

# Settings Configuration
***


## General configuration

![][General]{:width="100%"}

Field | Description
--- | ---
Trace Level | The value of trace level, in default it have five levels (TRACE, DEBUG,WARN,INFO,ERROR).
Data Path | IDA working directory data path
Enable LDAP Authentication | Login IDA with ldap configuration
Url | LDAP server url
User Name | LDAP server user name
Password | LDAP server password
Base DN | LDAP base dn for filtering users
User filter | LDAP user filter pattern, use '#' to split multiple user filter pattern
Default Role | Default role for LDAP user used in IDA
User Name Case Insensitive | LDAP server is case insensitive or not, default value is true
Enable Notifications | Global setting to enable/disable notifications. Enabled notifications can be futher configured on each user profile page
Test Case Created | Enable notification of test case creation
Test Case Modified | Enable notification of test case modification
Pipeline Build Success | Enable notification of pipeline build success
Pipeline Build Failure | Enable notification of pipeline build failure
BAW and Selenium Server Down/Up | Enable notification of server status
Server Status Check Interval | Time interval in seconds to check the availability of BAW and Selenium servers

## Test configuration 

![][Test]{:width="100%"}

Field | Description
--- | ---
Stop After Assert Failure | If not checked, the test case will keep running when the assertion fails.
Enable Test Case History | Enable save test case history function
Max Number of Test Case History | Set test case history max number of each test case, default value is 100.
Threshold of New Test Case | Threshold of generating test case per process
Default Wait Timeout(seconds) | Default wait time out for test commands and finding web elements, default value is 60.
Page Load Timeout(seconds) | Default page load time out for open and load page, default value is 10.
Default Retry Interval(seconds) | Default value of retry interval
Default Retry Times | Default value of retry times


## Checkstyle configuration

![][Checkstyle]{:width="100%"}

Field | Description
--- | ---
Engine | The checkstyle engine options can be EMBEDDED and ODM
Rest Url | Business decision service execution REST url
Decision Server Username | Decision Server Username
Decision Server Password | Decision Server Password
Decision Server URL | Decision server url, Replace localhost with the hostname or ip address of Rule Execution Server
Decision Server Port | The port of decision server
Tags | These will be used to ignore artifacts by tag(s). For example: test.
Naming Pattern | This pattern will be used to ignore artifacts by name. Pattern supports variables test$, ^test.

## Pipeline configuration

![][Pipeline]{:width="100%"}

Field | Description
--- | ---
Interval for Trigger by New Snapshot(seconds): | Time interval in seconds for pipeline new snapshot trigger job to query BAW PC servers
BAW Deployment Remote Dir | Installation Package Remote Dir
Deployment Timeout(seconds) | Timeout of check if snapshot is installed on PS and set as default snapshot
Deployment Check Interval(seconds) | Interval of check if snapshot is installed on PS and set as default snapshot
Max # of builds to keep | If not empty, only up to this number of builds are kept
Days to keep builds | If not empty, builds are only kept up to this number of days
Host | SMTP host
Port | SMPT port
Sender Email | Sender email
Sender Password | Sender Password

## Search configuration
![][Search]{:width="100%"}

Field | Description
--- | ---
Search Depth | Search (and comparison) depth of Coach/Coach View


## Set Kubernetes configuration

The Kubernetes configuration is used to create Containerized Selenium Grid Server. Tested on Openshift 4.x.

![][administrator_k8s_setting]{:width="100%"}

|   Field                | Description                                                         |
| -------------------|---------------------------                                          |
| Ingress Host|The subdomain to use for exposed routes. For OpenShift, it should be in the format of ```apps.<cluster_name>.<base_domain>```. The ```<cluster_name>``` and ```<base_domain>``` come from the installation config file.|  
| Server Url| Cluster API address. For OpenShift, it should be in the format of ```https://api.<cluster_name>.<base_domain>:6443```. The ```<cluster_name>``` and ```<base_domain>``` come from the installation config file.|
| Namespace| The namespace/project that you want to use to create your containerized grid.|  
| User Token| Token of service account.|

Here is a sample:

![][administrator_k8s_setting_sample]{:width="100%"}

The commands to get ingress host, server url and token:

``` 
# Command to get ingress host
oc get ingresses.config cluster --output jsonpath={.spec.domain}

# Command to get server url
oc whoami --show-server

# Commands to get user token
oc new-project selenium-demo
oc create sa ida-selenium-sa
oc adm policy add-role-to-user admin -z ida-selenium-sa
TOKENNAME=`oc describe  sa/ida-selenium-sa | grep Tokens |  awk '{print $2}'`
TOKEN=`oc get secret $TOKENNAME -o jsonpath='{.data.token}'| base64 --decode`
echo $TOKEN
``` 


[administrator_settings]: ../images/administrator/Administrator_settings.png
[administrator_k8s_setting]: ../images/administrator/administrator_k8s_setting.png
[administrator_k8s_setting_sample]: ../images/administrator/administrator_k8s_setting_sample.png
[General]: ../images/administrator/General.png
[Test]: ../images/administrator/Test.png
[Pipeline]: ../images/administrator/Pipeline.png
[Checkstyle]: ../images/administrator/Checkstyle.png
[Search]: ../images/administrator/Search.png
