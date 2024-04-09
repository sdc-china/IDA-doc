---
title: "Analyzer - Statistical Report"
category: analyzer
date: 2018-06-05 14:17:55
last_modified_at: 2019-11-26 14:50:00
---

# Analyzer - Statistical Report
***

## Basic Information
   
   After finishing the statistical analysis, the basic information for this application will be displayed in this section, including process application details, specific information of branch and snapshot. More details, see the following screenshot.

   ![][basic_info]

  
## Dependencies

   This part shows the dependencies of the current process application. The item above the arrow is the name of the current process application, and the items in the direction indicated by the arrow are the dependencies of the current process application. You can see the toolkit version after the toolkit name. 

   ![][dependencies]

## Artifacts Summary

   The number on the right of the BPMN artifact summary indicates the number of applications applied to the left artifact. In this diagram, we can get the number of Processes, Services, Business Objects, and Coach Views, as well as the number of each component under them.

   ![][bpmn_artifacts_summary]

## Artifacts Statistics

   Analyzer counts the number of components per Process, Service, Business Object, and Coach View, so that the user could have a better understanding of the complexity of the process application.
   - In the Process table, we can view the number of process components, input/output variables, and the JavaScript code lines for each process.
   - In the Service table, we can view the number of service components, input/output variables, and the JavaScript code lines for each service.
   - In the Business Object table, we can view the number of properties of each business object.
   - In the Coach View table, we can view the number of coach resources, coach views, options, and inline scripts.

   ![][bpmn_artifacts_statistic]

## BAW Migration Relevant Statistics
   As we know, there are some features/artifacts that are deprecated since BAW v19 or BAW on Container. In this section, we list all the impacted artifacts during BAW migration and migration suggestions. For example:
   - In the Adhoc Start Event table, we can view all Adhoc start events which will be deprecated when we convert BPD to Process during migration.
   - In the Deprecated Assignment table, we can view all deprecated assignments like "Last user in Lane", "list of User", "Routing Policy", and "Custom" which will be deprecated when we convert BPD to Process during migration.
   - In the Web Service table, we can view all inline web services which will be deprecated when we convert heritage service to service flow during migration.
   - In the Java Integration table, we can view all Java Integrations which may be corrupted when we convert heritage service to service flow during migration.
   - In the Coach v8.x and Coach v7.x tables, we can view the number of deprecated coach controls in Coach UI.
   - In the Ajax In Coach table, we can view all Ajax services used in deprecated coach controls, whose signature will be changed in the latest BAW UI toolkit.

   ![][migrate]

   ![][migrate_container]

## Unused Artifacts Statistics
   
   Analyzer lists all the unused artifacts in the application.

   ![][unused_artifacts]

## Validation Statistics
   
   Analyzer lists all the validation errors or warnings of the application.

   ![][validation]


[basic_info]: ../images/analyzer/basic_info.PNG
[dependencies]: ../images/analyzer/dependencies.PNG
[bpmn_artifacts_summary]: ../images/analyzer/bpmn_artifacts_summary.PNG
[bpmn_artifacts_statistic]: ../images/analyzer/bpmn_artifacts_statistic.PNG
[migrate]: ../images/analyzer/migrate.PNG
[migrate_container]: ../images/analyzer/migrate_container.PNG
[unused_artifacts]: ../images/analyzer/unused_artifacts.PNG
[validation]: ../images/analyzer/validation.PNG