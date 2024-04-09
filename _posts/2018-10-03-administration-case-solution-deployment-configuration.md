---
title: "Case Solution Deployment Configuration"
category: administration
date: 2018-08-05 15:17:55
last_modified_at: 2023-06-09 17:31:00
---

# Case Solution Deployment Configuration
***
A set of initial configuration is required to enable Case Solution Deployment.

## Case Object Store Configuration

Before deploying using IDA, please make sure you have configured the Case Object Store on the Workflow Center and Workflow Server in the IDA BAW Configuration.

Please reference the [Add Case Object Store Configuration to a BAW Server](https://sdc-china.github.io/IDA-doc/administration/administration-baw-configuration.html#add-case-object-store-configuration-to-a-baw-server)

## Manage Roles

If you are using a case project and deploying for the first time, you need to manage roles for the case project.

1. Log in to the **Case Client** Console: https://[Server URL]:[Port]/navigator/?desktop=baw

2. From the list of available solutions, expand your solution, and click **Manage Roles**.

   ![][case_manager_roles_warning]{:height="90%" width="90%"}
   ![][case_manager_roles]{:height="90%" width="90%"}

## Security Configuration

If you are using a case project and deploying for the first time, the following prompt message may appear when adding a new case in the Workflow Server environment:
 
  ![][case_insufficient_message]{:height="60%" width="60%"}
  
You need to configure the **Security Configuration** in your Workflow Server environment.

1. Log in to the **Case Administration** Console: https://[Server URL]:[Port]/navigator/?desktop=bawadmin

2. Open the project you want to configure in the Design Object Store, click **Action** -> **Manage** -> **Security Configuration**

   ![][case_administration_security_configuration]{:height="90%" width="90%"}
  
3. You can import the **Security Configuration** which was exported from the Workflow Center server, or create a new **Security Configuration**.

   ![][case_security_configuration_add]{:height="90%" width="90%"}
  
  
4. Configure/Modify the role permissions.

   ![][case_security_configuration_role]{:height="90%" width="90%"}
  
5. Associate users and groups with roles.
  
   ![][case_security_configuration_users]{:height="90%" width="90%"}
   
   **Note: After this step is executed, you don't need to configure Manager Roles, but after the Manager Roles are configured, this step still needs to be configured.**
  
6. Save and Apply this configuration. 

7. Deploy the **Security Configuration** to the Target Object Store.

   ![][case_ps_deploy]{:height="90%" width="90%"}
   
For more information, please reference the [Configuring the Target Environment After Solution Deployment](https://www.ibm.com/support/knowledgecenter/SS8JB4_19.x/com.ibm.casemgmt.design.doc/acmdc054.html)

[case_insufficient_message]: ../images/pipeline/case_insufficient_message.png
[case_administration_security_configuration]: ../images/pipeline/case_administration_security_configuration.png
[case_security_configuration_add]: ../images/pipeline/case_security_configuration_add.png
[case_security_configuration_role]: ../images/pipeline/case_security_configuration_role.png
[case_security_configuration_users]: ../images/pipeline/case_security_configuration_users.png
[case_ps_deploy]: ../images/pipeline/case_ps_deploy.png
[case_manager_roles_warning]: ../images/pipeline/case_manager_roles_warning.png
[case_manager_roles]: ../images/pipeline/case_manager_roles.png