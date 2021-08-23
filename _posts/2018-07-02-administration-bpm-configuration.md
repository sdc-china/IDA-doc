---
title: "BAW configuration"
category: administration
date: 2018-10-19 15:17:55
last_modified_at: 2019-07-29 16:18:00
order: 2
---

# BAW configuration
***
### Add a BAW server
  1. Click **Administrator** tab, then switch to  **BPM Configurtaion** tab to manage BAW server.  

  2. Click ![][add_icon] icon which is on the right of **BPM Server Configuration** to add new BAW server.

  3. Fill out the form below. Then click **Create** button. Optional fields are hidden inside **Advance** section. Click **Advance** to show them.

     ![][administrator_bpmserver]  

      |   Field                | Description                                                             |
      | ---------------------- |-------------------------------------------------------------------------|                                          
      | Server Name            | The display name of this BAW server.                                                                        |  
      | Type                   | Options: DEV, QA, STG, PRO. If the BAW server is Process Center, please select DEV, if your server is Process Server, you should choose QA, STG or PRO, it depends on your actual environment.  |
      | Server Url             | The BAW server URL, eg: https://bawserver:9443. It is the prefix of BAW Process Admin Url or Process Portal Url. In BAW HA environment, this field should be the Url of the load balancer.  |                                        
      | REST User Name         | The name of the user who is a member of tw_admins or tw_authors group and has the Read permission to the target process application (If your want to catch a new snapshot for this process application in IDA, for example **Trigger by new Snapshot**, you need to have the Write permission to the process application). |
      | REST Password          | The Password of the user.                                            |   
      | Connected PS Server  | Connected Server Name is the online PS server name, authorized users can install snapshots of process applications on connected Process Servers. This field only needs to be filled when this server is Process Server and is connected to the Process Center. It can be obtained from Process Center under Servers tab (login WebPD, click Servers) ![][connected_server_name].           |
      | Server Host            | The BAW server host, the IP or the hostname of Process Server, it is used for snapshot deployment from PC to PS. In BAW HA environment, you can get this value from one of the application cluster members. |
      | SOAP port              | Soap port id defined in Was console. To determine the correct port number, see the WebSphere administrative console Ports collection page (click Servers > Server Types > WebSphere application servers > server_name > Communications > Ports and find the value for SOAP_CONNECTOR_ADDRESS). In BAW HA environment, use the port configured for the application cluster member.|
      | WAS admin Command      | It is the path of wsadmin.sh in linux server, in BAW HA environment, use the path of wsadmin.sh in application cluster member. |      
      | WAS Admin username     | The name of the WAS Administrative user who can login the WAS console and can manages the product resources and user accounts in WebSphere Application Server. In BAW HA environment, use the WAS Admin user configured for the application cluster member. |
      | WAS Admin password     | The password of WAS admin user.  | 
      | SSH User Name          | The user who can access PC and PS by SSH key, this field is used for snapshot deployment from PC to PS. This user should have the permission to exeute wsadmin.sh, in BAW HA environment, use the SSH user configured for application cluster member.  |
      | SSH key                | Used for snapshot deployment from PC to PS. The way to generate ssh key is here: [Link](https://sdc-china.github.io/IDA-doc/pipeline/pipeline-configuration-PCtoPS.html). |
       

**Notes:**  

If you need to add bpmoc server,you don't need to fill everything only add BAW server url,server type,hostname and rest username(function id) and password.    
If you login get 401 unauthorized error,please check your function id belong to tw_admins (administrative access) and tw_authors (non-administrative access) groups.

   ![][administrator_bpmoc]

### Edit BAW server
  1. Click **Edit** icon on the right of the BAW server that you want to edit.

     ![][administrator_edit_bpm_server]

  2. Change configurations of the BAW server. Then click **Save**.


### Delete BAW server
  Select the servers in the **BPM Configuration** table, then click the **delete** icon to delete BAW server.

### Test BAW server
  Select  **Test Connection** icon on the right of the BAW server that you want to test.If test connection is failed,it will popup warning message.   

  ![][administrator_test_bpm_server]

### Add user to a BAW server
  1. Click **Edit BPM User** icon on the right of the BAW server. Then you can see then BAW user list of the server.

     ![][administrator_edit_bpm_user]

  2. Click ![][add_icon] icon which is on the right of **BPM User Configuration**. Then fill out the form below to add a new user for the server.

     ![][administrator_bpmuser]           

	 |   Field                | Description                                                             |
     | ---------------------- |-------------------------------------------------------------------------| 
     | Server                 | the BAW servers that need to add user                             |                                           
     | User Name              | the user name of BAW server                                              |  
     | Display Name           | the display name of BAW user                                          |
     | User Password          | the password of BAW user                                                |


     After adding user, you can see the user list for this BAW server.

     ![][administrator_bpmuserlist]   
     
  3. If the permission control of your BAW server is controlled by the UMS server, please add your UMS Admin user into ida and set it as UMS Admin user by following action:

	   a. Add UMS Admin user following steps one to two.
		  	
	   b. Set it as UMS Admin user:
		  	
	   ![][administration_set_as_ums_admin_user]

**Notes:**   
Pls make sure the added user  exist in your selected BAW server.Also You need to well define the **Display name** of the BAW user.You can choose the **Assignee** display name to choose user for the test case step command.

  ![][administrator_assignee]   

What's more, you can also edit a BAW user in a similar way to editing a user.


### Add Case Object Store configuration to a BAW server
  1. Click **Case Object Store** icon on the right of the BAW server. Then you can see then Case Object Store configuration list of the server.

     ![][administrator_edit_case_object_store]

  2. Click ![][add_icon] icon which is on the right of **Case Object Store**. Then fill out the form below to add a Case Object Store configuration for the server.

     ![][administrator_case_object_store]           

	 |   Field                | Description                                                             |
     | ---------------------- |-------------------------------------------------------------------------|                                          
     | Server                 | the display name of BAW server                                          |  
     | Display Name           | the display name of Case Object Store configuration                     |                  
     | Design Object Store    | the case design object store of BAW server                              |                                   
     | Target Object Store    | the case target object store of BAW server                              |                         
     | Connection Point       | the case connection point of BAW server                            |                              


     After adding Case Object Store, you can see the Case Object Store configuration list for this BAW server.

     ![][administrator_case_object_store_list]    
     
**Notes:**   
Pls make sure the added Case Object Store configurations exist in your selected BAW server. Also You need to well define the **Display name** of the Case Object Store.You can choose the **Case Object Store** display name to choose Case Object Store configuration when you create a test project.

  ![][administrator_case_object_store_project] 
  
What's more, you can also edit a case object store configuration in a similar way to editing a user.

[administrator_bpmserver]: ../images/administrator/administrator_bpmserver.png
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