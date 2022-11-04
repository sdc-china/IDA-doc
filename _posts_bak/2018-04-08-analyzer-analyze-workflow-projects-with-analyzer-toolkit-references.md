---
title: "Analyze Workflow projects with analyzer toolkit references"
category: analyzer
date: 2022-10-10 14:17:55
last_modified_at: 2022-11-26 14:50:00
order: 2
---

# Analyze Workflow projects with analyzer toolkit references
***

### Setting up the Workflow project and perform it.

   1. Switch to the **Analyzer** tab, then you can use BAW server to analyze.

      **Use BAW server**, choose the toolkit - references tab, fill the below field values for the analyzer toolkit references form.

      ![][analyzer_toolkit_references]

      |   Parameter   | Description    |
      | ------------- |----------------|
      | [Server][1]   |Server environment|
      | Process App   |Process app list on the selected server|
      | Toolkit       |Toolkits of  selected server|
      | Branch        |The branch of selected process app or selected toolkit|
      | Snapshot      |The snapshot of selected branch|
      | Tip           |The tip snapshot of the process app|
      | Exclude System Toolkits|Whether exclude system toolkits which include System Data,Coaches,Content Management,System Governance,Responsive Coaches,UI Toolkit,Dashboards,Responsive Portal Components|
   
   2. Click **Toolkit References Analyze** Button to see the toolkit references report.

      ![][analyzer_toolkit_references_report]


[analyzer_toolkit_references]: ../images/analyzer/analyzer_toolkit_references.png
[analyzer_toolkit_references_report]: ../images/analyzer/analyzer_toolkit_references_report.png

[1]: ../administration/administration-bpm-configuration.html
