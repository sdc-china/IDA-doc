---
title: "Customize Checkstyle rules"
category: checkstyle
date: 2018-10-07 15:17:55
last_modified_at: 2019-07-29 15:27:00
order: 2
---

# Customize Checkstyle rules
***
### Software Prerequisites

* [IBM® Operational Decision Manager](https://www.ibm.com/us-en/marketplace/operational-decision-manager)

### Prerequisite

   You have installed **Rule Designer** in your local environment and **Checkstyle Rule Projects** have been in your local workspace.

### BPM checkstyle rule projects overview

   The BPM checkstyle rule projects include **CheckstyleBOM**, **CheckstyleRules**, **CheckstyleRulesCore** and **CheckstyleRulesCustomized**. Their dependency relationships are as follows:

   ![][checkstyle_rule_project_relation]

### BPM checkstyle rules customization

#### Override core checkstyle rules

To rewrite any core checkstyle rule, please do not update the core rule itself. Instead you should copy the rule into the **checksOverride** rule package of project CheckstyleRulesCustomized and then update the copy. Take overriding a core checkstyle rule **check-app-with-too-many-bpd** as an example:

1. Review the content of the core rule **check-app-with-too-many-bpd**. if the process app has more than 5 bpds, then a checkstyle warning message will be generated.

    ![][checkstyle_override_step_one]

2. Run the BPM checkstyle asset against an updated sample file **sample-updated.twx** and verify in the final checkstyle report, there is warning message **Too many BPDs**.

    ![][checkstyle_override_step_two]

3. In rule designer, copy the rule **check-app-with-too-many-bpd** from rule project CheckstyleRulesCore to rule package checksOverride in rule project CheckstyleRulesCustomized.

    ![][checkstyle_override_step_three]

4. Update the rule **check-app-with-too-many-bpd** in CheckstyleRulesCustomized, change number 5 to 10.

    ![][checkstyle_override_step_four]

5. In the properties window of the rule **check-app-with-too-many-bpd**, select the core rule (with the same name) to override.

    ![][checkstyle_override_step_five_1]

    ![][checkstyle_override_step_five_2]

    ![][checkstyle_override_step_five_3]

6. Redeploy the ruleset to your target server e.g. on IBM Cloud.

7. Rerun BPM checkstyle asset against an updated sample file **sample-updated.twx** and verify in the final checkstyle report, there is **no** warning message **Too many BPDs**.


#### Write custom checkstyle rules

  To write customized checkstyle rules, put the new rules in rule package **customized** in rule project **CheckstyleRulesCustomized**. Create artifact-based rule package if necessary.

  ![][checkstyle_custom_rules]

  Take writing a customized checkstyle rule **check-service-name-contain-test** as an example:

  1. Add a new rule **check-service-name-contain-test** that will check if a BPM service name contains test into in package **customized** in rule project **CheckstyleRulesCustomized**.

     ![][checkstyle_custom_rules_step_one]

  2. Check that the asset provides the utility function **does not match the naming convension** in its **CheckstyleRulesBOM** project.

     ![][checkstyle_custom_rules_step_two]

  3. Redeploy the ruleset to your target server e.g. on IBM Cloud.

  4. Rerun BPM checkstyle asset against an updated sample file **sample-updated.twx** and verify in the final checkstyle report, there is a warning message **The service with the word 'Test' (not case sensitive) in its name**.

     ![][checkstyle_custom_rules_step_four]



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
