---
title: "Checkstyle ODM/Embedded Rules Upgrade"
category: checkstyle
date: 2018-04-11 15:29:00
last_modified_at: 2024-07-01 15:29:00
---

# Checkstyle ODM/Embedded Rules Upgrade
***

In each new release of IDA, the rule projects may include some updates. If you had created your customized rules. You need to merge and upgrade.

## ODM Rules Upgrade

If you want to migrate your customized rules to the new asset release, you need merge your customized rules with the new release. In general, it need:

1. Unzip the rules zip under <ASSET_HOME>/workspace/odm-checkstyle-rules.zip. Import the four rule projects.

![][checkstyle-rules-upgrade-odm-projects]

2. Overwrite the imported checkstyle-rules-customized project with your local updated version and fix any error you’ll see.

3. Deploy a new ruleset of the merged rule projects to the ODM server.

## Embedded Rules Upgrade

If you want to migrate your customized rules to the new asset release, you need merge your customized rules with the new release. In general, it need:

1. Unzip the rules zip under <ASSET_HOME>/workspace/embedded-checkstyle-rules.zip.

![][checkstyle-rules-upgrade-embedded-projects]

2. Rewrite your modifications in the latest release rule package, or update the specified rules to your local updated version according to the [Rules Upgrade Info](https://sdc-china.github.io/IDA-doc/checkstyle/checkstyle-odm-or-embedded-rules-upgrade.html#rules-upgrade-info).

3. Deploy your updated rules through the IDA Settings page, more information please refer [Override embedded rules](https://sdc-china.github.io/IDA-doc/checkstyle/checkstyle-customize-checkstyle-rules.html#override-embedded-rules).

## Rules Upgrade Info

### 24.0.4
[Updated rules]
- check/process/check-bpd-component-javascript-contains-sleep
- check/service/check-service-item-contains-sleep
- check/migrate/check-bpd-javascript-live-connect
- check/migrate/check-service-javascript-live-connect

### 23.0.7 
[Updated rules]
- check/process/check-stp-bpd

[Deleted rules]
- check/process/check-bpd-single-system-lane
- check/process/check-bpd-event-exception-loop


### 23.0.5
[Added rules]
- check/process/check-bpd-error-not-fully-implemented
- check/service/check-service-error-not-fully-implemented
 
[Updated rules]
- check/app/check-app-with-too-many-environmentvariableset
- check/app/check-app-with-too-many-exposedprocess-variable
- check/migration/check-bpd-javascript-live-connect
- check/migration/check-service-javascript-live-connect

### 23.0.4
[Added rules]
- check/service/check-coach-with-too-many-coach-view
- check/service/check-service-with-too-many-nested-cshs
 
[Updated rules]
- init/init-thresholds
- check/casesolution/check-page-javascript-length
- check/casesolution/check-page-javascript-length-pro
- check/service/check-service-item-contains-infinite-loop
- check/service/check-service-item-contains-infinite-loop

### 23.0.3
[Added rules]
- check/app/check-app-with-too-many-serviceflow
- check/migration/check-bpd-component-contains-inner-table-in-data-mapping
- check/migration/check-service-item-contains-inner-table-in-data-mapping
- check/migration/check-service-item-contains-inner-table-in-script
- check/migration/check-bpd-component-contains-inner-table-in-script
 
[Updated rules]
- check/process/check-bpd-contains-infinite-loop
- check/service/check-service-item-contains-infinite-loop

[Deleted rules]
- check/migration/check-service-item-contains-inner-table
- check/migration/check-bpd-component-javascript-contains-inner-table


[checkstyle-rules-upgrade-odm-projects]: ../images/checkstyle/checkstyle-rules-upgrade-odm-projects.png
[checkstyle-rules-upgrade-embedded-projects]: ../images/checkstyle/checkstyle-rules-upgrade-embedded-projects.png
