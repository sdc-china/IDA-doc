---
title: "Migrate IDA from V2.7.x to v3.0.0"
category: installation
date: 2020-09-29 15:17:55
last_modified_at: 2020-09-29 15:17:55
order: 10
---

IDA support JNDI and Datasource to connect a database.

# Do not use a JNDI datasource
If you do not use a JNDI datasource, you could follow below steps to migrate ida from v2.7.x to v3.0.0

1\. Please refer the doc [Repacking IDA Application][1] to build the latest ida-web.war file.

2\. Replace your old ida-web.war with the latest ida-web.war in your liberty server.

3\. Migrate the values form your old conf/ida.properties to Settings page. The below table lists all the filed need to be migrated:

|conf/ida.properties | Settings page|
--- | ---
server.host | Removed
server.servlet.context-path | Removed
http.port | Removed
https.port | Removed
jasypt.encryptor.password | Removed
event_type  | Removed
track_serviceflow | Removed
engine-config.connection-timeout| Test -> Connection Timeout(seconds)
engine-config.wait-timeout | Test -> Wait Timeout(seconds)
engine-config.default-retry-times | Test -> Default Retry Times
engine-config.default-retry-interval | Test -> Default Retry Interval(seconds)
engine-config.data-dir | Test -> Data Path
engine-config.installation-package-remote-dir | Pipeline -> Installation Package Remote Dir
smtp.host | Pipeline -> Host
smtp.port | Pipeline -> Port
email.from | Pipeline -> Sender Email
deployment.timeout | Pipeline -> Deployment Timeout(seconds)
deployment.interval | Pipeline -> Deployment Check Interval(seconds)
loggerLevel | General -> Trace Level
checkstyle.engine | Checkstyle -> Engine
resUser | Checkstyle -> Decision Server Username
resPassword | Checkstyle -> Decision Server Password
resUrl | Checkstyle -> Decision Server URL
resPort | Checkstyle -> Decision Server Port
restUrl | Checkstyle -> Rest Url
enable_case_history | Test -> Enable Test Case History
max_case_history | Test -> Max Number of Test Case History
default_total_case | Test -> Threshold of New Test Case
ldap.enable | General -> Enable LDAP Authentication
ldap.url | General -> Url
ldap.username | General -> User Name
ldap.password | General -> Password
ldap.basedn | General -> Base DN
ldap.user.filter | General -> User Filter
ldap.default.role | General -> Default Role
ldap.username.case-insensitive | General -> User Name Case Insensitive
pipeline.snapshot.trigger.interval | Pipeline -> Interval for Trigger by New Snapshot(seconds)


# Use a JNDI datasource

1\. Please refer the doc [Repacking IDA Application][1] to build the latest ida-web.war file. 

**Notes:** Please refer to the commment when you edit the \<IDA_HOME\>/conf/**ida.properties**

2\. Please refer to the doc [Installing IDA Application][2] to config the server.xml file.


3\. Please copy your Database driver to \<Liberty_Home\>/${shared.config.dir}/lib/global folder.

4\. Migrate the values form your old conf/ida.properties to Settings page. The below table lists all the filed need to be migrated:

|conf/ida.properties | Settings page|
--- | ---
server.host | Removed
server.servlet.context-path | Removed
http.port | Removed
https.port | Removed
jasypt.encryptor.password | Removed
event_type  | Removed
track_serviceflow | Removed
engine-config.connection-timeout| Test -> Connection Timeout(seconds)
engine-config.wait-timeout | Test -> Wait Timeout(seconds)
engine-config.default-retry-times | Test -> Default Retry Times
engine-config.default-retry-interval | Test -> Default Retry Interval(seconds)
engine-config.data-dir | Test -> Data Path
engine-config.installation-package-remote-dir | Pipeline -> Installation Package Remote Dir
smtp.host | Pipeline -> Host
smtp.port | Pipeline -> Port
email.from | Pipeline -> Sender Email
deployment.timeout | Pipeline -> Deployment Timeout(seconds)
deployment.interval | Pipeline -> Deployment Check Interval(seconds)
loggerLevel | General -> Trace Level
checkstyle.engine | Checkstyle -> Engine
resUser | Checkstyle -> Decision Server Username
resPassword | Checkstyle -> Decision Server Password
resUrl | Checkstyle -> Decision Server URL
resPort | Checkstyle -> Decision Server Port
restUrl | Checkstyle -> Rest Url
enable_case_history | Test -> Enable Test Case History
max_case_history | Test -> Max Number of Test Case History
default_total_case | Test -> Threshold of New Test Case
ldap.enable | General -> Enable LDAP Authentication
ldap.url | General -> Url
ldap.username | General -> User Name
ldap.password | General -> Password
ldap.basedn | General -> Base DN
ldap.user.filter | General -> User Filter
ldap.default.role | General -> Default Role
ldap.username.case-insensitive | General -> User Name Case Insensitive
pipeline.snapshot.trigger.interval | Pipeline -> Interval for Trigger by New Snapshot(seconds)


[1]: ../installation/installation-ida-repacking.html
[2]: ..installation/installation-ida-installing.html