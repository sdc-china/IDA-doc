---
title: "Architecture"
category: references
date: 2018-10-26 15:17:55
last_modified_at: 2019-07-29 16:40:00
order: 1
---

# Architecture
***
### Integration Architecture
![integration architecture](../images/architecture/integration_architecture.png)
- IDA communications with BAW servers by REST API or SSH.
- IDA connects to Database by TCP protocol.
- IDA connects to Selenium Server by HTTP protocol.
- IDA supports LDAP server for user authentication.
- Third party CI/CD tools can invoke IDA pipeline by REST API.
- [IBM Operational Decision Manager](https://www.ibm.com/us-en/marketplace/operational-decision-manager) will be used to replace OOTB static analysis POJO engine so that all static analysis rules could be customized and managed outside IDA solution. IDA integrate with ODM by REST API.

### Deployment Architecture
![deployment architecture](../images/architecture/deployment_architecture
.png)

