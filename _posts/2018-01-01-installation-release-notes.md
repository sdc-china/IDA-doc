---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-01-23 16:15:00
---

## Release Notes

### 25.0.1 - 01/23/2025

#### Enhancements
- [Testing] Support testing TX service flow and exposed async service flow on Cloud Pak for Business Automation.
- [Checkstyle] The parsing of subprocess data nested at more than two levels is incomplete.
- [Comparison] Able to regenerate report by clicking a refresh button on the comparison/merge results table row.
- [Comparison] Sort the results in comparison report.
- [Pipeline] Allow user to set a target deployment time of the pipeline deployment step before pipeline build is run.
- [Pipeline] Add cancel with comments option to all queued/running/pending builds.
- [Administration] Add version number to embedded rules.
- [Administration] Validate LDAP user filter when testing connection of LDAP server.

#### Bug Fixes
- [Comparison] It should show dependency tree when overwriting an artifact with sub-artifacts.
- [Comparison] Left-side menu is missing for sub-artifacts in comparison report when only sub-artifacts are changed.
- [Comparison] Sub-artifact changes cannot be committed in merge report when only sub-artifacts are changed.
- [Operations Tool] The snapshot status is not accurate in Clean Snapshot search results.
- [Administration] Change fields REST User Name/REST User Display Name to readonly in Edit BAW Server modal.

#### Notes
- There are database changes from 24.0.11 to 25.0.1, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).

#### The checkstyle rules change details
[Updated rules]
- checks/process/check-delete-completed-task


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server (eg: Liberty, WebSphere)	| ida-25.0.1.zip | [Installing IDA Application](../installation/installation-installing-ida-application.html) |
| IDA web and operator docker images | ida-25.0.1.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA web and operator docker images based on Java 11| ida-25.0.1-java11.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts | idaweb-helm-25.0.1.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/25.0.1/idaweb-helm-25.0.1.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
