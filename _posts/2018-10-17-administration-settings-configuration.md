---
title: "Settings Configuration"
category: administration
date: 2018-10-17 15:17:55
last_modified_at: 2024-03-07 11:28:00
---

# Settings Configuration
***

## General Configuration

![][General]{:width="100%"}

Field | Description
--- | ---
Trace Level | The value of the trace level, by default it has five levels (TRACE, DEBUG, WARN, INFO, ERROR).
Data Path | IDA working directory data path.
Enable LDAP Authentication | Login to IDA with LDAP configuration.
URL | LDAP server URL.
User Name | LDAP server user name.
Password | LDAP server password.
Base DN | LDAP base DN for filtering users.
User Filter | LDAP user filter pattern, use '#' to split multiple user filter patterns.
Default Role | Default role for LDAP users used in IDA.
User Name Case Insensitive | Whether the LDAP server is case insensitive or not, default value is true.
Enable Notifications | Global setting to enable/disable notifications. Enabled notifications can be further configured on each user profile page.
Test Case Created | Enable notification for test case creation.
Test Case Modified | Enable notification for test case modification.
Pipeline Build Success | Enable notification for pipeline build success.
Pipeline Build Failure | Enable notification for pipeline build failure.
BAW and Selenium Server Down/Up | Enable notification for server status.
Server Status Check Interval | Time interval in seconds to check the availability of BAW and Selenium servers.

## Test Configuration

![][Test]{:width="100%"}

Field | Description
--- | ---
Stop After Assert Failure | If not checked, the test case will keep running when the assertion fails.
Enable Test Case History | Enable saving test case history function.
Max Number of Test Case History | Set the maximum number of test case history for each test case, default value is 100.
Threshold of New Test Case | Threshold for generating test cases per process.
Default Wait Timeout (seconds) | Default wait timeout for test commands and finding web elements, default value is 60.
Page Load Timeout (seconds) | Default page load timeout for opening and loading pages, default value is 10.
Default Retry Interval (seconds) | Default value of retry interval.
Default Retry Times | Default value of retry times.

## Checkstyle Configuration

![][Checkstyle]{:width="100%"}

Field | Description
--- | ---
Engine | The checkstyle engine options can be EMBEDDED and ODM.
Rest URL | Business decision service execution REST URL.
Decision Server Username | Decision Server Username.
Decision Server Password | Decision Server Password.
Decision Server URL | Decision server URL, Replace localhost with the hostname or IP address of the Rule Execution Server.
Decision Server Port | The port of the decision server.
Tags | These will be used to ignore artifacts by tag(s). For example: test.
Naming Pattern | This pattern will be used to ignore artifacts by name. The pattern supports variables test$, ^test.

## Pipeline Configuration

![][Pipeline]{:width="100%"}

Field | Description
--- | ---
Interval for Trigger by New Snapshot (seconds) | Time interval in seconds for the pipeline new snapshot trigger job to query BAW PC servers.
BAW Deployment Remote Dir | Installation Package Remote Dir.
Deployment Timeout (seconds) | Timeout for checking if the snapshot is installed on PS and set as the default snapshot.
Deployment Check Interval (seconds) | Interval for checking if the snapshot is installed on PS and set as the default snapshot.
Max # of builds to keep | If not empty, only up to this number of builds are kept.
Days to keep builds | If not empty, builds are only kept up to this number of days.
Host | SMTP host.
Port | SMTP port.
Sender Email | Sender email.
Sender Password | Sender Password.

## Search Configuration
![][Search]{:width="100%"}

Field | Description
--- | ---
Search Depth | Search (and comparison) depth of Coach/Coach View.

## Set Kubernetes Configuration

The Kubernetes configuration is used to create a Containerized Selenium Grid Server. Tested on Openshift 4.x.

![][administrator_k8s_setting]{:width="100%"}

| Field | Description |
| --- | --- |
| Ingress Host | The subdomain to use for exposed routes. For OpenShift, it should be in the format of `apps.<cluster_name>.<base_domain>`. The `<cluster_name>` and `<base_domain>` come from the installation config file. |
| Server URL | Cluster API address. For OpenShift, it should be in the format of `https://api.<cluster_name>.<base_domain>:6443`. The `<cluster_name>` and `<base_domain>` come from the installation config file. |
| Namespace | The namespace/project that you want to use to create your containerized grid. |
| User Token | Token of the service account. |

Here is a sample:

![][administrator_k8s_setting_sample]{:width="100%"}

If you use OpenShift, you can get the Server URL through the command:

```
oc whoami --show-server
```

If you use OpenShift, you can get the Ingress Host from the console URL:

![][administrator_k8s_ocp_ingress_host]{:width="100%"}

The steps to create a service account and get the token:

```
oc new-project selenium-demo
oc create sa ida-selenium-sa
oc adm policy add-role-to-user admin -z ida-selenium-sa
TOKENNAME=`oc describe sa/ida-selenium-sa | grep Tokens | awk '{print $2}'`
TOKEN=`oc get secret $TOKENNAME -o jsonpath='{.data.token}' | base64 --decode`
echo $TOKEN
```

[administrator_settings]: ../images/administrator/Administrator_settings.png
[administrator_k8s_setting]: ../images/administrator/administrator_k8s_setting.png
[administrator_k8s_setting_sample]: ../images/administrator/administrator_k8s_setting_sample.png
[administrator_k8s_ocp_ingress_host]: ../images/administrator/administrator_k8s_ocp_ingress_host.png
[General]: ../images/administrator/General.png
[Test]: ../images/administrator/Test.png
[Pipeline]: ../images/administrator/Pipeline.png
[Checkstyle]: ../images/administrator/Checkstyle.png
[Search]: ../images/administrator/Search.png