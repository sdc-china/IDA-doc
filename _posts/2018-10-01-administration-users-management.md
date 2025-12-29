---
title: "User Management"
category: administration
date: 2018-10-01 15:17:55
last_modified_at: 2025-12-26 12:00:00
---

# User Management
***

## Add a New User
  Use the super account (idaAdmin/idaAdmin) to log in to the IDA application.
  1. Click the **Administrator** tab, then switch to the **User Management** tab to add users.  
  2. Click the ![][add_icon] icon on the right of **User Management** to add new users.
  3. Fill out the form below. Then click the **Create** button.

     ![][administrator_add]{:width="60%"}

     |   Field       | Description               |
     | --------------|---------------------------|
     | User Name     | Use an email address as the username|
     | Role          | A user can have multiple roles, only users with the Admin role can configure settings|

     Permissions for each role are shown in the following figure:

     ![][administrator_role_permission]{:width="100%"}

     **Note:**

     Roles and role privileges can be customized according to client needs.

  4. Click the **Reset Password** button to reset the password of a user. The default password is **123456**.

     ![][administrator_reset_password]{:width="100%"} 

## Edit a User
  1. Click the **Edit** icon on the right of the user you want to edit.

     ![][administrator_edit_user]{:width="100%"}

  2. Change the roles of the user. Then click **Save**.

## Activate/Deactivate Users

   Select users in the **User Management** table, then click the **Activate** button to activate the selected inactive users. And click the **Deactivate** button to deactivate the selected active users.

   	![][administrator_active_user]{:width="100%"}

## Remove a User
  1. Click the **Remove** icon on the right of the user you want to remove.

     ![][administrator_remove_user]{:width="70%"}

  2. Select to whom shared resources if existed will be transferred. Then click **OK**.

     ![][administrator_remove_user_transfer]{:width="70%"}

## User Profile

  1. In the top right corner, click the **Profile** button.

     ![][administrator_profile]{:width="100%"}

  2. Click the **Profile** button to get basic information about your account.

     ![][administrator_profile_page]{:width="100%"}
    
  3. Click the **Team** button to see which teams this user belongs to, you can also see which process apps and Selenium grids each team can access.
  
     ![][administration_user_team]{:width="100%"}
  4. Click the **Password** button to change your password.

     ![][administrator_password]{:width="100%"}

# LDAP User Management 

  1. A user would be added to the IDA system automatically if the user passes LDAP authentication from the IDA login page. 

  2. A user with the admin role could 'Add', 'Deactivate', and 'Activate' users from the User Management page.

     ![][ldap_user_management]{:width="100%"}

  3. A user with the admin role could edit other users' roles from the edit user modal.

     ![][edit_user_modal]{:width="60%"}

  4. All LDAP users could not update their passwords from IDA.


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
[administrator_remove_user]: ../images/administrator/administrator_remove_user.png
[administrator_remove_user_transfer]: ../images/administrator/administrator_remove_user_transfer.png