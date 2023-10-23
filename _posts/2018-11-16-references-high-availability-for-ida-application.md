---
title: "High availability configuring for IDA application on WebSphere Application Server"
category: references
date: 2018-11-16 15:00:00
last_modified_at: 2023-10-20 17:30:00
---

# High availability configuring for IDA application on WAS and HTTP Server
## Recommended topology 

  ![][was-ha-topology]

**prerequisite:** 
  Already set up share folder (e.g. NFS, NAS and so on) on both node servers. e.g. /share-folder/ida-data

There are 2 parts for IDA application high availability we need to install and configure, included:
- *High availability configuring for IDA application on WAS*
- *HTTP Server setup*

## High availability configuring for IDA application on WAS V9
### Step 1: Create DMGR and Node 1, add Node 1 to DMGR

```
## Create DMGR
/opt/IBM/WebSphere/bin/manageprofiles.sh -create -templatePath /opt/IBM/WebSphere/profileTemplates/management/ -profileName dmgr01 -nodeName idahanode1 -cellName idahacell1 -hostName ida-was-demo11.fyre.ibm.com  -enableAdminSecurity true -adminUserName wasadmin -adminPassword Passw0rd

## Start DMGR
/opt/IBM/WebSphere/profiles/dmgr01/bin/startManager.sh

## Create Node1
/opt/IBM/WebSphere/bin/manageprofiles.sh -create -templatePath /opt/IBM/WebSphere/profileTemplates/managed/ -profileName ida01

## Add Node1 to DMGR
/opt/IBM/WebSphere/profiles/ida01/bin/addNode.sh ida-was-demo11.fyre.ibm.com -username wasadmin -password Passw0rd

## Start Node
/opt/IBM/WebSphere/profiles/ida01/bin/startNode.sh

```

### Step 2: Create Node 2, add Node 2 to DMGR

```
## Create Node 2
/opt/IBM/WebSphere/bin/manageprofiles.sh -create -templatePath /opt/IBM/WebSphere/profileTemplates/managed/ -profileName ida02

## Add Node2 to DMGR
/opt/IBM/WebSphere/profiles/ida02/bin/addNode.sh ida-was-demo11.fyre.ibm.com -username wasadmin -password Passw0rd

## Start Node
/opt/IBM/WebSphere/profiles/ida02/bin/startNode.sh

```

### Step 3. Create a WAS cluster
3.1 Go to **Servers->Clusters->WebSphere application server clusters**, click **New**, then input cluster name, e.g. idaCluster, click **Next**.

  ![][was-create-cluster-input-name]

3.2 Input frist cluster member name, e.g. idaServer01, click **Next**,

  ![][was-create-first-cluster-member]

3.3 Input second cluster member name, e.g. idaServer02, change **Select node** to be the other node, then click **Add Member**,

  ![][was-create-second-cluster-member]

3.4 After add second cluster member, click **Next**, then click **Finish**.

  ![][was-created-2-cluster-members]

3.5 After saving the changes, click the cluster name, e.g. idaCluster, then click **Cluster members->Details** for step 2.

  ![][was-click-cluster-members-details]

### Step 4. Configurations for each cluster member
4.1 Click first member, e.g. idaServer01, go to **Web Container Settings->Web container->Custom properties**, click **New** to create below configurations:

 Name |  Value 
    --- | ---
trusthostheaderport | true
com.ibm.ws.webcontainer.extractHostHeaderPort | true

  ![][was-first-member-web-container]
  ![][was-first-member-customer-properties]
  ![][was-web-container-properties]

4.2 Back to first member, go to **Process definition->Java Virtual Machine**, input **1024** for Initial heap size, **8192** for Maximum heap size, then click **Apply**.

  ![][was-first-member-java-management]
  ![][was-input-jvm]

4.3 Go to **Process definition->Environment Entries**, click **New** to create below configurations.

 Name |  Value | Required/Optional
    --- | --- | --- 
HAZELCAST_NETWORK_JOIN_TCP_IP_ENABLED |    true | required
HAZELCAST_NETWORK_JOIN_TCP_IP_MEMBER | {your first WAS node IP} , {your second WAS node IP} | required
ORG_QUARTZ_JOBSTORE_DATASOURCE_ENABLED |    true | required
ORG_QUARTZ_JOBSTORE_DRIVERDELEGATECLASS | org.quartz.impl.jdbcjobstore.PostgreSQLDelegate | optional

**Note**: *Only PostgreSQL DB need ORG_QUARTZ_JOBSTORE_DRIVERDELEGATECLASS environment entry.*

  ![][was-first-member-env]

4.4 Repeat step 4.1~4.3 for second member, e.g. idaServer02.

### Step 5. Install IDA Web Application on cluster
5.1 Click first member, e.g. idaServer01, go to **Session management > Custom properties**, click **New** to create configuration for **CookieSameSite**:**None**.

  ![][was-session-management]
  ![][was-session-management-properties]

5.2 Make sure the host ports have been added to the **Environment > Virtual hosts > default_host**.

  ![][was-member-ports]
  ![][was-virtual-host]

5.3 Repeat step 4.1~4.3 for second member, e.g. idaServer02.

5.4 Confige the JNDI. 

5.4.1 In left navigation bar, click the **Resource > JDBC > JDBC providers**, create JDBC provider on cluster, e.g. idaCluster.
  ![][was-config-jndi-for-cluster]

5.4.2 Click **Resource > JDBC > Data sources** to **New** datasource on cluster.

///////////////////////
5.1 Make sure do all steps for web server on each cluster member. 

5.2 For Data source, create JDBC provider on cluster, e.g. idaCluster.



5.3 For **New Application**, need to select clusters and servers and click **Apply** in **Step 2:Map modules to servers**, then click **Next**.

  ![][was-new-app-step-2]
  ![][was-after-apply]

5.4 Before starting IDA web applicaiton, go to **System administration->Nodes**, select 2 nodes to click **Synchronize**. 

5.5 Go to **WebSphere application server clusters > idaCluster > Cluster members** to start cluster members.

5.6 Go to **WebSphere application server clusters** to make sure cluster started.


## HTTP Server setup


 [was-ha-topology]: ../images/references/was-ha-topology.png
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
 [was-session-management]: ../images/references/was-session-management.png
 [was-session-management-properties]: ../images/references/was-session-management-properties.png
 [was-member-ports]: ../images/references/was-member-ports.png
 [was-virtual-host]: ../images/references/was-virtual-host.png