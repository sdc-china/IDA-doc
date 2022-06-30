---
title: "Checkstyle Rule Configuration"
category: administration
date: 2018-10-21 15:17:55
last_modified_at: 2021-08-23 16:21:00
order: 5
---

# Checkstyle Rules Configuration
***
Users can enable/disable checkstyle rules dynamically without customization by using this fuction.

###  Enable/disable checkstyle rules
  1. Click **Administrator** tab, then switch to  **Checkstyle Rules Configuration** tab to manage checkstyle rules.  
  
  2. In this page, user can filter rules by Package, rule name and other conditions.
  
     ![][search_rule]{:height="80%" width="80%"}

  3. Select the rules that you want to enable/disable, click the **Enable** or **Disable** button to to enable/disable the rules.

     ![][disable_rule]{:height="80%" width="80%"}

###  Notes
  1. The priority of the settings here is higher than that of the Checkstyle page. For example, even if you do not ignore the document check in the Checkstyle page, but if you disable some document check rules here, the selected document check rules will not be executed. 
  2. Only the [Embedded rules] in IDA are listed here. The rules customized by customers can also be enabled or disabled if the names are the same with one of the embedded rules. If the names of the customized rules are different from the the embedded rules, there is no way to control whether the rules are enable or disable.


[search_rule]: ../images/administrator/checkstyle_rule_config_search_rule.png
[disable_rule]: ../images/administrator/checkstyle_rule_config_disable_rule.png
[Embedded rules]: ../checkstyle/checkstyle-rules-description.html
