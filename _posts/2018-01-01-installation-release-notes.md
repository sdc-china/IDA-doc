---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2026-04-29 18:00:00
---

## Release Notes

## IDA

### 26.0.4 - 04/30/2026

#### Enhancements
- [Checkstyle] Disable rule condition evaluation if rule is disabled for EMBEDDED Checkstyle engine.
- [Pipeline] Able to select custom date range when viewing Pipeline Overview data.

#### Bug Fixes
- [Checkstyle] For human tasks, "String of Pearls" problem should only be reported on tasks with the same Assignments settings.
- [Checkstyle] Fix unused service check.
- [Analyzer] Errors from Toolkit References analysis are not displayed on report.
- [Comparison] Fix comparison results of some properties for process Gateways.

#### Notes
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).

#### The checkstyle rules change details
[Added rules]
- /check/process/check-sequential-systemtask-activities-in-lane
- /check/process/check-sequential-usertask-activities-in-lane

[Deleted rules]
- /check/process/check-sequential-activities-in-lane


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-26.0.4-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-26.0.4-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-26.0.4-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-26.0.4.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/26.0.4/idaweb-helm-26.0.4.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
