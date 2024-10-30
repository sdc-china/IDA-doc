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

## Hardware Requirements for VM Deployment

Description | Hardware Requirements | Max Concurrent Users
------------|----------------------|---------------------
Minimum Requirement | 2 core CPU, 4 GB memory, 20 GB disk | 10
Recommended Requirement | 4 core CPU, 8 GB memory, 50 GB disk | 20
Optimal Requirement | 8 core CPU, 16 GB memory, 80 GB disk | 40

**Notes**:
*At least **8G memory** is recommended, if you are using Checkstyle/Analyzer/Comparison/Search for the TWX file that greater than 100MB*.

For more information on performance, please refer to [Performance Test Report](../references/references-performance-test.html).

## Hardware Requirements for Kubernetes Deployment

### Small profile:

Component | CPU Request (m) | CPU Limit (m) | Memory Request (Mi) | Memory Limit (Mi) | Disk space (Gi) | Access mode | Number of replicas
--- | --- | --- | --- | --- | --- | --- | ---
IDA Operator | 100 | 500 | 256 | 512 |  |  | 1
IDA Web | 1000 | 2000 | 2048 | 4096 | 20 | ReadWriteOnce(RWO) <br/> ReadWriteMany(RWX) | 1

### Medium profile:

Component | CPU Request (m) | CPU Limit (m) | Memory Request (Mi) | Memory Limit (Mi) | Disk space (Gi) | Access mode | Number of replicas
--- | --- | --- | --- | --- | --- | --- | ---
IDA Operator | 100 | 500 | 256 | 512 |  |  | 1
IDA Web | 2000 | 4000 | 4096 | 8192 | 50 | ReadWriteMany(RWX) | 2

### Large profile:

Component | CPU Request (m) | CPU Limit (m) | Memory Request (Mi) | Memory Limit (Mi) | Disk space (Gi) | Access mode | Number of replicas
--- | --- | --- | --- | --- | --- | --- | ---
IDA Operator | 100 | 500 | 256 | 512 |  |  | 1
IDA Web | 2000 | 8000 | 4096 | 16384 | 80 | ReadWriteMany(RWX) | 2
