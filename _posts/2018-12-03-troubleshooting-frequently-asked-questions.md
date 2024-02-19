---
title: "Frequently Asked Questions"
category: troubleshooting
date: 2018-12-03 15:17:55
last_modified_at: 2024-02-19 12:53:00
---

# Frequently Asked Questions
***

## FAQ about IDA

1. FAQ: Where can I get information about hardware and software requirements of IDA?
    - Answer: See [System Requirement doc](../installation/installation-system-requirement.html)
2. FAQ: Could IDA be used to do performnance testing?
    - Answer: No at the moment.
3. FAQ: Can Checkstyle or Testing component be integrated individually with the existing external CI/CD pipeline?
    - Answer: YES, you could define Testing only, Checkstyle only pipeline and then leverage REST APIs for integration. More detail please refer to [Architecture doc](../references/references-architecture.html) and [IDA REST APIs doc](../references/references-ida-rest-apis.html)
4. FAQ: Could IDA use Oracle or SQLServer as DB beside DB2 and Mysql in supported list?
    - Answer: IDA only tests on DB2 and Mysql by now.It need some consultancy hours to support other RDBMS.
5. FAQ: Could IDA WAR be deployed on the BAW WAS server?
    - Answer: NO. The BAW WAS server COULD be only used by Workflow project if it's not a license WAS server.
6. FAQ: Could we use IE to record testing?
    - Answer: NO. the recording feature only supports on Chrome or Firefox. IE could be used to replay the recorded test case. Just need setup a Selenium server on Windows to run regression testing.
6. FAQ: Could we import Selenium test projects to IDA?
    - Answer: NO.     
6. FAQ: Does IDA support BPM adv (BPEL) testing and static analysis?
    - Answer: NO. The testing and checkstyle of IDA only supports BPM std(BPMN).    
6. FAQ: Does IDA support IBM BAW v18?
    - Answer: YES.  Refer to *Software Prerequisites* in [System Requirement doc](../installation/installation-system-requirement.html)     
6. FAQ: Can we customize the rules of Checktyle?
    - Answer: YES.  Refer to doc [Customize Checkstyle Rules](../checkstyle/checkstyle-customize-checkstyle-rules.html) and [Architecture doc](../references/references-architecture.html) about integration.   
1. FAQ: Does the CheckStyle feature detect issues that cannot be detected by the Process Designer code validation
    - Answer: YES. Checkstyle is BAW code static analytic.The PD validation is to do "compiling validation".   
1. FAQ: Could IDA test process definitions in toolkits or just the ones in process applications?   
    - Answer: YES. The user could select toolkit when creating test case. See [doc](../test/test-test-case-management.html)
1. FAQ: If the team built some AngularJS code inside the coaches, can IDA support its testing?
    - Answer: YES. We could use [Custom Recorder](../administration/administration-custom-recorder.html) to capture all UI controls if the OOTB recorder does not record it correctly.
1. FAQ: What is the customer gets under the contract: source code of IDA or the packaged compiled code??
    - Answer: The packaged compiled code w/o source code.
1. FAQ: Does IDA support heritage coaches which is wildly used in BPM v8.x?
    - Answer: YES.
1. FAQ: Does IDA support BPMoC?
    - Answer: YES. But each test case needs to insert a command LoginBPMOC as the first step because the BPMOC environment needs to login before visiting.
![][loginbpmoc]

1. FAQ: Can a sample report be shared with us so we want to look at it more closely off-line to understand what checkstyle can analysis?
    - Answer: YES. You could share one TWX file with us and we coudl use IDA to generate a offline report.
1. FAQ: Is there technical documentation available for IDA?
    - Answer: All have been published on Git [doc](../)
1. FAQ: Is there number of users limitation on the IDA?
    - Answer: No limitation on # of users. The IDA asset license is granted to setup one IDA env.
1. FAQ: How does Checkstyle of IDA compare with IBM App Scan ?
    - Answer: The app scan only check for security vulnerability and the checkstyle is do statci code analysis in BAW TWX.
1. FAQ: Shall I record all test cases again if I add a new field or change its position?
    - Answer: You could use [group command](../test/test-group-command-management.html) to manage test cases. In that case, you could just manualy modify the group command if adding one new field. Or record group command steps again and not need update all test cases one by one.
1. FAQ: Does IDA support migration from versions which are not previous to the current release? For example, 2.2.1 to 2.2.4?
    - Answer: YES. though the intermediary sql scripts must be executed for each consecutive version we skip. Refer to [step one](../references/references-migrating-and-updating-ida-application-v2.x.html) in migration doc
1. FAQ: Why can't I launch the BP3 human services on firefox grid?
    - Answer: The firefox selenium driver that we used(geckodriver-v0.23.0) cannot launch the BP3 human services when the selenium version is 3.14.0. This will be fixed in the next release.
1. FAQ: Do we need the BAW admin to execute WAS commands permanently or we can use another user with similar/less permissions in configuration?
    - Answer: We need WAS admin role to execute WAS commands to do deployment if the version is BAW v18 less. If it's BAW v18.0.0.2 or better, there is no need to configure WAS Admin in IDA.    
1. FAQ: There are only user and admin two roles in doc. Can we define more roles?
    - Answer: Yes. e.g You need an infrustrure ADMIN role to do all servers configuration. It could be done thru  customization for role permission control.  
1. FAQ: Can we use a different user for the REST API configuration?
    - Answer: YES. Please make sure the user is in group either tw_authors or tw_admins.
1. FAQ: Does IDA support window.confirm in plugin? If not, what should I do If the result of window.confirm influences the business logic?
    - Answer: No. They are't support in IDA plugin and work in server by adding confirmOk and confirmCancel command. About replaying in plugin, need to click OK or Cancel button manually.
1. FAQ: I got the errors shows I don't have the access permission to the Process App when I using the Checksstyle and Analyzer, what should I do?
    - Answer: You should add permissions for your **Rest User** to access the Process App.
![][add-permission-1]
![][add-permission-2]

1. FAQ: I can't be assigned to tw_admins group because of security factors on PS server, what should I do to test Process Apps on PS?

	- Answer: Do below action to allow non tw_admin users to access the REST.

		1. Stop the servers of your IBM BAW PS environment.

		2. Start the scripting client in disconnected mode as described in [update BPM Config command](https://www.ibm.com/support/knowledgecenter/SS8JB4/com.ibm.wbpm.ref.doc/topics/rref_updatebpmconfig.html).

		3. Run the following commands:

			```
			wsadmin> AdminTask.updateBPMConfig( [ '-create', '/server' ]
			wsadmin> AdminTask.updateBPMConfig( [ '-create', '/server/enforce-authorization-check-for-ps-model-data', '-xNodeValue', 'false' ] )
			wsadmin> AdminConfig.save()
			```

		4. Restart the servers of your IBM BAW environment.

1. FAQ: I got the wrong character encoding in CSV file, what should I do?

	- Answer: See [Test Case Data Binding][1]

1. When you create a new pipeline.  Why do I have to tie it to a snapshot?  If I create a new snapshot do I need to then update all my pipelines to have that new snapshot referenced?
    - Answer: The snapshot in the first stage is the default snapshot that will be used to pull all process app information and run the pipeline steps.
	          If the stage begins with a "snapshot" step, then the new created snapshot will be used to run the follow up test/checkstyle steps.

1. Why do I need to specify the snapshot acronym when I want to run the pipeline?
    - Answer: The snapshot acronym is optional. If user specify a snapshot acronym name when start pipeline, then the pipeline will skip "snapshot" step and use this snapshot acronym to run test/checkstyle steps.

1. Can I run test/checkstyle against tip/default in pipeline?
    - Answer: Yes. If the tip option is checked in test/checkstyle step, then it will always run against tip/default(depends on PC or PS) snapshot.

1. Can I specify a PS as the first stage of a pipeline?
    - Answer: Yes. The first stage can be either PC or PS.
If the first stage is PC, then snapshot step can be added, and you can add online/offline deployment in the second PS stage.
If the first stage is PS, then you can not add snapshot step, and only offline deployment is supported.

1. How to enable the Javascript Expression execution?
    - Answer: Please follow the below steps:
      1. Stop the BAW environment.
      2. Change the enable-javascript-execution value in 99Local.xml flle, the file path is PROFILE_DMGR_HOME\config\cells\cell_name\nodes\node_name\servers\server_name\process-center\config\system\99Local.xml.
      3. Start the BAW environment.
      ![][enable-javascript-execution]

1. Why the snapshots is part missing when I search the snapshots in Admin Tool/Comparison?
    - Answer: Due to the BAW REST API's limitation on the number of returned results, so not all results are returned if the number of snapshots(named + unnamed) is huge, you can try to cleanup the unnamed snapshots.

1. Do you have any sizing recommedation for Selenium Hub? Can you explain what influences on the number of test cases which can run in parallel?

   See [docs][6]. Some suggestions about Selenium Hub sizing as follows:

   - Max concurrent sessions per Selenium node: #CPU cores and # of maxSession configured on Selenium node
   - Memory consumption after startup:
     Selenium Hub: 400M
     Per Selenium browser: 300M
   - Memory consumption running 1 test case:
     Selenium Hub: 600M
     Per Selenium browser: 1G
   - Memory consumption running 30 test cases:
     Selenium Hub: 1G
     Per Selenium browser: 1G

   Test cases are queued on IDA if no available Selenium browser sessions. Max concurrent test cases running in Selenium is also limited by IDA server's performance. IDA's max threads > Selenium's max threads concurrency. When test cases increases and their run time increases significantly, try increase #CPU cores per Selenium node and/or connect a new Selenium node to Selenium hub.

1. How to run test cases in plugin or Selenium when browser prompts for choosing client certificates?

   The browser prompts to let user choose a client certificate when the web server requires mutual TLS authentication. You need to manually choose the certificate on your machine or Selenium server once or configure your browser to auto select client certificates. The items to check:
   - There exist client certificates on your machine or Selenium server for the web browser to use. See reference [here][2].
   - Configure your browser to auto select client certificates, for example, configure [AutoSelectCertificateForUrls for Chrome][3]. See reference [here][4].
   - On Selenium, make your browser run on headful mode. For example, [Chrome does not support selecting or using client certificates in headless mode][5].

1. How to clean test screenshots generated by pipeline builds when disk space is full?

   IDA supports nightly cleanup of pipeline build reports - you can set Max # of builds to keep and Days to keep builds on Settings. To clean old test screenshots that are out of scope of the nighlty job, use commands below. For example, to clean test screenshots older than 45 days:

   `find /var/ida/data/screenshots/pipeline/Project* -maxdepth 0 -type d -ctime +45 -exec rm -r "{}" \;`
   
   
1. How to deal with WebSphere Application Server SOAP Connection Issues: "java.lang.SocketException: Connection reset" or "java.net.SocketTimeoutException: Read timed out"?

    - Answer: Please follow the below steps, refer to doc [Connection timeout when running a wsadmin script](https://www.ibm.com/docs/en/bpm/8.6.0?topic=configuration-connection-timeout-when-running-wsadmin-script):
      1. Open the Dmgr profile SOAP properties file, <WAS_PROFILE_HOME>/Dmgr01/properties/soap.client.props.
      2. Edit the SOAP timeout value to 0 (no limit), by default, the value is 180: com.ibm.SOAP.requestTimeout=0
      3. Open the AppSrv profile SOAP properties file, <WAS_PROFILE_HOME>/AppSrv01/properties/soap.client.props.
      4. Edit the SOAP timeout value to 0 (no limit), by default, the value is 180: com.ibm.SOAP.requestTimeout=0
      5. Restart the whole environment.

1. How to test non-exposed human service?

   Non-exposed human service can only be tested in Workflow Center environment. Before testing, assign process application(or toolkit if human service is created in toolkit) Read permission to the test account in Workflow Center. Non-exposed human service can not be tested in a Workflow Server environment.
      
      


[add-permission-1]: ../images/references/add-permission-1.png
[loginbpmoc]: ../images/references/loginbpmoc.png
[add-permission-2]: ../images/references/add-permission-2.png
[enable-javascript-execution]: ../images/references/enable-javascript-execution.png
[1]: ../test/test-test-case-data-binding.html#create-a-csv-test-data-file
[2]: https://jpassing.com/2021/09/27/do-browsers-use-client-certificates-to-authenticate-the-user-the-device-or-both/
[3]: https://gist.github.com/IngussNeilands/3bbbb7d78954c85e2e988cf3bfec7caa
[4]: https://chromeenterprise.google/policies/?policy=AutoSelectCertificateForUrls
[5]: https://bugs.chromium.org/p/chromium/issues/detail?id=1310715&q=component%3AInternals%3EHeadless&can=2
[6]: https://www.selenium.dev/documentation/grid/getting_started/#grid-sizes
