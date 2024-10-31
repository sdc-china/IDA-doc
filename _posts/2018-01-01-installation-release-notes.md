---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2024-08-14 13:35:00
---

## Release Notes

### 24.0.9 - 10/31/2024

#### Enhancements
- [Testing] Calculation of test suite coverage should include subprocess actual flows.
- [Testing] Able to fail the test case when actual flow is not the same as the expected flow.
- [Pipeline] Able to overwrite pipeline stage server info in pipeline REST API.
- [Pipeline] Hide My Pending Approvals section on Home page when there are no pending approvals.
- [Pipeline] Add input validation for Trigger Pipeline Build REST API.

#### Bug Fixes
- [Testing] Should not show expected flow if flow diagram cannot be loaded.
- [Testing] Cannot draw actual flow when the same linked process is attached in different subprocesses.
- [Testing] Custom command change is not highlighted in the second test case version.
- [Testing] Unique index constraint violation is thrown when restoring test case version with changes in custom command parameters.
- [Testing] Clear Import Project selection when the modal is displayed.
- [Testing] Display all time stamps in test case histories using the same time zone of user browser.
- [Pipeline] The imported pipeline has a null schedule time, causing the pipeline to run automatically.
- [Administration] User should not be redirected to migration page if the database version was set to a previous hotfix version, when no database migration or IDA upgrade is needed.
- [Database] Fix inconsistent database schema.


## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server (eg: Liberty, WebSphere)	| ida-24.0.9.zip | [Installing IDA Application](../installation/installation-installing-ida-application.html) |
| IDA web and operator docker images | ida-24.0.9.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA web and operator docker images based on Java 11| ida-24.0.9-java11.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA Helm Charts | idaweb-helm-24.0.9.tgz	| Helm Charts Repo: <https://sdc-china.github.io/ida-operator> <br/> Binary Releases: <https://github.com/sdc-china/ida-operator/releases/download/24.0.9/idaweb-helm-24.0.9.tgz> |

## IDA Supporting Subscription Service
1-year standard support is provided for each release after its official release date. It's only available with IDA Supporting Subscription Service.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
