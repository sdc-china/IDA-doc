---
title: "Customize Checkstyle Rules"
category: checkstyle
date: 2018-04-03 15:17:55
last_modified_at: 2019-07-29 15:27:00
---

# Customize Checkstyle Rules
***

The starter project for customizing Checkstyle rules can be downloaded from [IDA Resources page](../administration/administration-resources.html).

## ODM Customization

### Software Prerequisites

* [IBM® Operational Decision Manager](https://www.ibm.com/products/operational-decision-manager)
* For large BAW projects (e.g., the twx size is greater than 100MB), at least 4GB of memory is required for the ODM server.

### Prerequisite

   You have installed **Rule Designer** in your local environment, and **Checkstyle Rule Projects** have been in your local workspace.

### Workflow checkstyle rule projects overview

   The Workflow checkstyle rule projects include **CheckstyleBOM**, **CheckstyleRules**, **CheckstyleRulesCore**, and **CheckstyleRulesCustomized**. Their dependency relationships are as follows:

   ![][checkstyle_rule_project_relation]

### Workflow checkstyle rules customization

#### Override core checkstyle rules

To rewrite any core checkstyle rule, please do not update the core rule itself. Instead, you should copy the rule into the **checksOverride** rule package of the CheckstyleRulesCustomized project and then update the copy. Take overriding a core checkstyle rule **check-app-with-too-many-bpd** as an example:

1. Review the content of the core rule **check-app-with-too-many-bpd**. If the process app has more than 5 BPDs, then a checkstyle warning message will be generated.

    ![][checkstyle_override_step_one]

2. Run the Workflow checkstyle asset against an updated sample file **sample-updated.twx** and verify in the final checkstyle report that there is a warning message **Too many BPDs**.

    ![][checkstyle_override_step_two]

3. In Rule Designer, copy the rule **check-app-with-too-many-bpd** from rule project CheckstyleRulesCore to rule package checksOverride in rule project CheckstyleRulesCustomized.

    ![][checkstyle_override_step_three]

4. Update the rule **check-app-with-too-many-bpd** in CheckstyleRulesCustomized and change the number 5 to 10.

    ![][checkstyle_override_step_four]

5. In the properties window of the rule **check-app-with-too-many-bpd**, select the core rule (with the same name) to override.

    ![][checkstyle_override_step_five_1]

    ![][checkstyle_override_step_five_2]

    ![][checkstyle_override_step_five_3]{:width="60%"}

6. Redeploy the ruleset to your target server, e.g., on IBM Cloud.

7. Rerun the Workflow checkstyle asset against the updated sample file **sample-updated.twx** and verify in the final checkstyle report that there is **no** warning message **Too many BPDs**.


#### Write custom checkstyle rules

  To write customized checkstyle rules, put the new rules in rule package **customized** in rule project **CheckstyleRulesCustomized**. Create artifact-based rule package if necessary.

  ![][checkstyle_custom_rules]

  Take writing a customized checkstyle rule **check-service-name-contain-test** as an example:

  1. Add a new rule **check-service-name-contain-test** that will check if a Workflow service name contains test into in package **customized** in rule project **CheckstyleRulesCustomized**.

     ![][checkstyle_custom_rules_step_one]{:width="40%"}

  2. Check that the asset provides the utility function **does not match the naming convention** in its **CheckstyleRulesBOM** project.

     ![][checkstyle_custom_rules_step_two]

  3. Redeploy the ruleset to your target server, e.g., on IBM Cloud.

  4. Rerun the Workflow checkstyle asset against the updated sample file **sample-updated.twx** and verify in the final checkstyle report that there is a warning message **The service with the word 'Test' (not case-sensitive) in its name**.

     ![][checkstyle_custom_rules_step_four]

## Embedded Rules Customization

### Embedded rules overview

   After decompressing the **embedded-checkstyle-rules.zip**, the embedded rules folders include **init**, **checks**, and **score**. 
    
   ![][checkstyle_embedded_custom_folders]{:width="40%"}

Folder | Description 
     ----------------------|-------------------
     init | Including a thresholds initialization rule.
     checks | Specific rules for executing checkstyle, including folders like **app**, **businessobject**, **casesolution**, **businessobject**, **casetype**, **coachview**, **migrate**, **process**, **service**, **variable**, **webservice**.
     score | Including rules for calculating the score and setting the score bound.
   
     
   Customization can be done by directly modifying the rule file. For example, modify some thresholds by modifying the values in **init/init-thresholds.drl**.    
   
   ![][checkstyle_embedded_custom_init_thresholds]
   
   Modify the lower and upper bounds by modifying the values in **score/configure-score-health-bound.drl**.  
     
   ![][checkstyle_embedded_custom_modify_bound]{:width="70%"}
   
### Override embedded rules

  1. After modifying the rules, repackage the customized rules into a ZIP file.

     ![][checkstyle_embedded_custom_zip]{:width="40%"}
     
  2. Click the **Administrator** tab, then switch to the **Settings** tab.

     ![][checkstyle_embedded_settings_tab]{:width="40%"}
     
  3. Scroll to the **Checkstyle** section, choose **EMBEDDED** as the Engine, and switch on the **Enable Custom Rules**.

     ![][checkstyle_embedded_settings]
     
  4. Click the **Upload Custom Rules** button to upload the custom rules ZIP file.

     ![][checkstyle_embedded_custom_settings_upload]
     
  5. Click the **Save** button in Settings to save the configuration and rerun Checkstyle.

 [checkstyle_rule_project_relation]: ../images/checkstyle/checkstyle_rule_project_relation.png
 [checkstyle_override_step_one]: ../images/checkstyle/checkstyle_override_step_one.png
 [checkstyle_override_step_two]: ../images/checkstyle/checkstyle_override_step_two.png
 [checkstyle_override_step_three]: ../images/checkstyle/checkstyle_override_step_three.png
 [checkstyle_override_step_four]: ../images/checkstyle/checkstyle_override_step_four.png
 [checkstyle_override_step_five_1]: ../images/checkstyle/checkstyle_override_step_five_1.png
 [checkstyle_override_step_five_2]: ../images/checkstyle/checkstyle_override_step_five_2.png
 [checkstyle_override_step_five_3]: ../images/checkstyle/checkstyle_override_step_five_3.png
 [checkstyle_custom_rules]: ../images/checkstyle/checkstyle_custom_rules.png
 [checkstyle_custom_rules_step_one]: ../images/checkstyle/checkstyle_custom_rules_step_one.png
 [checkstyle_custom_rules_step_two]: ../images/checkstyle/checkstyle_custom_rules_step_two.png
 [checkstyle_custom_rules_step_four]: ../images/checkstyle/checkstyle_custom_rules_step_four.png
 [checkstyle_embedded_custom_folders]: ../images/checkstyle/checkstyle_embedded_custom_folders.png
 [checkstyle_embedded_custom_init_thresholds]: ../images/checkstyle/checkstyle_embedded_custom_init_thresholds.png
 [checkstyle_embedded_custom_modify_bound]: ../images/checkstyle/checkstyle_embedded_custom_modify_bound.png
 [checkstyle_embedded_custom_zip]: ../images/checkstyle/checkstyle_embedded_custom_zip.png
 [checkstyle_embedded_settings_tab]: ../images/checkstyle/checkstyle_embedded_settings_tab.png
 [checkstyle_embedded_settings]: ../images/checkstyle/checkstyle_embedded_settings.png
 [checkstyle_embedded_custom_settings_upload]: ../images/checkstyle/checkstyle_embedded_custom_settings_upload.png
