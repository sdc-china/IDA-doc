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
  Already set up share folder (e.g. NFS, NAS and so on) on both node servers, e.g. /share-folder/ida-data

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

4.4 Click first member, e.g. idaServer01, go to **Session management > Custom properties**, click **New** to create configuration for **CookieSameSite**:**None**.

  ![][was-session-management]
  ![][was-session-management-properties]

4.5 Make sure the host ports have been added to the **Environment > Virtual hosts > default_host**.

  ![][was-member-ports]
  ![][was-virtual-host]

4.6 Repeat step 4.1~4.5 for second member, e.g. idaServer02.

### Step 5. Confige the JNDI. 

5.1 In left navigation bar, click the **Resource > JDBC > Data sources**, **New** datasource on cluster, e.g. idaCluster.

  ![][was-create-ds]

5.2 Create a new data source, we use db2 as an example.

  ![][was-ds-step1]
  ![][was-ds-step2.1]

5.3 In step 2.2, update JDBC driver class file pathes and click **Apply**. Make sure they exist on each cluster member server. After apply, click **Next**.

 ![][was-ds-step2.2]
 ![][was-ds-step2.2-after-apply]

5.4 In step 3, fill in database information, make sure unselect the checkbox for **Use this data source in container managed persistence (CMP)**, then click **Next**.

 ![][was-ds-step3]

5.5 In step 4, create J2C authentication for database, then use it in datasource, click **Next** and **Finish**.

 ![][was-ds-j2c]
 ![][was-ds-step4]

5.6 Test datasource connection.

 ![][was-ds-test-connection]
 ![][was-ds-connected]

### Step 6. Deploy IDA Application

 6.1 In left navigation bar, click the **New Application»New Enterprise Application**.
    ![][wasappnew]

 6.2 In the **Path to the new application** section, check the **Local file system** and select the ida-web.war in your local file system. When the war package is uploaded, click **Next** button.

   ![][wasselectapp]  
 
 6.3 Choose the **Fast Path** option.  click **Next** button.

 6.4 Now the current page is used to specify options for installing enterprise application and modules. In step 1, you can change the application name, click **Next** button after changing the application name.

   ![][waschangeappname]

 6.5 Need to select clusters and servers and click **Apply** in **Step 2:Map modules to servers**, then click **Next**.

  ![][was-new-app-step-2]
  ![][was-after-apply]

 6.6 There is nothing to change in step3. And step 4 is used to configure values for contexts root in web modules, we should set the **Context Root** as **/ida** as shown below.

   ![][wassetcontextroot]

 6.7 There is nothing to change in step 5. In step 6, click **finish** button and wait for the server to complete the installation of IDA web application. When finished, click the **WebSphere enterprise application** in left navigation bar, you can see that the IDA web application is in Enterprise Applications table.

   ![][was-app-list]

### Step 7. Confige the Class Loader Order for IDA application

 7.1 Click the link of the **ida-web** in the table and go to the app confiugration page.

 7.2 Click the **Class loading and update detection** link as shown below.

   ![][wasclassloadlink]

 7.3 Change the class loader order to **Classes loaded with local class loader first (parent last)**.

   ![][wasclassloadorder]

 7.4 Then go back to the configuration page, and then click the **Manage Modules** link.

   ![][wasmanagemodules]

 7.5 Click the link of **ida-web.war**, in the configuration page, change the class loader order to  **Classes loaded with local class loader first (parent last)**.

   ![][wasmoduleclassloadorder]

### Step 8. Start IDA application

 8.1 Before starting IDA web applicaiton, go to **System administration->Nodes**, select 2 nodes to click **Synchronize**. 

   ![][was-sync-nodes]

 8.2 Go to **WebSphere application server clusters > idaCluster > Cluster members** to start cluster members.

   ![][was-start-cluster-members-1]
   ![][was-start-cluster-members]

 8.3 Go to **WebSphere application server clusters** to make sure cluster started.

   ![][was-start-app]
   ![][was-check-app-start]

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
 [was-new-app-step-2]: ../images/references/was-new-app-step-2.png
 [was-after-apply]: ../images/references/was-after-apply.png
 [was-session-management]: ../images/references/was-session-management.png
 [was-session-management-properties]: ../images/references/was-session-management-properties.png
 [was-member-ports]: ../images/references/was-member-ports.png
 [was-virtual-host]: ../images/references/was-virtual-host.png
 [was-create-ds]: ../images/references/was-create-ds.png
 [was-ds-step1]: ../images/references/was-ds-step1.png
 [was-ds-step2.1]: ../images/references/was-ds-step2.1.png
 [was-ds-step2.2]: ../images/references/was-ds-step2.2.png
 [was-ds-step2.2-after-apply]: ../images/references/was-ds-step2.2-after-apply.png
 [was-ds-step3]: ../images/references/was-ds-step3.png
 [was-ds-j2c]: ../images/references/was-ds-j2c.png
 [was-ds-step4]: ../images/references/was-ds-step4.png
 [was-ds-test-connection]: ../images/references/was-ds-test-connection.png
 [was-ds-connected]: ../images/references/was-ds-connected.png
 [was-app-list]: ../images/references/was-app-list.png
 [was-sync-nodes]: ../images/references/was-sync-nodes.png
 [was-start-cluster-members-1]: ../images/references/was-start-cluster-members-1.png
 [was-start-cluster-members]: ../images/references/was-start-cluster-members.png
 [was-start-app]: ../images/references/was-start-app.png
 [was-check-app-start]: ../images/references/was-check-app-start.png

 [wasappnew]: ../images/install/wasappnew.png
 [wasselectapp]: ../images/install/wasselectapp.png
 [waschangeappname]: ../images/install/waschangeappname.png
 [wassetcontextroot]: ../images/install/wassetcontextroot.png
 [wasclassloadlink]: ../images/install/wasclassloadlink.png
 [wasclassloadorder]: ../images/install/wasclassloadorder.png
 [wasmanagemodules]: ../images/install/wasmanagemodules.png
 [wasmoduleclassloadorder]: ../images/install/wasmoduleclassloadorder.png