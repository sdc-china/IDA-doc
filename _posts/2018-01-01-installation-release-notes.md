---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-12-26 12:00:00
---

## Release Notes

## IDA

### 25.0.12 - 12/30/2025

#### Enhancements
- [Testing] Add assign task to team option to assignTask test command.
- [Testing] When generating case step template for subprocess, should generate a complete path not just the first user task step.
- [Analyzer] Download Toolkit Reference report as CSV.
- [Pipeline] The snapshot should be marked as installed in Workflow Center if the snapshot is deployed by IDA pipeline.
- [Comparison] Add Source view in snapshot comparison and merge report.
- [Administration] Synchronize LDAP email field into IDA user profile when LDAP user logs in.

#### Bug Fixes
- [Checkstyle] Reference data is not displayed correctly in downloaded CSV report.
- [Comparison] Fix comparison results of some properties for Coach View.
- [Comparison] Fix comparison results of some properties for System Task.
- [Administration] When user is removed from a team, shared resources are not transferred.

#### Notes
- There are database changes from 25.0.12 to 25.0.12, please use the Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-25.0.12-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-25.0.12-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-25.0.12-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-25.0.12.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/25.0.12/idaweb-helm-25.0.12.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
