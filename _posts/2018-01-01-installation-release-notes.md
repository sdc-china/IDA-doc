---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2024-11-27 13:35:00
---

## Release Notes

### 24.0.11 - 12/20/2024

#### Enhancements
- [Pipeline] Allow user to change process app and snapshot acronym while triggering a new pipeline build.
- [Comparison] Allow selection of unnamed snapshots in new UI for snapshot comparison.

#### Bug Fixes
- [Testing] The "Exit Edit" button on test case page sometimes does not work.
- [Testing] Attributes are missing from auto generated process input parameters when attribute types are referenced multiple times.
- [Checkstyle] Checkstyle rule "the attribute number of business object is more than 50" throws dead loop exception.
- [Checkstyle] Expected Execution Flow icons should not be shown in comparison or checkstyle report.
- [Checkstyle] Checkstyle warning "system lane activity uses multi-instance loops" is reported by embedded rule engine but not by ODM rule engine.
- [Pipeline] The Log Details section keeps refreshing and blocking the build details page.
- [Comparison] Missing subprocess changes in snapshot comparison results.
- [Administration] Error is thrown when idaAdmin re-logs in or clicks Home page after executing tables creation scripts.

#### Notes
- Starting from version 24.0.10, IDA supports database tables creation after new IDA instance is installed and started up. Please use the new Create Database Tables page to execute tables creation scripts or ask DBA to execute the corresponding tables creation scripts. See new doc for Database Installation and Configuration(https://sdc-china.github.io/IDA-doc/installation/installation-database-installation-and-configuration.html).


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server (eg: Liberty, WebSphere)	| ida-24.0.11.zip | [Installing IDA Application](../installation/installation-installing-ida-application.html) |
| IDA web and operator docker images | ida-24.0.11.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA web and operator docker images based on Java 11| ida-24.0.11-java11.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts | idaweb-helm-24.0.11.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/24.0.11/idaweb-helm-24.0.11.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
