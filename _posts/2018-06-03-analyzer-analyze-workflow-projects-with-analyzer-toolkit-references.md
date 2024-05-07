---
title: "Analyze Workflow Projects with Analyzer Toolkit References"
category: analyzer
date: 2018-06-03 14:17:55
last_modified_at: 2019-11-26 14:50:00
---

# Analyze Workflow Projects with Analyzer Toolkit References
***

## Setting up the Workflow project and performing it.

1. Switch to the **Analyzer** tab, then you can use the BAW server to analyze.

   **Use BAW server**, choose the toolkit - references tab, fill in the below field values for the analyzer toolkit references form.

   ![][analyzer_toolkit_references]

   |   Parameter   | Description    |
   | ------------- |----------------|
   | [Server][1]   |Server environment|
   | Process App   |Process app list on the selected server|
   | Toolkit       |Toolkits of the selected server|
   | Branch        |The branch of the selected process app or selected toolkit|
   | Snapshot      |The snapshot of the selected branch|
   | Tip           |The tip snapshot of the process app|
   | Exclude System Toolkits|Whether to exclude system toolkits which include System Data, Coaches, Content Management, System Governance, Responsive Coaches, UI Toolkit, Dashboards, Responsive Portal Components|

2. Click the **Toolkit References Analyze** Button to see the toolkit references report.

   ![][analyzer_toolkit_references_report]


[analyzer_toolkit_references]: ../images/analyzer/analyzer_toolkit_references.png
[analyzer_toolkit_references_report]: ../images/analyzer/analyzer_toolkit_references_report.png

[1]: ../administration/administration-baw-configuration.html