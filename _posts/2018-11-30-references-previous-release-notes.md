---
title: "Previous Release Notes"
category: references
date: 2018-11-30 11:17:55
last_modified_at: 2024-08-14 13:35:00
---

## Previous Release Notes

### 24.0.7 - 08/29/2024
#### Enhancements
- [Testing] Draw the actual flow of sub processes in test report.
- [Testing] Upgrade Selenium Java API to support latest Selenium Hub.
- [Comparison] Redesign a hierarchical left-side menu bar by nesting child artifacts in parent artifact.
- [Administration] Add resources page for downloading all IDA resources.
- [Administration] Able to download the latest embedded rule project from settings page.

#### Bug Fixes
- [Testing] "Enter" event should not be triggered after text command.
- [Testing] Failed to upload docx and csv files using bpmFileDropzone command.
- [Testing] The test coverage diagram is not properly scaled in some cases.
- [Testing] Show multiple instances data in test report.
- [Pipeline] Could not commit JPA transaction error is thrown during test step run in pipeline.
- [Pipeline] Duplicate pipeline build numbers of scheduled pipeline.
- [Pipeline] Cancel button does not work on pipeline edit page if 'Trigger by New Snapshot' form validation fails.
- [Pipeline] SKIPPED build step should be not count when the success rate of a pipeline build step is calculated.
- [Comparison] List reverted artifacts when reverting a delete operation.
- [Administration] Failed to auto clean pipeline builds when builds are in PARTIAL SUCCESS status.

#### Notes
- There are database changes from 24.0.6 to 24.0.7, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA browser Plug-in is updated to version 24.7, please make sure you have installed the latest plug-in.
- Toolkit and workspace folders have been removed from the release package. User can download all the resource files(plugins, toolkits and customization starter projects) from the **Resources** page under menu **Administration**(https://sdc-china.github.io/IDA-doc/administration/administration-resources.html).
- Because Selenium Java API is upgraded to support the latest Selenium Hub, very old browser versions are no longer supported. Please upgrade the Selenium browsers to the minimum supported versions if needed(https://sdc-china.github.io/IDA-doc/installation/installation-system-requirement.html#selenium-grid-browsers-support).

### 24.0.6 - 07/30/2024

#### Enhancements
- Support CP4BA 24.0.0.
- Display all IDA time stamp using the same time zone of user browser.
- [Pipeline] Support to trigger the pipeline build at a specific time or within a time period.
- [Pipeline] Allow user to add approve/reject/resume pipeline comments.
- [Pipeline] Add Approved By/Rejected By/Resumed By info to pipeline build stage and step.
- [Comparison] Add new filter for merged artifacts.

#### Bug Fixes
- Fix inconsistent case_description column definition in database schemas.
- [Testing] Text command does not properly lose focus on Firefox hub.
- [Testing] Other selenium grids are not loaded sometimes when project is edited in project detailed page.
- [Testing] Style is broken when hiding the sub steps at group command second level.
- [Checkstyle] The "The Error is not implemented" rule fails to check some error handlers.
- [Pipeline] The imported pipeline from old version should not be saved without completed stage information.
- [Pipeline] It should do pre-check when user click the resume button in pipeline.
- [Pipeline] Fix the issue that failed to execute the pipeline test with inactive snapshot on Workflow Center environment.
- [Comparison] Delete operations also need to display all dependencies.
- [Comparison] Report generation hungs due to performance issue of comparing very long scripts.
- [Plugin] Not able to record Start workflow on Workplace.
- [Plugin] Websocket connection was not stable in IDA plugin.

#### Notes
- There are database changes from 24.0.5 to 24.0.6, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA browser Plug-in is updated to version 24.6, please make sure you have installed the latest plug-in.
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.

#### The checkstyle rules change details
[Added rules]
- checks/process/check-bpd-subprocess-error-not-fully-implemented
- checks/service/check-service-subprocess-error-not-fully-implemented


### 24.0.5.1 - 07/16/2024

#### Bug Fixes
- [Testing] Disregarding conditional execution of Group Command causes an error that is not handled correctly.
- [Pipeline] Test cases with different CSV data row bindings are executed sequentially instead of in parallel, which degrades pipeline performance.
- [Pipeline] Post Scripts has been executed but the build status returned by rest API is still running.


### 24.0.5 - 06/27/2024

#### Enhancements
- [Pipeline] Add build status in pipeline build print report.
- [Pipeline] Add datasetName and testCaseInfoId to pipeline REST API response.
- [Installation] Support importing LDAPS SSL certification for IDA Operator.
- [Administration] support LDAP user and local user login simultaneously.

#### Bug Fixes
- [Testing] Can't view test case content due to invalid JSON parameter in test result.
- [Testing] Can't record UI controls in popup window if it is opened in group command.
- [Testing] Test command assertTableContent failed with service data table.
- [Testing,Pipeline] Test report was not generated in pipeline report due to wrong smart comparison DB data.
- [Checkstyle] Error has been implemented but "The Error is not implemented" will still be reported in service flow.
- [Pipeline] Incorrect status of first build stage for Terminated build in pipeline REST API response.
- [Pipeline] Missing stop button for queued pipeline build.
- [Pipeline] Prevent concurrent snapshot deployment of the same application.
- [Operations Tool] Migrate Instances button should not be enabled if no data available in table.
- [Administration] Can't activate or deactivate user if LDAP is enabled.
- [Administration] No alert on process and branch selection when the BAW server is unavailable.

#### Notes
- There are database changes from 24.0.4 to 24.0.5, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA browser Plug-in is updated to version 24.4, please make sure you have installed the latest plug-in.

### 24.0.4 - 05/31/2024

#### Enhancements
- [Comparison] Improve snapshot comparison report UI.
- [Pipeline] Display QUEUED status as NOT EXECUTED in pipeline build steps.
- [Testing] Adjust log level for test step execution of IF condition JS command.
- [Pipeline] Add doc link in the pipeline pending warning message.

#### Bug Fixes
- [Testing] Fix plugin storage permission settings which could result in unintentional data exfil.
- [Testing] It should show project name in the project delete confirm modal.
- [Testing] Fix issue that the containerized Firefox selenium hub doesn't work on OCP 4.11+.
- [Testing] Last step overlaps with footer in smart compare.
- [Testing] Test case can't be stopped due to DB exception. 
- [Testing] Cannot draw complete actual flow for some test cases.
- [Testing] Task data is not listed in execution order in test report.
- [Checkstyle] Checkstyle performance issue due to too many nested toolkits.
- [Checkstyle] Checkstyle uploader style is unsightly.
- [Checkstyle] The rules should ignore commented code.
- [Pipeline] Can not edit the pipeline if the server is unconnected.
- [Pipeline] Print report button on build detail page does not work.
- [Pipeline] Test case error step info is wrong in the result of pipeline REST API.
- [Comparison] The history report is missing due to BAW server API error.
- [Comparison] Clear filter button should not be shown if there is no filter setting changes.
- [Administration] The version of a BAW server configuration is not updated immediately after test connection.
- [Administration] Logs improvement on twx upload and show IDA data folder space info.

#### Notes
- There are database changes from 24.0.3 to 24.0.4, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA browser Plug-in is updated to version 24.3, please make sure you have installed the latest plug-in.
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.
- We have upgraded to solve some security issues, which will cause problems with historical reports. Please regenerate them.



### 24.0.3 - 04/30/2024

#### Enhancements
- [Comparison] Replace an artifact content with the one in a specific snapshot in Merge function.
- [Comparison] Filter snapshot comparison report by modifier name.
- [Comparison] Remind user an artifact is already added or deleted and the merge report is outdated in Merge function.
- [Comparison] Show the action type of each change in the history of changes on a single artifact in the snapshot comparison report.
- [Administration] Migrate database schema on IDA startup.
- [Administration] Support to use internal service url when containerized selenium grid deployment.

#### Bug Fixes
- [Testing] IDA prompts for plugin login even user already logged in Home page.
- [Testing] Support to load business applications on Cloud Pak for Business Automation 23.0.2.
- [Testing] Refresh of the test log blocks the test case details page.
- [Pipeline] Pipeline build status is incorrect sometimes when it was terminated.
- [Pipeline] Display build name instead of build id in confirm modal for resuming/approving/rejecting pipeline build.
- [Pipeline] The action buttons don't work in filtered builds in the search field of the pipeline builds sidebar.
- [Pipeline] Snapshot creation times are different in the Comparison and Clean Snapshot pages.
- [Pipeline] Scheduled jobs cannot be rescheduled to the original schedule when Quartz data source is enabled.
- [Comparison] Snapshot creation times are different when 'Include Unnamed Snapshots' is selected.
- [Comparison] The documentation changes of client side human service items are not shown in the snapshot comparison report.

#### Notes
- There are database changes from 24.0.2 to 24.0.3, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA browser Plug-in is updated to version 24.2, please make sure you have installed the latest plug-in. 


### 24.0.2 - 03/27/2024

#### Enhancements
- [Pipeline] Support to migrate process instances by using custom policy created on Workflow Center for BAW v22.x+.
- [Pipeline] Enable more email notification configurations of pipeline.
- [Pipeline] Notify approvers of pipeline builds to approve.
- [Pipeline] Add Halt on Failure option on Test step of pipeline.
- [Pipeline] Add Partial Success build status for unchecked Halt on Failure build steps if they failed.
- [Pipeline] Add action menu to pipeline builds.
- [Comparison] Support merge behavior script changes in CoachView.
- [Comparison] Show the history of changes(who and when made a change) on a single artifact in the snapshot comparison report.
- [Installation] Improve and optimize IDA operator and instance installation on Openshift.
    - Able to install a cluster-wide or namespace-scoped IDA operator.
    - Optimize installation steps and scripts.
    - Able to configure IDA datasource currentSchema.
    - Add resource requests and limits configuration.

#### Bug Fixes
- [Testing] IDA recorder text format issue.
- [Testing] After logging in to the plugin, the warning for logging in to the plugin still pops up in custom command.
- [Testing] Smart comparison report got incorrect image differences when the entire screenshots are compared.
- [Testing] Not able to run JUnit test when writing custom Java command.
- [Testing] File controls cannot be recorded.
- [Testing] Cannot record value for text command on Portal search box.
- [Pipeline] Broken Info icon style for Deployment step on pipeline dashboard page.
- [Pipeline] Fix Checkstyle card display issues on pipeline build report.
- [Pipeline] Throws NumberFormatException in plugin pipeline notifications.
- [Comparison] The Enter key does not work in the merge script editor.
- [Administration] Adjust all async thread pool task rejection policy to abort policy.
- [Installation] Add SSL certification password parameter for IDA instance deployment script.

#### Notes
- There are database changes from 24.0.1 to 24.0.2, please execute the corresponding migration scripts.
- IDA operator is updated to version 24.0.1.
- New documentation on IDA operator and instance installation (https://github.com/sdc-china/ida-operator).
- New documentation on IDA operator and instance migration from 23.0.3 to 24.0.1 (https://github.com/sdc-china/ida-operator/blob/main/docs/Migrate%20IDA%20Operator.md). 


### 24.0.1 - 01/31/2024

#### Enhancements
- Support BAW 23.0.2 on Prem and Container versions.
- [Testing] Able to select Task Name for FileNet P8 activities in runActivityByName command.
- [Checkstyle] Ignore the meaningless Javascript code style warning.
- [Checkstyle] Combine JS coding check symptoms.
- [Pipeline] Support approval on pipeline stage.

#### Bug Fixes
- [Testing] Debug command does not print logs to web dev tool console.
- [Testing] Support BPM processes when generating cases for case type.
- [Testing] Cannot generate case for case solutions on Cloud Pak env.
- [Testing] Since the xpath will change, the playback of some click operations in navigator will fail.
- [Testing] Not able to use csv data in addCase command.
- [Checkstyle] Throws ConstraintEvaluationException when running checkstyle offline.
- [Pipeline] Incorrect count of failed case steps in pipeline test report.
- [Pipeline] Pipeline test report shows wrong process app info when pipeline is triggered with another process app using REST API.
- [Pipeline] Exception is thrown on toolkit or group pipeline.
- [Comparison] Toolkit is not listed in the dependency tree when artifact is added.
- [Comparison] The comparison result is wrong when the Extenal Services have duplicated operations.
- [Comparison] Internal sub artifact is not removed from merge report along with its parent artifact.
- [Comparison] Refactor Managed Asset type in comparison report.
- [Administration] Fix display of popup menu in configuration tables.
- File upload size limit in IDA app configuration does not work.
- IDA is not correctly redirected to target page when user re-logs in after session timeout.

#### Notes
- There are database changes from 23.0.11 to 24.0.1, please execute the corresponding migration scripts.
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.
- IDA browser Plug-in is updated to version 24.1, please make sure you have installed the latest plug-in.
	

### 23.0.11 - 12/27/2023

#### New Features
- [Testing,Pipeline] Support Business Applications on Cloud Pak for Business Automation.

#### Enhancements
- [Testing] Generate case solution test template with required activities.
- [Comparison] Add hint message for added artifacts in snapshot merge report.
- [Administration] Should check if IDA data path is writable when starting IDA.
- [Installation] Support Java 11.

#### Bug Fixes
- [Testing] Failed to run startManualActivity command in Workflow Server after offline deployment.
- [Testing] Failed to run AddActivity command in Workflow Server after offline deployment.
- [Testing] UTF8 string too large error during load test file generation.
- [Testing] WebPD plugin can't load test project due to CSP error.
- [Comparison] Fix Filter issues in snapshot compare and merge report.
- [Comparison] Invisible BO should not be updated independently in snapshot merge report.
- [Comparison] Toolkit dependencies should be added when adding an artifact in snapshot merge report.
- [Administration] Change Display Name to REST User Display Name on Add/Edit BAW Server.
- [Administration] Failed to clean test logs when it is forcibly cleaned up during test case run.

#### Notes
- There are database changes from 23.0.8 to 23.0.11, please execute the corresponding migration scripts.
- IDA browser Plug-in is updated to version 23.7, please make sure you have installed the latest plug-in.


### 23.0.10 - 11/29/2023

#### Enhancements
- [Comparison] Support add and revert artifacts in Merge function.
- [Checkstyle] Enhance the infinite loop rule to display loop details.
- [Administration] Enable disk cache auto clean on Settings page.
- [Administration] Adjust IDA data folder structure.
- [Administration] Long loading time blocks all Clean button on Clean Disk Cache page.
- [Installation] Use the same SSL certificate if IDA is run in multiple pods.

#### Bug Fixes
- [Testing] Selenium grid sessions are not fully used in HA environment.
- [Testing] Fix login issue on BAW on Container v23.0.1.
- [Testing] The icon of inline user task and robot task is missing in the diagram.
- [Testing] Compilation issue when load test simulation is generated.
- [Checkstyle] InvalidTwxFileException is thrown if there are objects without names in package.xml.
- [Checkstyle] NullPointerException is thrown when checking the error implementation.
- [Checkstyle] Online Checkstyle history report print version does not work.
- [Checkstyle] Clicking Checkstyle View History button throws error.
- [Comparison] Comparison result of external service is incorrect.
- [Comparison] Analyzer throws NumberFormatException.
- [Comparison] Workflow automation settings changes are not shown in the Comparison report.
- [Comparison] Filter does not work for toolkits and events.
- [Pipeline] The authentication information in pipeline script should not be print in log.
- [Administration] Error is thrown when cleaning case or pipeline logs or Logs disk cache.
- [Installation] The existing pods are not rolling updated when IDACluster configuration changed.

#### Notes
- IDA browser Plug-in is updated to version 23.6, please make sure you have installed the latest plug-in.
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.
- IDA operator is updated to version 23.0.3.


### 23.0.9 - 10/26/2023

#### New Features
- Support IDA High Availability Topology

#### Enhancements
- Support BAW 23.0.1 on Prem and Container versions.
- [Testing] Allow to specify the key for randomString and randomNumber commands.
- [Checkstyle] New Checkstyle rule for “Terminate” type end event.
- [Administration] Clean the disk cache based on file date.

#### Bug Fixes
- [Testing] Fix duplicate test screenshot folder on Linux IDA server.
- [Testing] Unable to view test case report if the exception trace contains special characters.
- [Testing] Missing parent step index in test screenshot for group command step.
- [Testing] StartServiceFlow command run against tip version of wrong track.
- [Testing] Websocket connection is cancelled when IDA is deployed in Docker Desktop on Windows.
- [Comparision] Rest Service change is not in the snapshot comparison report.
- [Comparison] It should not show the diagram section for the artifacts without diagram.
- [Comparison] The added inline user task is not show in the comparison report.
- [Comparison] Failed to delete and revert toolkits in Merge function.
- Fix security warnings and upgrade libs in IDA codebase.

#### Notes
- See new doc for IDA High Availability Topology configuration(https://sdc-china.github.io/IDA-doc/references/references-high-availability-for-ida-application-on-was-and-ihs.html, https://sdc-china.github.io/IDA-doc/references/references-high-availability-for-ida-application-on-liberty-and-haproxy.html).
- IDA browser Plug-in is updated to version 23.5, please make sure you have installed the latest plug-in.
- IDA operator is updated to version 23.0.1.


### 23.0.8 - 09/27/2023

#### Enhancement
- [Testing] Support to run a discretionary activity in case solution.
- [Comparison] Delete and revert artifact in Merge function.
- [Administration] Auto configure performance test engine in settings page.

#### Bug Fixes
- [Testing] Fix duplicated content in test case screenshot.
- [Analyzer] Unable to analyze the System Data toolkit.
- [Pipeline] Display warning message when the deployment option is not available.
- [Comparison] The compare report is incomplete if the items have the same name.
- [Comparison] The link changes of Heritage human service does not appear in the compare report.
- [Comparison] The changes of Theme does not appear in the compare report.
- [Comparison] Can't restart the failed compare/merge requests.
- [Administration] Check the global custom command usage and show warning message before deleting it.
- [Administration] Check the BAW server usage and show warning message before deleting it.
- [Administration] User with readonly permission should not able to stop test case or delete pipeline build.

#### Notes
- There are database changes from 23.0.7 to 23.0.8, please execute the corresponding migration scripts.
- IDA browser Plug-in is updated to version 23.4, please make sure you have installed the latest plug-in.


### 23.0.7 - 08/30/2023

#### Enhancement
- [Testing] Display flow diagram in case solution test project.
- [Checkstyle] Add track and snapshot acronym info to Checkstyle report.
- [Pipeline] User can view one page pipeline build report.
- [Pipeline] Using Snapshot Acronym to run pipeline overwrites the Tip checkbox in Checkstyle and Testing.
- [Pipeline] Support more flexible date format for the snapshot naming pattern.
- [Pipeline] The same installation Package from the same BAW sever is shared between different pipelines.

#### Bug Fixes
- [Checkstyle] Checkstyle should not report warnings from system toolkit.
- [Checkstyle] The artifact location is not correct when subprocess component is copied.
- [Checkstyle] Remove outdated Checkstyle rules.
- [Checkstyle] Fix the rule check-stp-bpd.
- [Pipeline] Ignore checkboxes are not saved after creating the Checkstyle step.
- [Pipeline] Checkstyle rules configuration does not take effect in pipeline Checkstyle step.
- [Pipeline] The pipeline build error shows wrong stage name.
- [Pipeline] Pipeline deployment sync settings operation timeout due to hardcode settings.
- [Pipeline] Can't deploy a brand new process app to BAW Server.
- [Administration] The loading indicator should cover modal.
- [Administration] Unable to use Clean Disk Cache if the data folder is too large.
- [Administration] Disk cache page doesn't show all the folders.

#### Notes
- There are database changes from 23.0.6 to 23.0.7, please execute the corresponding migration scripts.
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server. 


### 23.0.6.1 - 08/01/2023

#### Bug Fixes
- [Checkstyle] Wrong check-delete-completed-task warnings in subprocess.


### 23.0.6 - 07/27/2023

#### New Features
- [Testing] Support run test case on Edge on Selenium 4.

#### Enhancement
- [Testing] A new command named runActivityByName replaces the original runFileNetP8ActivityByName.
- [Testing] Enhance project print report function.
- [Pipeline]Provide detailed information in pipeline REST API.

#### Bug Fixes
- [Testing] It should not show load test error message in selenium test report.
- [Testing] When there are multiple scroll bars, the splicing of full-screen screenshots has repeated parts.
- [Testing] The dropdown button list style is different between project dashboard and project case page.
- [Testing] Enter key will bypass the verification and save the same test suite/case name.
- [Testing]Case project roles can not be loaded in Group command.
- [Pipeline] Fix DB2 deadlock issue.
- [Pipeline] Fix name of tip snapshot displayed on pipeline test report.
- [Comparison] The diff result is not right when insert an empty line in the end in merge editor.
- [Administration] Fix the Connected PS Server is missing when choose the Stage/Product type server.

#### Notes
- There are database changes from 23.0.3 to 23.0.6, please execute the corresponding migration scripts.


### 23.0.5 - 06/29/2023

#### Enhancement
- [Testing] Able to show test report summary print page for test project.
- [Checkstyle] Detect External Service calls within a Service Flow/BPD where the 'Catch specific errors' has no code in it.

#### Bug Fixes
- [Testing] Rename the argument "Token" to "Time Token" in fireTimer command.
- [Testing] Fix the continuous alarm window keeps the case running and cannot be stopped.
- [Testing] Fix not able to insert case in group case command.
- [Testing] Fix throw null error when generating the diagram.
- [Testing] Fix exporting the test project will lose the custom command information with the same name.
- [Testing] Fix importing project selects the global command instead of the custom command in the project.
- [Testing] Check tip option needs to select the default version in the PS environment.
- [Testing] Fix the test case is executed twice.
- [Checkstyle] Remove "Ignore Toolkits Check" option in Checkstyle page.
- [Checkstyle] Fix Checkstyle rules including check-app-with-too-many-environmentvariableset, check-app-with-too-many-exposedprocess-variable, check-bpd-javascript-live-connect and check-service-javascript-live-connect.
- [Analyzer] Remove "Ignore Toolkits Analysis" option in Analyzer page.
- [Pipeline] Fix the test report is missing in pipeline report dashboard.
- [Pipeline] The status of snapshot step should be SKIPPED if skipped snapshot step due to triggered by new snapshot.
- [Pipeline] Fix pipeline auto cleanup logic, which will cleanup individual pipeline instead of doing batch cleanup.
- [Operations Tool] Fix throw error when search unnamed snapshots.


### 23.0.4 - 05/25/2023

#### Enhancement
- Support CP4BA 22.0.2.
- [Checkstyle] Check too many nested client-side human services.
- [Checkstyle] Check too many coach views used in Coach UI.
- [Checkstyle] Adjust Checkstyle threshold.
- [Operations Tool] Load snapshots of all states including archived.

#### Bug Fixes
- [Testing] Show sub process actual execution flow.
- [Pipeline] Manually delete pipeline build should also delete the releated pipeline logs/checkstylereport/screenshot.
- [Pipeline] Fix bind CSV file per server name will trigger the original bundled CSV file.
- [Comparison] Adjust the report start number to 0 for decision tables.
- [Operations Tool] Fix show warning in clean snapshot page if swagger ui doc is not available.
- [Operations Tool] Fix the snapshot that failed to be deleted is always in the archived folder.


### 23.0.3 - 04/27/2023

#### Enhancement
- [Checkstyle] Ignore exposed service for unused service rules.
- [Checkstyle] Ignore empty and comment lines when calculate JavaScript code of lines.
- [Pipeline] Able to search old builds in the pipeline build side bar.
- [Pipeline] Configure and run pipeline builds in a separate thread pool from scheduled job thread pool.
- [Comparison] Support merge conditional script.

#### Bug Fixes
- [Testing] Recorder does not work when one line comment is added in Custom Recorder.
- [Testing] The startExternalProcess command loaded incorrect number of processes.
- [Checkstyle] Fix wrong unconnected item warnings when system toolkit is analyzed.
- [Checkstyle] Fix The variable is not used rule.
- [Checkstyle] Fix too many rule doesn't include service flow.
- [Checkstyle] Fix check infinite loop rule doesn't include heritage service.
- [Checkstyle] Fix inner table check rules.
- [Analyzer] The External Service operation should not be shown in the External Implementation list.
- [Analyzer] The WSDL value is not correct in the report.
- [Comparison] The auto generated snapshot name is not correct.
- [Comparison] Snapshot comparison keeps in progress in front-end but is actually completed in back-end.
- [Search] Default value of private variable cannot be searched.
- [Pipeline] Failed builds’ duration is displayed as “-”.
- [Pipeline] Fix pipeline build summary that trigger by new snapshot or timer.
- [Pipeline] Pipeline should not be passed if no permission to access IDA data folder.
- [Pipeline] The BAW server is offline but the pipeline build is not stopped.
- [Administration] Fix error in nightly cleanup job.
- [Administration] Failed to create containerized selenium grid configuration.

#### Notes
- There are database changes from 23.0.1 to 23.0.3, please execute the corresponding migration scripts.


### 23.0.2 - 03/30/2023

#### Enhancement
- [Checkstyle] Add new checkstyle rules for all artifacts that need UI/Service/BPD Conversion.
- [Checkstyle] Ignore artifacts for checkstyle by tags and naming pattern.
- [Comparison] Support compare the changes in decision table.
- [Comparison] Support merge coach data change script.
- [Pipeline] Support Toolkit Deployment between Workflow Centers.

#### Bug Fixes
- [Testing] The key does not exist error appears in any test project tab.
- [Testing] Failed to start non exposed service flow if multiple IDA Utility service exists in toolkits.
- [Testing] Load test network info is recorded incorrectly during user login.
- [Testing] Cannot run performance test with simple Debug command.
- [Testing] Test case generation does not work for linked process.
- [Testing] Can't view the performance test log information when the case is in running status.
- [Testing] The linked service flow in test flow diagram should not be clickable.
- [Testing] Coaches Radio click event should not be recorded twice.
- [Testing] Test case description lost after export and import.
- [Testing] The test case can not be stopped if there is no IDA data folder access permission.
- [Testing] NullPointException when click the case where the previous used selenium grid is deleted.
- [Checkstyle] The minimal health score should not be 0 if the warning count is more than 0.
- [Checkstyle] Refactor check-bpd-simulation-configurations-deprecated to ignore Default settings.
- [Checkstyle] Ignore Javascript code style check for conditional script.
- [Checkstyle] Ignore the infinity loop warning if the loop flow includes human task.
- [Checkstyle] The script in Activity Component do not show Artifact Details in the report.
- [Comparison] The pre and post changes merge on the service flow does not work.
- [Comparison] 500 error when click the node in the diagram.
- [Comparison] Script changes cannot be merged when the original script is blank.
- [Pipeline] Back button should return to the previous page with the list of testCases in pipeline testing report.
- [Pipeline] Add tooltip after the "Snapshot Acronym" Label on run pipeline dialog.

#### Notes
- IDA browser Plug-in is updated to version 23.3, please make sure you have installed the latest plug-in.
- There are changes for Checkstyle BOM and rules. If ODM Checkstyle engine is used, please deploy the latest Checkstyle rule project to Rule Execution Server. 


### 23.0.1 - 2/23/2023

#### Enhancement
- [Testing] Adjusted usage of timeouts and add page load timeout in the Settings.
- [Testing] Support record and util scripts customization on both browser plugin and selenium grid server.
- [Testing] Support fire event in click command.
- [Testing] Support sub process for test case generation.
- [Checkstyle] Support embedded Checkstyle rules customization.
- [Administration] Update the BAW server type display name in BAW cofiguration page.
 
#### Bug Fixes
- [Testing] The svg xpath can't be found when replay test case.
- [Testing] Delete button is recorded twice in BPM UI table.
- [Testing] Only prevent the submission for error severity messages when validate the Record Script.
- [Testing] Fix the verbalization of checkbox command.
- [Testing] Selenium returns status not ready when all sessions are occupied.
- [Plugin] WebPD style is affected by IDA plugin.
- [Plugin] Script is not injected into some sub iframe on firefox.
- [Plugin] Browser plugin doesn't work if the page without dojo library.
- [Plugin] Playback continues even with error message and file upload message.
- [Plugin] On input event not fired for textarea.
- [Plugin] BP3 ComboBox's cancel selection button cannot be recorded or replayed.
- [Checkstyle] Fix Checkstyle rules including check-coachcontrol-with-no-binding-value,check-bpd-phantom-steps,check-stp-bpd,check-toolkit-nested-level.drl,check-dojo-based-stock-controls-on-coach-deprecated.drl,check-responsive-stock-controls-on-coach-deprecated.drl.
- [Checkstyle] Using checkstyle at the same time on different account will affect each other.
- [Analyzer] Throws StringIndexOutOfBoundsException when WSDL URI is not accurate.
- [Checkstyle,Analyzer] Not able to run Checkstyle and Analyzer for Case project on BAWv2201.
- [Comparison] Script pre and post changes are missing in the report.
- [Comparison] The line number in merge report is negative number.
- [Comparison] The arrow style is break in comparison report.
- [Comparison] The newly added nodes are not all highlighted in the diagram and missing in the details.
- [Pipeline] It takes a long time to open stage edit modal.

#### Notes
- There are database changes from 22.1.9 to 23.0.1, please execute the corresponding migration scripts.
- IDA browser Plug-in is updated to version 23.2, please make sure you have installed the latest plug-in.
