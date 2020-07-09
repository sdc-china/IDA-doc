---
title: "Compare Snapshots"
category: snapshot-comparison
date: 2018-10-06 15:17:55
last_modified_at: 2019-07-29 15:26:00
order: 1
---

Snapshot Comparison allows users to compare two snapshots inside one trace of a process app. There will be a detailed side-by-side report after the comparison.

# Load Snapshots inside One Trace of a Process App

1. In **Labs**, click **Snapshot Comparison** menu.

2. Fill form according to below statement.

	 Parameter             | Description       
	 ----------------------|-------------------
	 [Server][1]           |Server environment.
	 Process App           |Process apps of the selected server.
	 Toolkit               |Toolkits of  selected server.
	 Track                 |The branches of selected process app or toolkit. Multiple select. Will load snapshots of selected branches.
	 Start Time            |Filtration condition. Filter snapshots based on the time at which snapshot was generated.
	 End Time              |Filtration condition. Filter snapshots based on the time at which snapshot was generated.
	 Include Unnamed Snapshots|Tip it to load unnamed snapshots. 
	 
	 ![][snapshot-comparison-form]
	 
3. Click **Load Snapshots**. All qualified snapshots are loaded. 

	![][snapshots]
	
	Click each snapshot to see brief changes from the previous snapshot.
	
	![][brief-changes]
	
	

# Compare Snapshots

There are two ways to compare snapshots.

1. Click button ![][snapshot-comparison-file-button] to compare with previous snapshot.
	
	![][snapshot-comparison-compare-pre]
	
	Waiting for finishing.
	
	After finishing, the button ![][snapshot-comparison-compare-pre-report-icon] will show. Click it to see compared report.

	![][snapshot-comparison-compare-pre-report]

2. Select two snapshots, then the **Compare** button will show. Click it.

	![][snapshot-comparison-compare-button]
	
	Waiting for finishing.
	
	After finishing, the button ![][snapshot-comparison-compare-pre-report-icon] will show. Click it to see compared report.
	
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
[1]: ../administration/administration-bpm-configuration.html
