---
title: "Team Management"
category: administration
date: 2018-10-02 15:17:55
last_modified_at: 2025-11-28 12:21:00
---

# Team Management
***

## Add a team
  1. Click **Administrator** tab, then switch to **Team Management** tab to manage teams.  

  2. Click ![][add_icon] icon which is on the right of **Team Management**.

  3. Fill out the form below. Then click **Create** button.

     ![][administrator_add_team]{:width="60%"}

     |   Field                | Description |
     |------------------------|-------------|                                          
     | Team Name              | the name of the created team|  
     | Description            | more description or information of the created team|
     | Access All BAW Server  | If checked, then the users in this team can access all BAW servers without assignment.|
     | Access All Selenium Server  | If checked, then the users in this team can access all selenium servers without assignment.|

     **Notes:**

     If checkboxes *Access All BAW Server* and *Access All Selenium Server* are checked, then the team is an administration team. Its users can access all BAW servers, process apps and selenium grids, which does not have to assign. *Process App Assignment* and *Selenium Grid Assignment* buttons are not available.

     ![][administration_super_team]{:width="80%"}

## Edit a team

  1. Click **Edit** icon on the right of the team that you want to edit.

     ![][administrator_edit_team]{:width="80%"}

  2. Change configurations of the team. Then click **Save**.

## Delete teams

  Select the teams in the **Teams Management** table, then click the **delete** icon to delete teams.

### Assign users to a team/ Remove users from a team

  1. Click **User Assignment** icon on the right of the team that you want to assign or remove users.

     ![][administrator_assign_user]{:width="80%"}

  2. The left table of the modal lists the users who do not belong to the team, while the right table lists those who do. You can select users in the left table and click ![][administrator_assign_button] to assign users to the team. Similarly, you can select users in the right table and click ![][administrator_remove_button] to remove users from the team.

     ![][administrator_assign]{:width="70%"}

## Assign process apps to a team

  1. Click **Process App Assignment** icon on the right of the team that you want to assign or remove process apps.

     ![][administrator_assign_processapps]{:width="80%"}

  2. Select a server, and the left table of the modal lists the process apps which belong to the server but do not belong to the team.

  3. Select process apps in the left table and click ![][administrator_assign_button] to assign process apps to the team.

  4. After finishing step 3, the assigned process apps will appear below the selected server.

     ![][administrator_assign_process_apps]{:width="70%"}

## Remove process apps from a team

  1. Click a server, and the right table of the modal lists the process apps which are under the server and belong to the team.

  2. Select process apps in the right table and click ![][administrator_remove_button] to remove process apps from the team.

  3. After finishing step 2, the selected server in step 1 will be selected in the left modal, and the removed process apps will appear in the lists which belong to the server but do not belong to the team.

## Assign selenium grids to a team/ Remove selenium grids from a team

  1. Click **Selenium Grid Assignment** icon on the right of the team that you want to assign or remove selenium grids.

     ![][administrator_assign_selenium_grid]{:width="80%"}

  2. The left table of the modal lists the selenium grids which do not belong to the team, while the right table lists those that do. You can select selenium grids in the left table and click ![][administrator_assign_button] to assign them to the team. Similarly, you can select selenium grids in the right table and click ![][administrator_remove_button] to remove them from the team.

     ![][administrator_assign_seleniumgrds]{:width="70%"}







[add_icon]: ../images/administrator/Administrator_add_icon.png
[administrator_add_team]: ../images/administrator/administrator_add_team.png
[administrator_edit_team]: ../images/administrator/administrator_edit_team.png
[administrator_assign_user]: ../images/administrator/administrator_assign_user.png
[administrator_assign_button]: ../images/administrator/administrator_assign_button.png
[administrator_remove_button]: ../images/administrator/administrator_remove_button.png
[administrator_assign]: ../images/administrator/administrator_assign.png
[administrator_assign_processapps]: ../images/administrator/administrator_assign_processapps.png
[administrator_assign_selenium_grid]: ../images/administrator/administrator_assign_selenium_grid.png
[administrator_assign_seleniumgrds]: ../images/administrator/administrator_assign_seleniumgrds.png
[administrator_assign_process_apps]: ../images/administrator/administrator_assign_process_apps.png
[administration_super_team]: ../images/administrator/administration_super_team.png