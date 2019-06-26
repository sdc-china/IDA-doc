---
layout: page
title: "BPM configuration"
category: administration
date: 2018-01-05 15:17:55
order: 2
---

### Add a BPM server
  1. Click **Administrator** tab, then switch to  **BPM Configurtaion** tab to manage BPM server.  
  
  2. Click ![][add_icon] icon which is on the right of **BPM Server Configuration** to add new BPM server. 
  
  3. Fill out the form below. Then click **Create** button.
  
     ![][administrator_bpmserver]  

      |   Field                | Description                                                             |
      | ---------------------- |-------------------------------------------------------------------------|                                          
      | Server Name            | the BPM server name                                                                        |  
      | Type                   | DEV, QA, STG, PRO                                                          |
      | BPM Version            | the BPM server version                                                                        |
      | Server Url             | the BPM server URL, eg: https://bpmserver:9443                     |                                                                        
      | SOAP port              | soap port defined in Was console                                |
      | SSH User Name          | used for snapshot deployment from PC to PS                            | 
      | SSH key                | used for snapshot deployment from PC to PS                           |
      | WAS admin Command      | the path of wsadmin.sh  in linux server                                 |      
      | Rest User Name         | BPM server rest api username                                            |
      | Rest Password          | BPM server rest api password                                            |   
      | WAS Admin username     | WAS admin name                                                                        |
      | WAS Admin password     | WAS admin password                                                                        |  
      | Connected Server Name  | online PS server name               |

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
