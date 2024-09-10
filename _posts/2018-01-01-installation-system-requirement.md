---
title: "System Requirements"
category: installation
date: 2018-01-01 15:17:55
last_modified_at: 2023-12-27 13:35:00
---

# System Requirements
***

## Supported Platforms

* Ubuntu 16.04+, CentOS 6.8+, Red Hat Enterprise Linux 6.9+
* Windows 10+
* OpenShift v4.x

## Software Prerequisites

* [OpenJDK 8, 11](https://openjdk.org/install/), [IBM JDK 8, 11](https://www.ibm.com/support/pages/java-sdk-downloads) or [Oracle JDK 8, 11](https://www.oracle.com/java/technologies/downloads/archive/)
* [IBM Business Process Manager v8.5.x, v8.6.x](https://www.ibm.com/support/knowledgecenter/en/SSFPJS), [IBM Business Automation Workflow v18.x](https://www.ibm.com/support/knowledgecenter/en/SS8JB4_18.0.0/com.ibm.wbpm.workflow.main.doc/kc-homepage-workflow.html), [IBM Business Automation Workflow 19.x](https://www.ibm.com/support/knowledgecenter/SS8JB4/com.ibm.wbpm.workflow.main.doc/kc-homepage-workflow.html), [IBM Business Automation Workflow 20.x and 21.x](https://www.ibm.com/support/knowledgecenter/SS8JB4_20.x/com.ibm.wbpm.workflow.main.doc/kc-homepage-workflow.html), [IBM Business Automation Workflow 22.x](https://www.ibm.com/docs/en/baw/22.x), [IBM Business Automation Workflow 23.x](https://www.ibm.com/docs/en/baw/23.x), [IBM Business Automation Workflow 24.x](https://www.ibm.com/docs/en/baw/24.x)
* [Open Liberty v20.0.0.3+](https://public.dhe.ibm.com/ibmdl/export/pub/software/openliberty/runtime/release/2020-03-05_1433/openliberty-20.0.0.3.zip), [WebSphere Liberty v20.0.0.3+](https://www.ibm.com/support/pages/node/6250961) or [IBM WebSphere Application Server Version v9.0.5.4+](https://www.ibm.com/support/pages/node/886749)
* [IBM Db2 v11.1+](https://www.ibm.com/analytics/us/en/db2/), [PostgreSQL 14.3+](https://www.postgresql.org/download/), [MySQL v5.7+](https://dev.mysql.com/downloads/mysql/), [Oracle v12.2.0.1](https://sdc-china.github.io/IDA-doc/installation/installation-database-installation-and-configuration.html#install-and-configure-oracle) or [Oracle v19.3+](https://sdc-china.github.io/IDA-doc/installation/installation-database-installation-and-configuration.html#install-and-configure-oracle)
* [Selenium v3.141.59](./installation-post-installation-setup.html#installing-selenium-grid-v3) or [Selenium v4.10+](./installation-post-installation-setup.html#installing-selenium-grid-v4)

## Selenium Grid Browsers Support

* Firefox v92+ (64-bit)
* Chrome v94+ (64-bit)
* Edge v114+ (64-bit)
* IE v11+ (Supports execution only)

## Hardware Requirements

Description | Hardware Requirements | Max Concurrent Users
------------|----------------------|---------------------
Minimum Requirement | 2 core CPU, 4 GB memory, 20 GB disk | 10
Recommended Requirement | 4 core CPU, 8 GB memory, 50 GB disk | 20
Optimal Requirement | 8 core CPU, 16 GB memory, 100 GB disk | 40

**Notes**:
*Using Checkstyle/Analyzer/Comparison/Search will consume more memory. If the TWX size is greater than 100MB, then at least **8G memory** is required.*

For more information on performance, please refer to [Performance Test Report](../references/references-performance-test.html).

## Disk Usage

We recommend at least **20G** reserved disk space, and **50G** reserved disk space is recommended. You can also enable "auto clean" in IDA settings page for saving disk space.

The following table provides the data stored by IDA and the approximate size of each type of data. You can estimate the required capacity according to your needs. This table does not include the size of IDA itself, logs, attachments, avatars, and temporary data, please add an additional 5GB when estimating.

File | Description | Average size of each file
-----|--------------|---------------------------
TWX File | IDA needs to export and download TWX from BAW to local for analysis | 50MB
Checkstyle Report | Generated after each Checkstyle execution | 400KB
Analyzer Report | Generated after each Analyzer execution | 200KB
Comparison Report | Generated after each Comparison execution | 300KB
Search Index Folder | Generated after each Search execution | 2MB
Testing Screenshot | Generated after each Testing step execution | 60KB
Installation Package | The deployment operation in the pipeline will export this installation package | 50MB
Standalone Testing Project | Average size of a Testing project | 55MB
Standalone Pipeline | Average size of a Pipeline | 105MB

Assuming that the following pipeline needs to be run every day, then the daily disk usage for one pipeline is about 105MB, and one month disk usage is 3GB+.

![][simple_pipeline]

[simple_pipeline]: ../images/install/simple_pipeline.png
