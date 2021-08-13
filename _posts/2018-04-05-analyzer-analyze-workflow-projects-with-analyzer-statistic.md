---
title: "Analyze Workflow projects with analyzer statistic"
category: analyzer
date: 2018-10-10 14:17:55
last_modified_at: 2019-11-26 14:50:00
order: 1
---

# Analyze Workflow projects with analyzer statistic
***
### Setting up the Workflow project and perform it.

   1. Switch to the **Analyzer** tab, then you can use Workflow server or upload a TWX file to analyze.
     
      **Use Workflow server**, choose the statistic - online tab, fill the below field values for the analyzer statistic form.

      ![][analyzer_statistic_online]
      
      |   Parameter   | Description    |
      | ------------- |----------------|
      | [Server][1]   |Server environment|
      | Process App   |Process app list on the selected server|
      | Toolkit       |Toolkits of  selected server|
      | Branch        |The branch of selected process app or selected toolkit|
      | Snapshot      |The snapshot of selected branch|
      | Tip           |The tip snapshot of the process app|

      **Upload a TWX file**, choose the statistic - offline tab.
      
      ![][analyzer_statistic_offline]

      You can choose or drop a TWX file.

      ![][analyzer_upload_drop] ![][analyzer_upload_done]

   2. Click **Statistic Analyze** Button to see the statistic report.

      ![][analyzer_report]

[analyzer_statistic_online]: ../images/analyzer/analyzer_statistic_online.png
[analyzer_statistic_offline]: ../images/analyzer/analyzer_statistic_offline.png
[analyzer_upload_drop]: ../images/analyzer/analyzer_upload_drop.PNG
[analyzer_upload_done]: ../images/analyzer/analyzer_upload_done.PNG
[analyzer_report]: ../images/analyzer/analyzer_report.PNG

[1]: ../administration/administration-bpm-configuration.html
