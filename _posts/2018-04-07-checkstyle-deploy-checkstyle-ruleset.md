---
title: "Deploy Checkstyle Ruleset"
category: checkstyle
date: 2018-04-07 15:17:55
last_modified_at: 2019-07-29 15:30:00
---

# Deploy Checkstyle Ruleset
***

## Software Prerequisites

* [IBM Operational Decision Manager](https://www.ibm.com/products/operational-decision-manager?mhsrc=ibmsearch_a&mhq=IBM%20Operational%20Decision%20Manager)

## Deploy ruleset to IBM Operational Decision Manager Decision Server

If you want to execute the ruleset through the Decision Server, you should deploy your ruleset to the Decision Server like IBM Cloud or an on-premise Rule Execution Server.

1. Set up the Decision Server.    

2. Deploy your ruleset.

	* Open the deployment Operation in the rule project CheckstyleRules. On the Deployment Target Servers tab, add a target server using the Connection Settings found in the Decision Server.

		![][checkstyle_deploy_ruleset_cloud_two_1]
	
		![][checkstyle_deploy_ruleset_cloud_two_2]{:width="60%"}

	* Deploy the Checkstyle rules to your IBM Business Rules Service on IBM Cloud. Open the deploymentOperation in the rule project CheckstyleRules. On the Deployment Overview tab, make sure Deploy the XOM is selected as Yes and click Proceed to RuleApp deployment.

		![][checkstyle_deploy_ruleset_cloud_two_3]
		
		![][checkstyle_deploy_ruleset_cloud_two_4]{:width="60%"}
		
		![][checkstyle_deploy_ruleset_cloud_two_5]{:width="60%"}
		
		![][checkstyle_deploy_ruleset_cloud_two_6]{:width="60%"}

	* After the deployment is completed, a report will be generated as follows. You can also check your IBM Cloud Business Rules service to verify that the ruleset is successfully deployed.

		![][checkstyle_deploy_ruleset_cloud_two_7]

3. Change configurations in **Administration > Settings**.

	* Go to the **Settings** section under **Administration**.

	* Make sure that the Checkstyle **Engine** is set to **ODM** and configure the values of Rest Url, Decision Server Username, and Decision Server Password.
		
		![][checkstyle_deploy_ruleset_cloud_two_8]

	* Click the **Test Connection** button to test the connection between IDA and the ODM Server. If successful, click **Save** to save the changes. 

## Deploy ruleset locally

If you want to execute the ruleset in the local file system, you need to replace the ruleset file following these steps below.

1. Deploy your ruleset

	* There is no need to define or choose a target server when deploying your ruleset locally.

    ![][checkstyle_deploy_ruleset_local_1]{:width="60%"}

	* After the successful deployment, the ruleset has been generated in the output folder of the CheckstyleRules Project as the file CheckstyleRules.dsar. Replace the ruleset in IDA.war(IDA-web/WEB-INF/classes/data/CheckstyleRules.dsar) with the new one.

2. Change configurations in ida.properties

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
 [checkstyle_deploy_ruleset_cloud_two_8]: ../images/checkstyle/checkstyle_deploy_ruleset_cloud_two_8.png
 [checkstyle_deploy_ruleset_local_1]: ../images/checkstyle/checkstyle_deploy_ruleset_local_1.png