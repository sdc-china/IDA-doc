---
title: "Compare Snapshots"
category: snapshot-comparison
date: 2018-05-01 15:17:55
last_modified_at: 2022-10-14 15:26:00
---

# Compare Snapshots
Snapshot Comparison allows users to compare two snapshots inside one trace of a process app. There will be a detailed side-by-side report after the comparison.

## Load Snapshots of a Process App

1. Click the **Comparison** tab.

2. Fill out the form according to the following table.

	 Parameter             | Description       
	 ----------------------|-------------------
	 [Server][1]           |Server environment.
	 Process App           |Process apps of the selected server.
	 Toolkit               |Toolkits of the selected server.
	 Track                 |The branches of the selected process app or toolkit. Multiple selections allowed. Will load snapshots of the selected branches.
	 Start Date            |Filtration condition. Filter snapshots based on the time at which the snapshot was generated.
	 End Date              |Filtration condition. Filter snapshots based on the time at which the snapshot was generated.
	 Include Unnamed Snapshots|Tip it to load unnamed snapshots. 
	 
	 ![][snapshot-comparison-form]
	 
3. Click **Load Snapshots**. All qualified snapshots are loaded. 

	![][snapshots]
	
	

## Compare Snapshots

Select two snapshots, then click the **Compare** button.

![][snapshot-comparison-compare-button]

Wait for the process to finish.
	
After finishing, the button ![][snapshot-comparison-compare-pre-report-icon] will appear. Click it to see the compared report.
	
![][snapshot-comparison-compare-report-button]



[snapshot-comparison-form]: ../images/snapshot-comparison/snapshot-comparison-form.png
[snapshots]: ../images/snapshot-comparison/snapshot-comparison-snapshots.png
[brief-changes]: ../images/snapshot-comparison/snapshot-comparison-brief-changes.png
[snapshot-comparison-compare-pre]: ../images/snapshot-comparison/snapshot-comparison-compare-pre.png
[snapshot-comparison-file-button]: ../images/snapshot-comparison/snapshot-comparison-file-button.png
[snapshot-comparison-compare-pre-report]: ../images/snapshot-comparison/snapshot-comparison-compare-pre-report.png
[snapshot-comparison-compare-pre-report-icon]: ../images/snapshot-comparison/snapshot-comparison-compare-pre-report-icon.png
[snapshot-comparison-compare-button]: ../images/snapshot-comparison/snapshot-comparison-compare-button.png
[snapshot-comparison-compare-report-button]: ../images/snapshot-comparison/snapshot-comparison-compare-report-button.png
[1]: ../administration/administration-baw-configuration.html