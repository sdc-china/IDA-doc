---
title: "Selenium Hub configuration"
category: administration
date: 2018-10-05 15:17:55
last_modified_at: 2022-09-28 16:39:00
order: 3
---

# Selenium Hub configuration
***

### How to configure selenium hub
   You need to setup the [Post Installation Setup] before this step.
### Add selenium hub
  1. Click **Administrator** tab, then switch to  **Selemium Hub Configuration** table to manage hubs.  
  2. Click ![][add_icon] icon which is on the right of **Users manager** to add new users.
  3. Fill out the form below to add **Standalone** selenium grid for IDA. Then click **Create** button.


     ![][administrator_hub]{:height="60%" width="60%"} 

     |   Field                | Description                                                         |
     | -------------------    |---------------------------                                          |
     | Server Name            | Hub name                                                            |  
     | Server URL             | Hub URL, there is no long a need for the ‘/wd/hub’ suffix in the URL|
     | Browser                | Support Firefox, Chrome and IE                                      |  
     | Configuration          | Customize browser options for selenium                              |

  4. Fill out the form below to create **Containerized** selenium grid for IDA. Then click **Create** button.

     ![][administrator_hub_containerized]

     |   Field                | Description                                                         |
     | -------------------    |---------------------------                                          |
     | Server Name            | Hub name                                                            |  
     | Browser                | Support Firefox and Chrome                                          |
     | Grid New Session Wait Timeout | How long a new test waiting for a node to become available (value in millisecond).|  
     | Grid Browser Timeout | How long the browser is allowed to hang(value in seconds).|
     | Grid Timeout | How long the client is allowed to be gone before the session is reclaimed(value in seconds).|
     | Node Replicas Number | How many nodes you need to create for this hub.|
     | Configuration          | Customize browser options for selenium                              |

     What's more, the option **Containerized** is unavailable by default. You need to [configure Kubernates Setting] before creating this kind of selenium grid. 

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

This argument only works under headless mode.

```
arguments:
## Change windows szie
- "window-size=1920,1080"
```  

**Full Page Screenshot**
```
arguments:
## Enable full page screenshot
- "--fullPageScreenshot"
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
[administrator_hub_containerized]: ../images/administrator/administrator_hub_containerized.png
[Post Installation Setup]: ../installation/installlation-post-installation.html
[configure Kubernates Setting]: ../administration/administration-settings-configuration.html#set-k8s-configuration
[add_icon]: ../images/administrator/Administrator_add_icon.png
[administrator_edit_selenium_grid]: ../images/administrator/administrator_edit_selenium_grid.png
[administrator_selenium_grid_test]: ../images/administrator/administrator_test_selenium_grid.png
