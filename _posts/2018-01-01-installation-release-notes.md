---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2024-11-27 13:35:00
---

## Release Notes

### 24.0.10 - 11/27/2024

#### Enhancements
- [Pipeline] Add Queued status on Total Number of Builds chart on Pipeline Overview.
- [Comparison] New UI for snapshot comparison and snapshot merge.
- [Comparison] Support batch push in snapshot merge report.
- [Administration] Support database tables creation for new IDA instance on IDA startup.
- [Administration] Able to recreate containerized selenium grid if it is down.
- [Container] Add resource requests and limits configrations for containerized selenium grid.

#### Bug Fixes
- [Testing] Slow loading of project dashboard and test case detail page.
- [Testing] Cannot record control ECM File Uploader in IDA Recorder.
- [Testing] Process diagram is not properly scaled on Process Coverage modal on Firefox.
- [Pipeline] Exception warning is thrown when pipeline build is approved.
- [Pipeline] Not able to click Stop or ...Menu button on the pipeline build table when build is run or completed.
- [Comparison] The inline scripts of coach views are the same but the comparison report shows there are changes.
- [Comparison] The data mappings of process(subprocess) tasks are the same but the comparison report shows there are changes.
- [Comparison] Changes in line links in human service are not shown in comparison result.
- [Administration] Unexpected exception is thrown when creating user if LDAP server is down.


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server (eg: Liberty, WebSphere)	| ida-24.0.10.zip | [Installing IDA Application](../installation/installation-installing-ida-application.html) |
| IDA web and operator docker images | ida-24.0.10.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA web and operator docker images based on Java 11| ida-24.0.10-java11.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts | idaweb-helm-24.0.10.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/24.0.10/idaweb-helm-24.0.10.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
