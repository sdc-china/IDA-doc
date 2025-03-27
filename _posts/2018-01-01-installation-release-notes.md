---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-03-26 16:15:00
---

## Release Notes

### 25.0.3 - 03/27/2025

#### Enhancements
- Support Spring Framework v6 based on Java 17.

#### Bug Fixes
- [Security] Upgrade jQuery Validation to v1.21.0.
- [Security] Validate the twx file format once the file is uploaded to IDA server.
- [Checkstyle] Checkstyle hangs when generating report.
- [Checkstyle] Variables used in event subprocess is incorrectly reported as unused variables.
- [Administration] Cannot download Chrome plugin v3(ida3-24.7.crx) from Resources page.

#### Notes
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check new doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).

#### The checkstyle rules change details
[Updated rules]
- check-bpd-component-contains-inner-table-in-script
- check-service-item-contains-inner-table-in-script
- check-bpd-component-sql-injection-in-script
- check-service-item-sql-injection-in-script
- check-bpd-unused-variables


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-25.0.3-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-25.0.3-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-25.0.3-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-25.0.3.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/25.0.3/idaweb-helm-25.0.3.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
