---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2026-05-25 18:00:00
---

## Release Notes

## IDA

### 26.0.5 - 05/28/2026

#### Enhancements
- [Testing] Add download link for Smart Comparison expected/actual/compare result screenshots.
- [Checkstyle] Able to view details of nested toolkits with max depth more than 4.

#### Bug Fixes
- [Checkstyle] "String of Pearls" warning is not displayed on Artifact Details popup from ARTIFACT WARNING SUMMARY.
- [Comparison] Fix comparison results of some properties for Intermediate and Boundary Events of Process.
- [Comparison] Change history of artifacts may be missing when comparing snapshots from different branches.
- [Security] Upgrade log4j to v2.26.0.
- [Security] Upgrade lang3 to v3.20.0.

#### Notes
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server based on Java 8(eg: Liberty, WebSphere)	| ida-26.0.5-java8.zip | [Installing IDA Application on Java 8](../installation/installation-installing-ida-application.html) |
| IDA release package for traditional web server based on Java 17(eg: Liberty)	| ida-26.0.5-java17.zip | [Installing IDA Application on Java 17](../installation/installation-installing-ida-application-java17.html) |
| IDA web and operator docker images based on Java 17| ida-26.0.5-java17.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts for Kubernetes platform | idaweb-helm-26.0.5.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/26.0.5/idaweb-helm-26.0.5.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each major release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
