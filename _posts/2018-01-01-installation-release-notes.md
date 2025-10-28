---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-08-27 12:00:00
---

## Release Notes

## IDA

### 25.0.10 - 10/30/2025

#### Enhancements
- [Checkstyle] Download Checkstyle Report as CSV.
- [Checkstyle] Add rules version number on Checkstyle report.
- [Analyzer] Support to print Toolkit References report.
- [Analyzer] Support to view history reports for Toolkit References.
- [Administration] Support to map AD groups to role User and Admin respectively.
- [Administration] Support to map LDAP user to default team when user logs in.

#### Bug Fixes
- [Checkstyle] Adjust 'String of Pearls' problem check to detect at least 3 sequential activities according to reference document.
- [Checkstyle] JavaScript uses java.lang.Thread.currentThread().sleep rule should not check client side script in client-side human service.
- [Checkstyle] Remove outdated rules.
- [Checkstyle] StackOverflowError is thrown when running Checkstyle.
- [Checkstyle] “IllegalStateException: There's already another KieContainer created from a different ClassLoader” is thrown when running Checkstyle using Embedded engine.
- [Checkstyle] Can not view the loop details diagram sometimes.
- [Checkstyle] Report is not auto scrolled to CHECK RESULT DETAILS when a tag is selected on Firefox.
- [Analyzer] Incorrect Referenced By is reported on a toolkit snapshot.
- [Pipeline] When New Snapshot Trigger is enabled in Build Triggers, an snapshot older than the pipeline edit time may trigger the pipeline.
- [Administation] When BAW user is edited with wrong password, test connection of the user still passed sometimes.
- [Administration] Wrong error message is displayed when Gatling download fails.

#### Notes
- There are database changes from 25.0.10 to 25.0.10, please use the Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).

#### The checkstyle rules change details
[Updated rules]
- /checks/service/check-service-item-contains-sleep
[Deleted rules]
- /checks/service/check-service-item-save-context-checked
- /checks/process/check-stp-bpd


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-25.0.10-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-25.0.10-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-25.0.10-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-25.0.10.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/25.0.10/idaweb-helm-25.0.10.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
