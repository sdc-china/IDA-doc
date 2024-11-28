---
title: "Compare Snapshots"
category: snapshot-comparison
date: 2018-05-01 15:17:55
last_modified_at: 2024-11-28 18:00:00
---

# Compare Snapshots
Snapshot Comparison allows users to compare two snapshots of a process app or toolkit. There will be a detailed side-by-side report after the comparison.

## Manage History

1. Click the **Comparison** tab.

2. Fill out the form according to the following table. 

	 Parameter             | Description       
	 ----------------------|-------------------
	 [Server][1]           |Server environment.
	 Process App           |Process apps of the selected server.
	 Toolkit               |Toolkits of the selected server.
		 
	 
    ![][snapshot-comparison-form]
	 
3. After the form is filled in, the history that meets the conditions will be automatically loaded. You can also click the **Reload** button to reload. 

    ![][history]
	
4. After checking, you can click the **Delete** button to delete.

    ![][history-delete]
	

## Compare Snapshots

 1. Click **Compare** button, select the two snapshots you want to compare, then click the **Generate Report** button.

    ![][snapshot-comparison-compare-button]

 2. Wait for the process to finish.
 
    ![][snapshot-comparison-compare-report-waiting]
	
 3. After finishing, the button ![][snapshot-comparison-compare-pre-report-icon] will appear. Click it to see the compared report.
	
    ![][snapshot-comparison-compare-report-link]
    



[snapshot-comparison-form]: ../images/snapshot-comparison/snapshot-comparison-form.png
[history]: ../images/snapshot-comparison/snapshot-comparison-history.png
[history-delete]: ../images/snapshot-comparison/snapshot-comparison-history-delete.png
[snapshot-comparison-compare-pre-report-icon]: ../images/snapshot-comparison/snapshot-comparison-compare-pre-report-icon.png
[snapshot-comparison-compare-button]: ../images/snapshot-comparison/snapshot-comparison-compare-button.png
[snapshot-comparison-compare-report-waiting]: ../images/snapshot-comparison/snapshot-comparison-compare-report-waiting.png
[snapshot-comparison-compare-report-link]: ../images/snapshot-comparison/snapshot-comparison-compare-report-link.png
[1]: ../administration/administration-baw-configuration.html