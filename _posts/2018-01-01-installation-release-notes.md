---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-10-29 12:00:00
---

## Release Notes

## IDA

### 25.0.11 - 11/27/2025

#### Enhancements
- [Analyzer] Download Analyzer report as CSV.
- [Pipeline] Support to use parameter ${BUILD_TRIGGERER_EMAIL} in pipeline email notification configurations, to send email to user who ran the pipeline.
- [Pipeline] Add deactivate previous snapshot option to deployment step.
- [Comparison] Support to merge scripts on Coach View.
- [Administration] Able to customize permissions for role on IDA UI.

#### Bug Fixes
- [Checkstyle] Remove outdated "Do not mix Coach View Libraries" rules.
- [Checkstyle] Remove meaningless Javascript coding style check.
- [Analyzer] Artifact Summary information is missing in Analyzer report.
- [Comparison] Missing highlight of changed items in Diagram comparison.
- [Comparison] Fix comparison results of some properties for User Task and Inline User Task.
- [Comparison] Cannot overwrite BO changes when script is merged.
- [Pipeline] Unexpected error is thrown when saving group pipeline.
- [Pipeline] User can see a pipeline approval request that does not belong to him.

#### Notes
- There are database changes from 25.0.10 to 25.0.11, please use the Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).

#### The checkstyle rules change details
[Deleted rules]
- /checks/coachview/check-mixed-js-libraries-on-coach
- /checks/service/check-service-item-contain-mixed-js-libraries

## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-25.0.11-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-25.0.11-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-25.0.11-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-25.0.11.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/25.0.11/idaweb-helm-25.0.11.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
