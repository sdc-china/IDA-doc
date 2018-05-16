---
layout: page
title: "Analyze BPM projects with checkstyle"
category: checkstyle
date: 2018-01-05 15:17:55
order: 1
---

### Setting up the BPM project and perform it.

   1. Fill the below field values for the checkstyle form.

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
    
   2. Click **Analyze** Button to see the CheckStyle report.
   
      ![][tutorial_checkstyle_report]

   
[checkstyle_checkstyleform]: ../images/checkstyle/checkstyle_checkstyleform.PNG
[tutorial_checkstyle_button]: ../images/tutorial/tutorial_checkstyle_button.PNG

[1]: ../administration/administration-bpm-configuration.html
