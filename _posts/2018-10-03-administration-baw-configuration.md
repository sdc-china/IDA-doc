---
title: "BAW Configuration"
category: administration
date: 2018-10-03 15:17:55
last_modified_at: 2023-02-28 15:30:00
---

# BAW Configuration
***

## Add a BAW server
  1. Click the **Administrator** tab, then switch to the **BAW Configuration** tab to manage the BAW server.

  2. Click the ![][add_icon] icon on the right of **BAW Server Configuration** to add a new BAW server.

  3. Fill out the form below. Then click the **Create** button. Optional fields are hidden inside the **Advanced** section. Click **Advanced** to show them.

     ![][administrator_bpmserver]{:width="60%"}

     ![][administrator_bpmserver_adv]{:width="60%"}

     |   Field                | Description                                                                                                                                                                                                                                                                                                                                                                       |
      |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
      | Server Name            | The display name of this BAW server.                                                                                                                                                                                                                                                                                                                                              |
      | Type                   | Options: Development, Test, Stage, Production. If the BAW server is Process Center, please select Development. If your server is Process Server, you should choose Test, Stage or Production, depending on your actual environment.                                                                                                                                                                                    |
      | Server Url             | The BAW server URL, e.g., https://bawserver:9443. It is the prefix of the BAW Process Admin URL or Process Portal URL. In a BAW HA environment, this field should be the URL of the load balancer.                                                                                                                                                                                        |
      | REST User Name         | The name of the user who is a member of the tw_admins or tw_authors group and has the Read permission to the target process application (If you want to catch a new snapshot for this process application in IDA, for example, **Trigger by new Snapshot**, you need to have the Write permission to the process application).                                                        |
      | REST Password          | The password of the user.                                                                                                                                                                                                                                                                                                                                                         |
      | Auth Command           | Choose the custom Java command that can automate the custom SSO page of the BAW server [1].                                                                                                                                                                                                                                                                                            |
      | Auth Method            | When the BAW server doesn't support BASIC Authentication, please set the authentication method to OTHER.                                                                                                                                                                                                                                                                          |
      | Connected PS Server  | The Connected Server Name is the online PS server name. Authorized users can install snapshots of process applications on connected Process Servers. This field only needs to be filled when this server is a Process Server and is connected to the Process Center. It can be obtained from the Process Center under the Servers tab (login to WebPD, click Servers) ![][connected_server_name].  |
      | Server Host            | The BAW server host, the IP or the hostname of the Process Server. It is used for snapshot deployment from PC to PS. In a BAW HA environment, you can get this value from one of the application cluster members.                                                                                                                                                                       |
      | SOAP port              | The SOAP port ID defined in the WebSphere console. To determine the correct port number, see the WebSphere administrative console Ports collection page (click Servers > Server Types > WebSphere application servers > server_name > Communications > Ports and find the value for SOAP_CONNECTOR_ADDRESS). In a BAW HA environment, use the port configured for the application cluster member. |
      | WAS admin Command      | It is the path of wsadmin.sh on the Linux server. In a BAW HA environment, use the path of wsadmin.sh in the application cluster member.                                                                                                                                                                                                                                    |
      | WAS Admin username     | The name of the WebSphere Administrative user who can log in to the WebSphere console and manage the product resources and user accounts in WebSphere Application Server. In a BAW HA environment, use the WebSphere Admin user configured for the application cluster member.                                                                                                       |
      | WAS Admin password     | The password of the WebSphere admin user.                                                                                                                                                                                                                                                                                                                                                   |
      | SSH User Name          | The user who can access PC and PS by SSH key. This field is used for snapshot deployment from PC to PS. This user should have permission to execute wsadmin.sh. In a BAW HA environment, use the SSH user configured for the application cluster member.                                                                                                                             |
      | SSH key                | Used for snapshot deployment from PC to PS. The way to generate an SSH key is here: [Link](../administration/administration-ssh-configuration.html).                                                                                                                                                                                                                                          |


**Notes:**
If you log in and get a 401 unauthorized error, please check if your function ID belongs to the tw_admins (administrative access) and tw_authors (non-administrative access) groups.

## Edit a BAW server
  1. Click the **Edit** icon on the right of the BAW server that you want to edit.

     ![][administrator_edit_bpm_server]{:width="100%"}

  2. Change the configurations of the BAW server. Then click **Save**.


## Delete a BAW server
  Select the servers in the **BAW Configuration** table, then click the **delete** icon to delete the BAW server.

## Test a BAW server
  Select the **Test Connection** icon on the right of the BAW server that you want to test. If the test connection fails, it will pop up a warning message.

  ![][administrator_test_bpm_server]{:width="100%"}

## Add a user to a BAW server
  1. Click the **Manage BAW User** icon on the right. Then you can see the BAW user list for the server.

     ![][administrator_edit_bpm_user]{:width="80%"}

  2. Click the ![][add_icon] icon on the right of **BAW User Configuration**. Then fill out the form below to add a new user for the server.

     ![][administrator_bpmuser]{:width="60%"}

     |   Field                | Description                                                             |
     | ---------------------- |-------------------------------------------------------------------------|
     | Server                 | The BAW servers that need to add a user                                |
     | User Name              | The username of the BAW server user                                    |
     | Display Name           | The display name of the BAW user                                       |
     | User Password          | The password of the BAW user                                           |


     After adding the user, you can see the user list for this BAW server.

     ![][administrator_bpmuserlist]{:width="80%"}

  3. If the permission control of your BAW server is controlled by the UMS server, please add your UMS Admin user to IDA and set it as the UMS Admin user by following these steps:

     a. Add the UMS Admin user following steps one to two.

     b. Set it as the UMS Admin user:

     ![][administration_set_as_ums_admin_user]{:width="100%"}

**Notes:**
Please make sure the added user exists in your selected BAW server. Also, you need to well define the **Display name** of the BAW user. You can choose the **Assignee** display name to choose a user for the test case step command.

  ![][administrator_assignee]{:width="80%"}

Moreover, you can also edit a BAW user in a similar way to editing a user.


## Add a Case Object Store configuration to a BAW server
  1. Click the **Case Object Store** icon on the right of the BAW server. Then you can see the Case Object Store configuration list for the server.

     ![][administrator_edit_case_object_store]{:width="100%"}

  2. Click the ![][add_icon] icon on the right of **Case Object Store**. Then fill out the form below to add a Case Object Store configuration for the server.

     ![][administrator_case_object_store]{:width="60%"}

     |   Field                | Description                                                            |
     | ---------------------- |-------------------------------------------------------------------------|
     | Server                 | The display name of the BAW server                                     |
     | Display Name           | The display name of the Case Object Store configuration               |
     | Design Object Store    | The case design object store of the BAW server                        |
     | Target Object Store    | The case target object store of the BAW server                        |
     | Connection Point       | The case connection point of the BAW server                           |
     | Target Environment Name| The case target environment name of the BAW server                    |

If the case functions are installed by default, please refer to the default configuration information.

|   Field | Workflow Center  |  Workflow Server | Workflow Center(Pak4BA) |  Workflow Server(Pak4BA) |
|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|
| Design Object Store    |     dos           |        dos            |    BAWDOS    |     BAWINS1DOS   |
| Target Object Store    |     tos           |         tos          |      BAWTOS       |BAWINS1TOS    |
| Connection Point  |  TOS_Default_ConnPt   |    TOS_Default_ConnPt   |   pe_conn_tosuser   | pe_conn_tosuser|
| Target Environment Name|     |   Workflow Default Target Environment |    |   Workflow Default Target Environment |


After adding the Case Object Store, you can see the Case Object Store configuration list for this BAW server.

   ![][administrator_case_object_store_list]{:width="80%"}

**Notes:**
Please make sure the added Case Object Store configurations exist in your selected BAW server. Also, you need to well define the **Display name** of the Case Object Store. You can choose the **Case Object Store** display name to choose a Case Object Store configuration when you create a test project.

  ![][administrator_case_object_store_project]{:width="60%"}

Moreover, you can also edit a case object store configuration in a similar way to editing a user.

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