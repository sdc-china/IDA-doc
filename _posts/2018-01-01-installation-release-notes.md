---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-06-27 16:15:00
---

## Release Notes

## IDA

### 25.0.6 - 06/27/2025

#### Enhancements
- [Pipeline] Support to overwrite deployment step parameters before pipeline build is run.
- [Comparison] Sort property entries on artifact change panels.
- [Comparision] Support to print Comparison report.
- [Analyzer] Support to print Analyzer report.
- [Container] Support re-encrypt route to IDA on OCP.
- Support HTTP/2 protocol for IDA on Java 17.

#### Bug Fixes
- [Checkstyle] Filtering of warning messages on pop-up window of artifact summary tree node does not work.
- [Comparison] Line numbers greater than 10 are not displayed correctly on artifact change panels.
- [Comparison] Converted artifact's old content is displayed as new content after conversion in comparison report.
- [Comparison] Fix comparison results of some properties for heritage artifacts on Desktop PD.
ties for Undercover Agent and Team.
- [Administration] Validate if the user attribute specified in LDAP User Filter exists when testing connection of LDAP server.
- [Administration] Verify database schema on Create Database Tables page.
- [Container] IDA data path should be readonly in container environment.


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-25.0.6-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-25.0.6-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-25.0.6-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-25.0.6.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/25.0.6/idaweb-helm-25.0.6.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
