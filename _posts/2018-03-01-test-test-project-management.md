---
title: "Test Project Management"
category: test
date: 2018-03-01 15:17:55
last_modified_at: 2019-07-26 16:23:00
---

# Test Project Management
***

## Create a Test Project

  1. On the project list page, click the **Create Project** button.
  
     ![][tutorial_createproject] 
     
     Click Advanced: 
     
     ![][tutorial_createproject_advance] 
  
  2. Fill in the project form according to the following table.
  
     Parameter             | Description       
     ----------------------|-------------------
     Project Name          | Name of the project    
     Project Description   | Description of the project
     Visibility            | Team for the project
     Server                | Server environment
     Case Object Store     | Server Case Object Store configuration
     Process App           | Process apps of the selected server
     Toolkit               | Toolkits of the selected server
     Trace                 | The branch of the selected process app or toolkit
     Snapshot              | The snapshot of the selected branch
     [Default Assignee][3] | Default assignee Workflow User
     [Default Selenium Grid][2]  | Support Chrome, Firefox Selenium node 
     [Other Selenium Grids][2]    | Support Chrome, Firefox Selenium node 
     Tip                   | Use the latest snapshot 
     Advanced               | Show the engine configuration
     Retry Times           | The retry times of the failed command
     Retry Interval        | The interval time between the retries (seconds) 
     Load Test             | Enable load test
     Post Script           | Enable post script for each test step	 
     
     **Notes:**     
     
     Remember to select either the process app or the toolkit, but not both.
     If the permission control of your BAW server is controlled by the UMS server, please add your UMS Admin user into IDA and set it as the UMS Admin user. Refer to [Add user to a BAW server][3].
        
  3. Click the **Create** button, you will enter the project dashboard page.

     ![][tutorial_project_info] 
  
### Edit a Test Project

  1. Click the Edit button on the project dropdown menu on project list page.
  
     ![][tutorial_project_list]
     
     ![][test_project_edit_form]
     
  2. Update the project form according to the table shown in the creation section.
   
### Delete a Test Project

  Click the Delete button on the project dropdown menu on project list page.
  
     

[test_sharing_project]: ../images/test/test_sharing_project.PNG
[test_sharing_project_list]: ../images/test/test_sharing_project_list.PNG
[test_sharing_project_form]: ../images/test/test_sharing_project_form.PNG
[test_project_edit_form]: ../images/test/test_project_edit_form.PNG
[test_project_edit_button]: ../images/test/test_project_edit_button.PNG
[test_project_delete_button]: ../images/test/test_project_delete_button.PNG
[tutorial_project_list]: ../images/tutorial/tutorial_project_list.PNG
[tutorial_createproject]: ../images/tutorial/tuorial_project_create.PNG 
[tutorial_project_info]: ../images/tutorial/tutorial_project_info.PNG
[1]: ../administration/administration-baw-configuration.html
[2]: ../administration/administration-selenium-hub-configuration.html
[3]: ../administration/administration-baw-configuration.html#add-user-to-a-baw-server
[tutorial_createproject_advance]: ../images/tutorial/tuorial_project_create_advance.PNG