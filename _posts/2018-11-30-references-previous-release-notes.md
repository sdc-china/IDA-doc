---
title: "Previous Release Notes"
category: references
date: 2018-11-30 11:17:55
last_modified_at: 2025-08-27 12:00:00
---

## Previous Release Notes

### 25.0.10 - 10/30/2025

#### Enhancements
- [Checkstyle] Download Checkstyle Report as CSV.
- [Checkstyle] Add rules version number on Checkstyle report.
- [Analyzer] Support to print Toolkit References report.
- [Analyzer] Support to view history reports for Toolkit References.
- [Administration] Support to map AD groups to role User and Admin respectively.
- [Administration] Support to map LDAP user to default team when user logs in.

#### Bug Fixes
- [Checkstyle] Adjust 'String of Pearls' problem check to detect at least 3 sequential activities according to reference document.
- [Checkstyle] JavaScript uses java.lang.Thread.currentThread().sleep rule should not check client side script in client-side human service.
- [Checkstyle] Remove outdated rules.
- [Checkstyle] StackOverflowError is thrown when running Checkstyle.
- [Checkstyle] “IllegalStateException: There's already another KieContainer created from a different ClassLoader” is thrown when running Checkstyle using Embedded engine.
- [Checkstyle] Can not view the loop details diagram sometimes.
- [Checkstyle] Report is not auto scrolled to CHECK RESULT DETAILS when a tag is selected on Firefox.
- [Analyzer] Incorrect Referenced By is reported on a toolkit snapshot.
- [Pipeline] When New Snapshot Trigger is enabled in Build Triggers, an snapshot older than the pipeline edit time may trigger the pipeline.
- [Administation] When BAW user is edited with wrong password, test connection of the user still passed sometimes.
- [Administration] Wrong error message is displayed when Gatling download fails.

#### Notes
- There are database changes from 25.0.10 to 25.0.10, please use the Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).

#### The checkstyle rules change details
[Updated rules]
- /checks/service/check-service-item-contains-sleep
[Deleted rules]
- /checks/service/check-service-item-save-context-checked
- /checks/process/check-stp-bpd


### 25.0.9 - 09/26/2025

#### Enhancements
- [Testing] Able to regenerate case step template based on edited Expected Execution Flow on Process and Sub-Processes Flow diagrams.
- [Pipeline] Improve pipeline pre-deletion check and warning messages.
- [Comparison] Add artifact changes summary to print report header.
- [Administration] Option to remove user.

#### Bug Fixes
- [Testing] MethodArgumentTypeMismatchException is sometimes thrown on test case edit page.
- [Testing] Input parameters of process operations selected for startRESTService command are not loaded.
- [Checkstyle] Recheck Symptom button is missing in Checkstyle online report.
- [Checkstyle] Fix duplicate statistics for nested coach views in human service.
- [Checkstyle] Some Checkstyle rule reference link is out of date.
- [Comparison] Sub-artifact is displayed as updated while parent artifact is displayed as added or deleted.
- [Comparison] Fix comparison results of Presentation properties of Process/BPD/Subprocess.
- [Administration] User permissions are not refreshed immediately after user role is edited.

#### Notes
- There are database changes from 25.0.9 to 25.0.9, please use the Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).
- If ODM Checkstyle engine is used, please deploy the latest ODM Checkstyle rule projects to Rule Execution Server.

#### The checkstyle rules change details
[Updated rules]
- /checks/migrate/check-bpd-component-contains-inner-table-in-data-mapping
- /checks/migrate/check-bpd-component-contains-inner-table-in-script
- /checks/migrate/check-service-item-contains-inner-table-in-data-mapping
- /checks/migrate/check-service-item-contains-inner-table-in-script
[Deleted rules]
- /checks/migrate/check-managed-asset-size
- /checks/migrate/check-server-item-endpoint-hardcoded
- /checks/migrate/check-service-item-ECMservices


### 25.0.8 - 08/28/2025

#### Enhancements
- [Testing] Add startRESTService test command to support testing of asynchronous Service flow by Exposed automation services/REST service.
- [Pipeline] Able to review all build activities(start/approve/reject/resume/reschedule/cancel/comment) on build detail report.
- [Checkstyle,Analyzer] Show the complete toolkit dependencies tree in Checkstyle and Analyzer reports.

#### Bug Fixes
- [Testing] Cannot create or edit global custom JavaScript command.
- [Testing] When test case is viewed from test project sidebar, case history is not updated correctly.
- [Pipeline] Cannot enter multiple line comments when approving a build.
- [Pipeline] Missing pipeline template diagram when Dev to Test template is selected to be imported.
- [Comparison] Missing comparison results of some properties of Service Flow.
- [Comparison] Missing comparison results of Included Scripts of Coach View.

#### Notes
- There are database changes from 25.0.7 to 25.0.8, please use the Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).


### 25.0.7 - 07/29/2025

#### Enhancements
- Support BAW 25.0.0.
- [Testing] Add getTaskData test command.
- [Testing] Support to set snapshot name for test command clickActivityFromPortal.
- [Pipeline] Add more build execution context variables for pipeline email notifications.
- [Comparison] Display artifact icon by artifact type.
- [Operations Tool] Add an option to force cleanup all running instances in snapshot cleanup tool.
- [Administration] Support custom SSH port and SOAP host in BAW SSH Configuration.

#### Bug Fixes
- [Pipeline] Fix Validation Error check on deployment step.
- [Comparison] Fix comparison results of some properties for service flows.
- [Plugin] Error icon on IDA recorder is not displayed correctly.
- DB2 persistence exception is thrown when pipeline build execution results are saved on IDA Java 17 environment.

#### Notes
- IDA browser Plug-in is updated to version 25.2, please make sure you have installed the latest plug-in.


### 25.0.6 - 06/27/2025

#### Enhancements
- [Pipeline] Support to overwrite deployment step parameters before pipeline build is run.
- [Comparison] Sort property entries on artifact change panels.
- [Comparision] Support to print Comparison report.
- [Analyzer] Support to print Analyzer report.
- [Container] Support re-encrypt route to IDA on OCP.
- Support HTTP/2 protocol for IDA on Java 17.

#### Bug Fixes
- [Checkstyle] Filtering of warning messages on pop-up window of artifact summary tree node does not work.
- [Comparison] Line numbers greater than 10 are not displayed correctly on artifact change panels.
- [Comparison] Converted artifact's old content is displayed as new content after conversion in comparison report.
- [Comparison] Fix comparison results of some properties for heritage artifacts on Desktop PD.
ties for Undercover Agent and Team.
- [Administration] Validate if the user attribute specified in LDAP User Filter exists when testing connection of LDAP server.
- [Administration] Verify database schema on Create Database Tables page.
- [Container] IDA data path should be readonly in container environment.


### 25.0.5 - 05/29/2025

#### Enhancements
- Upgrade to Bootstrap 5.
- Keep filter status of all DataTables.
- [Comparison] Support toolkit reference update in merge report.
- [Administration] Allow user to view assigned Selenium Grid Configurations and test their connections.
- [Administration] Set database schema in auto-generated Create Database Tables and Migration Database Schema SQL scripts for PostgreSQL and DB2.

#### Bug Fixes
- [Testing] Cannot open test project due to NULL pointer exception in test coverage calculation.
- [Testing] Edit button sometimes needs to be clicked twice to edit a test case.
- [Comparison] Cannot commit to add an artifact if it depends on toolkit in merge report.
- [Comparison] Cannot delete and add artifacts with the same name simultaneously in merge report.
- [Comparison] Show error message when loading diagram in a deleted snapshot in comparison report.
- [Administration] Create Database Tables on IDA startup does not work on IDA Java 17 environment.

#### Notes
- IDA browser Plug-in is updated to version 25.1, please make sure you have installed the latest plug-in.


### 25.0.4 - 04/29/2025

#### Enhancements
- [Pipeline] Able to reschedule deployment time when approving pipeline build.
- [Pipeline] Support scheduling/rescheduling deployment steps in group pipeline.

#### Bug Fixes
- [Checkstyle] The characters after "//" in the URL are ignored as comments.
- [Pipeline] Pipeline job Trigger by New Snapshot is not scheduled within Start Time and End Time of pipeline build trigger.
- [Comparison] Auto tracked fields changes are not shown in snapshot comparison report.
- [Comparison] Comparison results of complex type BO shows irrelevant simple type attributes.
- [Container] Missing JVM arguments for container environment deployed by Java 17 docker image when the number of pod replicas is set to 1.

#### Notes
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check new doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).


### 25.0.3 - 03/27/2025

#### Enhancements
- Support Spring Framework v6 based on Java 17.

#### Bug Fixes
- [Security] Upgrade jQuery Validation to v1.21.0.
- [Security] Validate the twx file format once the file is uploaded to IDA server.
- [Checkstyle] Checkstyle hangs when generating report.
- [Checkstyle] Variables used in event subprocess is incorrectly reported as unused variables.
- [Administration] Cannot download Chrome plugin v3(ida3-24.7.crx) from Resources page.

#### Notes
- IDA supports Spring Framework v6 based on Java 17 or Spring Framework v5 based on Java 8. To install IDA on Java 17, please check new doc in Installing IDA Application on Java 17(https://sdc-china.github.io/IDA-doc/installation/installation-installing-ida-application-java17.html).

#### The checkstyle rules change details
[Updated rules]
- check-bpd-component-contains-inner-table-in-script
- check-service-item-contains-inner-table-in-script
- check-bpd-component-sql-injection-in-script
- check-service-item-sql-injection-in-script
- check-bpd-unused-variables


### 25.0.2 - 02/27/2025

#### Bug Fixes
- [Testing] Instance name shown on test case report is not correct.
- [Testing] Recorded test cases are being saved with incorrect encoding.
- [Comparison] Missing Alias name changes of process Visible Variables in snapshot comparison report.
- [Comparison] Comparison result of decision gateway in service is not accurate.
- [Security] Remove version numbers in comments in resource files.
- [Security] Upgrade jQuery Validation to v1.19.5.
- [Security] Upgrade jQuery DataTables to v1.11.3.
- [Security] Request with rogue characters should return 400 bad request instead of 500 internal server error.
- [Security] Remove the detailed error trace from the error messages shown on UI.
- [Security] Remove restclient.jar from IDA Toolkit.
- [Security] Remove SSH private keys in sample project data.


### 25.0.1 - 01/23/2025

#### Enhancements
- [Testing] Support testing TX service flow and exposed async service flow on Cloud Pak for Business Automation.
- [Checkstyle] The parsing of subprocess data nested at more than two levels is incomplete.
- [Comparison] Able to regenerate report by clicking a refresh button on the comparison/merge results table row.
- [Comparison] Sort the results in comparison report.
- [Pipeline] Allow user to set a target deployment time of the pipeline deployment step before pipeline build is run.
- [Pipeline] Add cancel with comments option to all queued/running/pending builds.
- [Administration] Add version number to embedded rules.
- [Administration] Validate LDAP user filter when testing connection of LDAP server.

#### Bug Fixes
- [Comparison] It should show dependency tree when overwriting an artifact with sub-artifacts.
- [Comparison] Left-side menu is missing for sub-artifacts in comparison report when only sub-artifacts are changed.
- [Comparison] Sub-artifact changes cannot be committed in merge report when only sub-artifacts are changed.
- [Operations Tool] The snapshot status is not accurate in Clean Snapshot search results.
- [Administration] Change fields REST User Name/REST User Display Name to readonly in Edit BAW Server modal.

#### Notes
- There are database changes from 24.0.11 to 25.0.1, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).

#### The checkstyle rules change details
[Updated rules]
- checks/process/check-delete-completed-task


### 24.0.11 - 12/20/2024

#### Enhancements
- [Pipeline] Allow user to change process app and snapshot acronym while triggering a new pipeline build.
- [Comparison] Allow selection of unnamed snapshots in new UI for snapshot comparison.

#### Bug Fixes
- [Testing] The "Exit Edit" button on test case page sometimes does not work.
- [Testing] Attributes are missing from auto generated process input parameters when attribute types are referenced multiple times.
- [Checkstyle] Checkstyle rule "the attribute number of business object is more than 50" throws dead loop exception.
- [Checkstyle] Expected Execution Flow icons should not be shown in comparison or checkstyle report.
- [Checkstyle] Checkstyle warning "system lane activity uses multi-instance loops" is reported by embedded rule engine but not by ODM rule engine.
- [Pipeline] The Log Details section keeps refreshing and blocking the build details page.
- [Comparison] Missing subprocess changes in snapshot comparison results.
- [Administration] Error is thrown when idaAdmin re-logs in or clicks Home page after executing tables creation scripts.

#### Notes
- Starting from version 24.0.10, IDA supports database tables creation after new IDA instance is installed and started up. Please use the new Create Database Tables page to execute tables creation scripts or ask DBA to execute the corresponding tables creation scripts. See new doc for Database Installation and Configuration(https://sdc-china.github.io/IDA-doc/installation/installation-database-installation-and-configuration.html).


### 24.0.10-2 - 12/03/2024

#### Bug Fixes
- Comparison page doesn't work for non-admin user.


### 24.0.10.1 - 12/02/2024

#### Bug Fixes
- Database migration execution from v24.0.8 to v24.0.10 is hung on DB2.


### 24.0.10 - 11/27/2024

#### Enhancements
- [Pipeline] Add Queued status on Total Number of Builds chart on Pipeline Overview.
- [Comparison] New UI for snapshot comparison and snapshot merge.
- [Comparison] Support batch push in snapshot merge report.
- [Administration] Support database tables creation for new IDA instance on IDA startup.
- [Administration] Able to recreate containerized selenium grid if it is down.
- [Container] Add resource requests and limits configrations for containerized selenium grid.

#### Bug Fixes
- [Testing] Slow loading of project dashboard and test case detail page.
- [Testing] Cannot record control ECM File Uploader in IDA Recorder.
- [Testing] Process diagram is not properly scaled on Process Coverage modal on Firefox.
- [Pipeline] Exception warning is thrown when pipeline build is approved.
- [Pipeline] Not able to click Stop or ...Menu button on the pipeline build table when build is run or completed.
- [Comparison] The inline scripts of coach views are the same but the comparison report shows there are changes.
- [Comparison] The data mappings of process(subprocess) tasks are the same but the comparison report shows there are changes.
- [Comparison] Changes in line links in human service are not shown in comparison result.
- [Administration] Unexpected exception is thrown when creating user if LDAP server is down.


### 24.0.9 - 10/31/2024

#### Enhancements
- [Testing] Calculation of test suite coverage should include subprocess actual flows.
- [Testing] Able to fail the test case when actual flow is not the same as the expected flow.
- [Pipeline] Able to overwrite pipeline stage server info in pipeline REST API.
- [Pipeline] Hide My Pending Approvals section on Home page when there are no pending approvals.
- [Pipeline] Add input validation for Trigger Pipeline Build REST API.

#### Bug Fixes
- [Testing] Should not show expected flow if flow diagram cannot be loaded.
- [Testing] Cannot draw actual flow when the same linked process is attached in different subprocesses.
- [Testing] Custom command change is not highlighted in the second test case version.
- [Testing] Unique index constraint violation is thrown when restoring test case version with changes in custom command parameters.
- [Testing] Clear Import Project selection when the modal is displayed.
- [Testing] Display all time stamps in test case histories using the same time zone of user browser.
- [Pipeline] The imported pipeline has a null schedule time, causing the pipeline to run automatically.
- [Administration] User should not be redirected to migration page if the database version was set to a previous hotfix version, when no database migration or IDA upgrade is needed.
- [Database] Fix inconsistent database schema.


### 24.0.8.1 - 10/10/2024

#### Bug Fixes
- [Pipeline] Fix wrong snapshot is used in pipeline steps.
- [Container] Fix operator docker image security issues.


### 24.0.8 - 09/27/2024

#### Enhancements
- [Testing] Able to update expected flow in Flow diagram.
- [Testing] Display custom command change updater and update time in test case history.
- [Container] Support container resources settings in CR.
- [Container] Support SSL certification secret.

#### Bug Fixes
- [Testing] Fix actual flow for multiple nodes of the same linked process in a process.
- [Testing] Fix blank diagram in test case report.
- [Testing] Enable Record button even there's plugin compatibility warning.
- [Checkstyle] Variables used by activities in subprocess throws wrong unused warnings.
- [Pipeline] Fix the issue that cannot trigger the pipeline using REST API with another container and branch name.
- [Comparison] Fix no artifacts are shown in the report, after clearing the "Modified by" filter.
- [Operations Tool] Fix warning display issue for clean unnamed snapshots.
- [Container] Fix Docker image security issues.

#### Notes
- There are database changes from 24.0.7 to 24.0.8, please use the new Migrate Database Schema page to execute migration scripts or ask DBA to execute the corresponding migration scripts. See new doc for Migrating IDA Application(https://sdc-china.github.io/IDA-doc/installation/installation-migrating-ida-application.html#migrate-database-schema-on-ida-startup).


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
