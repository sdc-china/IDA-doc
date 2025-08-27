---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-08-27 12:00:00
---

## Release Notes

## IDA

### 25.0.8 - 08/28/2025

#### Enhancements
- [Testing] Add startRESTService test command to support testing of asynchronous Service flow by Exposed automation services/REST service.
- [Pipeline] Able to review all build activities(start/approve/reject/resume/reschedule/cancel/comment) on build detail report.
- [Checkstyle,Analyzer] Show the complete toolkit dependencies tree in Checkstyle and Analyzer reports.

#### Bug Fixes
- [Testing] Cannot create or edit global custom JavaScript command.
- [Testing] When test case is viewed from test project sidebar, case history is not updated correctly.
- [Pipeline] Cannot enter multiple line comments when approving a build.
- [Pipeline] Missing pipeline template diagram when Dev to Test template is selected to be imported.
- [Comparison] Missing comparison results of some properties of Service Flow.
- [Comparison] Missing comparison results of Included Scripts of Coach View.

#### Notes
- There are database changes from 25.0.8 to 25.0.8, please use the Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-25.0.8-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-25.0.8-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-25.0.8-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-25.0.8.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/25.0.8/idaweb-helm-25.0.8.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
