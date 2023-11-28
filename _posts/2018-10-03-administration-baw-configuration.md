---
title: "BAW Configuration"
category: administration
date: 2018-10-03 15:17:55
last_modified_at: 2023-02-28 15:30:00
---

# BAW Configuration
***

## Add a BAW server
  1. Click **Administrator** tab, then switch to  **BAW Configurtaion** tab to manage BAW server.  

  2. Click ![][add_icon] icon which is on the right of **BAW Server Configuration** to add new BAW server.

  3. Fill out the form below. Then click **Create** button. Optional fields are hidden inside **Advance** section. Click **Advance** to show them.

     ![][administrator_bpmserver]{:width="60%"}

     ![][administrator_bpmserver_adv]{:width="60%"}

     |   Field                | Description                                                                                                                                                                                                                                                                                                                                                                       |
      |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|                                          
      | Server Name            | The display name of this BAW server.                                                                                                                                                                                                                                                                                                                                              |  
      | Type                   | Options: Development, Test, Stage, Production. If the BAW server is Process Center, please select Development, if your server is Process Server, you should choose Test, Stage or Production, it depends on your actual environment.                                                                                                                                                                                    |
      | Server Url             | The BAW server URL, eg: https://bawserver:9443. It is the prefix of BAW Process Admin Url or Process Portal Url. In BAW HA environment, this field should be the Url of the load balancer.                                                                                                                                                                                        |                                        
      | REST User Name         | The name of the user who is a member of tw_admins or tw_authors group and has the Read permission to the target process application (If your want to catch a new snapshot for this process application in IDA, for example **Trigger by new Snapshot**, you need to have the Write permission to the process application).                                                        |
      | REST Password          | The Password of the user.                                                                                                                                                                                                                                                                                                                                                         |   
      | Auth Command           | Choose the custom Java command that can automate the custom SSO page of BAW server [1]                                                                                                                                                                                                                                                                                            |   
      | Auth Method            | When the BAW server doesn't support BASIC Authentication, please set the authentication method to OTHER.                                                                                                                                                                                                                                                                          |   
      | Connected PS Server  | Connected Server Name is the online PS server name, authorized users can install snapshots of process applications on connected Process Servers. This field only needs to be filled when this server is Process Server and is connected to the Process Center. It can be obtained from Process Center under Servers tab (login WebPD, click Servers) ![][connected_server_name].  |
      | Server Host            | The BAW server host, the IP or the hostname of Process Server, it is used for snapshot deployment from PC to PS. In BAW HA environment, you can get this value from one of the application cluster members.                                                                                                                                                                       |
      | SOAP port              | Soap port id defined in Was console. To determine the correct port number, see the WebSphere administrative console Ports collection page (click Servers > Server Types > WebSphere application servers > server_name > Communications > Ports and find the value for SOAP_CONNECTOR_ADDRESS). In BAW HA environment, use the port configured for the application cluster member. |
      | WAS admin Command      | It is the path of wsadmin.sh in linux server, in BAW HA environment, use the path of wsadmin.sh in application cluster member.                                                                                                                                                                                                                                                    |      
      | WAS Admin username     | The name of the WAS Administrative user who can login the WAS console and can manages the product resources and user accounts in WebSphere Application Server. In BAW HA environment, use the WAS Admin user configured for the application cluster member.                                                                                                                       |
      | WAS Admin password     | The password of WAS admin user.                                                                                                                                                                                                                                                                                                                                                   |
      | SSH User Name          | The user who can access PC and PS by SSH key, this field is used for snapshot deployment from PC to PS. This user should have the permission to exeute wsadmin.sh, in BAW HA environment, use the SSH user configured for application cluster member.                                                                                                                             |
      | SSH key                | Used for snapshot deployment from PC to PS. The way to generate ssh key is here: [Link](../pipeline/pipeline-deploy-snapshot-from-pc-to-ps.html).                                                                                                                                                                                                                                          |


**Notes:**  

If you need to add bpmoc server,you don't need to fill everything only add BAW server url,server type,hostname and rest username(function id), password, auth command and method.    
If you login get 401 unauthorized error,please check your function id belong to tw_admins (administrative access) and tw_authors (non-administrative access) groups.

   ![][administrator_bpmoc]{:width="60%"}

## Edit BAW server
  1. Click **Edit** icon on the right of the BAW server that you want to edit.

     ![][administrator_edit_bpm_server]{:width="100%"}

  2. Change configurations of the BAW server. Then click **Save**.


## Delete BAW server
  Select the servers in the **BAW Configuration** table, then click the **delete** icon to delete BAW server.

## Test BAW server
  Select  **Test Connection** icon on the right of the BAW server that you want to test.If test connection is failed,it will popup warning message.   

  ![][administrator_test_bpm_server]{:width="100%"}

## Add user to a BAW server
  1. Click **Manage BAW User** icon on the right. Then you can see then BAW user list of the server.

     ![][administrator_edit_bpm_user]{:width="80%"}

  2. Click ![][add_icon] icon which is on the right of **BAW User Configuration**. Then fill out the form below to add a new user for the server.

     ![][administrator_bpmuser]{:width="60%"}      

	 |   Field                | Description                                                             |
     | ---------------------- |-------------------------------------------------------------------------|
     | Server                 | the BAW servers that need to add user                             |                                           
     | User Name              | the user name of BAW server                                              |  
     | Display Name           | the display name of BAW user                                          |
     | User Password          | the password of BAW user                                                |


     After adding user, you can see the user list for this BAW server.

     ![][administrator_bpmuserlist]{:width="80%"}   

  3. If the permission control of your BAW server is controlled by the UMS server, please add your UMS Admin user into ida and set it as UMS Admin user by following action:

	   a. Add UMS Admin user following steps one to two.

	   b. Set it as UMS Admin user:

	   ![][administration_set_as_ums_admin_user]{:width="100%"}

**Notes:**   
Pls make sure the added user  exist in your selected BAW server.Also You need to well define the **Display name** of the BAW user.You can choose the **Assignee** display name to choose user for the test case step command.

  ![][administrator_assignee]{:width="80%"}

What's more, you can also edit a BAW user in a similar way to editing a user.


## Add Case Object Store configuration to a BAW server
  1. Click **Case Object Store** icon on the right of the BAW server. Then you can see then Case Object Store configuration list of the server.

     ![][administrator_edit_case_object_store]{:width="100%"}

  2. Click ![][add_icon] icon which is on the right of **Case Object Store**. Then fill out the form below to add a Case Object Store configuration for the server.

     ![][administrator_case_object_store]{:width="60%"}         

	 |   Field                | Description                                                            |
     | ---------------------- |-------------------------------------------------------------------------|                                          
     | Server                 | the display name of BAW server                                          |  
     | Display Name           | the display name of Case Object Store configuration                     |                  
     | Design Object Store    | the case design object store of BAW server                              |                                   
     | Target Object Store    | the case target object store of BAW server                              |                         
     | Connection Point       | the case connection point of BAW server                                 |   
     | Target Environment Name| the case target environment name of BAW server                          |   
     
If the case functions are installed by default, please refer to the default configuration information.
     
|   Field | Workflow Center  |  Workflow Server | Workflow Center(Pak4BA) |  Workflow Server(Pak4BA) |
|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|
| Design Object Store    |     dos           |        dos            |    BAWDOS    |     BAWINS1DOS   |                         
| Target Object Store    |     tos           |         tos          |      BAWTOS       |BAWINS1TOS    |                                    
| Connection Point  |  TOS_Default_ConnPt   |    TOS_Default_ConnPt   |   pe_conn_tosuser   | pe_conn_tosuser|                                    
| Target Environment Name|     |   Workflow Default Target Environment |    |   Workflow Default Target Environment |                                                      


After adding Case Object Store, you can see the Case Object Store configuration list for this BAW server.

   ![][administrator_case_object_store_list]{:width="80%"}    

**Notes:**   
Pls make sure the added Case Object Store configurations exist in your selected BAW server. Also You need to well define the **Display name** of the Case Object Store.You can choose the **Case Object Store** display name to choose Case Object Store configuration when you create a test project.

  ![][administrator_case_object_store_project]{:width="60%"}

What's more, you can also edit a case object store configuration in a similar way to editing a user.

[administrator_bpmserver]: ../images/administrator/administrator_bpmserver.png
[administrator_bpmserver_adv]: ../images/administrator/administrator_bpmserver_adv.png
[administrator_bpmoc]: ../images/administrator/bpmoc.png
[administrator_bpmuser]: ../images/administrator/administrator_bpmuser.png
[administration_set_as_ums_admin_user]: ../images/administrator/administration_set_as_ums_admin_user.png
[administrator_bpmuserlist]: ../images/administrator/administrator_bpmuserlist.png
[administrator_assignee]: ../images/administrator/administrator_asignee.png
[add_icon]: ../images/administrator/Administrator_add_icon.png
[administrator_edit_bpm_server]: ../images/administrator/administrator_edit_bpm_server.png
[administrator_test_bpm_server]: ../images/administrator/administrator_test_bpm_server.png
[administrator_edit_bpm_user]: ../images/administrator/administrator_edit_bpm_user.png
[connected_server_name]: ../images/administrator/connected_server_name.png
[administrator_edit_case_object_store]: ../images/administrator/administrator_edit_case_object_store.png
[administrator_case_object_store]: ../images/administrator/administrator_case_object_store.png
[administrator_case_object_store_list]: ../images/administrator/administrator_case_object_store_list.png
[administrator_case_object_store_project]: ../images/administrator/administrator_case_object_store_project.png
[1]: ../test/test-write-java-command.html
