---
title: "Role Management"
category: administration
date: 2018-10-02 17:17:55
last_modified_at: 2025-11-28 12:21:00
---

# Role Management
***

## Add a role
  1. Click **Administrator** tab, then switch to **Role Management** page to manage roles and permissions.  

  2. Click ![][add_icon] icon which is on the right of **Role Management**.

  3. Fill out the form below. Then click **Create** button. After a role is created, manage its permissions in the **Role Management** table.

     ![][administrator_add_role]{:width="60%"}

     |   Field                | Description |
     |------------------------|-------------|                                          
     | Role Name              | the name of the created role|

## Edit a role

  1. Click **Edit** icon on the last column of the row of role that you want to edit.

     ![][administrator_edit_role]{:width="80%"}

  2. Change name of the role. Then click **Save**.

## Delete a role

  1. Click **Delete** icon on the last column of the row of role that you want to delete.

     ![][administrator_delete_role]{:width="80%"}

  2. Change name of the role. Then click **OK**.

## Edit role permissions

  Check/uncheck permissions in the **Role Management** table, then click the **Save** button to update role permssions. The permissions are categorized into "Admin", "Testing", "Code Review", "Operations", "Permission" and "Configuration". Hover mouse over the Info icon of each permission, to view description of the permission.

  ![][administrator_update_permissions]{:width="80%"}

  When Role Management permission is removed from all roles, a warning message will show up, as if this permission is removed from all no user will be able to access the Role Mangament page.

  ![][administrator_update_permissions_warning]{:width="80%"}


[add_icon]: ../images/administrator/Administrator_add_icon.png
[administrator_add_role]: ../images/administrator/administrator_add_role.png
[administrator_edit_role]: ../images/administrator/administrator_edit_role.png
[administrator_delete_role]: ../images/administrator/administrator_delete_role.png
[administrator_update_permissions]: ../images/administrator/administrator_update_permissions.png
[administrator_update_permissions_warning]: ../images/administrator/administrator_update_permissions_warning.png