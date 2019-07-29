---
title: "Checkstyle report"
category: checkstyle
date: 2018-10-08 15:17:55
last_modified_at: 2019-07-29 15:29:00
order: 3
---

### Summary & Statistic

#### Warnings summary

   After finishing the analysis, a comprehensive mark named **HEALTH SCORE** would be given in this section to evaluate the selected process application's code is good or bad according the coding standard. More details, see the following screenshot.

   ![][checkstyle_healthScore]

   Lower score means that the code of this process application is closer to to the coding standard, and higher score means that the code needs to refactor.  

   The warnings are calculated from **Documentation**, **Implementation**, **Maintenance**, **Migration**, **Performance**, **Redundant** etc. dimensions and the dimension will not be displayed when there is no warning that belongs to this dimension. Warnings of each dimension  will be counted in three level : **critical**, **Major** and **Minor**. Developers can find the modification advises for each BPM application artifacts, so that it can continuously improve the coding quality.  

   ![][checkstyle_statistic]
####  Artifact Warning Summary
   In this part, it makes statistics based on dimensions of category, sub-category and artifact. You can click **CATETORY** column to see its sub-category, click **SUB-CATEGORY** to show its artifacts and the number in the red circle is the number of warnings that sub-category or artifact you select. Click **ARTIFACT** entry to get warning details.(Refer to **Check Result Details**)

   ![][checkstyle_category]

### Basic Info

   The basic information for this application will be displayed in this section, including dependencies and BPMN artifact summary. The number on the right of the BPMN artifact summary indicates the number of applications applied to the left artifact. More details, see the following screenshot.

   ![][checkstyle_basicInfo]

### Analysis

   This section is the pie chart and bar chart of the **SUMMARY & STATISTIC** part that calculated from different dimensions. More details, see the following screenshot.

   ![][checkstyle_chart]

### Check result details

   You can see more detailed information about checkstyle warnings. It supports to filter through different dimensions like level and category. You can type in **Symptom**, **Best Practice**, **Reference** and **Artifact** to make a more accurate search. **Symptom** provides the description of warnings, **Best Practice** offers suggestions for improvement, **Reference** gives a reference source for suggestions, and **Artifact** indicates the location of artifact that causes warnings so that you can fix them easily.

   ![][checkstyle_checkresultDetailed]

[checkstyle_healthScore]: ../images/checkstyle/checkstyle_healthScore.PNG
[checkstyle_basicInfo]: ../images/checkstyle/checkstyle_basicInfo.PNG
[checkstyle_chart]: ../images/checkstyle/checkstyle_checkstyle_chart.PNG
[checkstyle_statistic]: ../images/checkstyle/checkstyle_statistic.PNG
[checkstyle_category]: ../images/checkstyle/checkstyle_category.PNG
[checkstyle_checkresultDetailed]: ../images/checkstyle/checkstyle_checkresultDetailed.PNG
