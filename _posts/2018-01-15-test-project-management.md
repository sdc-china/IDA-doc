---
layout: page
title: "Test project management"
category: test
date: 2018-01-05 15:17:55
order: 1
---
    
### Create a test project

  1. In the project list page, click **Create Project** button.
  
     ![][tutorial_createproject] 
  
  2. Fill project form according to the following table.
  
     Parameter             | Description       
     ----------------------|-------------------
     Project Name          |Name of project    
     Project Description   |Description of project
     Server                |Server environment
     Process App           |Process apps of the selected server
     Toolkit               |Toolkits of  selected server
     Branch                |The branch of selected process app or toolkit
     Snapshot              |The snapshot of selected branch
     [Selenium Hub][2]     |Support chrome, firefox selenium node 
     Tip                   |Using the latest snapshot 
     Migrate an old project|Support test case project migration from Eclipse Version
     
     **Notes:**     
     
     The Project App and Toolkit must fill at least one and only one.     
     You need to upload eclipse test project workspace zip file when you check the "Migrate an old project".  
     **Known Limitions:**   
     Only supports test project migration in development environment.  
      
        
  3. Click **Create** button, you will enter into project dashboard page.

     ![][tutorial_project_info] 
  
### Edit a test project

  1. Click ![][test_project_edit_button] button on the project list page.
  
     ![][tutorial_project_list]
     
     ![][test_project_edit_form]
     
  2. Update project form according to the table showed in creating session.


### Sharing a test project

1. Click ![][test_sharing_project] button in project list page.

2. Choose the BPM users that you want to share your project.

     ![][test_sharing_project_form]
  
3. Click **Share** button.When the shared user is logged in, the user can edit suites and case steps for the project, but can not modify the project information or share the project.

     ![][test_sharing_project_list]  
     
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
