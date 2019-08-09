---
title: "Deploy Checkstyle ruleset"
category: checkstyle
date: 2018-10-09 15:17:55
last_modified_at: 2019-07-29 15:30:00
order: 4
---

# Deploy Checkstyle ruleset
***
### Software Prerequisites

* [IBM® Operational Decision Manager](https://www.ibm.com/us-en/marketplace/operational-decision-manager)

### Deploy ruleset to IBM® Operational Decision Manager Decision Server

#### If you want to execute ruleset through Decision Server, you should deploy your ruleset to Decision Server like IBM Cloud or on-premise Rule Execution Server.

#### 1. Have Decision Server set up    


#### 2. Deploy your ruleset

  * Open deployment Operation in rule project CheckstyleRules. On the Deployment Target Servers tab, add a target server using the Connection Settings found in Decision Server.

    ![][checkstyle_deploy_ruleset_cloud_two_1]

    ![][checkstyle_deploy_ruleset_cloud_two_2]

  * Deploy the Checkstyle rules to your IBM Business Rules Service on IBM Cloud. Open deploymentOperation in rule project CheckstyleRules. On the Deployment Overview tab, make sure Deploy the XOM is selected as Yes and click Proceed to RuleApp deployment.

    ![][checkstyle_deploy_ruleset_cloud_two_3]

    ![][checkstyle_deploy_ruleset_cloud_two_4]

	![][checkstyle_deploy_ruleset_cloud_two_5]

	![][checkstyle_deploy_ruleset_cloud_two_6]

  * After the deployment completes, a success report is generated as follows. You can also check your IBM Cloud Business Rules service to verify that the ruleset is successfully deployed.

    ![][checkstyle_deploy_ruleset_cloud_two_7]

#### 3. Change configurations in ida.properties

  * Make sure the value of ruleExecutionMode in ida.properties is 2.

  * Configure the values of resUser, resPassword, resUrl, restUrl and resPort in ida.properties.

### Deploy ruleset in local

#### If you want to execute ruleset in local file system, you need to replace the ruleset file following steps below.

#### 1. Deploy your ruleset

  * There is no need to define or choose a target server when deploy your ruleset in local.

    ![][checkstyle_deploy_ruleset_local_1]

  * After the successful deployment, the ruleset has been generated in the output folder of CheckstyleRules Project as the file CheckstyleRules.dsar. Replace the ruleset in IDA.war(IDA-web/WEB-INF/classes/data/CheckstyleRules.dsar) with the new one.

#### 2. Change configurations in ida.properties

  * Make sure the value of ruleExecutionMode in ida.properties is 0.




 [checkstyle_deploy_ruleset_cloud_one_1]: ../images/checkstyle/checkstyle_deploy_ruleset_cloud_one_1.png
 [checkstyle_deploy_ruleset_cloud_one_2]: ../images/checkstyle/checkstyle_deploy_ruleset_cloud_one_2.png
 [checkstyle_deploy_ruleset_cloud_one_3]: ../images/checkstyle/checkstyle_deploy_ruleset_cloud_one_3.png
 [checkstyle_deploy_ruleset_cloud_two_1]: ../images/checkstyle/checkstyle_deploy_ruleset_cloud_two_1.png
 [checkstyle_deploy_ruleset_cloud_two_2]: ../images/checkstyle/checkstyle_deploy_ruleset_cloud_two_2.png
 [checkstyle_deploy_ruleset_cloud_two_3]: ../images/checkstyle/checkstyle_deploy_ruleset_cloud_two_3.png
 [checkstyle_deploy_ruleset_cloud_two_4]: ../images/checkstyle/checkstyle_deploy_ruleset_cloud_two_4.png
 [checkstyle_deploy_ruleset_cloud_two_5]: ../images/checkstyle/checkstyle_deploy_ruleset_cloud_two_5.png
 [checkstyle_deploy_ruleset_cloud_two_6]: ../images/checkstyle/checkstyle_deploy_ruleset_cloud_two_6.png
 [checkstyle_deploy_ruleset_cloud_two_7]: ../images/checkstyle/checkstyle_deploy_ruleset_cloud_two_7.png
 [checkstyle_deploy_ruleset_local_1]: ../images/checkstyle/checkstyle_deploy_ruleset_local_1.png
