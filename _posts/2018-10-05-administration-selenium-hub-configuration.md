---
title: "Selenium Hub Configuration"
category: administration
date: 2018-10-05 15:17:55
last_modified_at: 2023-10-12 12:00:00
---

# Selenium Hub Configuration
***

## How to Configure Selenium Hub
   You need to set up the [Post Installation Setup] before this step.
## Add Selenium Hub
  1. Click the **Administrator** tab, then switch to the **Selenium Hub Configuration** table to manage hubs.  
  2. Click the ![][add_icon] icon which is on the right of **Users Manager** to add new users.
  3. Fill out the form below to add a **Standalone** Selenium Grid for IDA. Then click the **Create** button.


     ![][administrator_hub]{:width="60%"} 

     |   Field                | Description                                                         |
     | -------------------    |---------------------------                                          |
     | Server Name            | Hub name                                                            |  
     | Server URL             | Hub URL, there is no longer a need for the '/wd/hub' suffix in the URL|
     | Browser                | Support Firefox, Chrome, and IE                                      |  
     | Configuration          | Customize browser options for Selenium                              |

  4. Fill out the form below to create a **Containerized** Selenium Grid for IDA. Then click the **Create** button.

     ![][administrator_hub_containerized]{:width="60%"}

     |   Field                | Description                                                         |
     | -------------------    |---------------------------                                          |
     | Server Name            | Hub name                                                            |  
     | Browser                | Support Chrome, Edge, and Firefox.                                   |
     | Session Timeout        | The Node will automatically kill a session that has not had any activity in the last X seconds. This will release the slot for other tests.|
     | Session Request Timeout| Timeout in seconds. A new incoming session request is added to the queue. Requests sitting in the queue for longer than the configured time will timeout.|
     | Node Min Replicas Number | Nodes will automatically increase or decrease according to actual needs, this value sets the minimum number of nodes. |
     | Node Max Replicas Number | Nodes will automatically increase or decrease according to actual needs, this value sets the maximum number of nodes.|
     | Configuration          | Customize browser options for Selenium                              |

     The **Containerized** option is unavailable by default. You need to [configure Kubernetes Setting] before creating this kind of Selenium Grid.

**Known Issues:**

Containerized Firefox hub throws a timeout exception when deployed on OCP 4.11+.

**Notes:**

You can customize the Selenium configuration based on the template. Currently, we support the following types of configuration.  

**Headless** for Chrome and Firefox
```
arguments:
## Enable headless mode
- "--headless"
```  

**experimentalOption** for Chrome setting
```
experimentalOptions:
## Fix issue "Loading of unpacked extensions is disabled by administrator."
  useAutomationExtension: false
```

**Window Size**

This argument only works under headless mode.

```
arguments:
## Change windows size
- "window-size=1920,1080"
```  

**Full Page Screenshot**
```
arguments:
## Enable full page screenshot
- "--fullPageScreenshot"
```  

## Edit Selenium Hub
  1. Click the **Edit** icon on the right of the Selenium Grid Configuration that you want to edit.

     ![][administrator_edit_selenium_grid]{:width="80%"}

  2. Change the configurations of the Selenium Grid. Then click **Save**.

## Delete Selenium Hub
  Select the hub in the **Selenium Hub Configuration** table, then click the **Delete** button to delete the Selenium Hub.

## Test Selenium Hub   
  Click the **Test Connection** icon on the right of the Selenium Grid Configuration that you want to test. If the connection is wrong, it will
 pop up a warning message.  

   ![][administrator_selenium_grid_test]{:width="80%"}


[administrator_hub]: ../images/administrator/administrator_hub.png
[administrator_hub_containerized]: ../images/administrator/administrator_hub_containerized.png
[Post Installation Setup]: ../installation/installation-post-installation-setup.html
[configure Kubernetes Setting]: ../administration/administration-settings-configuration.html#set-kubernetes-configuration
[add_icon]: ../images/administrator/Administrator_add_icon.png
[administrator_edit_selenium_grid]: ../images/administrator/administrator_edit_selenium_grid.png
[administrator_selenium_grid_test]: ../images/administrator/administrator_selenium_grid_test.png