---
title: "Settings Configuration"
category: administration
date: 2018-10-24 15:17:55
last_modified_at: 2021-01-29 16:25:00
order: 15
---

# Settings configuration
***


## General configuration

![][General]

![][General_Notifications]{:height="70%" width="70%"}

Field | Description
--- | ---
Trace Level | The value of trace level, in default it have five levels (TRACE, DEBUG,WARN,INFO,ERROR).
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

![][Test]

Field | Description
--- | ---
Stop After Assert Failure | If not checked, the test case will keep running when the assertion fails.
Enable Test Case History | Enable save test case history function
Max Number of Test Case History | Set test case history max number of each test case, default value is 100.
Threshold of New Test Case | Threshold of generating test case per process
Connection Timeout(seconds) | Timeout of connection
Wait Timeout(seconds) | Timeout of wait
Default Retry Interval(seconds) | Default value of retry interval
Default Retry Times | Default value of retry times
Data Path | IDA working directory data path

## Checkstyle configuration

![][Checkstyle]

Field | Description
--- | ---
Engine | The checkstyle engine options can be EMBEDDED and ODM
Rest Url | Business decision service execution REST url
Decision Server Username | Decision Server Username
Decision Server Password | Decision Server Password
Decision Server URL | Decision server url, Replace localhost with the hostname or ip address of Rule Execution Server
Decision Server Port | The port of decision server

## Pipeline configuration

![][Pipeline]

Field | Description
--- | ---
Interval for Trigger by New Snapshot(seconds): | Time interval in seconds for pipeline new snapshot trigger job to query BAW PC servers
Installation Package Remote Dir | Installation Package Remote Dir
Deployment Timeout(seconds) | Timeout of check if snapshot is installed on PS and set as default snapshot
Deployment Check Interval(seconds) | Interval of check if snapshot is installed on PS and set as default snapshot
Host | SMTP host
Port | SMPT port
Sender Email | Sender email


## Set K8s Configuration

You can runtime update k8s configuration in IDA, after that you can use the new k8s server on Selenium Grid Configuration. Only test for Openshift 4.3.

  1. Click Administrator tab, then switch to Settings tab.
  2. Scroll down to K8s tab and fill out form according to below table:

     ![][administrator_k8s_setting]
    
     |   Field                | Description                                                         |
     | -------------------|---------------------------                                          |
     | Ingress Host|The subdomain to use for exposed routes. For openshift, it should be in the format of ```apps.<cluster_name>.<base_domain>```. The ```<cluster_name>``` and ```<base_domain>``` come from the installation config file.|  
     | Server Url| Cluster API address |
     | Namespace| The namespace/project that you want to use to create your containerized grid.|  
     | User Token| Token of service account.|

     Here is a sample:

     ![][administrator_k8s_setting_sample]

  3. How to create service account and get its token:

     After login openshift, run below commands.

     ```
     kubectl -n kube-system create serviceaccount ida-service-account
     kubectl create clusterrolebinding ida-clusterrolebinding --clusterrole=cluster-admin --serviceaccount=kube-system:ida-service-account
     TOKENNAME=`kubectl -n kube-system get serviceaccount/ida-service-account -o jsonpath='{.secrets[0].name}'`
     TOKEN=`kubectl -n kube-system get secret $TOKENNAME -o jsonpath='{.data.token}'| base64 --decode`
     kubectl config set-credentials ida-service-account --token=$TOKEN
     kubectl config set-context --current --user=ida-service-account
     ```

     Check if the current user is added successfully or not, and get the token for the newly added user:
     
     ```
     oc config view
     ```


**Notes:**
The settings values are saved in database so if you restart the server, the configurations are still valid.

[administrator_settings]: ../images/administrator/Administrator_settings.png
[administrator_k8s_setting]: ../images/administrator/administrator_k8s_setting.png
[administrator_k8s_setting_sample]: ../images/administrator/administrator_k8s_setting_sample.png
[General]: ../images/references/General.jpg
[General_Notifications]: ../images/references/General_Notifications.jpg
[Test]: ../images/references/Test.jpg
[Pipeline]: ../images/references/Pipeline.jpg
[Checkstyle]: ../images/references/Checkstyle.jpg
