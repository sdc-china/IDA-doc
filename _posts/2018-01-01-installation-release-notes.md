---
title: "Release Notes"
category: installation
date: 2018-01-01 10:17:55
last_modified_at: 2024-08-13 13:35:00
---

# Release Notes
***

## 24.0.6 - 07/30/2024

### Enhancements
- Support CP4BA 24.0.0.
- Display all IDA time stamp using the same time zone of user browser.
- [Pipeline] Support to trigger the pipeline build at a specific time or within a time period.
- [Pipeline] Allow user to add approve/reject/resume pipeline comments.
- [Pipeline] Add Approved By/Rejected By/Resumed By info to pipeline build stage and step.
- [Comparison] Add new filter for merged artifacts.

### Bug Fixes
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

### Notes
- There are database changes from 24.0.5 to 24.0.6, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for [Migrating IDA Application](https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA browser Plug-in is updated to version 24.6, please make sure you have installed the latest plug-in.
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.
- IDA operator is updated to version 24.0.6.

### The checkstyle rules change details
[Added rules]
- checks/process/check-bpd-subprocess-error-not-fully-implemented
- checks/service/check-service-subprocess-error-not-fully-implemented


## 24.0.5.1 - 07/16/2024

### Bug Fixes
- [Testing] Disregarding conditional execution of Group Command causes an error that is not handled correctly.
- [Pipeline] Test cases with different CSV data row bindings are executed sequentially instead of in parallel, which degrades pipeline performance.
- [Pipeline] Post Scripts has been executed but the build status returned by rest API is still running.


## 24.0.5 - 06/27/2024

### Enhancements
- [Pipeline] Add build status in pipeline build print report.
- [Pipeline] Add datasetName and testCaseInfoId to pipeline REST API response.
- [Installation] Support importing LDAPS SSL certification for IDA Operator.
- [Administration] support LDAP user and local user login simultaneously.

### Bug Fixes
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

### Notes
- There are database changes from 24.0.4 to 24.0.5, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for [Migrating IDA Application](https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA browser Plug-in is updated to version 24.4, please make sure you have installed the latest plug-in.
- IDA operator is updated to version 24.0.2.


## 24.0.4 - 05/31/2024

### Enhancements
- [Comparison] Improve snapshot comparison report UI.
- [Pipeline] Display QUEUED status as NOT EXECUTED in pipeline build steps.
- [Testing] Adjust log level for test step execution of IF condition JS command.
- [Pipeline] Add doc link in the pipeline pending warning message.

### Bug Fixes
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

### Notes
- There are database changes from 24.0.3 to 24.0.4, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for [Migrating IDA Application](https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA browser Plug-in is updated to version 24.3, please make sure you have installed the latest plug-in.
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.
- We have upgraded to solve some security issues, which will cause problems with historical reports. Please regenerate them.



## 24.0.3 - 04/30/2024

### Enhancements
- [Comparison] Replace an artifact content with the one in a specific snapshot in Merge function.
- [Comparison] Filter snapshot comparison report by modifier name.
- [Comparison] Remind user an artifact is already added or deleted and the merge report is outdated in Merge function.
- [Comparison] Show the action type of each change in the history of changes on a single artifact in the snapshot comparison report.
- [Administration] Migrate database schema on IDA startup.
- [Administration] Support to use internal service url when containerized selenium grid deployment.

### Bug Fixes
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

### Notes
- There are database changes from 24.0.2 to 24.0.3, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for [Migrating IDA Application](https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA browser Plug-in is updated to version 24.2, please make sure you have installed the latest plug-in. 


## 24.0.2 - 03/27/2024

### Enhancements
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

### Bug Fixes
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

### Notes
- There are database changes from 24.0.1 to 24.0.2, please execute the corresponding migration scripts.
- IDA operator is updated to version 24.0.1.
- New documentation on [IDA operator and instance installation](https://github.com/sdc-china/ida-operator).
- New documentation on [IDA operator and instance migration from 23.0.3 to 24.0.1](https://github.com/sdc-china/ida-operator/blob/main/docs/Migrate%20IDA%20Operator.md). 


## 24.0.1 - 01/31/2024

### Enhancements
- Support BAW 23.0.2 on Prem and Container versions.
- [Testing] Able to select Task Name for FileNet P8 activities in runActivityByName command.
- [Checkstyle] Ignore the meaningless Javascript code style warning.
- [Checkstyle] Combine JS coding check symptoms.
- [Pipeline] Support approval on pipeline stage.

### Bug Fixes
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

### Notes
- There are database changes from 23.0.11 to 24.0.1, please execute the corresponding migration scripts.
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.
- IDA browser Plug-in is updated to version 24.1, please make sure you have installed the latest plug-in.
	

## 23.0.11 - 12/27/2023

### New Features
- [Testing,Pipeline] Support Business Applications on Cloud Pak for Business Automation.

### Enhancements
- [Testing] Generate case solution test template with required activities.
- [Comparison] Add hint message for added artifacts in snapshot merge report.
- [Administration] Should check if IDA data path is writable when starting IDA.
- [Installation] Support Java 11.

### Bug Fixes
- [Testing] Failed to run startManualActivity command in Workflow Server after offline deployment.
- [Testing] Failed to run AddActivity command in Workflow Server after offline deployment.
- [Testing] UTF8 string too large error during load test file generation.
- [Testing] WebPD plugin can't load test project due to CSP error.
- [Comparison] Fix Filter issues in snapshot compare and merge report.
- [Comparison] Invisible BO should not be updated independently in snapshot merge report.
- [Comparison] Toolkit dependencies should be added when adding an artifact in snapshot merge report.
- [Administration] Change Display Name to REST User Display Name on Add/Edit BAW Server.
- [Administration] Failed to clean test logs when it is forcibly cleaned up during test case run.

### Notes
- There are database changes from 23.0.8 to 23.0.11, please execute the corresponding migration scripts.
- IDA browser Plug-in is updated to version 23.7, please make sure you have installed the latest plug-in.


## 23.0.10 - 11/29/2023

### Enhancements
- [Comparison] Support add and revert artifacts in Merge function.
- [Checkstyle] Enhance the infinite loop rule to display loop details.
- [Administration] Enable disk cache auto clean on Settings page.
- [Administration] Adjust IDA data folder structure.
- [Administration] Long loading time blocks all Clean button on Clean Disk Cache page.
- [Installation] Use the same SSL certificate if IDA is run in multiple pods.

### Bug Fixes
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

### Notes
- IDA browser Plug-in is updated to version 23.6, please make sure you have installed the latest plug-in.
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.
- IDA operator is updated to version 23.0.3.


## 23.0.9 - 10/26/2023

### New Features
- Support IDA High Availability Topology

### Enhancements
- Support BAW 23.0.1 on Prem and Container versions.
- [Testing] Allow to specify the key for randomString and randomNumber commands.
- [Checkstyle] New Checkstyle rule for “Terminate” type end event.
- [Administration] Clean the disk cache based on file date.

### Bug Fixes
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

### Notes
- See new doc for IDA High Availability Topology configuration (<https://sdc-china.github.io/IDA-doc/references/references-high-availability-for-ida-application-on-was-and-ihs.html>, <https://sdc-china.github.io/IDA-doc/references/references-high-availability-for-ida-application-on-liberty-and-haproxy.html>).
- IDA browser Plug-in is updated to version 23.5, please make sure you have installed the latest plug-in.
- IDA operator is updated to version 23.0.1.


## 23.0.8 - 09/27/2023

### Enhancement
- [Testing] Support to run a discretionary activity in case solution.
- [Comparison] Delete and revert artifact in Merge function.
- [Administration] Auto configure performance test engine in settings page.

### Bug Fixes
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

### Notes
- There are database changes from 23.0.7 to 23.0.8, please execute the corresponding migration scripts.
- IDA browser Plug-in is updated to version 23.4, please make sure you have installed the latest plug-in.


## 23.0.7 - 08/30/2023

### Enhancement
- [Testing] Display flow diagram in case solution test project.
- [Checkstyle] Add track and snapshot acronym info to Checkstyle report.
- [Pipeline] User can view one page pipeline build report.
- [Pipeline] Using Snapshot Acronym to run pipeline overwrites the Tip checkbox in Checkstyle and Testing.
- [Pipeline] Support more flexible date format for the snapshot naming pattern.
- [Pipeline] The same installation Package from the same BAW sever is shared between different pipelines.

### Bug Fixes
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

### Notes
- There are database changes from 23.0.6 to 23.0.7, please execute the corresponding migration scripts.
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server. 


## 23.0.6.1 - 08/01/2023

### Bug Fixes
- [Checkstyle] Wrong check-delete-completed-task warnings in subprocess.


## 23.0.6 - 07/27/2023

### New Features
- [Testing] Support run test case on Edge on Selenium 4.

### Enhancement
- [Testing] A new command named runActivityByName replaces the original runFileNetP8ActivityByName.
- [Testing] Enhance project print report function.
- [Pipeline]Provide detailed information in pipeline REST API.

### Bug Fixes
- [Testing] It should not show load test error message in selenium test report.
- [Testing] When there are multiple scroll bars, the splicing of full-screen screenshots has repeated parts.
- [Testing] The dropdown button list style is different between project dashboard and project case page.
- [Testing] Enter key will bypass the verification and save the same test suite/case name.
- [Testing]Case project roles can not be loaded in Group command.
- [Pipeline] Fix DB2 deadlock issue.
- [Pipeline] Fix name of tip snapshot displayed on pipeline test report.
- [Comparison] The diff result is not right when insert an empty line in the end in merge editor.
- [Administration] Fix the Connected PS Server is missing when choose the Stage/Product type server.

### Notes
- There are database changes from 23.0.3 to 23.0.6, please execute the corresponding migration scripts.


## 23.0.5 - 06/29/2023

### Enhancement
- [Testing] Able to show test report summary print page for test project.
- [Checkstyle] Detect External Service calls within a Service Flow/BPD where the 'Catch specific errors' has no code in it.

### Bug Fixes
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


## 23.0.4 - 05/25/2023

### Enhancement
- Support CP4BA 22.0.2.
- [Checkstyle] Check too many nested client-side human services.
- [Checkstyle] Check too many coach views used in Coach UI.
- [Checkstyle] Adjust Checkstyle threshold.
- [Operations Tool] Load snapshots of all states including archived.

### Bug Fixes
- [Testing] Show sub process actual execution flow.
- [Pipeline] Manually delete pipeline build should also delete the releated pipeline logs/checkstylereport/screenshot.
- [Pipeline] Fix bind CSV file per server name will trigger the original bundled CSV file.
- [Comparison] Adjust the report start number to 0 for decision tables.
- [Operations Tool] Fix show warning in clean snapshot page if swagger ui doc is not available.
- [Operations Tool] Fix the snapshot that failed to be deleted is always in the archived folder.


## 23.0.3 - 04/27/2023

### Enhancement
- [Checkstyle] Ignore exposed service for unused service rules.
- [Checkstyle] Ignore empty and comment lines when calculate JavaScript code of lines.
- [Pipeline] Able to search old builds in the pipeline build side bar.
- [Pipeline] Configure and run pipeline builds in a separate thread pool from scheduled job thread pool.
- [Comparison] Support merge conditional script.

### Bug Fixes
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

### Notes
- There are database changes from 23.0.1 to 23.0.3, please execute the corresponding migration scripts.


## 23.0.2 - 03/30/2023

### Enhancement
- [Checkstyle] Add new checkstyle rules for all artifacts that need UI/Service/BPD Conversion.
- [Checkstyle] Ignore artifacts for checkstyle by tags and naming pattern.
- [Comparison] Support compare the changes in decision table.
- [Comparison] Support merge coach data change script.
- [Pipeline] Support Toolkit Deployment between Workflow Centers.

### Bug Fixes
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

### Notes
- IDA browser Plug-in is updated to version 23.3, please make sure you have installed the latest plug-in.
- There are changes for Checkstyle BOM and rules. If ODM Checkstyle engine is used, please deploy the latest Checkstyle rule project to Rule Execution Server. 


## 23.0.1 - 2/23/2023

### Enhancement
- [Testing] Adjusted usage of timeouts and add page load timeout in the Settings.
- [Testing] Support record and util scripts customization on both browser plugin and selenium grid server.
- [Testing] Support fire event in click command.
- [Testing] Support sub process for test case generation.
- [Checkstyle] Support embedded Checkstyle rules customization.
- [Administration] Update the BAW server type display name in BAW cofiguration page.
 
### Bug Fixes
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

### Notes
- There are database changes from 22.1.9 to 23.0.1, please execute the corresponding migration scripts.
- IDA browser Plug-in is updated to version 23.2, please make sure you have installed the latest plug-in.


## 22.1.9 - 12/30/2022

### Enhancement
- [Pipeline] Automatically clean old pipeline builds.
- [Comparison] Support to view comparison history reports.
- [Snapshot Merge] Add Snapshot Naming Pattern on Settings page for snapshot merge.
- [Administration] Move data path to general section on Settings page.
  
### Bug Fixes
- [Testing] Save Draft Button (Postpone) does not work in Recorder mode.
- [Testing] Case description column too short.
- [Testing] Duration of group command is not accurate.
- [Testing] Not able to run test case on test case details page.
- [Testing] Default Assignee should be blank when new test step is added.
- [Analyzer] The 8.x UI controls count number is not accurate in analyzer report.
- [Pipeline] Ignore Post Scripts when pipeline build is terminated.
- [Pipeline] View Case button is hidden when the selenium hub is not available in pipeline test report.
- [Administration] Test connection of BAW Server Configuration shows incorrect status and error message.

### Notes
- There are database changes from 22.1.8.1 to 22.1.9, please execute the corresponding migration scripts.
- IDA browser Plug-in is updated to version 22.6, please make sure you have installed the latest plug-in.


## 22.1.8.1 - 12/07/2022

### Bug Fixes
- [Testing] WaitTextPresent unstable in test project and pipeline.
- [Testing] Large number of Velocity log files.
- [Snapshot Merge] Not able to edit the script in Script Edit window.
- [Ops Tool] Missing snapshots in search results of Clean Snapshot.

### Notes
- IDA browser Plug-in is updated to version 22.5, please make sure you have installed the latest plug-in.

## 22.1.8 - 11/30/2022

### New Feature
- [Snapshot Merge v0.1] Merge updated Script section in Service Flow/Human Service/Process.
  
### Enhancement
- [Testing] Record test case with a different row in CSV file.
- [Testing] Empty test suite should be hidden while filtering test case.
- [Testing] Add case step duration to test case report.
- [Checkstyle] Support recheck symptom for ODM rules.
- [Search] Refactor Offline search folder structure.
- [Pipeline] Move the Pipeline module to a dropdown list in the top navigation.

### Bug Fixes
- [Testing] Full page screenshot caused RasterFormatException.
- [Testing] Extra case step recorded - don't not auto-enable recording on debug breakpoint.
- [Testing] WaitTextPresent retried too many times in Plugin mode.
- [Testing] Last run time and duration are not updated in test project dashboard.
- [Testing] Adjust the layout on test project dashboard.
- [Testing] Test case is not terminated until the step after group command steps.
- [Analyzer] The history date is different with the analysis report date.
- [Checkstyle, Analyzer, Search] Submenu in the top navigation cannot be selected when loading indicator is shown.
- [Checkstyle, Analyzer, Search] Foreign language characters in application do not show correctly in Checkstyle/Analyzer/Search reports.
- [Pipeline] Update dependency does not work on BAW22010.

### Notes
- There are database changes from 22.1.7 to 22.1.8, please execute the corresponding migration scripts.
- IDA browser Plug-in is updated to version 22.4, please make sure you have installed the latest plug-in.


## 22.1.7 - 10/28/2022

### New Feature
- [Testing] Support customized SSO page for different BAW servers.

### Enhancement
- [Testing] WaitXXX commands not consistent in failure.
- [Analyzer] Unused BO, Coach View, Service on process app level.
- [Analyzer] Add Ignore Toolkits Analysis options.
- [Analyzer] Able to differentiate between validation errors and warnings on Analyzer report.
- [Comparison] Refine control path on Comparison report.
- [Comparison, Search] Enable search and compare Coach/Coach View with configurable depth.
- [Search] Able to search control id on coach/coach view.
- [Ops Tool] Allow normal user to clean snapshots.

### Bug Fixes
- [Checkstyle] SQL Injection check failed.
- [Checkstyle] Recheck symptom does not work on WebPD.
- [Comparison] Snapshot comparison not working after reloading snapshots.
- [Pipeline] Adjust the Avg Duration css style in the pipeline dashboard.
- [Pipeline] Long stage name didn't display completely in the pipeline dashboard.
- [Pipeline] There is text overlapping in the Pipeline Group dashboard.
- [Pipeline] Throw exception when enabling pipeline group for subpipeline.

### Notes
- There are database changes from 22.1.3 to 22.1.7, please execute the corresponding migration scripts.
- IDA browser Plug-in is updated to version 22.3, please make sure you have installed the latest plug-in.


## 22.1.6 - 09/29/2022

### Enhancement
- [Testing] Able to filter test case based on expected execution flow.
- [Testing] Add validation when upload the CSV file.
- [Testing] Able to capture the entire screen in test report screenshots.
- [Analyzer] Highlighted unused toolkits in Toolkit Reference.
- [Analyzer] Add logs in analyzer report to indicate the error artifacts.
- [Checkstyle, Analyzer] Add performance logs in Checkstyle and Analyzer.
- [Checkstyle] Recheck each symptom in CHECK RESULT DETAILS when using Drules engine.
- [Checkstyle] Add threshold value in the Symptom for the too many check rules.
- [Pipeline] Adjust the width of pipeline summary board so that its style to the appropriate type.
- [Pipeline, Testing] Add direct link from the pipeline result page to the corresponding test project.
- [Search] Able to search with the filter.

### Bug Fixes
- [Testing] The style is broken when the CSV file name is too long.
- [Testing] Test case is failed, but the test report is in success status.
- [Testing] Throws error when import an old testing project.
- [Testing] Throws NullPointerException when the group commands contain custom commands.
- [Analyzer] The offline statistic in Analyzer is not working when switching to another page and then back.
- [Analyzer] The report history button often hide abnormally in Analyzer.
- [Analyzer] Throws NullPointerException when the environment variables contains empty value.
- [Checkstyle] Fix Checkstyle rule check-icon-settings-on-process-nodes.
- [Pipeline] Can not check snapshot installable in V8.5.7.
- [Pipeline] The build step exception trace is not shown.
- [Pipeline] Pipeline diagram failed to show when select some pipeline template.
- [Pipeline] Script service reports error but execute script successfully in the pipeline log.
- [Comparison] The added variables and its default value is not displayed.
- [Comparison] The input mappings is displayed wrong.
- [Plugin] Plugin affects Coach designer in Web PD

### Notes
- There are changes for Checkstyle ODM BOM. If ODM Checkstyle rule is used, please deploy the latest ODM rule project to Rule Execution Server.
- IDA browser Plug-in is updated to version 22.2, please make sure you have installed the latest plug-in.


## 22.1.5 - 08/30/2022

### New Features
- [Checkstyle] Detect potential SQL injection issue in Service and Process.

### Enhancement
- [Testing] Update the advanced options fields in create test project modal page.
- [Pipeline] Show pipeline step results in pipeline build report.
- [Comparison] Adjust the UI layout in Comparison.
- [Checkstyle] Update checkstyle migration tag rules.

### Bug Fixes
- [Testing] Show the unexpected error page when click on the custom command step which has been removed in test case history.
- [Checkstyle] Fix Checkstyle rules including check-stp-bpd, check-bpd-single-system-lane, check-bpd-event-exception-loop, check-bpd-event-end-contains-script, check-bpd-event-start-contains-script, check-service-unused-variables, check-sequential-activities-in-lane, check-service-item-sql-injection-in-script, check-service-with-too-many-inputvariables, check-service-event-end-contains-script, check-auto-tracking-enable.
- [Checkstyle] Checkstyle throws runtime exception when parsing empty attributes element using Drools engine.
- [Checkstyle] Ignore options are not working in checkstyle offline tab.	
- [Pipeline] Can't take new snapshot for toolkit.
- [Pipeline] Offline installation package export failure is not reported in pipeline build log.
- [Analyzer] Toolkit reference diagram is inaccurate.
- [Analyzer] Remove custom assignment from deprecated assignment list.
- [Analyzer] Filter out the internal system Business Objects.
- [Administration] Failed to update the BAW server configuration when the user name is duplicated.
- [Administration] Extra ending slash in BAW server configuration causes BAW server login failure.
- [Plugin] Fix checkstyle and snapshot comparison browser plugin page in 19003 Web Process Designer.
- [Plugin] Chrome browser plugin broken when recording in the version 104.0.5112.101.
- [IDA Toolkit] IDA Toolkit is not working for BAW v20.0.0.1.

### Notes
- There are changes for Checkstyle ODM BOM. If ODM Checkstyle rule is used, please deploy the latest ODM rule project to Rule Execution Server.
- IDA browser Plug-in is updated to version 22.1, please make sure you have installed the latest plug-in.
- For BAW 20.0.0.1, IDA toolkit is updated to version [IDA_Toolkit - 8.6.2.20001_TC.twx](https://sdc-china.github.io/IDA-doc/installation/installation-ida-installing.html#step-2-installing-ida-baw-toolkit).
- New document about [IDA Performance Test Report](https://sdc-china.github.io/IDA-doc/references/references-performance-test.html).


## 22.1.4 - 07/28/2022

### Enhancement
- [Testing] Show test suite name in the delete CVS file warning dialog.
- [Checkstyle] Optimize ODM checkstyle REST call performance.
- [Checkstyle] Support Checkstyle offline history.
- [Checkstyle] Update artifact description in Checkstyle report.
- [Analyzer] Support Analyzer offline history.
- [Search] Show notification message while creating search index file.
- [Search] Support searching more artifact types.
- [Administration] Optimize the Clean Disk Cache page load time.

### Bug Fixes
- [Testing] Can not auto discover Inline User Tasks when generating test cases for a process.
- [Testing] Fix parse problem for CSV file in UTF-8 format.
- [Checkstyle] Fix Checkstyle rules including check-service-unused-variables, check-service-item-not-implemented, check-service-item-save-context-checked, check-service-step-incorrectly-referenced.
- [Pipeline] Fix the Pipeline build summary page style.
- [Search] Special character is not supported in search keywords.
- [Search] Search on Tip snapshot is not working.

### Notes
- There are changes for Checkstyle ODM BOM. If ODM Checkstyle rule is used, please deploy the latest ODM rule project to Rule Execution Server.


## 22.1.3 - 06/30/2022

### New Features
- [Administration] Support Postgresql Database.
- [Search] Add new menu "Search", which allow user to search script content in BAW application.
- [Checkstyle] Add new menu "Checkstyle Rules Configuration", which allow user to enable/disable built-in Checkstyle rules.
- [Checkstyle] Able to view the Checkstyle/Analyzer history reports.
  
### Enhancement
- [Testing] Shows warning message if the user is trying to unbind a used CSV data file.
- [Checkstyle] Update the references information in Checkstyle report.
- [Admin Tool] Update migration instance tab of Admin Tool.
- [Administration] Add analyzer and search folder to Clean Disk Cache page.

### Bug Fixes
- [Testing] assertProcessInstanceStatus command does not work for STP process.
- [Checkstyle] The XSD generated from Checkstyle rules REST API contains ambiguity.
- [Checkstyle] Fix check-service-item-save-context-checked rule.
- [Snapshot Comparison] Failed to load Comparison snapshots after clean the Track selection.
- [Administration] Unable edit a selenium grid server if it's offline.
- [Admin Tool] Can't get the snapshot list in Workflow Server environment in Migration Instance page.

### Notes
- There are database changes from 22.1.1 to 22.1.3, please execute the corresponding migration scripts.
- IDA operator is updated to version 22.0.1, which supports Postgresql database.


## 22.1.2.1 - 06/06/2022

### Bug Fixes
- [Testing] Can't open context menu on disabled test step.

## 22.1.2 - 05/27/2022

### New Features
- [Pipeline] V2 Pipeline REST API, more detail can be found in doc <https://sdc-china.github.io/IDA-doc/references/references-apis.html>

### Enhancement
- [Testing] Add new command startExternalProcess which can start process in a different Process Application from any given test cases.
- [Testing] Show the detail pipeline name link in the Test delete warning message.
- [Testing] Able to view test case log when run it for the first time.
- [Snapshot Comparison] Add toolkit version diff result in the snapshot comparison report.
- [Checkstyle] Improve ODM checkstyle performance.
- [Checkstyle] Add more ODM rules relate to case solution.

### Bug Fixes
- [Testing] Failed to replay the conditional test step in group command.
- [Testing] The default value of custom command parameter can't be exported with test project.
- [Testing] unable load the input parameter of startProcess command.
- [Testing] Can't open a process test case if the user task in process contains double quote.
- [Testing] Failed to add finishTask command if the task name contains special characters.
- [Pipeline] User without any team can't view the pipeline tab.
- [Pipeline] Cannot specify Installation Package File Name when run offline install with deployFromLocalFileSystem.
- [Pipeline] Failed to migration instance if deploy the first snapshot in QA environment.
- [Checkstyle] The "Ignore JS Coding Check" option only ignore coding style related checkstyle rules.
- [Checkstyle] Failed to perform checkstyle if the RES is deployed in a different host.
- [Checkstyle] Fix problem checkstyle rules.
- [Checkstyle] Fix the deprecated reference link in Checkstyle report.

## 22.1.1 - 04/27/2022

### New Features
- [Testing] Support Selenium Hub 4.1.

### Enhancement
- [Testing] Add log details section to test case report. (Only available for the test report run against IDA v22.1.1 or after)
- [Testing] Show artifact name on delete test case/custom command/test data file/attachment confirmation page. 
- [Testing] Optimize the sidebar menu behaivor in the test case editor page.
- [Testing] The service flow which enabled the ajax call option can be invoked without IDA toolkit.
- [Checkstyle] Supports ODM server via https protocol with self-sign certification.
- [Pipeline] Add download link for pipeline logs.
- [Administrator] Support LDAP group filter.
- [Administrator] Show database version in IDA settings page.
- [Administrator] Optimize "Clean Snapshot" tab in Admin Tool page.
- [All] Adjust inconsistent labels and icons.

### Bug Fixes
- [Testing] Can't save custom js command.
- [Testing] Can not show the second bar content in BPD Coverage.
- [Testing] Nullpointer exception when generating diagram data.
- [Testing] The search box cannot be focused when the page in the modal is too long.
- [Testing] claimTask and finishTask choose wrong task.
- [Testing] Group command name should not be empty.
- [Testing] Failed to assert expected output with empty brace.
- [Testing] Can't click the delete icon beside the service name selection in case step edit form.
- [Pipeline] Pipeline build test step stuck in RUNNING status when test report saving throws DB exception.
- [Pipeline] When user stops pipeline build, build and step status should be TERMINATED not FAILED.
- [Administrator] Failed to login LDAP if the organization is changed from "IDA" to any other value.

### Notes
- There are database changes from 22.1.0 to 22.1.1, please execute the corresponding migration scripts.
- IDA browser Plug-in is updated to version 22.0, please make sure you have installed the latest plug-in.


## 22.1.0.2 - 04/01/2022

### Bug Fixes
- [Testing] Failed to execute Custom JavaScript command with JSON variable parameter
- [Testing] Failed pass csv json data if the first command is group command
- [Testing] The group command with JSON parameter is not escaped


## 22.1.0.1 - 03/28/2022

### Bug Fixes
- [Testing] 405 error when create group command


## 22.1.0 - 03/25/2022

### New Features
- Support CP4BA 21.0.3.
- [Testing] Enable or Disable a test step.

### Enhancement
- [Administrator] Modify the implementation of the clean snapshot function to support swagger API.
- Add refresh button to retrieve the latest process app in Checkstyle/Analyzer/Comparison/Admin Tool.

### Bug Fixes
- [Testing] Duplicated rows in test case after restoring to some versions because current test steps are not deleted.
- [Testing] Only the last 50 versions can be viewed in test case history.
- [Testing] Test report shows old, incorrect results when test case fails and is stopped in Selenium run mode.
- [Testing] Null error when the test case was run on an unavailable selenium grid.
- [Testing] The plugin shows execution timeout if the case step condition command was failed.
- [Testing] Unexpected error when restoring to a test case version with deleted CSV data file.
- [Testing] The display of index is wrong in editor when using group command in group case.
- [Testing] The report data is missing when using group command in group case.
- [Testing] Test Case using RunTaskByActivityName with round robin task owner failing in selenium mode execution.
- [Testing] Error in record mode when group command is the first step in a test case.
- [Testing] Test case description is not displayed well in test case info popup.
- [Checkstyle] Fix ODM checkstyle rule project due to missing libs.
- [Checkstyle] Offline checkstyle throws unexpected errors.
- [Pipeline] Offline install is not selectable when the first stage is configured with a process server.
- [Administrator] Not able to delete archived snapshots on PC.
- [Administrator] Can not clean old snapshot which is referenced by snapshots in PS.

### Notes
- There are database changes from 21.3.3 to 22.1.0, please execute the corresponding migration scripts.
- IDA browser Plug-in is updated to version 21.9, please make sure you have installed the latest plug-in.


## 22.0.0.1 - 02/21/2022

### Bug Fixes
- [Testing] Test Case using RunTaskByActivityName with round robin task owner failing in selenium mode execution
- [Checkstyle] Offline checkstyle throws unexpected errors


## 22.0.0 - 01/27/2022

### Enhancement
- [Administrator] Admin Tool support to delete toolkit snapshot in PS.

### Bug Fixes
- [Testing] Failed to restore test case history when it contains custom command with parameter.
- [Testing] The Passed and Failed statistic number is wrong when running with multi cvs data.
- [Testing] Hard to click the last item in the testing dashboard.
- [Testing] No default output returned when using the finishTask command.


## 21.3.4.1 - 01/14/2022

### Bug Fixes
- [Testing] Can’t support UTF-8 format CSV file created from windows OS.
- [Testing] Passing wrong parameter value to group command if the group command is used more than one time in the test case.
- [Testing] The test report is wrong if a test case uses the same group command more than one time.
- [Pipeline] The branch id in the pipeline log is not the runtime branch id when using Snapshot Acronym.


## 21.3.4 - 12/30/2021

### Enhancement
- [Analyzer] Enhance Analyze report for BAW on Container.
- [Testing] CSV test data support JSON format.
- [Testing] Support selenium grid deployment on Kubernetes v1.22 (OCP v4.9).

### Bug Fixes
- [IDA] Upgrade Log4j2 to 2.17.0 for resolving potential security issue.
- [Testing] Test Case Diff feature is broken when the comments is empty.
- [Testing] Refresh Process App button on Import Project dialog is not working.
- [Testing] The testing attachment upload warning should not be undefined.
- [Testing] Not able to replay the tab drop down menu using selenium.
- [Testing] Select window does not work on Workplace page on CP4BA.
- [Checkstyle] Fix checkstyle report.

### Notes
- IDA browser Plug-in is updated to version 21.8, please make sure you have installed the latest plug-in.
- New document on [Coverage](https://sdc-china.github.io/IDA-doc/test/test-case-report.html#coverage).
- Format Installation document (<https://sdc-china.github.io/IDA-doc/installation/installation-ida-repacking.html>, <https://sdc-china.github.io/IDA-doc/installation/installation-ida-installing.html>).


## 21.3.3 - 11/26/2021

### Enhancement
- [Testing] Create new Java Command - GetProcessInstanceData.
- [Case Solution Checkstyle] Add Javascript check rules for Custom Widget.
- [Case Solution Checkstyle] Support fetching the latest case project Page modification when Tip is selected.
- [Analyzer] Add validation errors statistic when choosing Tip.   
- [Pipeline] Able to migration of instances from old snapshot to the latest one in deployment pipeline.

### Bug Fixes
- [Testing] loginWorkplace command not work in WFPS.
- [Testing] When Selenium run completes, it should not refresh the Test Case edit page if it's not the same test case.
- [Checkstyle] The output link artifacts label in summary tree is not correct.
- [Case Solution Checkstyle] The checkstyle summary total number and the warning numbers in report are not consistent.
- [Case Solution Checkstyle] Fix JavaScript code style rules.
- [Case Solution Checkstyle] Separate Content Object from BO in Checkstyle report.
- [Case Solution Checkstyle] The save execution context is not editable but checkstyle report it.
- [Pipeline] Wrong form in Deployment step.

### Notes
- There are database changes from 21.3.2 to 21.3.3, please execute the corresponding migration scripts.
- New document on [test case data dynamic loading](https://sdc-china.github.io/IDA-doc/test/test-case-data-dynamic.html).


## 21.3.2 - 10/28/2021

### New Features
Support WfPS.

### Enhancement
- [Testing] Create new Java Command - wait the process instance status to be changed until timeout.
- [Testing] Extend the length of case step comment to 512 characters and enhance comments display.
- [Testing] Add warning info to the Clean Old Snapshots checkbox in pipeline deployment step.
- [Checkstyle] Case Solution Checkstyle v0.3.
    - Add Javascript check rules for Script Adapters.
    - Report details enhancements and bug fixes.

### Bug Fixes
- [Testing] Debug command throws parsing exception when variable value contains quote.
- [Testing] Special character display issues in Comment field of Edit Test Case Step modal.
- [Testing] Null exception during load test when old load test data record date is null.
- [Testing] Provide warning before load test when recorded load test data is incorrect.
- [Testing] The load test case failed if the command contains parameters.
- [Testing] User can't choose load test button in test case edit mode.
- [Checkstyle] "Missing 'use strict' statement" warning should not be shown in the checkstyle report.
- [Analyzer] The statistic number is not match with the number of the table items.
- [Analyzer] The BAW On Container Migration Statistic Labels style is broken.
- [Pipeline] Pipeline can be saved when QA stage server is empty.
- [Comparison] Snapshot comparison reports items added/deleted when it is just renamed.
- [Administrator] Clean snapshot in Admin Tool can not load toolkit snapshots in process server.
- [Administrator] All checkboxes on the page disappear after deleting a baw server.

### Notes
- There are database changes from 21.3.1 to 21.3.2, please execute the corresponding migration scripts.


## 21.3.1 - 09/30/2021

### New Features
- [Analyzer] List deprecated BAW artifacts for BAW Container version.
 
### Enhancement
- [Testing] Support to run multiple test cases load test in project dashboard page.
- [Testing] Notify user to record network info if it is outdated for Load Testing.
- [Testing] Modified the implementation of logging in to BAW portal.
- [Checkstyle] Case Solution Checkstyle v0.2.
    - Enhance ARTIFACT SUMMARY and CHECK RESULT DETAILS report.
    - Add Empty Documentation rules.
- [Pipeline] Support environment variable in script step of pipeline.
- [Pipeline] Able to clean old snapshots that without any running instance in deployment pipeline.
- [Pipeline] Support to update dependency for Toolkit.

### Bug Fixes
- [Testing] The command debug does not print logs when execute in IDA Recorder mode.
- [Testing] Update wordings on Load Test Strategy popup window.
- [Testing] Load test failed when network is recorded using Chrome.
- [Testing] Assertion error message is not shown correctly in IDA browser Plug-in.
- [Testing] Service command params include csv empty variable has binding issue.
- [Pipeline] Post Script doesn't work.
- [Pipeline] SSH command with path of the script does not exist, but the pipeline runs successfully.
- [Pipeline] NullPointerException occurred when change the stage name.
- [Pipeline] NullPointerException occurred when run test case with CSV data.
- [Pipeline] Valid parameter BUILD_ID or PIPELINE_ID, but the pipeline runs failure.
- [Pipeline] ${BUILD_REPORT_URL} is not resolved in pipeline script.
- [Pipeline] Wrong character encoding after saving script.
- [Pipeline] Failed to install snapshot the first time.
- [Comparison] The reported change does not exist.
- [Administrator] The UMS secret does not encoded in Settings table.
- [Administrator] Using profile avatar cause the project dashboard load slow.

### Notes
- There are database changes from 21.3.0 to 21.3.1, please execute the corresponding migration scripts.
- We found an issue using jdk 8 with TLSv1.3, which can cause very high CPU usage of IDA. To fix the issue, use TLSv1.2. For more information, please refer to <https://sdc-china.github.io/IDA-doc/installation/installation-ida-installing.html#installing-on-liberty>.


## 21.3.0 - 08/26/2021

### New Features
[Checkstyle] Case Solution Checkstyle v0.1 includes rules for checking required artifacts and unused artifacts.

### Enhancement
- [Testing] Support Workplace in CP4BA.
- [Testing] Support search project by description.
- [Testing] The projects are sorted in descending order by date.
- [Testing] Add checkbox to enable/disable BPM OOTB requests in load test strategy.
- [Testing] Add parameter to enable/disable postscript in project configuration.
- [Testing] Add test step index on Load Test report.
- [Testing] Support execute wasadmin script file.
- [Checkstyle] Ignore the system toolkits when checking the nested toolkits.
- [Checkstyle] Ignore the service Deployment Service Flow/IDA Utility check.
- [Pipeline] Support parameters when executing wasadmin script file.
- [Pipeline] Support synchronize Environment Variables/EPVs/Team Bindings in Deployment step.

### Bug Fixes
- [Testing] The runFileNetP8ActivityByName command need re-login in recorder.
- [Testing] The last character gets deleted when download the csv file in test case.
- [Testing] The case locked in a different session in load test.
- [Testing] Switch user is wrong in load test.
- [Testing] Conflicting XSRF token in load test.
- [Testing] Switch server for portal case is not working for some request in load test.
- [Testing] Fail test case when gatling scripts exits abnormal in load test.
- [Testing] Y Axis number is wrong in load test Active User diagram.
- [Testing] Run result query fails when json path includes '[' and '.'.
- [Checkstyle] The snapshot name is empty in the report when checking tip project.
- [Pipeline] The URI is too long to import pipeline.
- [Comparison] Fix ignore comparison when change name includes number.

### Notes
- IDA browser Plug-in is updated to version 21.7, please make sure you have installed the latest plug-in.
- There are database changes from 21.2.0 to 21.3.0, please execute the corresponding migration scripts.


## 21.2.2 - 07/29/2021

### Enhancement
- [Testing] Set the load testing log level in run load test modal.
- [Testing] Support BAW 21.0.2.
- [Testing] Users can configure the threshold to measure whether the load test passes.
- [Testing] Support Ajax command in load test.

### Bug Fixes
- [Testing] Optimized several checkstyle rules about infinite loop detection.
- [Testing] Switch BPM server from PC to PS cause error in load test.
- [Testing] Coach name is missing in load test report.

### Notes
- IDA browser Plug-in is updated to version 21.6, please make sure you have installed the latest plug-in.

## 21.2.1 - 06/30/2021

### Enhancement
- [Testing] Enhance Load Test v0.2.
    - Enhance and integrate Load Test report on Case Detail page.
    - Stabilize and optimize Load Test recording and execution. 
- [Testing] When you run the case on the case dashboard page, IDA will use each line of test data in the CSV file to run the test case.

### Bug Fixes
- [Testing] Duplicate single select options are loaded when editing a case step.
- [Testing] For checkboxes, there is no need to provide single select options.
- [Testing] No CSV data is loaded in case step editing form after binding a CSV file.
- [Testing] Data set name from CSV file was shown twice in the test report.
- [Testing] The function of adding a favourite project does not work.
- [Testing] Wrong Selenium Grid Server is used when run test case with CSV data.
- [Testing] Can not edit group command in case detail page.
- [Testing] No service flow data is loaded when editing case step.
- [Testing] Remove bpm server info updates on Project List page.
- [Testing] Can't choose the CSV data row when run case from case detail page.
- [Plug-in] IDA recorder can not load test steps in Chrome V80.

### Notes
- Short demo for [Load Test v0.2](https://video.ibm.com/recorded/130211251)
- IDA browser Plug-in is updated to version 21.5, please make sure you have installed the latest plug-in.


## 21.2.0 - 05/28/2021

### New Features
- [Testing] Load Testing v0.1. See doc:<https://sdc-china.github.io/IDA-doc/test/test-run-load-test.html>

### Enhancements
- [Testing] Support Cloud Pak for Business Automation v21.0.1.

### Bug Fixes
- [Testing] Space is missing for case step with IF Command.
- [Comparison] Can’t view comparison report.

### Notes
- IDA browser plugin is updated to version 21.3, please make sure you have installed the latest plugin.
- There are database changes from 21.1.1 to 21.2.0, please execute the corresponding migration scripts.


## 21.1.1 - 04/29/2021

### New Features
Support BAW 20.0.0.2 Container version.

### Enhancements
- [Plugin] Add Testing feature to WebPD.
- [Testing] Add ‘show changes only’ checkbox in version diff page.
- [Comparison] Add diagram comparison for Process/Service.
- [Testing] Add ability to configure a drop down list with possible values for input parameter of JavaScript and Java custom commands.
- [Testing] Add comments for test case history.
- [Testing] Show the custom command log trace to test case report.

### Bug Fixes
- [Testing] Command stuck in pending state or timeout error in plugin.
- [Plugin] Disable Login button when IDA plugin checks IDA url for user login info.
- [Testing] Can’t import test project from BPM Testing Asset.
- [Testing] User can record the same test cases in different browsers at the same time.
- [General] IDA web access is blocked due to too many websocket connection.
- [Testing] Can’t get the expected output of service flow on BPMoC due to wrong assignee.

### Notes
- IDA browser plugin is updated to version 21.1.1, please make sure you have installed the latest plugin.


## 21.1.0 - 3/26/2021

### New Features
Support BAW 20.0.0.2 Traditional version.

### Enhancements
- [Pipeline] Export/import existing pipeline.
- [Pipeline] As a user, I want to know the detail information of the ssh command failed.
- [Admin] Add avatar to the place where the user name is used.
- [Pipeline] Allow low version to high version deployment.
- [Testing] Enhance get instance id by native search api.
- [Admin] Error message should be more friendly when config wrong ssh configuration on bpm configuration form.
- [Testing] Add doc link for each testing Command.
- [Admin] Add password field to SMTP configuration.

### Bug Fixes
- [Testing] Cannot view test case screenshot if user open the test from the left side menu.
- [Plugin] Improve plugin web socket connection retry function.
- [Pipeline] Fix script service error.
- [Testing] Create a new command ClickActivityFromPortal to start activities from portal menu.
- [Plugin] Cannot record new step on one test case on firefox.
- [Testing] The button to run test case with the selected testing data is not working.
- [Testing] Click command does not work on instance detail page.
- [Testing] Cannot record upload file in case type if not use debug command in Firefox.
- [Testing] As a user, I want appropriate information to know that my operation fails because of Unauthorized REST API response.

### Notes
- IDA browser plugin is updated to version 21.1.0.1, please make sure you have installed the latest plugin.
- There are database changes from 21.0.0 to 21.1.0, please execute the corresponding migration scripts.
- For Chrome browser, IDA Plugin 21.0.0+ works on Liberty 20.0.0.3+. For the plugin to work on WAS V9+, a CookieSameSite property needs to be set. Please refer to [IDA doc](https://sdc-china.github.io/IDA-doc/installation/installation-ida-installing.html#installing-on-was-v9).
- For BAW 20.0.0.2, IDA toolkit is updated to version 8.6.2.0_TC, please update the toolkit dependency with the latest version in the process app, and re-install the IDA Utility service. Doc: <https://sdc-china.github.io/IDA-doc/references/references-migrating-and-updating-your-application.html>. For BAW version below 20.0.0.1, please still use IDA toolkit version 1.5.


## 21.0.0 - 1/28/2021

### New Features
- [Pipeline] Support case solution Online/Offline deployment for BAW 20..
- [Admin] Support dynamic capacity of containerized selenium node.

### Enhancements
- [Plugin] Protect the REST url by basic authentication that used by IDA plugin. **(Updating server.xml is required)**
- [Testing] Add search field to filter testing cases.
- [Testing] Allow user to pull left side bar in testing project.
- [Testing] When there is no permission to upload attachment file in Test project, show warning message to inform user.
- [Testing] Stop at the file upload command automatically in record mode.
- [Pipeline] Prepend test case name for test case running log inside pipeline.
- [Pipeline] Support running scripts including mulitple lines and variables inside pipeline script step on linux.
- [Analyzer] Re-design data folder in Analyzer to support container.
- [Admin] Allow user to turn on/off notification popup on plugin.
- [Admin] Redesign K8s Panel on Settings page.
- [Admin] Enhance operator to support configmap to store sql scripts.
- [Admin] Remove plugin notification to case generator and modifier self.
- [Admin] Re-design user profile UI.
- [Admin] Allow user to upload an image as his profile image.
- [Admin] Re-design notification settings UI.

### Bug Fixes
- [Testing] Fixed that BPM File Uploader control on UI Toolkit(4.4.5 EE) can not run on selenium hub.
- [Testing] Fixed that can't rename test case with high network latency.
- [Testing] Fixed that can't binding data csv for test case.
- [Testing] Fixed that the test case list table is not refreshed when delete a test case on project dashboard page.
- [Testing] Fixed that the status of test cases on project dashbaord can not be changed automatically.
- [Testing] Fixed that the case manager testing case can not be stoped in OCP environment.
- [Pipeline] Fixed that can't do PC to PC deployment on BPM 8.5.7.
- [Pipeline] Check Ignore Toolkits by default.
- [Admin] Fixed that turn off notification for IDA plug-in on profile page do not work.
- [Admin] Fixed that including comment symbol "//" inside customOOTB will block the command.

### Notes
- IDA browser plugin is updated to version 21.0.0, please make sure you have installed the latest plugin. 
- There are database changes from 3.3.0 to 21.0.0, please execute the corresponding migration scripts.
- We have improved the security check for IDA plugin. The configuration  ```<httpSession cookieSameSite="None"/>``` must be added to server.xml in Open Liberty profile, otherwise the IDA plugin can't work. For the full example of server.xml, please refer to <https://sdc-china.github.io/IDA-doc/installation/installation-ida-installing.html>.


## 3.3.0 - 12/30/2020

### New Features
- [Case] IDA could generate a statistical analysis report for case manager project.
- [Testing] IDA supports add a group command as one step of other group command.

### Enhancements
- [Performance] Improve IDA performance when execute checkstyle.
- [Performance] Improve the project dashboard and test case editor page performance.
- [Checkstyle] Detect the infinite loops at human service/service flow/BPD level.
- [Checkstyle] Improve the checking nested toolkits rules performance.
- [Checkstyle] Add toolkits ignore option to Checkstyle and pipeline.
- [Testing] Add case activity properties to the testing report.
- [Administrator] Enable SSH configurations for BAW server.
- [Plugin] Auto login web if plugin is logged in.

### Bug Fixes
- [Checkstyle] Fix IDA can not upload big twx files when run checkstyle.
- [Pipeline] Fix the BPM user is changed after pipeline run.
- [Pipeline] Fix IDA can not fetch the latest toolkit in an update dependency step.
- [Pipeline] Fix user can not view test case report after pipeline run.
- [Testing] Fix IDA throws CASE related exception when run a testing case.
- [Testing] Fix IDA can not bind csv data when execute the getting service expected value.
- [Testing] Fix IDA report stack overflow when using BPM v8.5.6.
- [Administrator] Fix IDA report NullPointerException when edit a standalone grid.
- [Case] Fix user can not open Case Object Store usage page.
- [Testing] Fix the position of popup message.
- [Analyzer] Fix toolkit reference report height issue.
- [Checkstyle] Fix the number of warning message is inconsistent with checkstyle report.


## 3.2.0 - 11/26/2020

### New Features
- [Checkstyle] Discover new rules for BAW v20.x.
    - Avoid using live connect in java scripts. (BAW on container)
    - Detect mixing usage of Coach Views written with different JavaScript libraries

### Enhancements
- [Administrator] User could enable/disable BPM Test Coverage feature on the setting page.
- [Pipeline] User could save a pipeline as a template, so he could use it to create a new pipeline quickly.
- [Plugin] Enhance plugin notification when importing a project.
- [Testing] User could add task name to the dropdown when using runTaskByActivityName command.
- [Testing] Add a refresh button under the "Expected Value" to the startRestApi command.
- [Testing] Update test case solution application report page style.
- [Testing] Show global error message if running test cases hit unexpected error.

### Bug Fixes
- [Administrator] Fix selenium grid node replicas number could be a negative number.
- [Administrator] Fix "Server Status Check Interval" on setting page does not work.
- [Checkstyle] Fix the checkstyle page style if there are error after running checkstyle.
- [Pipeline] Fix user could delete a selenium grid server that is used by the current pipeline.
- [Plugin] Fix deleting commands on IDA recorder has no effect when connected server is down.
- [Plugin] Fix the error message style on the IDA recorder.
- [Testing] Fix clicking add a case with no response after uploading a test data file.
- [Testing] Fix cannot show custom java command parameter if it only has one parameter.
- [Testing] Fix the step assignee doesn't match with the user value in the step parameter.
- [Testing] Fix the notification position on the html.

### Notes
- IDA browser plugin is updated to version 1.52, please make sure you have installed the latest plugin. 
- There are database changes from v3.1.0 to v3.2.0, please execute the corresponding migration scripts.



## 3.1.0 - 10/30/2020

### New Features
- Support BAW v20.X.
- IDA Operator v1.0.
- Support containerized Selenium grid.

### Enhancements
- [Testing] Support to run test cases with binding csv file in parallel model.
- [Testing] Support Inline User Task in runTask command.
- [Testing] Constraints of case type in addCase command.
- [Testing] The task name list can be changed when selecting the activity name in runTask command.
- [Administrator] Add "Test Connection" to Case Object Store.
- [Administrator] Remove Rule Server URL and Rule server port field from setting page.

### Bug Fixes
- [Pipeline] Fixed try to find a wrong log4j log file when run pipeline.
- [Plugin] Fixed edit command on IDA recorder throws exception in logs.
- [Plugin] Fixed IDA plugin allow user login with an invalid server url.
- [Plugin] Fixed can't connect IDA plugin to another server.
- [Testing] Fixed can't create User Interface Test suite.
- [Testing] Fixed Group Command with condition does not work when condition returns FALSE.
- [Testing] Fixed case scenario running hung when there's DB insertion error.
- [Testing] Fixed bold Select & UnSelect in checkbox command.
- [Testing] Fixed context root not found page will appear when check log.
- [Testing] Fixed users can create many duplicated projects by multi clicking on "Create" button.
- [Testing] Fixed synchronize a test project error when the snapshot was archived.
- [Testing] Fixed assertCoachControl does not work if comparing to decimal value with ",".
- [Testing] Fixed see error when multiple click on checkstyle button of test project.
- [Administrator] Fixed can't open settings page because of the wrong settings version.
- [Administrator] Fixed can't configure window size on the Selenium grid for Firefox.
- [Administrator] Fixed the k8s token is invalid if saved the settings page twice.
- [Administrator] Fixed wrong error message when input wrong password.

### Notes
- IDA browser plugin is updated to version 1.51, please make sure you have installed the latest plugin.By click the IDA browser plugin icon, you will see an IDA login window for the Plugin. You must login IDA in plugin before use it. The plugin can only support one IDA server at one time. You have to re-login IDA in plugin if you want to switch to different IDA server.  
- IDA toolkit is updated to version 1.5, please update the toolkit dependency with the latest version in the process app, and re-install the IDA Utility service. Doc: <https://sdc-china.github.io/IDA-doc/references/references-migrating-and-updating-your-application.html>

## 3.0.0 - 09/30/2020

### New Features
- [Plugin] Support to notify message from IDA in plugin.
- [Testing] Support to test Case Solution Application.
- [Administrator] Support the integration of Selenium grid management and Openshift.

### Enhancements
- [Plugin] Support to perform checkstyle and Comparision on WebPD for V19.0.0.3.
- [Plugin] Support to perform analyzer on WebPD.
- [Plugin] Redesign plugin option page.
- [Plugin] Display warning message in plugin if IDA server is not available.
- [Testing] Add CaseType to Artifact Type for case generation.
- [Comparison] Change "Code Review" as top menu and rename as "Comparison".
- [Pipeline] The "PC to PC" pipeline deployment can be done by BAW REST API instead of SSH.
- [Administrator] Configure Object Stores to BPM server configuration.
- [Administrator] Redesign "Add BPM Server" form.
- [Administrator] Support JNDI name datasource.
- [Administrator] Simplify IDA properties and move most of them to Settings page.

### Bug Fixes
- [Testing] Fixed the issue of all buttons were missing when clicking Run button in case edit page.
- [Comparison] Fixed the issue of loading - indicator was not hidden after getting changes while running snapshot comparison.

### Notes
- There are database changes from v2.7.1 to v3.0.0, please execute the corresponding migration scripts.
- IDA browser plugin is updated to version 1.49, please make sure you have installed the latest plugin. By click the IDA browser plugin icon, you will see an IDA login window for the Plugin. You must login IDA in plugin before use it. The plugin can only support one IDA server at one time. You have to re-login IDA in plugin if you want to switch to different IDA server. 
- The ida.properties is updated, most of the settings in the ida.properties need to be reconfigured by the menu "Administration -> Settings".
- Migration Doc: <https://sdc-china.github.io/IDA-doc/references/references-migrate-ida-from-v2.7.3-to-v3.0.0.html>

## 2.7.3.3 - 08/26/2020

### Bug Fixes
- [Testing] Fix IDA can not import old project. (<https://github.ibm.com/sdc/keter-roadmap/issues/2540>)
- [Testing] Fix IDA reports JdbcSQLException: Referential integrity constraint violation error when delete project. (<https://github.ibm.com/sdc/keter-roadmap/issues/2541>)
- [Testing] Fix can not click the checkbox 'byTaskOwner' in runTaskByActivityName command. (<https://github.ibm.com/sdc/keter-roadmap/issues/2543>)
- [Pipeline] Fix failed to set the snapshot as default when deploy snapshot on BAW v19002. (<https://github.ibm.com/sdc/keter-roadmap/issues/2548>)


## 2.7.3.2 - 08/12/2020

### Change
- [Administrator] [Support Oracle Database 19c](https://github.ibm.com/sdc/keter-roadmap/issues/2545)


## 2.7.3.1 - 08/04/2020

### Bug Fixes
- [Testing] Fix that IF command can not be copied when copy a test case.
- [Testing] Fix that IDA plugin add a not used IF command when edit a case step. 
- [Testing] Fix that stopping test case process will never be complete.
- [Testing] Fix that BPM UI Select Control can not be replayed when all parameters changed except controlID.
- [Testing] Fix that Task Name options miss of BPM.runTaskByActivityName when group BPM.runTaskByActivityName command.
- [Testing] Fix that can not login BAW19003 when bpm user password contains "&".


## 2.7.3 - 07/29/2020

### Changes
- [Testing] Update asset command error message.
- [Testing] Filter out System Toolkit UI interface when generating test cases.
- [Testing] Show the error message when there is no access permission in BPMoC.
- [Checkstyle] Enhance STP-like process checkstyle rule as per product feature.
- [Checkstyle] Update the log when using ODM engine.
- [Snapshot Comparison] Display more user-friendly error message on Snapshot Comparison page.
- [Document] Add document about supporting WAS 8.5.5.x.
- [Document] Add document about user management for LDAP integration.

### Bug Fixes
- [Home] Change 'show more' to 'Show More'.
- [Testing] Fix spelling mistakes in the options of startRestApi command.
- [Testing] Fix spelling mistakes in the startExposedHeritageHumanService command.
- [Testing] Fix startRestApi command if it returns huge data.
- [Testing] Fix BPM UI Decimal CV lost value when playing back the saved scripts.
- [Testing] Fix repeated case steps when editing case steps in plugin.
- [Testing] Fix startAjaxService command that could not pass on BPMoC.
- [Testing] Fix can not generate expected output when editing test command.
- [Testing] Fix record collapsible panel open/close in BPM UI Toolkit issue.
- [Plugin] Fix execution custom java command timeout error in plugin recorder.
- [Analyzer] Fix missing relations of analysis report for toolkit.
- [Administrator] Fix the issue of unable to connect to BPMoC due to SSL exception.
- [Administrator] Fix BPM Usage Page layout issue.

### Notes
- IDA browser plugin is updated to version 1.48, please make sure you have installed the latest plugin.

## 2.7.2 - 06/24/2020

### Changes
- [Plugin] Show full index of case step on plugin.
- [Plugin] Show compatibility message on plugin if users need to update plugin.
- [Testing] User can add an IF Command to a common case step.
- [Testing] Add detailed message to assertion command.
- [Testing] Do not allow user to add parameters of IDA post script on creating form.
- [Administrator] Use yaml configuration file to maintain the IDA version.
- [Administrator] Move 'Migrate instance' to Action column.
- [Administrator] Show action icons if user hover the table row. 

### Bug Fixes
- [Snapshot Comparison] Fix snapshot order when compare multiple branches.
- [Snapshot Comparison] Fix the throw exception issue when getting changes of first snapshot.
- [Testing] Fix test case report statistic information that was not accurate. 
- [Testing] Fix diagram tooltip that was missed when a test case bound csv file.
- [Pipeline] Fix popup inexplicit error message when deleting a pipeline sometimes.
- [Pipeline] Fix can-not-add sub pipeline issue when editing a group pipeline without sub pipeline.
- [Checkstyle] Remove useless dsr file. 

### Notes
- IDA browser plugin is updated to version 1.47, please make sure you have installed the latest plugin.


## 2.7.1 - 05/27/2020

### Changes
- [Testing] The assertion command can be used as IF Command.
- [Testing] Allow user to specify the name of Hiring Sample.
- [Testing] Show meaningful error message if the target snapshot is not activate.
- [Testing] cleaning all cookies when switch user in test case.
- [Snapshot Comparison] Allow developer to compare 2 snapshots from different tracks.
- [Pipeline] Add snapshot naming patterns "yyyyMMddHHmmss" and "yyyyMMddHHmmss_MAJOR.MINOR.PATCH".
- [Pipeline] Able to encrypt ODM server password in IDA.properties
- [Administrator] Rename "Supporting Tool" to "Admin Tool" and move it to the administrator menu.
- [Administrator] As a IDA Administrator I want to find all BPM Users given userId and test connection for an individual or multiple users.

### Bug Fixes
- [Testing] Fix the group test case doesn't work.
- [Testing] Fix that deleting or changing the name of custom command parameter does not update existing JS code.
- [Testing] Fix the ida_post_script template can not be generated automatically.
- [Testing] Fix the duplicated command parameters when user add/edit case step in test case.
- [Testing] Fix the statistic number if there are group commands in case report.
- [Testing] Fix the IF Command configuration is not copied with the group command.
- [Plugin] Fix the second conditional group command in test case does not work in IDA Chrome Plugin.
- [Snapshot Compare] Fix the line separator in linux is different from that in window.
- [Pipeline] Fix that "Trigger by new snapshot" not working for toolkit.
- [Pipeline] Can not generate pipeline report if the test case enabled smart comparison.
- [Pipeline] Fix checkstyle error in using ODM rules.
- [Administrator] Fix the Oracle SQLs.

### Notes
- IDA browser plugin is updated to version 1.46, please make sure you have installed the latest plugin. 
- There are database changes from v2.7.0 to v2.7.1, please execute the corresponding migration scripts.

## 2.7.0.2 - 05/21/2020

### Changes
- [Pipeline] Add snapshot naming pattern.

### Bug Fixes
- [Testing] Fix that the group test case always failure.
- [Testing] Fix duplicate form widgets.
- [Testing] Fix that the IF command failed if a test case has more than one test steps with same group command.
- [Pipeline] Fix that the "Trigger by new snapshot" not working for old rest API.
- [Pipeline] Fix NullpoinerException when generate the pipeline report.

### Notes
- IDA browser plugin is updated to version 1.45, please make sure you have installed the latest plugin. 

## 2.7.0.1 - 04/30/2020

### Bug Fixes
- [Testing] Fix modifying custom command parameters drops command's code. 


## 2.7.0 - 04/29/2020

### New Features
- [Testing] As a test case developer I can enable conditional group command capability. Doc: <https://sdc-china.github.io/IDA-doc/test/test-group-command-management.html>
- [Testing] Support BAW 19003.
- [Lab - Supporting tool] Enable user to remove useless snapshots on BPM servers.

### Changes
- [Testing] Allow user to select rows of binded test data when run test cases. Doc: <https://sdc-china.github.io/IDA-doc/test/test-case-data-binding.html>
- [Testing/Pipeline] Unify notification message page.
- [Testing] Unify the custom command edit page layout.
- [Testing] Add readable message when plugin blocks by the self-sign certification.
- [Testing] Show last modification user and time in a line on project card.
- [Lab - Snapshot Comparison] Enhance user experience when compare snapshots
- [Pipeline] Do not allow user to add a deployment step to deploy a toolkit.
- [Pipeline] Add readable message in testing result when screenshots have been cleaned in **Clean Disk** during smart comparison.
- [Administrator] Unify expected exception and warning page.

### Bug Fixes
- [Testing] Fix that diagram disappear after changing server. 
- [Testing] Fix that test case failed to assert date time picker with the saved ${saveDate} when using IE
- [Testing] Fix that test case fail to assert table with row and column when IE
- [Testing] Fix that waitTextPresent doesn't work in IE.
- [Testing] Fix that Kolban event button doesn't work in IE.
- [Testing] Fix that sub process item icon is wrong on diagram.
- [Testing] Fix that date value can't pass into service flow in BAW.
- [Testing] Fix that Browser console error for javascript:void(0) code.
- [Testing] Fix that failed to generate case diagram on BAW 19003.
- [Testing] Fix that Coach toolkit select can not work.
- [Testing] Fix that the report style broken when a test case refer two same group commands.
- [Testing] Fix that changing Project's BPM server results in exception.
- [Testing] Fix that expected image is shown when fails because of the other reasons but not smart comparison.
- [Checkstyle] Fix offline checkstyle exception.
- [Checkstyle] Remove undefined symptom and best practice in checkstyle report.
- [Checkstyle/Analyze/Supporting] Fix that team entitlement broken after searching in-flight instances.
- [Pipeline] Fix that can not get snapshot of pipeline form.
- [Pipeline] Fix test case report table style.
- [Pipeline] Fix NullpoinerException if the pipeline doesn't contain any stages.
- [Administrator] Fix that custom command doesn't work If the parameter name endwith space.
- [Administrator] Fix that invalid User password errors are not handled gracefully.

### Notes
- IDA browser plugin is updated to version 1.43, please make sure you have installed the latest plugin. 
- There are database changes from v2.6.4 to v2.7.0, please execute the corresponding migration scripts.
- The IDA toolkit is updated to version 1.4, please update the toolkit dependency with the latest version in the process app, and re-install the IDA Utility service. Doc: <https://sdc-china.github.io/IDA-doc/references/references-migrating-and-updating-your-application.html>


## 2.6.4 - 03/25/2020

### New Features
- [Testing] As a user, I want to create a group test case so that I test multiple test cases by sequence.
- [Pipeline] Support toolkit in pipeline.
- [Pipeline] add new step "Update Dependency" in pipeline which can update the toolkit dependency to the latest version.

### Changes
- [Testing] Update login command to support BAW v19003.
- [Testing] As a user, I want to choose a task from subprocess when edit test case, so that I can test subprocess easier.
- [Testing] As a user, I want to use a custom JS command in Custom Recorder script, so that I can auto record and replay an unsupported UI control. 
- [Testing] Able to check custom Javascript Syntax error.
- [Pipeline] Update log level for check permission of pipeline.

### Bug Fixes
- [Testing] Fix BP3 Combo Box fails in IE grid.
- [Testing] Fix search programmatically in Multiple select of Select2 can not work in IE11.
- [Testing] Apex Checkbox/Toggle does not record in Chrome.
- [Testing] Fix the label is missing when exporting the test case.
- [Testing] Fix copy of test case which has a custom command from another project copies the command into current project.
- [Testing] Fix can't find the app testbyxf in Process App drop list.
- [Testing] Fix can not generate CSHS test cases. 
- [Testing] Fix can not generate test case if there are two process referred with each other.
- [Testing] Fix error on test project dashboard.
- [Testing] Fix run task url doesn't work in 19003.
- [Testing] Fix duplicated label name.
- [Testing] Fix the test project name is overlap with the project description. 
- [Pipeline] Fix can not use ${PIPELINE_ID} in pipeline post script and error script.
- [Pipeline] Fix that if user checks the tip checkbox on Test step under Proecss Server stage, test cases will failed.
- [Administrator] Fix that the select all checkbox in user management table is not corrent.
- [Administrator] Fix the overlapped checkboxs in empty Custom Command table.
- [Analyzer] Fix that the toolkit Reference Report is always empty.

### Notes
- IDA browser plugin is updated to version 1.41, please make sure you have installed the latest plugin. 
- There are database changes from v2.6.3 to v2.6.4, please execute the corresponding migration scripts.

## 2.6.3 - 02/26/2020

### New Features
- [Testing] Admin can extend OOTB Javascript command.

### Changes
- [Testing] Auto add label when user type space/enter key or Done button.
- [Testing] Lock case editor table by session.
- [Testing] Improve save/edit test project performance. 
- [Testing] Improve generate test case performance. 
- [Pipeline] Remove inactive snapshot from the options of snapshot in pipeline stage. 
- [Administrator] Admin can view the usage of a BPM server.
- [Administrator] Support LDAP ou filter.

### Bug Fixes
- [Testing] Fix test Dashboard layout.
- [Testing] Fix the length of column exception_trace in test_step_info table is too short.
- [BP3] Fix that BP3 Date Time Picker not working on playback.
- [Checkstyle] Fix IDA auto logout when I click the checkstyle report in a checkstyle pipeline.
- [Checkstyle] FIx that the twx folder in data folder can not be created automatically.
- [Pipeline] Fix that trigger pipeline periodically blocks 'delete pipeline'.
- [Pipeline] FIx pipeline status cannot be updated dynamically in pipeline list page.
- [Pipeline] Fix the second stage in pipeline IDA can not find Test server.
- [Pipeline] Fix that the pipeline template can't work.
- [Pipeline] Fix can not click the link in Post Scripts in pipeline editing page.
- [Pipeline] Fix the pipeline test report layout.

### Notes
- There are database changes from v2.6.2.3 to v2.6.3, please execute the corresponding migration scripts.


## v2.6.2.3 - 01/24/2020
### Bug Fixes

- [Testing] Open command does not work if the argument contains a variable.
- [Testing] Fix server permission is broken.

### Notes
- There are database changes from v2.6.2 to v2.6.2.3, please execute the corresponding migration scripts.

## v2.6.2.2 - 01/21/2020

### Bug Fixes
- [Testing] Open command does not work if the argument contains a variable.


## v2.6.2.1 - 01/20/2020

### Bug Fixes
- [Administration] Fixed setting the default value of max size file in ida.properties.

## v2.6.2 - 01/17/2020

### New Features
- [Testing] User can move or copy test case between test suites.

### Changes
- [Testing] Asset command failure does NOT stop test case execution by default, and user can change the behavior in Settings page. 
- [Testing] As a test case developer I need to asset that a UI control is present on the page and has value WITH OUT caring what the value is.
- [Testing] Enhance validation logic when restore test case.
- [Testing] Enhance test case history comparison.
- [Pipeline] Able to deploy process app on Process Center environment.
- [Home] group the activities by test suite name.
- [Labs] Update snapshot comparison report style.
- [Labs] Remove monitor menu.
- [System] Upgrade to Spring Boot 2.2.2

### Bug Fixes
- [Testing] Fix the variable key not found issue.
- [Testing] Fix the sample test project.
- [Coachv8] Fix v8 Select CV when selected option has trailing spaces does not work in Chrome Grid.
- [Coachv8] Fix Checkbox is not recorded correctly on v8 Coaches toolkit.
- [Coachv8] Fix v8 record select box records duplicated test steps.
- [Apex] Fix BPM Document Upload CV in Apex toolkit v 1.4.F.
- [Administration] Fix layout issue.

### Notes
- There are database changes from v2.6.1 to v2.6.2, please execute the corresponding migration scripts.


## v2.6.1 - 12/18/2019

### New Features
- [Testing] User can restore a test case content from history.
- [Testing] User can diff test case history.
- [Testing] User can view csv file content.
- [Pipeline] Support auto triggering a pipeline when creating a new named snapshot.

### Changes
- [Testing] User can view context parameter from report.
- [Testing] User could decide only generate one test case if there are more than 50 test case flow.
- [Pipeline] User could exclude selenium hubs from pipeline test step.
- [Checkstyle] Show progress when uploading a large file.
- [Administration] Add Administration/Settings page for user to update some of IDA properties value.

### Bug Fixes
- [Testing] Fix assertTableContent does not work on bpm v8 table.
- [Testing] Fix can not replay bpm v8 decimal widget.
- [Testing] Fix can not replay text and multiline coach views in Apex (ACV2) toolkit v 1.4.F in IDA plug-in.
- [Testing] Fix popup message when user fail to login IDA.
- [Testing] Fix assertSelect command does not work on Select 2 kolban toolkit.
- [Testing] Fix can not record Select 2 widget of kolban toolkit.
- [Testing] Fix can not replay kolban tk event button.
- [Testing] Fix style of edit custom command page.
- [Testing] Fix diagram flow is different from BPM webPD.
- [Testing] Fix the verbalization of selecting a row of table is not correct.
- [Testing] Fix the verbalization of coachControl command.
- [Testing] Fix IDA skips the next command if previous wait command failed.
- [Testing] Fix fileupload command issue.
- [Pipeline] Fix button can not click on pipeline test report page.
- [Pipeline] Fix pipeline build status is wrong if offline deployment step failed.
- [CodeReview] Fix report button does not work.

### Notes
- IDA browser plugin is updated to version 1.39, please make sure you have installed the latest plugin. 
- There are database changes from v2.6.0 to v2.6.1, please execute the corresponding migration scripts.


## v2.6.0 - 11/21/2019

## New Features
- [Testing] Add label management to Test case and use it in pipeline as a filter for test cases selection.
- [Analyzer] Add Toolkit reference to analyzer.

## Changes
- [Testing] Able to export the image assertions for test project.
- [Testing] Do not need to reload entire process app if someone change the code in Process Center.
- [Testing] Able to assert system task's status by the command "assetTaskStatus".
- [IDA Toolkit] Support IDA Toolkit for BPM v8.5.7.
- [IDA Toolkit] Empty teamworks datasource for execute SQL query.
- [Pipeline] Add pipeline activities to Recent activities list Pipeline.
- [Plugin] Able to debug the test case in read only mode.
- [Plugin] Able to run post script in plugin.

### Bug Fixes
- [Testing] Can not select the toolkit's processes in the dropdown list when using start process command.
- [Testing] All BPM task related commands, like assignTask, assertTaskStatus should take a timeout value.
- [Testing] Import project into different IDA env missing assignee in the case step.
- [Testing] Clicking the delete button on the casestep edit modal will cause an error.
- [Testing] Timeout issue for selenium grid when we use timer delay for the task.
- [Testing] Select of invalid option on Apex Select control fails with wrong error message.
- [Testing] Test step description is wrong if it includes html tag in parameter.
- [Testing] JSON parser parameter issue in serviceflow/ajax testing
- [Testing] Unable to record the action that modal pops up after clicking the button on dashboard.
- [Testing] Project reports are mixed with pipeline reports.
- [Analyzer] Analyzer dropzone can not work
- [Checkstyle] Checkstyle offline can not work.
- [Pipeline] Take snapshot is failed for group pipeline with snapshot step.
- [Pipeline] Wrong statistic logic in group pipeline.
- [Pipeline] Pipeline step status not updated.
- [Administration] Some LDAP users can not login IDA.


## v2.5.0.5 - 11/08/2019

### Changes
- [Testing] - Enable users to pass a ${variableName} as JSON input for non string values.

### Bug Fixes
- [Pipeline - Rest API] - Fix the Testing Rest-API shows a wrong status and doesn't show the list of screenshots.
- [Pipeline - Dashboard] - Fix null pointer issue when the pipeline does not match with its build.
- [Pipeline - Deployment] - Fix the pipeline deployment failed, but the snapshot does install in PS.
- [Code Review] - Fix empty comparison report in code review.
- [Pipeline - Deployment] - Fix if a process app has never been deployed by IDA, the deployment step will fail unless it is done manually.
- [Pipeline - Dashboard] - Fix pipeline steps average duration.
- [Pipeline - Group] - Fix the checkbox in sub pipeline auto checked when it belongs to team and another group pipeline.
- [Pipeline] - Fix the PipelineAdmin and Deployer users can not exclude test cases.

### Know Limitation
- "Main" track is mandatory to do deployment by pipeline.


## v2.5.0.4 - 11/06/2019

### Bug Fixes
- [Test] - Fix user can't open test case which referenced a JS command in another project


## v2.5.0.3 - 10/29/2019

### Bug Fixes
- [Test] - Fix user cannot run BPM.runTaskByActivityName command.
- [Pipeline] - Fix admin user cannot run deployment pipeline.


## v2.5.0.2 - 10/28/2019

### Bug Fixes
- [Checkstyle] - Fix DSAR related rule execution issue.
- [Administration] - Fix null pointer issue in Clean Disk Cache tab.

### Changes
- [Pipeline] - Provide enhanced REST API response to testing pipeline status query by including detailed evidence of the test case executions.
- [Security] - Refine the advanced permission functionalities by introducing more roles like RobotAdmin, SSHKeyConfig and PipelineAdmin.

## v2.5.0.1 - 10/25/2019

### Bug Fixes
- [Test] - Testing service fails on JSON arguments.
- [Test] - Add a service to IDA toolkit for reassignment of users.

## v2.5.0 - 10/23/2019

### New Features
- [Analyzer] - Add new menu Analyzer which can generate the statistic report for process app.

### Changes
- [Test] - User can enable post script by creating a custom Javascript command named "ida_post_script", then user toggle the post script on case editor page.
- [Test] - User can configure the retryTimes and retryInterval for a test project.
- [Test] - Support XML input to test service.
- [Test] - assertSelect use label variable in the description instead of the ControlID.
- [Test] - Add new JS API bta.util.putContexts which can set multiple key-value pairs into context.
- [Test] - The runTask command can locate the actual "Assignee" by display name in BPM server configuration.
- [Test] - user could upload different CSV file, so that he could reuse same test project on different server.
- [Checkstyle] - Remove checkstyle dsar file from the release package.
- [Pipeline] - User can deploy multiple process apps in one batch by creating a pipeline which including the other sub pipeline.

### Bug Fixes
- [Test - Coach v7.5.x] - Fix the test case recorded in Firefox fails to be replayed in the grid.
- [Test - Coach v7.5.x] - Fix Datetime picker can not replay in plugin.
- [Test - Coach v7.5.x] - Fix input text can not replay in plugin.
- [Test - Apex] - Fix assertTable Content for Apex Table control.
- [Test - Apex] - Fix assertTable rows for Apex Table control.
- [Test - Apex] - Fix assertSelect does not work for Apex toolkit.
- [Test - Apex] - Fix assertOutputText does not work for Apex toolkit.
- [Test - Apex] - Fix select all rows in table can not work APEX.
- [Test - Apex] - Fix dateTime picker control for Apex toolkit.
- [Test - Apex] - Fix rich Text Editor is not recorded Apex.
- [Test - Apex] - Fix decimal/Integer control for Apex toolkit.
- [Test - Apex] - Fix radiobox selection for APEX toolkit.
- [Test - Apex] - Fix currency CV does not record correctly for Apex toolkit.
- [Test - Apex] - Fix table sorting does not recorded in firefox.
- [Checkstyle] - Fix null pointer exception in checkstyle.
- [Pipeline] - Check package file before export the installation package in Pipeline Deployment step.
- [Pipeline] - Fix the status of deployment step doesn't change to complete in IDA even the app have been deployed successfully.
- [Pipeline] - Fix admin user doesn't have permission of the builds which belong to a private pipeline of other users.
- [Pipeline] - Fix pipeline can not deploy issue.
- [Pipeline] - Fix spell issue in pipeline dashboard.
- [Pipeline] - Fix the average build duration chart of pipeline dashboard is not correct on Firefox.
- [Pipeline] - Fix the ratio is wrong in deployment by servers chart of pipeline dashboard.
- [Administration] - Fix DB2 schema error.
- [Plugin] - Fix the plugin doesn't work properly in chrome v77+.

### Notes
- IDA browser plugin is updated to version 1.37, please make sure you have installed the latest plugin. 
- There are database changes from v2.4.2 to v2.5.0, please execute the corresponding migration scripts.

## v2.4.2.1.1 - 10/09/2019

### Bug Fixes
- [Test] - Fix assertOutputText command issue for APEX toolkit
- [Test] - Fix assertSelect command issue for ApEX toolkit


## v2.4.2.1 - 09/30/2019

### Bug Fixes
- [Test] - Fix APEX date time picker control recording and replay issue
- [Test] - Fix APEX richText control recording issue
- [Test] - Fix APEX currency control recording and replay issue
- [Test] - Fix APEX decimal,Integer control recording and replay issue
- [Test] - Fix APEX table control sort recording issue
- [Test] - Fix APEX verbalization for select all checkbox in table 

## v2.4.2 - 09/25/2019

### Changes

- [Test] - Update the verbalization of checkbox command.
- [Test] - Change queuing status icon.
- [Checkstyle] - Ignore toolkit content parsing.
- [Pipeline] - New pipeline dashboard.
- [Pipeline] - Add pipeline diagram in build detail page.
- [Pipeline] - Add an option to directly deploy the installation package from file system of remote BPM server.
- [Pipeline] - Change public URL of the REST API to adapt to BAW.
- [Pipeline] - Add more details in the response of Pipeline Query REST API.
- [Pipeline] - Add configuration for offline installation folder path.
- [Pipeline] - Add Open API site for the pipeline REST APIs.
- [Administration] - Support Oracle Database.
- [Administration] - Support LDAP.
- [Administration] - Add role assigning permission to config manager in advance permission.
- [Plugin] - Support Popup window.
- [Plugin] - Don't allow user to click controls if recording is not ready.
- [Documentation] - Add descriptions regarding JVM settings of the IDA server.


### Bug Fixes

- [Test] - Fix The runTaskByActivityName and runTaskByDisplayName command can't get the actual task list of current instance.
- [Test] - Fix failed step in group command does not stop execution of the test case.
- [Test] - Fix onblur event handler function triggering issue.
- [Test] - Fix cannot delete steps in custom command issue.
- [Test] - Fix empty comments in recording window issue.
- [Test] - Fix execution trace order issue.
- [Test] - Fix can't edit test case name and description issue.
- [Test] - Fix can't edit the info parameter of selectWindow command.
- [Pipeline] - Fix pipeline report if it contains a test project with empty test case.
- [Pipeline] - Fix wrong pipeline status by email.
- [Pipeline] - Fix can't delete pipeline issue.
- [Pipeline] - Fix errors when offline install by tracks other than Main.
- [Pipeline] - Fix non-stop pipeline builds.
- [Administration] - Fix can't edit BPM server configuration when the server is not available.
- [Common] - Fix error page layout issue.

### Notes

- IDA browser plugin is updated to version 1.36, please make sure you have installed the latest plugin. 
- There are database changes from v2.4.1 to v2.4.2, please execute the corresponding migration scripts.

## v2.4.1 - 08/28/2019

### Changes

- [Test] - Able to clone a test case.
- [Test] - Able to copy a group command.
- [Test] - Add success or failure case steps number for each test case report.
- [Test] - Add type ahead search on Generate Test Cases pages.
- [Test] - Improve case editor page performance.
- [Test] - Change the screenshot path from absolute path to relative path.
- [Pipeline] - Improve pipeline dashboard page look and feel.
- [Pipeline] - remove the password of wsadmin show up in plain text in the pipeline log.
- [Administration] - Able "Clean Disk Cache" menu.
- [Plugin] - Add disable break points button in IDA browser plugin.
- [Plugin] - Add disable record button in IDA browser plugin.

### Bug Fixes

- [Test] - Fix duplicated synchronized confirm dialog. 
- [Test] - Fix can't retrieve service flow expected output.
- [Test] - Fix test case version icon disappear issue.
- [Checkstyle] - Fix checkstyle print page style.
- [Pipeline] - Fix the pipeline report can not fetch expected image if enable smart compare.
- [Pipeline] - Fix can't see checkstyle report if it's exceed the Health Score/Warning Threshold.
- [Pipeline] - Fix run pipeline and test case simultaneously issue.
- [Administration] - Remove redundant file "${ctx" in project.
- [Administration] - Fix 'human_task_data' column length.
- [Administration] - Fix the context path can't change issue.
- [Administration] - Fix can't upload custom Java command.

### Notes

- IDA browser plugin is updated to version 1.35, please make sure you have installed the latest plugin. 
- There are database changes from v2.4.0 to v2.4.1, please execute the corresponding migration scripts.


## v2.4.0 - 08/07/2019

### New Features

- Users could assert test result by smart comparision.

### Changes

- Add JS category to checkstyle report.
- User can choose a pipeline template in pipeline edit page.
- Enhance pipeline build report and editing page style.
- Apply new theme for IDA Doc.
- Add edit project button on lest side menu.
- Add checking rules for WebPD migration.
- Support use task owner in BPM.runTaskByDisplayName and BPM.runTaskByActivityName.
- Upgrade selenium to v3.141.59.
- Support checkstyle on BAW v19.0.0.1.
- Improve the test case editor page loading time.


### Bug Fixes

- Fix checkstyle and code review plugin don't work in WebPD(need to upgrade IDA browser plugin).
- Fix assertSelect command don't work for BP3 combo widget.
- Fix statistic report isn't updated after running a test case.
- Fix assertOutputText command don't work on BAW v19.0.0.1.
- Fix some BP3 buttons can't be replay with chrome hub. 
- Fix the validation logic of pipeline name and project name.

### Notes
- IDA browser plugin is updated to version 1.33, please make sure you have installed the latest plugin. 
- There are database changes from v2.3.2 to v2.4.0, please execute the corresponding migration scripts.


## v2.3.2 - 07/10/2019
### Changes
- Be able to choose selenium hub on the project datashboard page.
- Add checkstyle rules for WebPD migration.
- Support selenium grid headless mode.
- Add all migrate sql files in release pack.
- Move pipeline 'build now' button to top.
- Support BP3 rich textarea and table pagination buttons.

### Bug Fixes
- Fix Chrome without admin permission will popup alert window.
- Fix exception case can not work for system service.
- Fix the report error after running a empty project in pipeline
- Fix the same process app will appear twice in the Process APP list when using a user role to log in.
- Fix the same Process app can not be assigned to two different teams.
- Fix it can't generate test report when running a testing bound with multiple selenium grid servers in pipeline.
- Fix it can't open project list page if remove the user from default team error.
- Fix the replay does not work correctly if there are some controls with same label value.
- Fix the synchronize button in project list page doesn't work.
- Fix the export project button doesn't work in DB2 environment.
- Fix the pipeline build always pass even the logs shows error.
- Fix the radio box record issue.

### Notes
- There are database changes from v2.3.1 to v2.3.2, please execute the corresponding migration scripts.

## v2.3.1 - 06/19/2019
### Changes
- Allow user to enable/disable the test case history feature by updating the ida.properties. 
- Compress test case history content in database.
- Update tab name in checkstyle page.
- Display last modifier in test project list page. 
- Enhance project dashboard usability.
- Update IDA package version in Manifest file. 
- Add settings table to maintain version in database.
- Support BPM UI slider recording.
- Update button verblization from "click {{value}}" to "click {{value|type}}".

### Bug Fixes
- Fix the issue that import old test project issue.
- Fix the issue that unable to click the delete button in pages under administration tab.
- Fix BP3 toolkit recording issues, includes delete button in table, row selection button in table and buttons in table.
- Fix Coach v8 toolkit recording issues, includes delete button in table and row selection button in table.
- Fix BPMUI toolkit recording issues, includes row selection button in table, checkbox in table, multiple select in table.

### Notes
- There are database changes from v2.3.0 to v2.3.1, please execute the corresponding migration scripts in migrate-mysql.sql file if you upgrade IDA from v2.3.0.

## v2.3.0 - 06/05/2019
### New Features
- User can view the change history of a test case. A version number will be displayed beside the test case name on case editor page. 

### Changes
- User can configure his owned BPM user account information.
- Auto scroll to the widget position when replay on recorder plugin.
- Remove screenshoot icon in test report if there is no screenshot.
- Improve the button visibility on project dashboard and user management page.
- Optimize the Selenium grid max session number setting. 

### Bug Fixes
- Fix the issue that MultiSelect, Checkbox, Yes_No_radio button and radio group button can not record on coach v8.
- Fix the issue that the "assetTableContent" and "saveCoachControl" commands not work in coach v8.
- Fix the issue that BP3 record button doesn't show button label value.
- Fix the issue that can't replay BP3 and coach date time picker.
- Fix the issue that the sendkey command doesn't work properly when run in selenium hub.
- Fix the issue that duplicated test cases are generated.
- Fix the issue that the loading indicator was not popup when click the run button in project dashboard.
- Fix the issue that package.bat doesn't work if the folder path contains '~'.
- Fix the issue that the code review never stops "spinning".

### Notes
- IDA browser plugin is updated to version 1.32, please make sure you have installed the latest plugin. 
- There are database changes from v2.2.4 to v2.3.0, please execute the corresponding migration scripts in migrate-mysql.sql file if you upgrade IDA from v2.2.4.


## v2.2.4 - 05/15/2019
### Changes
- User could specify a default BPM User to be used in all commands for the use case.
- Add process coverage report on project dashboard page.
- Monitor project BPM and Selenium Grid servers availability on project dashboard page.
- Auto unlock a locked test case editor.
- Optimize the logger configuration to make the logs more readable.
- Able to set the log level to trace.
- Auto set Selenium Grid max session number.
- User don't need to set the offline installation package folder in the pipeline any more. It will use the IDA "data/installationpackages" folder instead of.

### Bug Fixes
- Fix the issue that can't open some of the test case from old release.
- Fix the issue that duplicated selenium hub shown in test case editor page.
- Fix the issue that the test case execution status was wrong if the case uses group command.

### Notes
- There are database changes from v2.2.3 to v2.2.4, please execute the corresponding migration scripts in migrate-mysql.sql file if you upgrade IDA from v2.2.3.


## v2.2.3 - 04/24/2019
### Changes
- User can set the max session number of selenium grid server. The test cases will be run concurrently according to the max session number. If the running test case number exceed the max session number, then system will put them into Queue.
- Support BAW v18.0.0.2.
- Add team information in user profile page.
- User can find reference of custom command.
- Adjust the case editor right click menu sequence.
- Clean inactive test projects.
- Support CSV multiple row data and multiple browsers in pipeline test.

### Bug Fixes
- Fix the issue that the test case status was wrong when the selenium grid is not available.
- Fix the issue that a private test project can not select a custom command from a team project.
- Fix the issue that error page in project dashboard page.
- Fix the issue that can't delete a favorite pipeline.

### Notes
- There are database changes from v2.2.2 to v2.2.3, please execute the corresponding migration scripts in migrate-mysql.sql file if you upgrade IDA from v2.2.2.


## v2.2.2 - 04/03/2019
### Changes
- User can search test project by name and add favorite test project.
- User can search pipeline by name and add favorite pipeline.
- User can select one row by clicking anywhere in a line of case editor table.
- User can do multiple select on the case editor table by using keys shift and ctrl.
- Enable right click menu on the case editor table.
- Set the case editor table to readonly when other user is editing or running the test case.
- Updated the Home page. 
- Removed the project tab in user profile page which is out-of-date.

### Bug Fixes
- Fix the issue that the user name validation logic has problem.
- Fix the issue that the the test can't bypass insecure SSL certification on IE.
- Fix the issue that the test window was closed when replay on IE.
- Fix the issue that can't create a utility stage in pipeline.
- Fix the issue that can't import custom JavaScript command parameter.
- Fix the issue that the default Browser project config is lost, after executing use case in Other browser Grid.
- Fix the issue that the save custom JavaScript command button doesn't work.
- Fix the issue that duplicated execution traces were shown on test report page.
- Fix the issue that the test case status is wrong when user stop a test case manually.
- Fix the issue that browser plugin doesn't work when Firefox enabled "allow_scripts_to_close_windows" setting.

### Notes
- IDA browser plugin is updated to version 1.31, please make sure you have installed the latest plugin. 
- There are database changes from v2.2.1 to v2.2.2, please execute the corresponding migration scripts in migrate-mysql.sql file if you upgrade IDA from v2.2.1.


## v2.2.1 - 03/13/2019
### Changes
- User can copy/cut/paste test steps in test case editor.
- User can add post script in pipeline.
- Admin can change the logger level on runtime by the menu "Custom Logger Level".
- Admin can active/inactive a user account.
- Admin can create a team which can access all process apps and selenium grid resources.
- Admin can test the connection of BPM server and selenium grid.
- Removed the scope property form custom command. User can view all custom commands from the same team.
- Update pipeline validation logic, a pipeline can only add a test project belongs to the same team.
- Highlight the custom command parameter in case step editor window.
- Remove the trace icon from test report if there in no any log available.

### Bug Fixes
- Fix the issue that can't remove group command parameter.
- Fix the issue that the select command doesn't work properly in IDA recorder plugin.
- Fix the issue that the execution trace step order in test report is wrong.

### Notes
- IDA browser plugin is updated to version 1.30, please make sure you have installed the latest plugin. 
- There are database changes from v2.2.0 to v2.2.1, please execute the corresponding migration scripts in migrate-mysql.sql file if you upgrade IDA from v2.2.0.

## v2.2.0 - 02/27/2019

### New Features
- Enhance the permission control feature. 

    - We defined two built-in Roles, which are "User" and "Admin".
    - As an admin, he can access Testing, Checkstyle, Pipeline, Labs, User Management, BPM configuration, Selenium Grid Configuration, Team Configuration, Custom Recorder and Custom Java Command menus.
    - As a user, he can access Testing, Checkstyle, Pipeline and Labs menus.
    
- Introduce the Team feature. 
	
    - As an admin, he can create a team and assign user/process app/selenium grid to a team. 
    - As a user, he can only see the process app and selenium grid belongs to his team.
    - As an admin, he can view all test projects and pipelines.
    - As a user, he can set the visibility of a test project or pipeline. If the visibility is set to a Team, then all the team members can view the test project or pipeline.

### Changes
- User can't open shared custom command in editor if the project is accessible by the user.
- User can easily distinguish between shared command and command created in current project.
- Optimize recorder plugin.

### Bug Fixes
- Fix the issue that can't start adhoc subprocess.
- Fix the issue that can't rename custom command.
- Fix the issue that the import test project feature doesn't work properly.
- Fix the issue that the assetTableContent doesn't work for responsive coach toolkit.
- Fix the issue that the "Printable Report" button disappear in pipeline checkstyle report.

### Notes
- IDA browser plugin is updated to version 1.29, please make sure you have installed the latest plugin. 
- There are database changes from v2.1.1 to v2.2.0, please execute the corresponding migration scripts in migrate-mysql.sql file if you upgrade IDA from v2.1.1.

## v2.1.1 - 01/30/2019

### Changes
- Update the test case editor page style.
- Add notification on project dashboard page if the process application don't have IDA toolkit linked.
- Add validation logic when delete a test project.
- Add validation logic for test step in pipeline.
- Add validation logic for duplicated custom command name.
- Rename command startSqlQuery to executeSQL.
- Add retry interval in global configuration file. You can find the new property "engineConfig.retryInterval" in the ida.properties file.
- Add take screenshot option when create a custom JavaScript command.

### Bug Fixes
- Fix the issue that the synchronize button is miss on view case detail page.
- Fix the issue that the test case flow is disappeared after click synchronize button.
- Fix the issue that can't see exception trace in the failed test step.
- Fix the issue that the test case shows random test case flow if the process contains sub process.
- Fix the issue that can't open checkstyle print page.

### Notes
- IDA browser plugin is updated to version 1.28, please make sure you have installed the latest plugin. 
- There are database changes from v2.1.0 to v2.1.1, please execute the corresponding migration scripts in migrate-mysql.sql file if you upgrade IDA from v2.1.0.

## v2.1.0 - 01/16/2019

### New Features
- Support Custom Java Command.
- Redesign the administration configuration page UI.
- Add synchronize button for test project, so that user can synchronize the latest process app info to the test project.
- Support run pipeline by a named snapshot.
- Able to set the TWX file path when do offline deployment in pipeline.

### Changes
- User can set the sharing scope of a custom command. Public scope means the command can be used in all test project. Private scope means the command can only be used in the current test project.
- Add validation that user can't create test project on a process app without any named snapshot.
- Update test report to indicate the test cases were executed on tip or not.
- Update the label "Branch" to "Track", so that it align with naming in Process Center.
- Auto update the parameter definition script in custom JavaScript command.
- Optimize command verbalization.
- Update command description.
- Test command could get the "Assignee" value from group command.

### Bug Fixes
- Fix the issue that the dateString command does not work with negative date offset.
- Fix the issue that the snapshot step failed due to duplicated snapshot name.
- Fix the issue that import test project doesn't work in some case.
- Fix the issue that can't load output template when use finishTask command.
- Fix the issue that got exception when press "enter" on create custom command popup dialog.
- Fix the issue that the test case detailed execution report is missing in pipeline REST API.
- Fix the issue that the pipeline test trend diagram is gone.
- Fix the issue that adding a comment to custom command breaks it.
- Fix the issue that the index of group command was wrong in test report.
- Fix the issue that startSQLQuery command failed when expectRow is empty.
- Fix the issue that shared custom JavaScript command doesn't work on plugin.

### Notes
- IDA browser plugin is updated to version 1.27, please make sure you have installed the latest plugin. 
- There are database changes from v2.0.1 to v2.1.0, please execute the corresponding migration scripts in migrate-mysql.sql file if you upgrade IDA from v2.0.1.


## v2.0.1.1 - 12/27/2018

### Bug Fixes
- Fix the issue that startSqlQuery command reports assertion error when ExpectedRows is empty.


## v2.0.1 - 12/19/2018

### Changes
- IDA browser plugin upgraded to version 1.25. More details please refer to <https://sdc-china.github.io/IDA-doc/installation/installlation-post-installation.html#install-ida-plug-in>
- Able to record new steps to a group command in record mode.
- Able to assert table content by column number.
- Able to update the test suite artifact type and name.
- Update checkstyle Drools.
- Able to view the Debug ${variable} in recorder browser console.
- Able to validate number of rows in command startSQLQuery.

### Bug Fixes
- Fix the issue that the IDA plugin can't replay UI.
- Fix the issue that can't record BP3 radio box.
- Fix the issue that absence of service execution diagram on CHCS.
- Fix the issue that putContext command doesn't work.
- Fix the issue that one test project can view custom command from other test project.  
- Fix the issue that Monitor feature doesn't work.
- Fix the issue that pipeline step checkbox value doesn't save properly.

### Notes
- There are database changes from v2.0.0 to v2.0.1, please execute the corresponding migration scripts in migrate-mysql.sql file if you upgrade IDA from v2.0.0.

## v2.0.0 - 12/5/2018

### New Features
- Rename to IDA (IBM Deployment Accelerator for Business Automation Workflow). The demo server url is changed to <https://9.30.255.220:9443/ida>
- Rewrite checkstyle in Java. Customer can use this OOTB checkstyle engine or ODM
- Support BAW18
- Able to upload a TWX file to do offline code static analysis without connecting to a BPM server
- Able to extend the recorder script. More details please refer to <https://sdc-china.github.io/IDA-doc/administration/administration-custom-recorder.html>
- Provide sample test projects. Git repository: <https://github.com/sdc-china/IDA-samples/tree/master/testing>

### Changes

- IDA browser plugin upgraded to version 1.24. More details please refer to <https://sdc-china.github.io/IDA-doc/installation/installlation-post-installation.html#install-ida-plug-in>
- Update pipeline REST API. More details please refer to <https://sdc-china.github.io/IDA-doc/references/references-apis.html>
- Able to stop a running pipeline build
- Able to exclude test cases when run pipeline
- Able to send pipeline email notification by script. More details please refer to https://sdc-china.github.io/IDA-doc/pipeline/pipeline-script.html#script-samples
- Updated test project dashboard page. User can batch run/delete the selected test cases
- Able to create an empty test suite by choose the option "Build from Scratch" when generate test case
- Add Javascript API doc. More details please refer to <https://sdc-china.github.io/IDA-doc/references/references-js-api.html>
- Deleted deprecated test commands cleanCookies, setCurrentInstanceIndex and openBPMDefaultUrl.

### Bug Fixes

- Fix the issue that pipeline dashboard page has duplicated test build trend chart
- Fix the issue that pipeline deployment doesn't work if the branch name contains white space
- Fix the issue that delete does not work inside Group Command
- Fix the issue that debug inside group command does not generate output in report
- Fix the issue that addContext, putContext, saveText and saveCoachControl commands don't work on IDA plugin
- Fix the issue that runAdhocActivity and StartExposedHertiageHumanService don't work on Selenium Grid
- Fix the issue that finishTask command can't generate output template
- Fix the issue that text, textarea and select command don't work for coach v8 toolkit
- Fix the issue that select table row is not working on BP3 enterprise version
- Fix the issue that assertTableContent fails on BP3 table

### Notes
- There are database changes from v1.3.1 to v2.0.0, please execute the corresponding migration scripts in migrate-mysql.sql file if you upgrade IDA from v1.3.1

## v1.3.1 - 11/14/2018

### Changes

- The mysql-connector-java jar is removed from Keter release package. Please download the jar by yourself, and repackage it into keter war. More details please refer to <https://sdc-china.github.io/keter-doc/installation/installation-db.html>.
- Be able to view pipeline runtime log in pipeline dashboard page.
- Be able to delete a pipeline build.
- Update pipeline snapshot naming pattern. It supports the name pattern like: {MAJOR.MINOR.PATCH} - {APP_ACRONYM} {TRACK} {yyyyMMddHHmmss}
- Pipeline script supports **wsadmin*- script. More details please refer to <https://sdc-china.github.io/keter-doc/pipeline/pipeline-script.html>.
- Update pipeline form validation logic.
- keter.properties supports encrypted password. More details please refer to <https://sdc-china.github.io/keter-doc/installation/installation-keter-repacking.html>
- Added data directory **engineConfig.dataDir*- in keter.properties. Removed **engineConfig.screenshotDir**, **engineConfig.tempDir**, **checkstyle.dir**, **codereview.dir*- and **twx.dir*- in keter.properties. All files will be put in the folder **engineConfig.dataDir**.
- Generate Javascript command template when create a new custom Javascript command.
- The command runTaskByDisplayName can populate the runtime task subject name when add the command from keter plugin.
- Be able to generate output template for BPM.finishTask command.
- Add task name drop down for command assertTaskNotGenerated.
- Add status drop down for command assertProcessInstanceStatus.
- Support BP3 Combo Box with type ahead.
- Support BP3 table selection.

### Bug Fixes

- Fix the issue that custom command can't be replayed in keter plugin.
- Fix the issue that stop case button doesn't work properly.
- Fix the issue that assertSelect doesn't work for Responsive Coach toolkit.
- Fix the issue that assertDatePicker doesn't work for Responsive Coach toolkit.
- Fix the issue that the startUCA parameter was reset when change the UCA name. 

## v1.3.0.1 - 11/08/2018

### Bug Fixes

- Fix the issue that BP3 table row select not record.

## v1.3.0 - 10/24/2018

### New Features

- New pipeline configuration UI, user can adjust sequence of pipelinestages and steps.  
- Supports run script in pipeline.

### Changes

- As we can't publish the Firefox plugin in Firefox Addon site, we published it in github page now: <https://sdc-china.github.io/keter-doc/installation/installlation-post-installation.html#plug-in>
- Update file upload commands: UI.file, UI.bpmFileDropzone and UI.bpmFileUploader.
- Supports UI.waitElement command in Keter Plugin.

### Bug Fixes

- Fix code review concurrency run issues.
- Fix diagram display issue in test report page.
- Fix the issue that BPM.loginBPMoC command doesn't work in Firefox.
- Fix the commands BPM.getLatestInstanceIdByProcess, BPM.getInstanceIdByInstanceName, BPM.getInstanceIdByTaskName and BPM.getInstanceIdByBusinessData.
- Fix the issue that the service flows didn't shown when create monitor.
- Fix the issue that the disable monitor button doesn't work.
- Fix the issue that can't import a project with custom JS command.
- Fix the issue that the record order is incorrect. 
- Fix the issue that user can't save custom Javascript command sometimes.
- Fix the issue that click the Edit/Exit Edit button always refresh the page.
- Fix the issue that the Select CV from v8 coaches toolkit playback not working.
- Fix the issue that the Date Time Picker CV from v8 coaches toolkit playback not working.
- Fix the issue that import of a test project with group command changes the command from original.
- Fix the issue that startProcess case step does not preserve parameters when editing existing step.
- Fix the issue that The value defined in test case data file can't be parsed in Keter plugin
- Fix the issue that assertTableRows command doesn't work for Responsive Coach.

### Know Limitation
- The file upload commands UI.file and UI.bpmFileUploader can't be replayed on Keter Plugin due to browser security issue, but these commands can work on Selenium Grid. So you can record the file upload commands by Keter Plugin, but replay them on Selenium Grid.
- The command UI.close is disabled in Keter plugin which may caused issue in plugin.
- We made significant change on pipeline data structure. To migrate the database to the latest version, we have to drop all pipeline related tables, and create them again. And we only provided the migration script for MySQL. For DB2, please recreate the database.

## v1.2.0.1 - 10/16/2018

### Bug Fixes

- Fix the issue that task window is auto closed in firefox plugin. (Keter plugin v1.22 is published)
- Fix the checkstyle doesn't work issue.

## v1.2.0 - 10/10/2018

### New Features

- Support DB2 v11.1.
- Support offline deployment.
- Add checkstyle report print page.

### Changes

- Don't allow special characters for test project name.
- Encrypt password in database.
- Add new configuration "loggerLevel" in keter.properties.
- Only display process server in code review page.
- Add confirm dialog when delete test case.
- The "Json Path" parameter supports array item now.
- Remove "Section" parameter in commands. It's deprecated.
- Remove "saveSQLQueryResult" command, It's deprecated, please use "startSQLQuery". 
- Upgrade Keter plugin to v1.21.

### Bug Fixes

- Fix the firefox plugin issue.
- Fix the plugin recording issues for BP3 coach control.
- Fix the issue that the "refresh" icon in "expected output" never returns.
- Fix the tooltip layout issue.
- Fix the commands assertValidationPassed, assertTableContent, assignTask, addInstanceId, startRestApi, startAjaxService, startSQLQuery and startExposedHertiageHumanService.


## v1.1.1 - 09/18/2018

### Changes

- Support Advanced Integration Service.
- Adjust the Labs menu layout.
- Disable Keter plugin recorder when the test case is in replaying mode.
- Add Keter help link on the right of navigation bar.

### Bug Fixes

- Fix the process SVG diagram didn't show correctly sometimes.
- Fix the Keter plugin can't catch ajax exception sometimes.
- Fix the loginBPMoC, waitTextPresent, startUCA, startAdHoc, runAdHocActivity, fireTimer and assertProcessInstanceDetail commands didn't work.
- Fix the service input parameters didn't load when add a test case step.
- Fix the test project can't be created on BPM Process Server.
- Fix it can't create/edit a testing project with a toolkit application.
- Fix it can't parsed the context variable in input parameter, eg: ${context.currentInstanceId}.
- Fix the running icon is disappear after clicking edit/exit edit button.
- Fix UI issue on code review report rendering.

## v1.1.0 - 09/04/2018

### Changes

- Upgrade selenium version to 3.14.0
- Support select a named snapshot in pipeline.
- Skip deployment step if the snapshot already exists in Process Server.
- Configure the deployment timeout in keter.properties.
- Configure code review report folder in keter.properties.
- Support test service in toolkit.
- Auto reload test project information if Tip is selected.
- Detect selenium grid availability before run test case.
- Can edit the verbalization of the customized command. 
- Provide migrate SQL script for old version.

### Bug Fixes

- Fix execution trace is empty in pipeline test report.
- Fix the "Halt on Failure" does not saved in pipeline.
- Fix the test project load wrong snapshot name issue.
- Fix the test report layout issue.
- Fix generate case dialog layout issue.
- Fix can't edit test project shared by other user.


## v1.0.6 - 08/22/2018

### New Features

- Support export a test project to zip file.

### Changes

- Increase fields length in database.
- Detect the validation errors before the deployment.
- Update document about how to install and verify SSH key

### Bug Fixes

- Fix can't start system service in toolkit error.
- Fix require.js console error.
- Fix special character error when import a project.
- Fix add BPM user error.
- Fix the case step index isn't correct when save them in a group command.
- Fix edit JavaScript command name error.
- Fix can't clear the text in the text box error.
- Fix can't support special character in text box error.

## v1.0.5 - 07/25/2018

### New Features

- Support http protocol in keter plug-in.
- User can choose multiple selenium hubs when create a project. 

### Changes

- Refactor the browser plug-in. 
- User can migrate old project from project left sidebar and select the "Import" menu.
- Minimize jar of keter dependences.

### Bug Fixes

- Fix user can't create pipeline sometimes.
- Fix some custom command issues.
- Fix user can't delete binding external test data.
- Fix some UI style issues.
- Fix delete on completion check not working properly with some twx.
- Fix service flow referenced by coach view but checkstyle reports as unused.
- Fix predefined variables in JS checking.



## v1.0.4 - 07/11/2018

### New Features

- Show threshold info in exception trace of Checkstyle step.
- Add "Halt on failure" option for checkstyle build step.
- Add button to generate exepcted output for service assertion. 

### Changes
- Refractor the browser plug-in.

### Bug Fixes
- Fix the ratio number issue in test project dashboard 
- Fix user can't run another test case when stop a running test case
- Fix pipeline running status never update issue.

## v1.0.3 - 06/26/2018

### New Features

- Add threshold settings for checkstyle step in pipeline. Exceeding the thresholds will fail the build.
- Support keter plug-in for fireofox browser to record UI. 

### Changes

-  Add browser type check for Keter home page for plug-in installation information.
-  Change Cancel button to Close.
-  Remove Rest Uri column in BPM configration. 
-  Change the copyright text align center of the page.

### Bug Fixes

- Fix code review delta changes layout issue.
- Fix checkstyle stack overflow issue when checking some specific process app.
- Fix password in Administration tab  show up.
- Fix code review layout change issue.
- Fix click elsewhere close the project dialog.
- Fix menus display properly issue when exception occurs.
- Fix keter dashboard always get reload issue.
- Fix missing expected result issue when run the system service get exception.


## v1.0.2 - 06/13/2018

### New Features

- Support create and use custom javascript command in case steps.
- Support stop a running test case.
- Add BPM Web PD plugin to support checkstyle and code review.

### Changes

- Refresh shown texts and page style on html.
- Add an icon for Keter.

### Bug Fixes

- Miss help information when chooseing a command.
- Miss verberlization for custom command.
- The page is reload frequently when binding/unbinding an external test data.
- Miss validation for service output parameter.
- Null point exception occasionally in code review componnent.


## v1.0.1 - 05/30/2018

### New Features

- Release Checkstyle rule projects.

### Changes

- Add custom command parameter when migrate an old project.
- Combine create project and migrate project widget.
- Disable ActiveMQ if Monitoring is not needed.
- Remove jrules-engine.jar from package war.
- Add document with Mysql8.0 start issue for Keter.

### Bug Fixes

- Can not add same name custom command across the Projects.
- RuleExecutionMode is wrong for Checkstyle module.
- Support click button by value in Keter Plugin.
- Checkstyle overlay covered the top menu.


## v1.0 - 05/15/2018

### New Features
- Pipeline 
- BPM Test
- BPM Checkstyle
- BPM Code Review
- BPM Monitor
- BPM Supporting Tool



