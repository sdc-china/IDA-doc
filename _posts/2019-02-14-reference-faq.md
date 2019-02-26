---
layout: page
title: "Frequently asked questions"
category: references
date: 2019-02-14 15:17:55
order: 9
---

# FAQ about IDA

1. FAQ: Where can I get information about hardware and software requirements of IDA? 
    - Answer: See [System requirement doc](https://sdc-china.github.io/IDA-doc/installation/installation-system-requirement.html)
2. FAQ: Could IDA be used to do performnance testing?
    - Answer: No at the moment. 
3. FAQ: Can Checkstyle or Testing component be integrated individually with the existing external CI/CD pipeline?
    - Answer: YES, you could define Testing only, Checkstyle only pipeline and then leverage REST APIs for integration. More detail please refer to [Architecture doc](https://sdc-china.github.io/IDA-doc/references/references-architecture.html) and [API doc](https://sdc-china.github.io/IDA-doc/references/references-apis.html)
4. FAQ: Could IDA use Oracle or SQLServer as DB beside DB2 and Mysql in supported list?
    - Answer: IDA only tests on DB2 and Mysql by now.It need some consultancy hours to support other RDBMS.
5. FAQ: Could IDA WAR be deployed on the BPM WAS server?
    - Answer: NO. The BPM WAS server COULD be only used by BPM application if it's not a license WAS server.
6. FAQ: Could we use IE to record testing?
    - Answer: NO. the recording feature only supports on Chrome and Firefox. IE could be used to replay the recorded test case. Just need setup a Selenium server on Windows to run regression testing.
6. FAQ: Could we import Selenium test projects to IDA?
    - Answer: NO.     
6. FAQ: Does IDA support BPM adv (BPEL) testing and static analysis?
    - Answer: NO. The testing and checkstyle of IDA only supports BPM std(BPMN).    
6. FAQ: Does IDA support IBM BAW v18?
    - Answer: YES.  Refer to *Software Prerequisites* in [System requirement doc](https://sdc-china.github.io/IDA-doc/installation/installation-system-requirement.html)     
6. FAQ: Can we customize the rules of Checktyle?
    - Answer: YES.  Refer to doc [Customize Checkstyle rules](https://sdc-china.github.io/IDA-doc/checkstyle/checkstyle-customize-checkstyle-rules.html) and [Architecture doc](https://sdc-china.github.io/IDA-doc/references/references-architecture.html) about integration.   
1. FAQ: Does the CheckStyle feature detect issues that cannot be detected by the Process Designer code validation
    - Answer: YES. Checkstyle is BPM code static analytic.The PD validation is to do "compiling validation".   
1. FAQ: Could IDA test process definitions in toolkits or just the ones in process applications?   
    - Answer: YES. The user could select toolkit when creating test case. See [doc](https://sdc-china.github.io/IDA-doc/test/test-case-management.html)
1. FAQ: If the team built some AngularJS code inside the coaches, can IDA support its testing?
    - Answer: YES. We could use [Recorder extention](https://sdc-china.github.io/IDA-doc/administration/administration-custom-recorder.html()) to capture all UI controls if the OOTB recorder does not record it correctly.
1. FAQ: What is the customer gets under the contract: source code of IDA or the packaged compiled code??
    - Answer: The packaged compiled code w/o source code. 
1. FAQ: Does IDA support heritage coaches which is wildly used in BPM v8.x?
    - Answer: YES. 
1. FAQ: Does IDA support BPMoC?
    - Answer: YES. 
1. FAQ: Can a sample report be shared with us so we want to look at it more closely off-line to understand what checkstyle can analysis?
    - Answer: YES. You could share one TWX file with us and we coudl use IDA to generate a offline report.
1. FAQ: Is there technical documentation available for IDA?
    - Answer: All have been published on Git [doc](https://sdc-china.github.io/IDA-doc/)
1. FAQ: Is there number of users limitation on the IDA?
    - Answer: No limitation on # of users. The IDA asset license is granted to setup one IDA env.
1. FAQ: How does Checkstyle of IDA compare with IBM App Scan ? 
    - Answer: The app scan only check for security vulnerability and the checkstyle is do statci code analysis in BPM TWX.
1. FAQ: Shall I record all test cases again if I add a new field or change its position?
    - Answer: You could use [group command](https://sdc-china.github.io/IDA-doc/test/test-group-command-management.html) to manage test cases. In that case, you could just manualy modify the group command if adding one new field. Or record group command steps again and not need update all test cases one by one.