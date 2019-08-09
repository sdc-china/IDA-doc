---
title: "Selenium Hub configuration"
category: administration
date: 2018-10-20 15:17:55
last_modified_at: 2019-07-29 16:20:00
order: 3
---
### How to configure selenium hub
   You need to setup the [Post Installation Setup] before this step.
### Add selenium hub
  1. Click **Administrator** tab, then switch to  **Selemium Hub Configuration** table to manage hubs.  
  2. Click ![][add_icon] icon which is on the right of **Users manager** to add new users.
  3. Fill out the form below. Then click **Create** button.


     ![][administrator_hub]

     |   Field                | Description                                                         |
     | -------------------    |---------------------------                                          |
     | Server Name            | Hub name                                                            |  
     | Server URL             | Hub URL name                                                        |
     | Browser                | Support Firefox, Chrome and IE                                      |  
     | Configuration          | Customize browser options for selenium

**Notes:**
You can customize the selenium configuration based on the template.Currenctly we support below types of configuration.  

**Headless** for chrome and firefox
```
arguments:
## Enable headless mode
- "--headless"
```  

**experimentalOption** for chrome setting
```
experimentalOptions:
## Fix issue "Loading of unpacked extensions is disabled by administrator."
  useAutomationExtension: false
```

**Window Size**
```
arguments:
## Change windows szie
- "window-size=1920,1080"
```  


### Edit selenium hub
  1. Click **Edit** icon on the right of the Selenium Grid Configuration that you want to edit.

     ![][administrator_edit_selenium_grid]

  2. Change configurations of the selenium grid. Then click **Save**.

### Delete selenium hub
  Select the hub in the **Selemium Hub Configuration** table, then click the 	**Delete** button to delete selenium hub.

### Test selenium hub   
  Click **Test Connection** icon on the right of the Selenium Grid Configuration that you want to test.If connection is wrong,it will
 popup warning info.  

   ![][administrator_selenium_grid_test]


[administrator_hub]: ../images/administrator/administrator_hub.png
[Post Installation Setup]: ../installation/installlation-post-installation.html
[add_icon]: ../images/administrator/Administrator_add_icon.png
[administrator_edit_selenium_grid]: ../images/administrator/administrator_edit_selenium_grid.png
[administrator_selenium_grid_test]: ../images/administrator/administrator_test_selenium_grid.png
