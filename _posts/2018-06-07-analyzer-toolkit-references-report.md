---
title: "Analyzer - Toolkit References Report"
category: analyzer
date: 2018-06-07 14:17:55
last_modified_at: 2019-11-26 14:50:00
---

# Analyzer - Toolkit References Report
***

## Title

After finishing the toolkit references analysis, the basic information for this application will be displayed in this section, including app name, branch, snapshot, and report date. See the following screenshot.

![][analyzer_toolkit_references_report_title]

## References

This part shows the references of the current process application, the item above the arrow is the name of the current process application/toolkit, the items in the direction indicated by the arrow are the dependencies of the current process application, you can see the toolkit version after the toolkit name. The items can be clicked to filter the References table.

![][analyzer_toolkit_references_report_references]

Unused toolkits are in gray color and cannot be clicked.

![][analyzer_toolkit_references_report_references_unused]

## References Table

This table shows the details of the toolkit references in the current process application.

![][analyzer_toolkit_references_report_references_table]

|   Column                    | Description               |
| --------------------------- |---------------------------|
| Artifact                    |The artifact in the current process application/toolkit|
| Artifact Type               |The type of "Artifact"|
| Using Toolkit               |The toolkit which is used by the current process application/toolkit|
| Using Artifact              |The toolkit artifact which is used by the current process application/toolkit|
| Using Artifact Type         |The type of "Using Artifact"|

## Referenced By (Toolkit Only)

When you analyze a toolkit, this part will be displayed. This part shows the applications using the current toolkit, the item below the arrow is the name of the current toolkit, the applications using the current toolkit are displayed at the beginning of the arrow.

![][analyzer_toolkit_references_report_referenced_by]

## Referenced By Table (Toolkit Only)

When you analyze a toolkit, this part will be displayed. This table shows the referenced by details of the current toolkit.

![][analyzer_toolkit_references_report_referenced_by_report]

|   Column                    | Description               |
| --------------------------- |---------------------------|
| Artifact                    |The artifact in the current toolkit|
| Artifact Type               |The type of "Artifact"|
| Referencing Project         |The process application/toolkit which uses the current toolkit|
| Referencing Artifact        |The artifact of the process application/toolkit which uses the current toolkit|
| Referencing Artifact Type   |The type of "Referencing Artifact"|

[analyzer_toolkit_references_report_title]: ../images/analyzer/analyzer_toolkit_references_report_title.png
[analyzer_toolkit_references_report_references]: ../images/analyzer/analyzer_toolkit_references_report_references.png
[analyzer_toolkit_references_report_references_unused]: ../images/analyzer/analyzer_toolkit_references_report_references_unused.png
[analyzer_toolkit_references_report_references_table]: ../images/analyzer/analyzer_toolkit_references_report_references_table.png
[analyzer_toolkit_references_report_referenced_by]: ../images/analyzer/analyzer_toolkit_references_report_referenced_by.png
[analyzer_toolkit_references_report_referenced_by_report]: ../images/analyzer/analyzer_toolkit_references_report_referenced_by_report.png