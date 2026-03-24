---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2026-03-24 18:00:00
---

## Release Notes

## IDA

### 26.0.3 - 03/26/2026

#### Enhancements
- [Testing] Able to force refresh Params when editing Process/Service/UCA/Case test commands.
- [Analyzer] Able to drill down for a specific application and find the interdependences within toolkits.
- [Pipeline] Add data filters and new fields on Pipeline Overview tables.

#### Bug Fixes
- [Checkstyle] Unused variable in Process is not flagged in the Checkstyle report.
- [Pipeline] Missing ProcessApp data on Deploy overview table.
- [Comparison] Fix comparison results of some properties for Sub/Event Sub Process.
- [Comparison] Missing comparison results of Multi-instance Loop Ordering for Process tasks.

#### Notes
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).

## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-26.0.3-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-26.0.3-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-26.0.3-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-26.0.3.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/26.0.3/idaweb-helm-26.0.3.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
