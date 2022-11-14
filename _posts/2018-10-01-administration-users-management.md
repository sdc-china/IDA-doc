---
title: "Users Management"
category: administration
date: 2018-10-01 15:17:55
last_modified_at: 2019-07-29 16:18:00
---

# Users Management
***

## Add a new user
  Use super account (idaAdmin/idaAdmin) login into IDA application.
  1. Click **Administrator** tab, then switch to  **Users management** tab to add user.  
  2. Click ![][add_icon] icon which is on the right of **Users Management** to add new users.
  3. Fill out the form below. Then click **Create** button.

     ![][administrator_add]{:width="40%"}

     |   Field       | Description               |
     | --------------|---------------------------|
     | User Name     | Use email address as user name|
     | Role          | A user can have multiple roles, only Admin role user can configure settings|

     Permissions for each role are shown in the following figure:

     ![][administrator_role_permission]

     **Notes:**

     Role and role privileges can be customized according to client needs.

  4. Click **Reset password** button can reset password of one user. The default password is **123456**.

     ![][administrator_reset_password]{:width="73%"} 

## Edit a user
  1. Click **Edit** icon on the right of the user that you want to edit.

     ![][administrator_edit_user]{:width="73%"}

    2. Change roles of the user. Then click **Save**.

## Activate/Deactivate users

   Select users in the **Users Management** table, then click **Activate** button to activate the selected inactive users. And click **Deactivate** button to deactivate the selected active users.

   	![][administrator_active_user]{:width="73%"}

## User profile

  1. On the top right corner, click the  **Profile** icon.

     ![][administrator_profile]{:width="90%"}

  2. Click **Profile** button to get basic information of your account.

     ![][administrator_profile_page]{:width="73%"}

  3. Click **API Access** button to generate your token

     ![][administrator_api_access]{:width="73%"}

  4. Click **Team** button to see which teams this user belongs to, you can also see which process apps and selenium grids each team can access.
  
     ![][administration_user_team]{:width="73%"}
  5. Click **Password** button to change your password.

     ![][administrator_password]{:width="73%"}

# LDAP Users Management 

  1. A user would be added to IDA system automatically if the user pass LDAP authentication from IDA login page. 

  2. A user with admin role could 'Add', 'Deactivate' and 'Active' user from User Management page.

     ![][ldap_user_management]{:width="80%"}

  3. A user with admin role could edit other user role from edit user modal.

     ![][edit_user_modal]{:width="40%"}

  4. All ldap users could not update password from IDA.


[administrator_add]: ../images/administrator/Administrator_add.png
[administrator_reset]: ../images/administrator/Administrator_reset.png
[administrator_profile]: ../images/administrator/administrator_profile.PNG
[administrator_profile_page]: ../images/administrator/administrator_profile_page.PNG
[administrator_api_access]: ../images/administrator/administrator_api_access.png
[administrator_password]: ../images/administrator/administrator_password.png
[add_icon]: ../images/administrator/Administrator_add_icon.png
[administrator_reset_password]: ../images/administrator/administrator_reset_password.png
[administrator_edit_user]: ../images/administrator/administrator_edit_user.png
[administrator_active_user]: ../images/administrator/administrator_active_user.png
[administrator_role_permission]: ../images/administrator/administrator_role_permission.png
[administration_user_team]: ../images/administrator/administration_user_team.png
[ldap_user_management]: ../images/administrator/ldap_user_management.png
[edit_user_modal]: ../images/administrator/edit_user_modal.png