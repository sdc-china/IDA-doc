---
title: "Analyzer report"
category: analyzer
date: 2018-10-10 14:17:55
last_modified_at: 2019-07-29 14:50:00
order: 2
---

# Analyzer report
***
## Basic information
   
   After finishing the analysis, the basic information for this application will be displayed in this section, including the infomation about process application version, branch, snapshot and so on. More details, see the following screenshot.

   ![][basic_info]

  
## Dependencies

   This part shows the dependencies of this process application, also you can see the toolkit version details behind the toolkit name. 

   ![][dependencies]

## BPMN Artifacts Summary

   The number on the right of the BPMN artifact summary indicates the number of applications applied to the left artifact. In this diagram, we can get the number of Process, Service, Business Object and Coach View, also we can get the number of each component under them.
   ![][bpmn_artifacts_summary]

## BPMN Artifacts Statistic

   Analyzer counts the number of components per Process, Service, Business Object and Coach View, so that the user could have better understanding about the complexity of each Process, Service, Business Object and Coach View in current process application. You can change the number of rows displayed in the table, and also you can search the 
   entries in table by name.
   ![][bpmn_artifacts_statistic]

## BAW v19 Migration Relevant Statistic
   When the current process application version is the previous version of BAW v19, and when you want to migrate this process application to BAW v19, it may cause some problems. This table can give you a detailed statistics before migration.
   ![][migrate]



[basic_info]: ../images/analyzer/basic_info.PNG
[dependencies]: ../images/analyzer/dependencies.PNG
[bpmn_artifacts_summary]: ../images/analyzer/bpmn_artifacts_summary.PNG
[bpmn_artifacts_statistic]: ../images/analyzer/bpmn_artifacts_statistic.PNG
[migrate]: ../images/analyzer/migrate.PNG
