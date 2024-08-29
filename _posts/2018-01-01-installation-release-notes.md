---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2024-08-14 13:35:00
---

## Release Notes

### 24.0.7 - 08/29/2024
#### Enhancements
- [Testing] Draw the actual flow of sub processes in test report.
- [Testing] Upgrade Selenium Java API to support latest Selenium Hub.
- [Comparison] Redesign a hierarchical left-side menu bar by nesting child artifacts in parent artifact.
- [Administration] Add resources page for downloading all IDA resources.
- [Administration] Able to download the latest embedded rule project from settings page.

#### Bug Fixes
- [Testing] "Enter" event should not be triggered after text command.
- [Testing] Failed to upload docx and csv files using bpmFileDropzone command.
- [Testing] The test coverage diagram is not properly scaled in some cases.
- [Testing] Show multiple instances data in test report.
- [Pipeline] Could not commit JPA transaction error is thrown during test step run in pipeline.
- [Pipeline] Duplicate pipeline build numbers of scheduled pipeline.
- [Pipeline] Cancel button does not work on pipeline edit page if 'Trigger by New Snapshot' form validation fails.
- [Pipeline] SKIPPED build step should be not count when the success rate of a pipeline build step is calculated.
- [Comparison] List reverted artifacts when reverting a delete operation.
- [Administration] Failed to auto clean pipeline builds when builds are in PARTIAL SUCCESS status.

#### Notes
- There are database changes from 24.0.6 to 24.0.7, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA browser Plug-in is updated to version 24.7, please make sure you have installed the latest plug-in.
- Toolkit and workspace folders have been removed from the release package. User can download all the resource files(plugins, toolkits and customization starter projects) from the **Resources** page under menu **Administration**(https://sdc-china.github.io/IDA-doc/administration/administration-resources.html).
- Because Selenium Java API is upgraded to support the latest Selenium Hub, very old browser versions are no longer supported. Please upgrade the Selenium browsers to the minimum supported versions if needed(https://sdc-china.github.io/IDA-doc/installation/installation-system-requirement.html#selenium-grid-browsers-support).

## Release Components

| Component Description	| Release File	| Installation instructions| 
|:----------------|:------------------------|:---------------|
| IDA release package for traditional web server (eg: Liberty, WebSphere)	 |ida-24.0.7.zip|[Installing IDA Application](../installation/installation-installing-ida-application.html) |
| IDA web and operator docker images |	ida-24.0.7.tgz	| <https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |
| IDA web and operator docker images based on Java 11|	ida-24.0.7-java11.tgz	|<https://github.com/sdc-china/ida-docker> <br/> <https://github.com/sdc-china/ida-operator> |

## IDA Supporting Service Subscription
1-year standard support is provided for each release after its official release date. It's only available with IDA Supporting Service Subscription.

## Previous Releases

Here you can find a more complete list of [release notes](../references/references-previous-release-notes.html).
