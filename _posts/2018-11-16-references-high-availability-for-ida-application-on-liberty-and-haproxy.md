---
title: "High availability for IDA application on Liberty"
category: references
date: 2018-11-16 15:00:00
last_modified_at: 2023-10-20 17:30:00
---

# High availability for IDA application
**prerequisite:** 
1. For setting up high availability for IDA application on WAS, the prerequisite is WAS already installed and configured nodes. For example, idaNode01 and idaNode02.
2. Already set up share folder on both node servers. For example, /sdc-nfs/ida-data/was-data

There are 2 parts for IDA application high availability we need to install and configure, included:
- *HA configurations on WAS or Liberty*
- *HA Proxy setup*

# Step 1: HA Configurations
## Configurations on WAS V9
### 1. Create a WAS cluster
1.1 Go to **Servers->Clusters->WebSphere application server clusters**, click **New**, then input cluster name, for example idaCluster, click **Next**.

  ![][was-create-cluster-input-name]

1.2 Input frist cluster member name, for example idaServer01, click **Next**,

  ![][was-create-first-cluster-member]

1.3 Input second cluster member name, for example idaServer02, change **Select node** to be the other node, then click **Add Member**,

  ![][was-create-second-cluster-member]

1.4 After add second cluster member, click **Next**, then click **Finish**.

  ![][was-created-2-cluster-members]

1.5 After saving the changes, click the cluster name, ex. idaCluster, then click **Cluster members->Details** for step 2.

  ![][was-click-cluster-members-details]

### 2. Configurations for each cluster member
2.1 Click first member, ex. idaServer01, go to **Web Container Settings->Web container->Custom properties**, click **New** to create below configurations:

* Name: trusthostheaderport
* Value: true

* Name: com.ibm.ws.webcontainer.extractHostHeaderPort
* Value: true

  ![][was-first-member-web-container]
  ![][was-first-member-customer-properties]
  ![][was-web-container-properties]

2.2 Back to first member, go to **Process definition->Java Virtual Machine**, input **1024** for Initial heap size, **8192** for Maximum heap size, then click **Apply**.

  ![][was-first-member-java-management]
  ![][was-input-jvm]

2.3 Go to **Process definition->Environment Entries**, click **New** to create below configurations, this is example for PostgreSQL DB.

* HAZELCAST_NETWORK_JOIN_TCP_IP_ENABLED=true
* HAZELCAST_NETWORK_JOIN_TCP_IP_MEMBER= {your first WAS node IP} , {your second WAS node IP}
* ORG_QUARTZ_JOBSTORE_DRIVERDELEGATECLASS=org.quartz.impl.jdbcjobstore.PostgreSQLDelegate
* ORG_QUARTZ_JOBSTORE_DATASOURCE_ENABLED=true

  ![][was-first-member-env]

2.4 Repeat step 2.1~2.3 for second member, ex. idaServer02.

### 3. Install IDA Web Application 
Install IDA Web Application according [Installing IDA Application(v3.x, v2.x)](../installation/installation-installing-ida-application.html#installing-on-was-v9)，take below steps for HA configurations:

3.1 Make sure do all steps for web server on each cluster member. 

3.2 For Data source, create JDBC provider on cluster, ex. idaCluster.

  ![][was-config-jndi-for-cluster]

3.3 For **New Application**, need to select clusters and servers and click **Apply** in **Step 2:Map modules to servers**, then click **Next**.

  ![][was-new-app-step-2]
  ![][was-after-apply]

3.4 Before starting IDA web applicaiton, go to **System administration->Nodes**, select 2 nodes to click **Synchronize**. 

3.5 Go to **WebSphere application server clusters > idaCluster > Cluster members** to start cluster members.

3.6 Go to **WebSphere application server clusters** to make sure cluster started.


## Configurations on Liberty
Install IDA Web Application on Liberty according [Installing IDA Application(v3.x, v2.x)](../installation/installation-installing-ida-application.html#installing-on-liberty), take below steps for HA configurations:
### 1. Support for X-Forwarded-* and Forwarded headers
Add below config in **server.xml**, support for X-Forwarded-* and Forwarded headers in Liberty means better integration with front end HTTP load balancers and web servers.

```
 <httpEndpoint id="defaultHttpEndpoint"
                        host="*" httpPort="9080"
                        httpsPort="9443">
               <remoteIp useRemoteIpInAccessLog="true"/>
    </httpEndpoint>
```

### 2. Set environment
Create **server.env** from *wlp/usr/servers/SERVER_NAME* folder with below environment values:
```
#/opt/wlp/usr/servers/<SERVER_NAME>/server.env

HAZELCAST_NETWORK_JOIN_MULTICAST_ENABLED=false
HAZELCAST_NETWORK_JOIN_TCP_IP_ENABLED=true
HAZELCAST_NETWORK_JOIN_TCP_IP_MEMBER=<your first liberty server IP>,<your second liberty server IP>
ORG_QUARTZ_JOBSTORE_DRIVERDELEGATECLASS=org.quartz.impl.jdbcjobstore.PostgreSQLDelegate
ORG_QUARTZ_JOBSTORE_DATASOURCE_ENABLED=true
```

### 3. Set jvm options
Create **jvm.options** from *wlp/usr/servers/SERVER_NAME* folder with below settings:
```
#/opt/wlp/usr/servers/<SERVER_NAME>/jvm.options

-Xms512m
-Xmx8192m
```
## ORG_QUARTZ_JOBSTORE_DRIVERDELEGATECLASS value for different Database

 DB Type | ORG_QUARTZ_JOBSTORE_DRIVERDELEGATECLASS value
    --- | ---
Oracle |    org.quartz.impl.jdbcjobstore.oracle.OracleDelegate
DB2 V8 |  org.quartz.impl.jdbcjobstore.DB2v8Delegate 
PostgreSQL |  org.quartz.impl.jdbcjobstore.PostgreSQLDelegate
MySQL | org.quartz.impl.jdbcjobstore.StdJDBCDelegate ??

Note: Other DB2 versions please refer to: [Uses of Interface org.quartz.impl.jdbcjobstore.DriverDelegate](https://javadoc.io/doc/org.quartz-scheduler/quartz/2.1.3/org/quartz/impl/jdbcjobstore/class-use/DriverDelegate.html)

# Step 2: HA Proxy setup

## 1. Install HAProxy in Linux

```
# Ubuntu
sudo add-apt-repository ppa:vbernat/haproxy-2.7 -y
sudo apt update
sudo apt install haproxy=2.7.\* -y
```

## 2. Start/Stop HAProxy command

```
systemctl start haproxy
systemctl stop haproxy
systemctl restart haproxy
```

## 3. Create haproxy.cfg
Add config file to /etc/haproxy/haproxy.cfg, change the IP address to the IDA nodes.
```
global
    log         127.0.0.1 local2
    chroot      /var/lib/haproxy
    pidfile     /var/run/haproxy.pid
    maxconn     5000
    user        haproxy
    group       haproxy
    daemon

    # turn on stats unix socket
    stats socket /var/lib/haproxy/stats

defaults
    mode                    http
    log                     global
    option                  httplog
    option                  dontlognull
    option http-server-close
#   option forwardfor       except 127.0.0.0/8
    option                  redispatch
    retries                 3
    timeout queue           5m
    timeout connect         5m
    timeout client          5m
    timeout server          5m
    timeout check           10s
    maxconn                 50000

listen stats
    bind :9000
    mode http
    stats enable
    stats uri /
    monitor-uri /healthz
    
frontend ida-fe-https
    bind :443
    default_backend ida-be-https
    mode tcp
    option tcplog

backend ida-be-https
    balance source
    mode tcp
    server ida01 <your first node IP>:<port> check
    server ida02 <your second node IP>:<port> check
```



 [was-create-cluster-input-name]: ../images/references/was-create-cluster-input-name.png
 [was-create-first-cluster-member]: ../images/references/was-create-first-cluster-member.png
 [was-create-second-cluster-member]: ../images/references/was-create-second-cluster-member.png
 [was-created-2-cluster-members]: ../images/references/was-created-2-cluster-members.png
 [was-click-cluster-members-details]: ../images/references/was-click-cluster-members-details.png
 [was-first-member-web-container]: ../images/references/was-first-member-web-container.png
 [was-first-member-customer-properties]: ../images/references/was-first-member-customer-properties.png
 [was-web-container-properties]: ../images/references/was-web-container-properties.png
 [was-first-member-java-management]: ../images/references/was-first-member-java-management.png
 [was-input-jvm]: ../images/references/was-input-jvm.png
 [was-first-member-env]: ../images/references/was-first-member-env.png
 [was-config-jndi-for-cluster]: ../images/references/was-config-jndi-for-cluster.png
 [was-new-app-step-2]: ../images/references/was-new-app-step-2.png
 [was-after-apply]: ../images/references/was-after-apply.png