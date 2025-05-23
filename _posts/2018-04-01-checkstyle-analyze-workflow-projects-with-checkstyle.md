---
title: "Analyze Workflow Projects with Checkstyle"
category: checkstyle
date: 2018-04-01 20:17:55
last_modified_at: 2025-05-22 15:26:00
---

# Analyze Workflow Projects with Checkstyle
***

## Setting up the Workflow project and performing it

   1. Use the BAW server or upload a TWX file to analyze.

      **Use the BAW server**, fill in the below field values for the Checkstyle form.

      ![][checkstyle_checkstyleform]{:width="100%"}
      
      |   Parameter   | Description    |
      | ------------- |----------------|
      | [Server][1]   | Server environment|
      | Process App   | Process app list on the selected server|
      | Toolkit       | Toolkits of the selected server|
      | Branch        | The branch of the selected process app or the selected toolkit|
      | Snapshot      | The snapshot of the selected branch|
      | Tip           | The tip snapshot of the process app|
      | Ignore Empty Documentation| Ignoring the empty documentation check|
      | Ignore JS Coding Style Check| Ignore the JS coding style check|

      **Upload a TWX file**, choose the TWX tab.

      ![][checkstyle_checkstyleupload]{:width="100%"}

      You can choose or drop a TWX file.

      ![][checkstyle_checkstyleupload_drop]{:width="40%"}<br>
      ![][checkstyle_checkstyleupload_done]{:width="40%"}

   2. Click the **Analyze** Button to see the Checkstyle report.

      ![][tutorial_checkstyle_report]{:width="100%"}


[checkstyle_checkstyleform]: ../images/checkstyle/checkstyle_checkstyleform.PNG
[checkstyle_checkstyleupload]: ../images/checkstyle/checkstyle_checkstyleupload.PNG
[checkstyle_checkstyleupload_drop]: ../images/checkstyle/checkstyle_checkstyleupload_drop.PNG
[checkstyle_checkstyleupload_done]: ../images/checkstyle/checkstyle_checkstyleupload_done.PNG
[tutorial_checkstyle_report]: ../images/tutorial/tutorial_checkstyle_report.PNG

[1]: ../administration/administration-baw-configuration.html