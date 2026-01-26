---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-12-26 12:00:00
---

## Release Notes

## IDA

### 26.0.1 - 01/28/2026

#### Enhancements
- [Checkstyle] Show loop details when Checkstyle is invoked in ODM mode.
- [Pipeline] Able to customize installation package file directory on deployment step when deploying from file on Workflow Server.
- [Comparison] Support to overwrite more artifact types in the snapshot merge report.
- [Comparison] Display event sub types of start/end/intermediate/boundary events of Process in comparison report.
- [Administration] Support to test LDAP user filter with multiple user attributes by an optional test username.
- [Administration] Add reminder when all existing IDA users who have access to User Management are deactivated or removed.

#### Bug Fixes
- [Testing] Fix wrong year is returned by the dateString command in the last week of year.
- [Testing] Coach button text is not displayed in flow diagram of Human Service.
- [Checkstyle] Fix potential infinite loop check.
- [Analyzer] Analyzer does not show the correct last run Statistic or Toolkit References report.
- [Comparison] Fix comparison results of some properties for Linked Process.
- [Comparison] Failed to completely overwrite a Process artifact if it has an inline user task with view template changes, using snapshot merge.

#### Notes
- There are database changes from 25.0.12 to 26.0.1, please use the Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-26.0.1-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-26.0.1-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-26.0.1-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-26.0.1.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/26.0.1/idaweb-helm-26.0.1.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
