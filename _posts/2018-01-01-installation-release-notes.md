---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-08-27 12:00:00
---

## Release Notes

## IDA

### 25.0.9 - 09/26/2025

#### Enhancements
- [Testing] Able to regenerate case step template based on edited Expected Execution Flow on Process and Sub-Processes Flow diagrams.
- [Pipeline] Improve pipeline pre-deletion check and warning messages.
- [Comparison] Add artifact changes summary to print report header.
- [Administration] Option to remove user.

#### Bug Fixes
- [Testing] MethodArgumentTypeMismatchException is sometimes thrown on test case edit page.
- [Testing] Input parameters of process operations selected for startRESTService command are not loaded.
- [Checkstyle] Recheck Symptom button is missing in Checkstyle online report.
- [Checkstyle] Fix duplicate statistics for nested coach views in human service.
- [Checkstyle] Some Checkstyle rule reference link is out of date.
- [Comparison] Sub-artifact is displayed as updated while parent artifact is displayed as added or deleted.
- [Comparison] Fix comparison results of Presentation properties of Process/BPD/Subprocess.
- [Administration] User permissions are not refreshed immediately after user role is edited.

#### Notes
- There are database changes from 25.0.9 to 25.0.9, please use the Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.

#### The checkstyle rules change details
[Updated rules]
- check-bpd-component-contains-inner-table-in-data-mapping
- check-bpd-component-contains-inner-table-in-script
- check-service-item-contains-inner-table-in-data-mapping
- check-service-item-contains-inner-table-in-script
[Deleted rules]
- check-managed-asset-size
- check-server-item-endpoint-hardcoded
- check-service-item-ECMservices


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-25.0.9-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-25.0.9-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-25.0.9-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-25.0.9.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/25.0.9/idaweb-helm-25.0.9.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
