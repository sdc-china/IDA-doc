---
title: "Analyzer - Statistic report"
category: analyzer
date: 2018-10-10 14:17:55
last_modified_at: 2019-11-26 14:50:00
order: 3
---

# Analyzer - Statistic report
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

   Analyzer counts the number of components per Process, Service, Business Object and Coach View, so that the user could have better understanding about the complexity of each Process, Service, Business Object and Coach View in current process application. You can change the number of rows displayed in the table, and also you can search the entries in table by name.

   ![][bpmn_artifacts_statistic]

## BAW v19 Migration Relevant Statistic

   These tables are shown when the current process application version is the previous version of BAW v19, when you want to migrate current process application to BAW v19, it may cause some problems because some of features are deprecated on BAW v19. This table can give you a detailed migration relevant statistics before you start to migrate your process application.

   ![][migrate]



[basic_info]: ../images/analyzer/basic_info.PNG
[dependencies]: ../images/analyzer/dependencies.PNG
[bpmn_artifacts_summary]: ../images/analyzer/bpmn_artifacts_summary.PNG
[bpmn_artifacts_statistic]: ../images/analyzer/bpmn_artifacts_statistic.PNG
[migrate]: ../images/analyzer/migrate.PNG
