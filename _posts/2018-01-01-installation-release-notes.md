---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-07-29 12:00:00
---

## Release Notes

## IDA

### 25.0.7 - 07/29/2025

#### Enhancements
- Support BAW 25.0.0.
- [Testing] Add getTaskData test command.
- [Testing] Support to set snapshot name for test command clickActivityFromPortal.
- [Pipeline] Add more build execution context variables for pipeline email notifications.
- [Comparison] Display artifact icon by artifact type.
- [Operations Tool] Add an option to force cleanup all running instances in snapshot cleanup tool.
- [Administration] Support custom SSH port and SOAP host in BAW SSH Configuration.

#### Bug Fixes
- [Pipeline] Fix Validation Error check on deployment step.
- [Comparison] Fix comparison results of some properties for service flows.
- [Plugin] Error icon on IDA recorder is not displayed correctly.
- DB2 persistence exception is thrown when pipeline build execution results are saved on IDA Java 17 environment.

#### Notes
- IDA browser Plug-in is updated to version 25.2, please make sure you have installed the latest plug-in.


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-25.0.7-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-25.0.7-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-25.0.7-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-25.0.7.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/25.0.7/idaweb-helm-25.0.7.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
