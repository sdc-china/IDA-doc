---
title: "Test Project Management"
category: test
date: 2018-03-01 15:17:55
last_modified_at: 2019-07-26 16:23:00
---

# Test Project Management
***

## Create a test project

  1. In the project list page, click **Create Project** button.
  
     ![][tutorial_createproject] 
     
     Click Advance: 
     
     ![][tutorial_createproject_advance] 
  
  2. Fill in the project form according to the following table.
  
     Parameter             | Description       
     ----------------------|-------------------
     Project Name          |Name of project    
     Project Description   |Description of project
     Visibility            |Team of project
     Server                |Server environment
     Case Object Store     |Server Case Object Store configuration
     Process App           |Process apps of the selected server
     Toolkit               |Toolkits of  selected server
     Trace                 |The branch of selected process app or toolkit
     Snapshot              |The snapshot of selected branch
     [Default Assignee][3] |Default assignee Workflow User. 
     [Default Selenium Grid][2]  |Support chrome, firefox selenium node 
     [Other Selenium Grids][2]    |Support chrome, firefox selenium node 
     Tip                   |Use the latest snapshot 
     Advance               |Show the engine configuration
     Retry Times           |The retry times of the failed command
     Retry Interval        |The interval time between the retries(seconds) 
	 Load Test             |Enable load test
	 Post Script           |Enable post script for each test step	 
     
     **Notes:**     
     
     Remember to select the process app or toolkit, which can't be both selected.
     If the permission control of your BAW server is controlled by the UMS server, please add your UMS Admin user into ida and set it as UMS Admin user.[Refer to][3]
        
  3. Click **Create** button, you will enter into project dashboard page.

     ![][tutorial_project_info] 
  
### Edit a test project

  1. Click ![][test_project_edit_button] button on the project list page.
  
     ![][tutorial_project_list]
     
     ![][test_project_edit_form]
     
  2. Update project form according to the table showed in the creation session.
   
### Delete a test project

  Click ![][test_project_delete_button] button on the project list page.
  
     

[test_sharing_project]: ../images/test/test_sharing_project.PNG
[test_sharing_project_list]: ../images/test/test_sharing_project_list.PNG
[test_sharing_project_form]: ../images/test/test_sharing_project_form.PNG
[test_project_edit_form]: ../images/test/test_project_edit_form.PNG
[test_project_edit_button]: ../images/test/test_project_edit_button.PNG
[test_project_delete_button]: ../images/test/test_project_delete_button.PNG
[tutorial_project_list]: ../images/tutorial/tutorial_project_list.PNG
[tutorial_createproject]: ../images/tutorial/tuorial_project_create.PNG 
[tutorial_project_info]: ../images/tutorial/tutorial_project_info.PNG
[1]: ../administration/administration-bpm-configuration.html
[2]: ../administration/administration-selenium-hub-configuration.html
[3]: ../administration/administration-bpm-configuration.html#add-user-to-a-bpm-server
[tutorial_createproject_advance]: ../images/tutorial/tuorial_project_create_advance.PNG 
