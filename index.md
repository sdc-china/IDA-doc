---
layout: default
title: "IBM Deployment Accelerator for Business Automation Workflow (IDA)"
---

## Overview

[IBM Deployment Accelerator for Business Automation Workflow](https://youtu.be/6LJhP7LedU0 ) redefines IBM Business Process Manager (BPM)/IBM Business Automation Workflow(BAW) innovation with tools and methodologies from IBM. It is a lightweigth solution for BPM process development team,testing team and ops team to apply DevOps to a BPM project.
  ![][ida-devops]   

### Development Team

Developers can perform static analysis on the BPM process application, which enforces design convention and processes development standards.  There are 80+ checkstyle rules built-in which are based on BPM development best practices and anti-patterns. Also, developers can monitor the status and overall report through the pipeline dashboard. If there are any error with the build, they will be notified by mail.

1. As a developer, I want to create unit test cases against the services and coach UI, so that I can run the test cases in CI server to ensure the code quality.
2. As a developer, I want to extend the auto testing tool functionalities using customized commands, so that I reduce the testing effort and improve the test coverage.
3. As a developer, I want to analyze my BPM project with the static analysis tool regularly, so that I can enforce the coding standard and best practice in my project and ensure the quality of the deliverables.
4. As a developer, I want to compare the different versions of the BPM project, so that I can understand what changes are to be delivered,  what changes are causing issues.
5. As a developer, I want to analyze the code quality of a specific snapshot, so that I can control the code quality of all snapshots in my deployment cycle.
6. As a developer, I want to get the code analysis result organized by categories, so that I understand and assign code quality issues to the Dev team.
7. As a developer, I want to get the code analysis result with suggestions, so that I know how to solve every issue.
8. As an architect, I want to be able to customize the code quality rules for static analysis, so that our specific check list can be applied.

### Testing Team

Testers can automate their test scenarios and boost their productivity by generating the test project and case template from a BPM server, then edit and record their test scenarios without coding. They can use 60+ built-in automation test commands to support BPM application testing.

Testers can create a monitor to monitor BPM service metrics with alerts. The alerts can be configured to be sent using email.

IDA offers detailed reports including screenshots, execution process flow and coverage to improve communications between testers and developers on each test case. 

1. As a tester, I want to easily create functional test cases, so that the regressive test can be automatically performed against each new version of the BPM project.
2. As a tester, I want to have comprehensive testing reports, so that we could know the testing coverage of my BPM test project and troubleshooting if any test failed.
3. As a tester, I want to do automatic regression testing in my DevOps sprint, so that let me to be focused in the new application features.
4. As a tester, I want a have an auto testing tool that allows me to do End-to-end auto testing without human involved, so I can build a complete test coverage.
5. As a tester, I want that the auto testing tool can autogenerate the test evidence of every test case, so that I can reduce effort to do it manually.
6. As a tester, I want that the auto testing tool can run test projects in parallel, so that I can reduce the testing time.
7. As a tester, I want that the auto testing tool can execute tests in BPM and in other web applications together, so that I can reduce the testing effort. 
8. As a tester, I want that the auto testing tool is easy to learn and easy to use, so I can reduce my learning time and testing effort.
9. As a tester, I want to record a test script in one environment and run in different environments, so I can reduce my testing effort.
10. As a tester, I want to run a test script with multiple test data, so I can reduce my testing effort, make test cases reusable and increase the test coverage.

### Ops Team:
1. As a BPM Administrator, I want to be notified upon the status change or abnormal execution time of specific services, so that I can be take immediate actions on any outage.
2. As a BPM Administrator, I want to manipulate the in-flight instances more efficiently, so that I do the run-time deggub to fix the issue reported by business users easily. 


### CICD Pipeline
1. As a Deployer, I want to construct an automatic release process, so that I can deliver the BPM releases more frequently and in good quality.
2. As a Developer, I want to deploy my BPM application in TEST env through creating a snapshot or one-click, so that it is available for testing. 
3. As a Deployer, I want to be notified when a deployment is finished, so that I take action when the deployment fails.
4. As a Deployer, I want to able to schedule pipelines to execute, so that I can assure that deployment be executed without human involvement.
5. As a Project Manager, I want to review the build history of my BPM project, so that I can push the team to handle the outstanding issues during development and deployment.

### Features & Capabilities
* Test Case generation
* Record and playback BPM UI
* Static code analysis for BPM application
* Continuous delivery of BPM application through visualize pipeline
* Code review for BPM application
* Monitor BPM service with alert in real time
* Support tools for BPM instance migration
  



[ida-devops]: ./images/install/ida-devops.png


