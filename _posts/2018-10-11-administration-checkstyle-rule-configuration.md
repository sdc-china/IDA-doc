---
title: "Checkstyle Rule Configuration"
category: administration
date: 2018-10-11 15:17:55
last_modified_at: 2022-07-01 16:21:00
---

# Checkstyle Rules Configuration
***

Users can enable/disable Checkstyle rules dynamically without customization.

## Enable/Disable Checkstyle Rules
1. Click the **Administrator** tab, then switch to the **Checkstyle Rules Configuration** tab to manage Checkstyle rules.

2. On this page, users can filter rules by Package, rule name, and other conditions.

   ![][search_rule]{:width="80%"}

3. Select the rules you want to enable/disable, click the **Enable** or **Disable** button to enable/disable the rules.

   ![][disable_rule]{:width="80%"}

## Notes
1. It's a global setting, once a rule is disabled in the configuration page, it won't be executed when users run Checkstyle in the Checkstyle page or pipeline.
2. Only the [built-in Checkstyle rules] are listed here.


[search_rule]: ../images/administrator/checkstyle_rule_config_search_rule.png
[disable_rule]: ../images/administrator/checkstyle_rule_config_disable_rule.png
[built-in Checkstyle rules]: ../checkstyle/checkstyle-checkstyle-rules-description.html