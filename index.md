---
layout: single
author_profile: false
sidebar:
  nav: "docs"
---

## Overview

[IBM Deployment Accelerator for Business Automation Workflow](https://www.youtube.com/playlist?list=PLvnkIpbV-59aKdOujdn30R7KRZ0qLd8Cg) redefines IBM Business Process Manager (BPM)/IBM Business Automation Workflow(BAW) innovation with tools and methodologies from IBM. It is a lightweigt solution for BPM process development,testing and ops team to apply DevOps to a BPM project.

  ![][ida-devops]   

### Development Team

Developers can perform static analysis on the BPM process application, which enforces design convention and processes development standards.  There are 80+ checkstyle rules built-in that are based on BPM development best practices and anti-patterns. Also, developers can monitor the status and overall report through the pipeline dashboard. If there are any error with the build, developers will be notified by mail.

Here are some user stories.

1. As a developer, I want to create unit test cases against the services and coach UI that could help me to run the test cases in CI server to ensure the code quality.
2. As a developer, I want to extend the auto testing tool functionalities using customized commands to reduce the testing effort and improve the test coverage.
3. As a developer, I want to analyze my BPM project with the static analysis tool regularly that could help me to enforce the coding standard and best practice in my project and ensure the quality of the deliverables.
4. As a developer, I want to compare the different snapshot of the BPM project to understand what changes are to be delivered, what changes are causing issues.
5. As a developer, I want to analyze the code quality of a specific snapshot to control the code quality of all snapshots in my deployment cycle.
6. As a developer, I want to get the code analysis result organized by categories to understand and assign code quality issues to the Dev team.
7. As a developer, I want to get the code analysis result with suggestions that could help me to find out how to solve every issue.
7. As a developer, I want to know toolkit dependency result that could help me to find out what shall we update when a toolkit is upgraded or removed.
8. As an architect, I want to be able to customize the code quality rules for static analysis that could make our specific check list be applied.

### Testing Team

Testers can automate their test scenarios and boost their productivity by generating the test project and case template from a BPM server, then edit and record their test scenarios without coding. They can use 60+ built-in automation test commands to support BPM application testing.

Testers can create a monitor to monitor BPM service metrics with alerts. The alerts can be configured to be sent by mails. 

IDA offers detailed report including screenshots, execution process flow and coverage to improve communications between testers and developers on each test case. 

Here are some user stories.

1.	As a tester, I want to create functional test cases easily to perform the regressive test automatically against each new version of the BPM project.
2.	As a tester, I want to have comprehensive testing reports to know the testing coverage of my BPM test project and troubleshooting if any test failed.
3.	As a tester, I want to do automatic regression testing in my DevOps sprint that could make me  be focused in the new application features.
4.	As a tester, I want to a have an auto testing tool that allows me to do end-to-end auto testing without human involved to build a complete test coverage.
5.	As a tester, I want that the auto testing tool can generate the test evidence of every test case, to reduce the manual effort.
6.	As a tester, I want that the auto testing tool can run test projects in parallel to reduce the testing time.
7.	As a tester, I want that the auto testing tool can execute tests in BPM and other web applications together to reduce the testing effort.
8.	As a tester, I want that the auto testing tool is easy to learn and easy to use, so I can reduce my learning time and testing effort.
9.	As a tester, I want to record a test script in one environment and run in different environments, so I can reduce my testing effort.
10.	As a tester, I want to run a test script with multiple test data, so I can reduce my testing effort and make test cases reusable and increase the test coverage.

### Ops Team:

The user stories are as below:

1.	As a BPM Administrator, I want to be notified upon the status change or abnormal execution time of specific services that could help me take immediate actions on any outage.
2.	As a BPM Administrator, I want to manipulate the in-flight instances more efficiently to do the run-time debug to fix the issues reported by business users easily.


### CICD Pipeline

The user stories are as below:

1.	As a Deployer, I want to construct an automatic release process to deliver the BPM releases more frequently and also in good quality.
2.	As a Deployer, I want to deploy my BPM application in TEST env through creating a snapshot or one-click to make it available for testing.
3.	As a Deployer, I want to be notified when a deployment is finished that could remind me to take action when the deployment fails.
4.	As a Deployer, I want to be able to schedule pipelines to execute to assure that deployment is executed without human involvement.
5.	As a Project Manager, I want to review the build history of my BPM project that helps push the team to handle the outstanding issues during development and deployment.

### Features & Capabilities
* Test Case generation
* Record and playback BPM UI
* Smart comparison for Testing
* Static code analysis for BPM application
* Continuous delivery of BPM application through visualizing pipeline
* Snapshot Comparision for BPM application
* Statistic Analyzing for BPM application
* Toolkit Dependency Analyzing for BPM application
* Support tools for BPM instance migration
  



[ida-devops]: ./images/install/ida-devops.png


