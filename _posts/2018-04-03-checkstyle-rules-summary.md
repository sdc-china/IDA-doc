---
title: "Checkstyle Rules Summary"
category: checkstyle
date: 2018-10-09 15:18:55
last_modified_at: 2021-11-24 15:29:00
order: 3
---

# Checkstyle rules by category
***
### App

| Rule                                               | Level    |
|----------------------------------------------------|----------|
| check-app-with-mismatch-version-toolkits           | CRITICAL |
| check-app-too-many-toolkit                         | MAJOR    |
| check-toolkit-nested-level                         | MAJOR    |
| check-toolkit-size                                 | MAJOR    |
| check-app-with-too-many-advancedintegrationservice | MINOR    |
| check-app-with-too-many-ajaxservice                | MINOR    |
| check-app-with-too-many-bpd                        | MINOR    |
| check-app-with-too-many-busnessobject              | MINOR    |
| check-app-with-too-many-decisionservice            | MINOR    |
| check-app-with-too-many-environmentvariableset     | MINOR    |
| check-app-with-too-many-exposedprocess-variable    | MINOR    |
| check-app-with-too-many-generalsystemservice       | MINOR    |
| check-app-with-too-many-humanservice               | MINOR    |
| check-app-with-too-many-report                     | MINOR    |
| check-app-with-too-many-servicelevelagreement      | MINOR    |
| check-app-with-too-many-undercoveragent            | MINOR    |
| check-app-with-too-many-webservice                 | MINOR    |

### Process

| Rule                                            | Level    |
|-------------------------------------------------|----------|
| check_bpd_searchable_field                      | CRITICAL |
| check-bpd-component-need-exception-handle       | CRITICAL |
| check-bpd-event-exception-loop                  | CRITICAL |
| check-bpd-gateway-condition                     | CRITICAL |
| check-delete-completed-task                     | CRITICAL |
| check-auto-tracking-enable                      | MAJOR    |
| check-bpd-activities                            | MAJOR    |
| check-bpd-activity-contain-tostring-datamapping | MAJOR    |
| check-bpd-component-JS-contains-sleep           | MAJOR    |
| check-bpd-condition-javascript-coding-style     | MAJOR    |
| check-bpd-contains-infinite-loop                | MAJOR    |
| check-bpd-duplicated-EPVs                       | MAJOR    |
| check-bpd-event-end-contains-script             | MAJOR    |
| check-bpd-event-start-contains-script           | MAJOR    |
| check-bpd-humanservice-in-system-lane           | MAJOR    |
| check-bpd-implementation-coding-style           | MAJOR    |
| check-bpd-message-event                         | MAJOR    |
| check-bpd-not-fully-implemented                 | MAJOR    |
| check-bpd-phantom-steps                         | MAJOR    |
| check-bpd-single-system-lane                    | MAJOR    |
| check-bpd-step-incorrectly-referenced           | MAJOR    |
| check-bpd-unused-variables                      | MAJOR    |
| check-lane-participant-not-default              | MAJOR    |
| check-MIL-system-activity                       | MAJOR    |
| check-participant-all-users                     | MAJOR    |
| check-sequential-activities-in-system-lane      | MAJOR    |
| check-sequential-system-task-in-bpd             | MAJOR    |
| check-stp-bpd                                   | MAJOR    |
| check-bpd-activity-narrative                    | MINOR    |
| check-bpd-activity-subject                      | MINOR    |
| check-bpd-documentation                         | MINOR    |
| check-participant-documentation                 | MINOR    |

### Service

| Rule                                                      | Level    |
|-----------------------------------------------------------|----------|
| check-service-exception-loop-item                         | CRITICAL |
| check-service-javascript-length-pro                       | CRITICAL |
| check-app-unused-service                                  | MAJOR    |
| check-humanservice-with-too-many-coach                    | MAJOR    |
| check-service-duplicated-EPVs                             | MAJOR    |
| check-service-duplicated-resource-bundles                 | MAJOR    |
| check-service-event-end-contains-script                   | MAJOR    |
| check-service-item-contains-infinite-loop                 | MAJOR    |
| check-service-item-contain-tostring-datamapping           | MAJOR    |
| check-service-item-execution-assignment-coding-style      | MAJOR    |
| check-service-item-implementation-javascript-coding-style | MAJOR    |
| check-service-item-save-context-checked                   | MAJOR    |
| check-service-javascript-length                           | MAJOR    |
| check-service-not-fully-implemented                       | MAJOR    |
| check-service-SOPE-directly-follow-postpone-object        | MAJOR    |
| check-service-step-incorrectly-referenced                 | MAJOR    |
| check-service-unused-variables                            | MAJOR    |
| check-service-without-step                                | MAJOR    |
| check-service-documentation                               | MINOR    |
| check-service-item-contain-mixed-js-libraries             | MINOR    |

### Coach

| Rule                                     | Level |
|------------------------------------------|-------|
| check-coachview-reach-endpoint           | MAJOR |
| check-mixed-js-libraries-on-coach        | MINOR |
| check-coachcontrol-with-no-binding-value | MINOR |

### Bussiness Object

| Rule                                          | Level |
|-----------------------------------------------|-------|
| check-shared-business-object                  | MAJOR |
| check-too-big-businessobject-used             | MAJOR |
| check-businessobject-documentation            | MINOR |
| check-businessobject-properties-documentation | MINOR |

### Variable

| Rule                                        | Level |
|---------------------------------------------|-------|
| check-bpd-variables-naming-conversion       | MAJOR |
| check-service-variables-naming-conversion   | MAJOR |
| check-service-with-too-many-inputvariables  | MAJOR |
| check-service-with-too-many-outputvariables | MAJOR |
| check-bpd-variables-documentation           | MINOR |
| check-service-variables-documentation       | MINOR |

### Web Service

| Rule                                     | Level |
|------------------------------------------|-------|
| check-webservice-documentation           | MINOR |
| check-webservice-operation-documentation | MINOR |

### Case Solution

| Rule                             | Level    |
|----------------------------------|----------|
| check-case-without-casetype      | CRITICAL |
| check-case-without-role          | CRITICAL |
| check-page-javascript-length-pro | CRITICAL |
| check-page-javascirpt-code-style | MAJOR    |
| check-page-javascript-length     | MAJOR    |
| check-unused-page                | MAJOR    |
| check-unused-property            | MAJOR    |
| check-casetype-documentation     | MINOR    |
| check-page-documentation         | MINOR    |
| check-property-documentation     | MINOR    |
| check-role-documentation         | MINOR    |

### Case Type

| Rule                               | Level |
|------------------------------------|-------|
| check-casetype-without-activity    | MAJOR |
| check-unused-casepagelayout        | MAJOR |
| check-unused-propertyview          | MAJOR |
| check-unused-rule                  | MAJOR |
| check-activity-documentation       | MINOR |
| check-casepagelayout-documentation | MINOR |
| check-propertyview-documentation   | MINOR |
| check-rule-documentation           | MINOR |


### Migration (Deprecated Features)

| Rule                                   | Level |
|----------------------------------------|-------|
| check-ad-hoc-start-event               | MAJOR |
| check-deprecated-task-routing-policy   | MAJOR |
| check-inline-web-service-configuration | MAJOR |
| check-bpd-milestones                   | MINOR |
| check-icon-settings-on-process-nodes   | MINOR |
| check-key-performance-indicator        | MINOR |
| check-simulation-configurations        | MINOR |

#### Deprecated from V857

| Rule                                                | Level |
|-----------------------------------------------------|-------|
| check-dojo-based-stock-controls-on-coach-deprecated | MAJOR |
| check-heritage-coaches-deprecated                   | MAJOR |
| check-responsive-stock-controls-on-coach-deprecated | MAJOR |

#### Deprecated from V862

| Rule                                                | Level |
|-----------------------------------------------------|-------|
| check-bpd-javascript-live-connect                   | MAJOR |
| check-service-javascript-live-connect               | MAJOR |

#### Deprecated on IBM BPM on Cloud

| Rule                                        | Level    |
|---------------------------------------------|----------|
| check-bpd-component-JS-contains-inner-table | CRITICAL |
| check-service-item-contains-inner-table     | CRITICAL |
| check-server-item-endpoint-hardcoded        | MAJOR    |
| check-managed-asset-size                    | MINOR    |
| check-service-item-ECMservices              | MINOR    |
| check-web-services                          | MINOR    |