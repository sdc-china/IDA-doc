---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2025-03-26 16:15:00
---

## Release Notes

### 25.0.4 - 04/29/2025

#### Enhancements
- [Pipeline] Able to reschedule deployment time when approving pipeline build.
- [Pipeline] Support scheduling/rescheduling deployment steps in group pipeline.

#### Bug Fixes
- [Checkstyle] The characters after "//" in the URL are ignored as comments.
- [Pipeline] Pipeline job Trigger by New Snapshot is not scheduled within Start Time and End Time of pipeline build trigger.
- [Comparison] Auto tracked fields changes are not shown in snapshot comparison report.
- [Comparison] Comparison results of complex type BO shows irrelevant simple type attributes.
- [Container] Missing JVM arguments for container environment deployed by Java 17 docker image when the number of pod replicas is set to 1.

#### Notes
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check new doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-25.0.4-java8.zip | [Installing IDA Application](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty, WebSphere)	| ida-25.0.4-java17.zip | [Installing IDA Application](../installation/installation-installing-ida-application.html) |
| IDA web and operator docker images based on Java 8| ida-25.0.4-java8.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA web and operator docker images based on Java 17| ida-25.0.4-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts | idaweb-helm-25.0.4.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/25.0.4/idaweb-helm-25.0.4.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
