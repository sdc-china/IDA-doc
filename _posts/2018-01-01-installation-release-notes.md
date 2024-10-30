---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2024-08-14 13:35:00
---

## Release Notes

### 24.0.8.1 - 10/10/2024

#### Bug Fixes
- [Pipeline] Fix wrong snapshot is used in pipeline steps.
- [Container] Fix operator docker image security issues.

### 24.0.8 - 09/27/2024

#### Enhancements
- [Testing] Able to update expected flow in Flow diagram.
- [Testing] Display custom command change updater and update time in test case history.
- [Container] Support container resources settings in CR.
- [Container] Support SSL certification secret.

#### Bug Fixes
- [Testing] Fix actual flow for multiple nodes of the same linked process in a process.
- [Testing] Fix blank diagram in test case report.
- [Testing] Enable Record button even there's plugin compatibility warning.
- [Checkstyle] Variables used by activities in subprocess throws wrong unused warnings.
- [Pipeline] Fix the issue that cannot trigger the pipeline using REST API with another container and branch name.
- [Comparison] Fix no artifacts are shown in the report, after clearing the "Modified by" filter.
- [Operations Tool] Fix warning display issue for clean unnamed snapshots.
- [Container] Fix Docker image security issues.

#### Notes
- There are database changes from 24.0.7 to 24.0.8, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server (eg: Liberty, WebSphere)	| ida-24.0.8.1.zip | [Installing IDA Application](../installation/installation-installing-ida-application.html) |
| IDA web and operator docker images | ida-24.0.8.1.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA web and operator docker images based on Java 11| ida-24.0.8.1-java11.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts | idaweb-helm-24.0.8.1.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/24.0.8.1/idaweb-helm-24.0.8.1.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
