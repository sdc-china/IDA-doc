---
title: "Architecture"
category: references
date: 2018-11-01 15:17:55
last_modified_at: 2019-07-29 16:40:00
---

# Architecture
***

## Integration Architecture
![integration architecture](../images/architecture/integration_architecture_1.png)
1. IDA communications with BAW servers by REST API using basic authentication method.
2. SSH is needed to support IDA pipeline deployment feature, if the BAW server version is prior to 18.0.0.2.
3. To gain full function of testing feature, [IDA toolkit](../installation/installation-installation-ida-application.html#step-2-installing-ida-baw-toolkit) needs to be installed in the BAW application.
4. To record and replay test case by browser, [IDA Plugin](../installation/installation-installation-ida-application.html#step-3-installing-ida-browser-plug-in) need to be installed in user's browser(Chrome or Firefox).
5. IDA connects to Database by TCP protocol.
6. IDA connects to Selenium Server by HTTP protocol.
7. [IBM Operational Decision Manager](https://www.ibm.com/us-en/marketplace/operational-decision-manager) will be used to replace OOTB static analysis POJO engine so that all static analysis rules could be customized and managed outside IDA solution. IDA integrate with ODM by REST API using basic authentication method. 
8. IDA provides [REST API](../references/references-ida-rest-apis.html) to support third party CI/CD tools. Basic authentication method is used to authorize IDA REST API access.
9. IDA supports LDAP server for user authentication.


## Deployment Architecture
![deployment architecture](../images/architecture/deployment_architecture
.png)
