---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2024-08-14 13:35:00
---

## Release Notes

### 24.0.6 - 07/30/2024

#### Enhancements
- Support CP4BA 24.0.0.
- Display all IDA time stamp using the same time zone of user browser.
- [Pipeline] Support to trigger the pipeline build at a specific time or within a time period.
- [Pipeline] Allow user to add approve/reject/resume pipeline comments.
- [Pipeline] Add Approved By/Rejected By/Resumed By info to pipeline build stage and step.
- [Comparison] Add new filter for merged artifacts.

#### Bug Fixes
- Fix inconsistent case_description column definition in database schemas.
- [Testing] Text command does not properly lose focus on Firefox hub.
- [Testing] Other selenium grids are not loaded sometimes when project is edited in project detailed page.
- [Testing] Style is broken when hiding the sub steps at group command second level.
- [Checkstyle] The "The Error is not implemented" rule fails to check some error handlers.
- [Pipeline] The imported pipeline from old version should not be saved without completed stage information.
- [Pipeline] It should do pre-check when user click the resume button in pipeline.
- [Pipeline] Fix the issue that failed to execute the pipeline test with inactive snapshot on Workflow Center environment.
- [Comparison] Delete operations also need to display all dependencies.
- [Comparison] Report generation hungs due to performance issue of comparing very long scripts.
- [Plugin] Not able to record Start workflow on Workplace.
- [Plugin] Websocket connection was not stable in IDA plugin.

#### Notes
- There are database changes from 24.0.5 to 24.0.6, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for [Migrating IDA Application](https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA browser Plug-in is updated to version 24.6, please make sure you have installed the latest plug-in.
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.

#### The checkstyle rules change details
[Added rules]
- checks/process/check-bpd-subprocess-error-not-fully-implemented
- checks/service/check-service-subprocess-error-not-fully-implemented

## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server (eg: Liberty, WebSphere)	 |ida-web-24.0.6.zip|[Installing IDA Application](../installation/installation-installing-ida-application.html) |
| IDA web and operator docker images |	ida-all-24.0.6.tgz	| <https://github.com/sdc-china/ida-docker> <https://github.com/sdc-china/ida-operator> |
| IDA web and operator docker images based on Java 11|	ida-all-24.0.6-java11.tgz	|<https://github.com/sdc-china/ida-docker> <https://github.com/sdc-china/ida-operator> |

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
