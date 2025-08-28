---
title: "Checkstyle Report"
category: checkstyle
date: 2018-04-05 15:17:55
last_modified_at: 2025-08-28 15:29:00
---

# Checkstyle Report
***

## Summary & Statistics

### Warnings Summary

After finishing the analysis, a comprehensive score named **HEALTH SCORE** would be given in this section to evaluate whether the selected process application's code is good or bad according to the coding standard. More details are provided in the following screenshot.

![][checkstyle_healthScore]{:width="60%"}

A lower score means that the code of this process application is closer to the coding standard, and a higher score means that the code needs to be refactored.

The warnings are calculated from dimensions such as **Documentation**, **Implementation**, **Maintenance**, **Migration**, **Performance**, **Redundancy** and **SAST**. A dimension will not be displayed if there are no warnings belonging to that dimension. Warnings for each dimension will be counted at three levels: **critical**, **Major**, and **Minor**. Developers can find modification advice for each application artifact, so that they can continuously improve the coding quality.

![][checkstyle_statistic]{:width="100%"}

### Artifact Warning Summary
In this part, statistics are made based on dimensions of category, sub-category, and artifact. You can click the **CATEGORY** column to see its sub-categories, click the **SUB-CATEGORY** to show its artifacts, and the number in the red circle is the number of warnings for the sub-category or artifact you select. Click the **ARTIFACT** entry to get warning details (refer to **Check Result Details**).

![][checkstyle_category]{:width="100%"}

## Toolkit Dependencies
Here mainly displays the hierarchical information of the toolkits. You can see the toolkit version after the toolkit name. Click the circular arrow to show or hide.

![][checkstyle_toolkitdependencies]{:width="100%"}

## Artifacts Summary

This area shows BPMN artifact summary. The number on the right of the BPMN artifact summary indicates the number of applications applied to the left artifact.

![][checkstyle_artifactssummary]{:width="100%"}

## Analysis

This section contains the pie chart and bar chart of the **SUMMARY & STATISTICS** part, calculated from different dimensions. More details are provided in the following screenshot.

![][checkstyle_chart]{:width="100%"}

## Check Result Details

You can see more detailed information about Checkstyle warnings in this section. It supports filtering through different dimensions like level and category. You can type in **Symptom**, **Best Practice**, **Reference**, and **Artifact** to perform a more accurate search. **Symptom** provides the description of warnings, **Best Practice** offers suggestions for improvement, **Reference** gives a reference source for suggestions, and **Artifact** indicates the location of the artifact that causes warnings so that you can fix them easily.

If you have fixed a warning, you can hover the mouse over the row and click the **Refresh** icon to re-check the warning.

![][checkstyle_checkresultDetailed]{:width="100%"}


[checkstyle_healthScore]: ../images/checkstyle/checkstyle_healthScore.PNG
[checkstyle_toolkitdependencies]: ../images/checkstyle/checkstyle_toolkitdependencies.png
[checkstyle_artifactssummary]: ../images/checkstyle/checkstyle_artifactssummary.png
[checkstyle_chart]: ../images/checkstyle/checkstyle_checkstyle_chart.PNG
[checkstyle_statistic]: ../images/checkstyle/checkstyle_statistic.PNG
[checkstyle_category]: ../images/checkstyle/checkstyle_category.PNG
[checkstyle_checkresultDetailed]: ../images/checkstyle/checkstyle_checkresultDetailed.PNG