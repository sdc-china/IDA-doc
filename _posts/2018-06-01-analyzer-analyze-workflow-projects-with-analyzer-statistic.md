---
title: "Analyze Workflow Projects with Analyzer Statistics"
category: analyzer
date: 2018-06-01 14:17:55
last_modified_at: 2025-05-22 14:50:00
---

# Analyze Workflow Projects with Analyzer Statistics
***

## Setting up the Workflow project and performing it.

   1. Switch to the **Analyzer** tab, then you can use the BAW server or upload a TWX file to analyze.
     
      **Use BAW server**, choose the statistics - online tab, fill in the field values for the analyzer statistics form below.

      ![][analyzer_statistic_online]{:width="100%"}
      
      |   Parameter   | Description    |
      | ------------- |----------------|
      | [Server][1]   |Server environment|
      | Process App   |Process app list on the selected server|
      | Toolkit       |Toolkits of the selected server|
      | Branch        |The branch of the selected process app or selected toolkit|
      | Snapshot      |The snapshot of the selected branch|
      | Tip           |The tip snapshot of the process app|
      | Options       |Check "Ignore Toolkits Analysis" to skip toolkit analysis |

      **Upload a TWX file**, choose the statistics - offline tab.
       
      ![][analyzer_statistic_offline]{:width="100%"}
       
      You can choose or drag and drop a TWX file.
       
      ![][analyzer_upload_drop]{:width="40%"}
      
      ![][analyzer_upload_done]{:width="40%"}

   2. Click the **Statistic Analyze** Button to see the statistics report.

      ![][analyzer_report]{:width="100%"}

[analyzer_statistic_online]: ../images/analyzer/analyzer_statistic_online.png
[analyzer_statistic_offline]: ../images/analyzer/analyzer_statistic_offline.png
[analyzer_upload_drop]: ../images/analyzer/analyzer_upload_drop.PNG
[analyzer_upload_done]: ../images/analyzer/analyzer_upload_done.PNG
[analyzer_report]: ../images/analyzer/analyzer_report.PNG

[1]: ../administration/administration-baw-configuration.html