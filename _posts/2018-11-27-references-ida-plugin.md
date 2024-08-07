---
title: "IDA Plug-in"
category: references
date: 2018-11-27 15:39:00
last_modified_at: 2021-01-29 15:39:00
---

# IDA Plug-in

## Login

After installing the IDA plug-in, you need to log in to the plug-in to use it. If you are not logged in, the following information will appear when using the record function in testing.

![][plugin_message]{:width="40%"}

1. Click the plug-in button, the landing page will pop up.
      
      
    ![][plugin_login]{:width="40%"}

     Parameter             | Description       
	 ----------------------|-------------------
	 Server URL            |The IDA server URL. For example: https://[ida-server-url]/ida
	 User name             |The IDA server user name
	 Password              |The IDA server password
	 

2. After successfully logging in, you will see the following interface.

    ![][plugin_menu]{:width="40%"}
    
	 Parameter             | Description       
	 ----------------------|-------------------
	 Home                  |IDA home page
	 Settings              |IDA profile page
	 Notifications         |Notifications messages
	 Help                  |IDA documentation website
	 

## Notifications

### Configuration

1. You can enter the configuration page through the following two entrances.

    ![][plugin_profile_menu]{:width="30%"}
        
    OR
    
    ![][plugin_settings]{:width="40%"}
    
2. Enter the **Settings** tab and click the **Notifications** left-side menu.

    ![][plugin_profile_main]{:width="80%"}
    
3. Configure according to your needs. If you don't see the notifications configuration page, check with your admin if they have enabled notifications on the Settings page. See [General Configuration][settings-notifications-step-ref].

4. You can turn on/off system notifications popup window on the plug-in.

   ![][plugin_notifications]{:width="40%"}

   ![][plugin_notifications_popup]{:width="40%"}

### Messages

1. When a notification arrives, a digital logo will appear on the plug-in.

    ![][plugin_notification]{:height="10%" width="10%"}

2. Click **Notifications** to enter the messages page.

    ![][plugin_notification_message]{:width="40%"}

3. You can click to view details.

    ![][plugin_notification_message_details]{:width="40%"}

## WebPD Integration

When you install the IDA plug-in and use BAW WebPD, you will find three new tabs.

![][plugin_webpd_menu]{:height="100%" width="100%"}

### CHECKSTYLE

1. Click **CHECKSTYLE** to enter the CheckStyle page. Click the refresh button to load the CheckStyle report.

    ![][plugin_webpd_checkstyle]{:height="100%" width="100%"}
    
2. It takes some time to wait for the IDA server to return the result.

    ![][plugin_webpd_checkstyle_loading]{:height="100%" width="100%"}

3. After the IDA server completes the request, you will see the CheckStyle report.

    ![][plugin_webpd_checkstyle_done]{:height="100%" width="100%"}

### COMPARISON

1. Click **COMPARISON** to enter the Comparison page. Click the **Load** button to load the snapshots.

    ![][plugin_webpd_comparison]{:height="100%" width="100%"}
    
2. You can select any two snapshots you want to compare.
    
    ![][plugin_webpd_comparison_compare_any]{:height="100%" width="100%"}
    
3. It takes some time to wait for the IDA server to return the result.
     
    ![][plugin_webpd_comparison_compare_any_loading]{:height="100%" width="100%"}
    
4. After the IDA server completes the request, you will see the compare report link.
    
    ![][plugin_webpd_comparison_compare_any_done]{:width="30%"}
    
5. After clicking, it will jump to the specific comparison result page.

    ![][plugin_webpd_comparison_compare_details]{:height="100%" width="100%"}

    
### ANALYZER

1. Click **ANALYZER** to enter the Analyzer page. Click the refresh button to load the Analyzer report.

    ![][plugin_webpd_analyzer]{:height="100%" width="100%"}
    
2. It takes some time to wait for the IDA server to return the result.

    ![][plugin_webpd_analyzer_loading]{:height="100%" width="100%"}

3. After the IDA server completes the request, you will see the Analyzer report.

    ![][plugin_webpd_analyzer_done]{:height="100%" width="100%"}
    

[plugin_login]: ../images/references/plugin_login.png
[plugin_message]: ../images/references/plugin_message.png
[plugin_settings]: ../images/references/plugin_settings.png
[plugin_profile_menu]: ../images/references/plugin_profile_menu.png
[plugin_profile_main]: ../images/references/plugin_profile_main.png
[plugin_profile_config]: ../images/references/plugin_profile_config.png
[plugin_notification]: ../images/references/plugin_notification.png
[plugin_notification_message]: ../images/references/plugin_notification_message.png
[plugin_notification_message_details]: ../images/references/plugin_notification_message_details.png
[plugin_menu]: ../images/references/plugin_menu.png
[plugin_webpd_menu]: ../images/references/plugin_webpd_menu.png
[plugin_webpd_comparison]: ../images/references/plugin_webpd_comparison.png
[plugin_webpd_comparison_compare]: ../images/references/plugin_webpd_comparison_compare.png
[plugin_webpd_comparison_compare_loading]: ../images/references/plugin_webpd_comparison_compare_loading.png
[plugin_webpd_comparison_compare_done]: ../images/references/plugin_webpd_comparison_compare_done.png
[plugin_webpd_comparison_compare_details]: ../images/references/plugin_webpd_comparison_compare_details.png
[plugin_webpd_comparison_compare_any]: ../images/references/plugin_webpd_comparison_compare_any.png
[plugin_webpd_comparison_compare_any_loading]: ../images/references/plugin_webpd_comparison_compare_any_loading.png
[plugin_webpd_comparison_compare_any_done]: ../images/references/plugin_webpd_comparison_compare_any_done.png
[plugin_webpd_checkstyle]: ../images/references/plugin_webpd_checkstyle.png
[plugin_webpd_checkstyle_loading]: ../images/references/plugin_webpd_checkstyle_loading.png
[plugin_webpd_checkstyle_done]: ../images/references/plugin_webpd_checkstyle_done.png
[plugin_webpd_analyzer]: ../images/references/plugin_webpd_analyzer.png
[plugin_webpd_analyzer_loading]: ../images/references/plugin_webpd_analyzer_loading.png
[plugin_webpd_analyzer_done]: ../images/references/plugin_webpd_analyzer_done.png
[settings-notifications-step-ref]: ../administration/administration-settings-configuration.html#general-configuration
[plugin_notifications]: ../images/references/plugin_notifications.png
[plugin_notifications_popup]: ../images/references/plugin_notifications_popup.png