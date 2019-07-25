---
title: "Users management"
category: administration
date: 2018-01-05 15:17:55
order: 1
permalink: /administration/administration-bpm-configuration.html
---

### Add a new user 
  Use super account (idaAdmin/idaAdmin) login into IDA application.
  1. Click **Administrator** tab, then switch to  **Users management** tab to add user.  
  2. Click ![][add_icon] icon which is on the right of **Users Management** to add new users. 
  3. Fill out the form below. Then click **Create** button.
  
     ![][administrator_add]  
	
     |   Field       | Description               |
     | --------------|---------------------------| 
     | User Name     | Use email address as user name| 
     | Role          | A user can have multiple roles, only Admin role user can configure settings|
     
     Permissions for each role are shown in the following figure:
     
     ![][administrator_role_permission]
     
     **Notes:**
     
     Role and role privileges can be customized according to client needs.
                
  4. Click **Reset password** button can reset password of one user. The default password is **123456**.
  
     ![][administrator_reset_password]  

### Edit a user 
  1. Click **Edit** icon on the right of the user that you want to edit.
  
     ![][administrator_edit_user]
     
  2. Change roles of the user. Then click **Save**.
  
### Activate/Deactivate users
  
   Select users in the **Users Management** table, then click **Activate** button to activate the selected inactive users. And click **Deactivate** button to deactivate the selected active users.
   
   	![][administrator_active_user]
  
### User profile 
  
  1. On the top right corner, click the  **Profile** icon.
  
     ![][administrator_profile]
     
  2. Click **Info** button to get basic information of your account.
  
  3. Click **Setting** button to change your password.
  
      ![][administrator_password]
  
  4. Click **Projects** button to get basic information of your projects.
  
      ![][administrator_profile_page]
  
  
[administrator_add]: ../images/administrator/Administrator_add.png
[administrator_reset]: ../images/administrator/Administrator_reset.png
[administrator_profile]: ../images/administrator/administrator_profile.PNG
[administrator_profile_page]: ../images/administrator/administrator_profile_page.PNG
[administrator_password]: ../images/administrator/administrator_password.png
[add_icon]: ../images/administrator/Administrator_add_icon.png
[administrator_reset_password]: ../images/administrator/administrator_reset_password.png
[administrator_edit_user]: ../images/administrator/administrator_edit_user.png
[administrator_active_user]: ../images/administrator/administrator_active_user.png
[administrator_role_permission]: ../images/administrator/administrator_role_permission.png



