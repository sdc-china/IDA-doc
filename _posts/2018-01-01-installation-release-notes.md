---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-05-27 16:15:00
---

## Release Notes

### 25.0.5 - 05/29/2025

#### Enhancements
- Upgrade to Bootstrap 5.
- Keep filter status of all DataTables.
- [Comparison] Support toolkit reference update in merge report.
- [Administration] Allow user to view assigned Selenium Grid Configurations and test their connections.
- [Administration] Set database schema in auto-generated Create Database Tables and Migration Database Schema SQL scripts for PostgreSQL and DB2.

#### Bug Fixes
- [Testing] Cannot open test project due to NULL pointer exception in test coverage calculation.
- [Testing] Edit button sometimes needs to be clicked twice to edit a test case.
- [Comparison] Cannot commit to add an artifact if it depends on toolkit in merge report.
- [Comparison] Cannot delete and add artifacts with the same name simultaneously in merge report.
- [Comparison] Show error message when loading diagram in a deleted snapshot in comparison report.
- [Administration] Create Database Tables on IDA startup does not work on IDA Java 17 environment.

#### Notes
- IDA browser Plug-in is updated to version 25.1, please make sure you have installed the latest plug-in.


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-25.0.5-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-25.0.5-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-25.0.5-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-25.0.5.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/25.0.5/idaweb-helm-25.0.5.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
