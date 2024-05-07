---
title: "Merge Snapshots"
category: snapshot-comparison
date: 2018-05-05 15:17:55
last_modified_at: 2022-12-01 20:00:00
---

# Merge Snapshots
Snapshot merge allows users to compare one snapshot with a trace tip snapshot of a process app. There will be a detailed side-by-side report after this merge operation.

This feature is an experimental function and currently has the following **limitations**:
- Only supports the **updated Script** section in **Service Flow/Human Service/Process**
- Only supports deleting the entire artifact.

## Enable Merge To

Enable the **Snapshot Merge** in Administration Settings. Then the **Merge To** button will show in Comparison.

![][settings-comparison-merge]{:width="100%"}

Field | Description
--- | ---
Snapshot Merge | Enable it to enable Merge To in Comparison.
Snapshot Naming Pattern | This pattern will be used to create a snapshot for an unnamed tip snapshot during merge. The pattern supports variables {MAJOR.MINOR.PATCH}, {yyyyMMddHHmmss}, {yyyyMMdd}, {TRACK}, and {APP_ACRONYM}


## Load Snapshots of a Process App

1. Click the **Comparison** tab.

2. Fill out the form according to the following statement.

	 Parameter             | Description       
	 ----------------------|-------------------
	 [Server][1]           |Server environment.
	 Process App           |Process apps of the selected server.
	 Toolkit               |Toolkits of the selected server.
	 Track                 |The branches of the selected process app or toolkit. Multiple selections allowed. Will load snapshots of the selected branches.
	 Start Date            |Filtration condition. Filter snapshots based on the time at which the snapshot was generated.
	 End Date              |Filtration condition. Filter snapshots based on the time at which the snapshot was generated.
	 Include Unnamed Snapshots|Tip it to load unnamed snapshots. 
	 
	 ![][snapshot-comparison-merge-form]
	 
3. Click **Load Snapshots**. All qualified snapshots are loaded. 

	![][merge-snapshots]
	
	

## Merge Snapshots

Select one snapshot, then click the **Merge To** button. Choose the track to merge.

![][snapshot-comparison-merge-to-button]

If the current tip snapshot of this track is unnamed, the following alert will show, and the user needs to create a new snapshot. 

![][merge-create-snapshot]{:width="60%"}

If the current tip snapshot of this track is named, the following alert will show.

![][merge-exist-snapshot]{:width="60%"}

Click the **Create** / **OK** button and wait for it to finish.
	
After finishing, the button ![][snapshot-comparison-compare-pre-report-icon] will show. Click it to see the merged report.
	
![][snapshot-comparison-merge-report-button]


[settings-comparison-merge]: ../images/snapshot-comparison/settings-comparison-merge.png
[snapshot-comparison-merge-form]: ../images/snapshot-comparison/snapshot-comparison-merge-form.png
[merge-snapshots]: ../images/snapshot-comparison/merge-snapshots.png
[merge-create-snapshot]: ../images/snapshot-comparison/merge-create-snapshot.png
[merge-exist-snapshot]: ../images/snapshot-comparison/merge-exist-snapshot.png
[snapshot-comparison-merge-to-button]: ../images/snapshot-comparison/snapshot-comparison-merge-to-button.png
[snapshot-comparison-compare-pre-report-icon]: ../images/snapshot-comparison/snapshot-comparison-compare-pre-report-icon.png
[snapshot-comparison-merge-report-button]: ../images/snapshot-comparison/snapshot-comparison-merge-report-button.png
[1]: ../administration/administration-baw-configuration.html