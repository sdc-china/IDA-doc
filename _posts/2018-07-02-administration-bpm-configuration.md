---
title: "BPM configuration"
category: administration
date: 2018-10-19 15:17:55
last_modified_at: 2019-07-29 16:18:00
order: 2
---

# BPM configuration
***
### Add a BPM server
  1. Click **Administrator** tab, then switch to  **BPM Configurtaion** tab to manage BPM server.  

  2. Click ![][add_icon] icon which is on the right of **BPM Server Configuration** to add new BPM server.

  3. Fill out the form below. Then click **Create** button.

     ![][administrator_bpmserver]  

      |   Field                | Description                                                             |
      | ---------------------- |-------------------------------------------------------------------------|                                          
      | Server Name            | the BPM server display name                                                                          |  
      | Type                   | Options: DEV, QA, STG, PRO. If the BPM server is Process Center, please select DEV, if your server is Process Server, you should choose QA, STG or PRO, it depends on your actual environment  |
      | Server Url             | the BPM server URL, eg: https://bpmserver:9443, you can get it from the BPM Process Admin Url or Process Portal Url, but only keep the protocol, hostname and port, do not type other words after port, in HA environment, server url is the load balancer Url.  |                                        
      | REST User Name         | BPM server rest api username, REST user should be added to tw_admins group, and need to have the Read permission to access the process application that your want to test in IDA (If your want to take process app snapshot in IDA, you need to add Write permission to this REST user) |
      | REST Password          | BPM server rest api password                                            |   
      | Connected Server Name  | online PS server name, only need to be filled when this server is Process Server, this server is connected to the Process Center. Authorized users can install snapshots of process applications on connected Process Servers, we can get this name from Process Center under Servers tab  ((login WebPD, click Servers) ![][connected_server_name]           |
      | Server Host            | the BPM server host, the IP of Process Server Url, it is used to for snapshot deployment from PC to PS, in HA environment, server url is the load balancer Url. |
      | SOAP port              | soap port defined in Was console. To determine the correct port number, see the WebSphere administrative console Ports collection page (click Servers > Server Types > WebSphere application servers > server_name > Communications > Ports and find the value for SOAP_CONNECTOR_ADDRESS) , in HA environment, use the port configured for the application cluster member.|
      | WAS admin Command      | the path of wsadmin.sh in linux server, in HA environment, use the path of wsadmin.sh in application cluster member. |      
      | WAS Admin username     | WAS admin name, the Administrative user who manages the product resources and user accounts in WebSphere Application Server, in HA environment, use the Admin username in application cluster member. |
      | WAS Admin password     | WAS admin password  | 
      | SSH User Name          | used for snapshot deployment from PC to PS, this user should have the permission to exeute wsadmin.sh, in HA environment, use the SSH user in application cluster member.  |
      | SSH key                | used for snapshot deployment from PC to PS, the way to generate ssh key is here: [Link](https://sdc-china.github.io/IDA-doc/pipeline/pipeline-configuration-PCtoPS.html) |
       

**Notes:**  

If you need to add bpmoc server,you don't need to fill everything only add bpm server url,server type,hostname and rest username(function id) and password.    
If you login get 401 unauthorized error,please check your function id belong to tw_admins (administrative access) and tw_authors (non-administrative access) groups.

   ![][administrator_bpmoc]

### Edit BPM server
  1. Click **Edit** icon on the right of the BPM server that you want to edit.

     ![][administrator_edit_bpm_server]

  2. Change configurations of the BPM server. Then click **Save**.


### Delete BPM server
  Select the servers in the **BPM Configuration** table, then click the **delete** icon to delete BPM server.

### Test BPM server
  Select  **Test Connection** icon on the right of the BPM server that you want to test.If test connection is failed,it will popup warning message.   

  ![][administrator_test_bpm_server]

### Add user to a BPM server
  1. Click **Edit BPM User** icon on the right of the BPM server. Then you can see then BPM user list of the server.

     ![][administrator_edit_bpm_user]

  2. Click ![][add_icon] icon which is on the right of **BPM User Configuration**. Then fill out the form below to add a new user for the server.

     ![][administrator_bpmuser]           

	 |   Field                | Description                                                             |
     | ---------------------- |-------------------------------------------------------------------------|                                          
     | User    Name           | the user name of BPM server                                              |  
     | Display Name           | the display name of BPM user                                          |
     | User Password          | the password of BPM user                                                |
     | Role                   | the logical role name of BPM user                                                    |  


     After adding user, you can see the user list for this BPM server.

     ![][administrator_bpmuserlist]    

**Notes:**   
Pls make sure the added user  exist in your selected BPM server.Also You need to well define the **Display name** of the BPM user.You can choose the **Assignee** display name to choose user for the test case step command.

  ![][administrator_assignee]   

What's more, you can also edit a bpm user in a similar way to editing a user.

[administrator_bpmserver]: ../images/administrator/administrator_bpmserver.png
[administrator_bpmoc]: ../images/administrator/bpmoc.png
[administrator_bpmuser]: ../images/administrator/administrator_bpmuser.png
[administrator_bpmuserlist]: ../images/administrator/administrator_bpmuserlist.png
[administrator_assignee]: ../images/administrator/administrator_asignee.png
[add_icon]: ../images/administrator/Administrator_add_icon.png
[administrator_edit_bpm_server]: ../images/administrator/administrator_edit_bpm_server.png
[administrator_test_bpm_server]: ../images/administrator/administrator_test_bpm_server.png
[administrator_edit_bpm_user]: ../images/administrator/administrator_edit_bpm_user.png
[connected_server_name]: ../images/administrator/connected_server_name.png
