---
title: "Analyze Workflow projects with checkstyle"
category: checkstyle
date: 2018-10-06 15:17:55
last_modified_at: 2019-07-29 15:26:00
order: 1
---

# Analyze Workflow projects with checkstyle
***
### Setting up the Workflow project and perform it.

   1. Use BAW server or upload a TWX file to analyze.

      **Use BAW server**, fill the below field values for the checkstyle form.

      ![][checkstyle_checkstyleform]

      |   Parameter   | Description    |
      | ------------- |----------------|
      | [Server][1]   |Server environment|
      | Process App   |Process app list on the selected server|
      | Toolkit       |Toolkits of  selected server|
      | Branch        |The branch of selected process app or selected toolkit|
      |Snapshot       |The snapshot of selected branch|
      |Tip            |The tip snapshot of the process app|
      |Ignore Empty Documentation|Ignoring empty documentation check|
      |Ignore JS Coding Style Check|Ignore JS coding style check check|

      **Upload a TWX file**, choose the TWX tab.

      ![][checkstyle_checkstyleupload]

      You can choose or drop a TWX file.

      ![][checkstyle_checkstyleupload_drop] ![][checkstyle_checkstyleupload_done]

   2. Click **Analyze** Button to see the CheckStyle report.

      ![][tutorial_checkstyle_report]


[checkstyle_checkstyleform]: ../images/checkstyle/checkstyle_checkstyleform.PNG
[checkstyle_checkstyleupload]: ../images/checkstyle/checkstyle_checkstyleupload.PNG
[checkstyle_checkstyleupload_drop]: ../images/checkstyle/checkstyle_checkstyleupload_drop.PNG
[checkstyle_checkstyleupload_done]: ../images/checkstyle/checkstyle_checkstyleupload_done.PNG
[tutorial_checkstyle_report]: ../images/tutorial/tutorial_checkstyle_report.PNG

[1]: ../administration/administration-bpm-configuration.html
