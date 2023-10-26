---
title: "High availability for IDA application on Liberty and HAProxy"
category: references
date: 2018-11-16 15:00:00
last_modified_at: 2023-10-26 11:20:00
---

# High availability for IDA application on Liberty and HAProxy

## Recommended topology 

   ![][liberty-ha-topology]

There are 2 parts for IDA application high availability we need to install and configure, included:
- *High availability configuring for IDA application on Liberty*
- *HAProxy setup*

## High availability configuring for IDA application on Liberty
**prerequisite:** 
  Already set up share folder on both node servers. For example, /sdc-nfs/ida-data/was-data

Install IDA Web Application on Liberty according [Installing IDA Application(v3.x, v2.x)](../installation/installation-installing-ida-application.html#installing-on-liberty), and take below steps for HA configurations:
### Step 1. Support for X-Forwarded-* and Forwarded headers
Add below config in **server.xml**, support for X-Forwarded-* and Forwarded headers in Liberty means better integration with front end HTTP load balancers and web servers.

```
 <httpEndpoint id="defaultHttpEndpoint"
                        host="*" httpPort="9080"
                        httpsPort="9443">
               <remoteIp useRemoteIpInAccessLog="true"/>
    </httpEndpoint>
```

### Step 2. Set environment variables
Create **server.env** from *wlp/usr/servers/SERVER_NAME* folder with below environment values:
```
#/opt/wlp/usr/servers/<SERVER_NAME>/server.env

HAZELCAST_NETWORK_JOIN_MULTICAST_ENABLED=false
HAZELCAST_NETWORK_JOIN_TCP_IP_ENABLED=true
HAZELCAST_NETWORK_JOIN_TCP_IP_MEMBER=<your first liberty server IP>,<your second liberty server IP>
ORG_QUARTZ_JOBSTORE_DATASOURCE_ENABLED=true
```

Additional environment variable for PostgreSQL DB only.
```
ORG_QUARTZ_JOBSTORE_DRIVERDELEGATECLASS=org.quartz.impl.jdbcjobstore.PostgreSQLDelegate
```

## HAProxy setup

### Step 1. Install HAProxy in Linux

```
# Ubuntu
sudo add-apt-repository ppa:vbernat/haproxy-2.7 -y
sudo apt update
sudo apt install haproxy=2.7.\* -y
```

### Step 2. Start/Stop HAProxy command

```
systemctl start haproxy
systemctl stop haproxy
systemctl restart haproxy
```

### Step 3. Create haproxy.cfg
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


 [liberty-ha-topology]: ../images/references/liberty-ha-topology.png
