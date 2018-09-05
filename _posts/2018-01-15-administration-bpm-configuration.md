---
layout: page
title: "BPM configuration"
category: administration
date: 2018-01-05 15:17:55
order: 2
---

### Add a BPM server
  1. Click **Administrator** tab, then switch to  **BPM configurtaion** tab to manage BPM server.  
  
  2. Click **add new row** icon to add a new BPM server.  
  
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


### Edit BPM server
  Select the server in the **BPM Configuration** table, then click the	**edit** icon to edit a BPM server. 


### Delete BPM server
  Select the server in the **BPM Configuration** table, then click the **delete** icon to delete BPM server. 

### Add user to a BPM server
  1. Select the server in the **BPM Configuration** table, then click the **BPM User** icon to add user. Then you can see the BPM user list table. 
  
  2. Click **add new row** icon from bpm user table to add a new BPM user.  
	
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
You need to well define the **Display name** of the BPM user.You can choose the **Assignee** display name to choose user for the test case step command.

  ![][administrator_assignee]   
  
[administrator_bpmserver]: ../images/administrator/administrator_bpmserver.png
[administrator_bpmuser]: ../images/administrator/administrator_bpmuser.png
[administrator_bpmuserlist]: ../images/administrator/administrator_userlist.png
[administrator_assignee]: ../images/administrator/administrator_asignee.png
