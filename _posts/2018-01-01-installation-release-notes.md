---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2026-06-26 18:00:00
---

## Release Notes

## IDA

### 26.0.6 - 06/30/2026

#### Enhancements
- [Checkstyle] Detect External Service calls within a Service Flow where there is no associated exception handling.
- [Checkstyle] Synchronize the Checkstyle BOM models with the latest XOM models.
- [Pipeline] Display the deployment response message(status description) associated with the deployment status when hovering over status icons.

#### Bug Fixes
- [Comparison] Remove Boundary Event(Tracking) from comparison result.
- [Security] Fix security issues and upgrade libs in IDA codebase.

#### Notes
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).

#### The checkstyle rules change details
[Added rules]
- /checks/service/check-service-item-using-external-service-without-exception-handling(This rule is disabled by default; if you need to use it, please enable it in the Checkstyle Rules Configuration.)


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-26.0.6-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-26.0.6-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-26.0.6-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-26.0.6.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/26.0.6/idaweb-helm-26.0.6.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
