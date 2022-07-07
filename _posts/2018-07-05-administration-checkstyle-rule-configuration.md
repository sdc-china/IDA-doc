---
title: "Checkstyle Rule Configuration"
category: administration
date: 2018-10-21 15:17:55
last_modified_at: 2022-07-01 16:21:00
order: 5
---

# Checkstyle Rules Configuration
***
Users can enable/disable checkstyle rules dynamically without customization.

###  Enable/disable checkstyle rules
  1. Click **Administrator** tab, then switch to  **Checkstyle Rules Configuration** tab to manage checkstyle rules.  
  
  2. In this page, user can filter rules by Package, rule name and other conditions.
  
     ![][search_rule]{:height="80%" width="80%"}

  3. Select the rules that you want to enable/disable, click the **Enable** or **Disable** button to to enable/disable the rules.

     ![][disable_rule]{:height="80%" width="80%"}

###  Notes
  1. It's global setting, once the rule is disabled in the configuration page, then it won't be executed when user run checkstyle in the checkstyle page or pipeline.
  2. Only the [built-in checkstyle rules] are listed here.


[search_rule]: ../images/administrator/checkstyle_rule_config_search_rule.png
[disable_rule]: ../images/administrator/checkstyle_rule_config_disable_rule.png
[built-in checkstyle rules]: ../checkstyle/checkstyle-rules-description.html
