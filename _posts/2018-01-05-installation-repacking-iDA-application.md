---
title: "Repacking IDA Application"
category: installation
date: 2018-01-05 15:17:55
last_modified_at: 2021-12-10 21:34:00
---

# Repacking IDA Application v21.x
Below are steps to repackage IDA application v21.x+. For repackaging applications of early versions of IDA, see [Repacking IDA v3.x Application, Repacking IDA v2.x Application](../references/references-repacking-ida-application-early-version.html)

***


## Properties Configuration

**Configure IDA properties** 

Edit [IDA_HOME]/conf/**ida.properties** under **conf** folder. 

Please add JNDI configuration. See sample JNDI datasource configuration in Liberty server in [installation doc](../installation/installation-installation-ida-application.html#installing-on-liberty).

**JNDI Configuration**

*  **spring.datasource.jndi-name** : JNDI NAME
.

## Repacking IDA-web with configuration

The purpose of repackage  is to update your application-product.yaml in the war to make sure it loads the recent configuration.Once all the properties in [IDA_HOME]/conf/ida.properties file have been updated, you can then re-package the [IDA_HOME]/build/**ida-web.war** file.  

Before running the [IDA_HOME]/**package.bat** or [IDA_HOME]/**package.sh** you will need to set the JAVA_HOME environment variable and make ensure that [JAVA_HOME]/bin is included in the variable.  Once the environment variable is set , you can then execute the package shell command to repackage the **ida-web.war**.
