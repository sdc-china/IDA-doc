---
title: "Test project management"
category: test
date: 2018-09-27 15:17:55
last_modified_at: 2019-07-26 16:23:00
order: 10
---
    
### Create a test project

  1. In the project list page, click **Create Project** button.
  
     ![][tutorial_createproject] 
  
  2. Fill in the project form according to the following table.
  
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
     Migrate an old project|Support test case project migration from eclipse version
     
     **Notes:**     
     
     Remember to select the process app or toolkit, which can't be both selected.
     You need to upload Eclipse test project zip file when you check the "Migrate an old project".  
     
     **Known Limitions:**   
     The test project migration is only supported under development environment.  
     It doesn't support the java/js customization test project.
      
        
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
