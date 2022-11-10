---
title: "Analyzer - Statistic Report"
category: analyzer
date: 2018-06-05 14:17:55
last_modified_at: 2019-11-26 14:50:00
---

# Analyzer - Statistic Report
***

## Basic information
   
   After finishing the statistic analysis, the basic information for this application will be displayed in this section, including process application details, specific information of branch and snapshot. More details, see the following screenshot.

   ![][basic_info]

  
## Dependencies

   This part shows the dependencies of current process application, the item above the arrow is the name of current process application, the items in the direction indicated by the arrow are the dependencies of current process application, you can see the toolkit version after the toolkit name. 

   ![][dependencies]

## BPMN Artifacts Summary

   The number on the right of the BPMN artifact summary indicates the number of applications applied to the left artifact. In this diagram, we can get the number of Process, Service, Business Object and Coach View, also we can get the number of each component under them.

   ![][bpmn_artifacts_summary]

## BPMN Artifacts Statistic

   Analyzer counts the number of components per Process, Service, Business Object and Coach View, so that the user could have better understanding about the complexity of the process application.
   - In Process table, we can view the number of process components, input/output variables number and the JavaScript code lines for each process.
   - In Service table, we can view the number of service components, input/output variables number and the JavaScript code lines for each service.
   - In Business Object table, we can view the number of properties of each business object.
   - In Coach View table, we can view the number of coach resource, coach resource, options and inline scripts.

   ![][bpmn_artifacts_statistic]

## BAW v19 Migration Relevant Statistic
   As we know, there are some features/artifacts are dprecated on BAW v19. In this section, we list all the impacted artifacts during BAW migration.
   - In Adhoc Start Event table, we can view all Adhoc start events which will be deprecated when we convert BPD to Process during migration.
   - In Deprecated Assignment table, we can view all depreciated assignments like "Last user in Lane", "list of User", "Routing Policy" and "Custom" which will be  deprecated when we convert BPD to Process during migration.
   - In Web Service table, we can view all inline webservice which will be deprecated when we convert heritage service to service flow during migration.
   - In Java Integration table, we can view all Java Integration which may be corrupted when we convert heritage service to service flow during migration.
   - In Coach v8.x and Coach v7.x table, we can view the number of deprecated coach controls in Coach UI.
   - In Ajax In Coach table, we can view all Ajax services used in deprecated coach controls, whose signature will be changed in the latest BAW UI toolkit.

   ![][migrate]



[basic_info]: ../images/analyzer/basic_info.PNG
[dependencies]: ../images/analyzer/dependencies.PNG
[bpmn_artifacts_summary]: ../images/analyzer/bpmn_artifacts_summary.PNG
[bpmn_artifacts_statistic]: ../images/analyzer/bpmn_artifacts_statistic.PNG
[migrate]: ../images/analyzer/migrate.PNG
