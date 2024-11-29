---
title: "Merge Snapshots"
category: snapshot-comparison
date: 2018-05-05 15:17:55
last_modified_at: 2024-11-29 11:00:00
---

# Merge Snapshots
Snapshot merge allows users to compare one snapshot with a trace tip snapshot of a process app. There will be a detailed side-by-side report after this merge operation.

This feature is an experimental function and currently has the following **limitations**:
- Only supports the **updated Script** section in **Service Flow/Human Service/Process**
- Only supports overwriting the entire artifact in **Service Flow/Human Service/Process**
- Only supports deleting the entire artifact.
- Only supports adding the entire artifact.

## Enable Merge To

Enable the **Snapshot Merge** in Administration Settings. Then the **Merge To** button will show in Comparison.

![][settings-comparison-merge]{:width="100%"}

Field | Description
--- | ---
Snapshot Merge | Enable it to enable Merge To in Comparison.
Snapshot Naming Pattern | This pattern will be used to create a snapshot for an unnamed tip snapshot during merge. The pattern supports variables {MAJOR.MINOR.PATCH}, {yyyyMMddHHmmss}, {yyyyMMdd}, {TRACK}, and {APP_ACRONYM}


## Manage History

1. Click the **Comparison** tab.

2. Fill out the form according to the following statement.

	 Parameter             | Description       
	 ----------------------|-------------------
	 [Server][1]           |Server environment.
	 Process App           |Process apps of the selected server.
	 Toolkit               |Toolkits of the selected server.
	 Track                 |The branches of the selected process app or toolkit. Multiple selections allowed. Will load snapshots of the selected branches.
	 
	 ![][snapshot-comparison-merge-form]
	 
3. After the form is filled in, the history that meets the conditions will be automatically loaded. You can also click the **Reload** button to reload. 

    ![][history]
	
4. After checking, you can click the **Delete** button to delete.

    ![][history-delete]
	

## Merge Snapshots

1. Click **Merge** button, select the new snapshot and the base branch you want to merge, then click the **Generate Report** button.

    ![][snapshot-comparison-merge-button]

If the current tip snapshot of this track is unnamed, the following alert will show, and the user needs to create a new snapshot. 

    ![][merge-create-snapshot]{:width="60%"}


 2. Wait for the process to finish.
  
    ![][snapshot-comparison-merge-report-waiting]
	
 3. After finishing, the button ![][snapshot-comparison-compare-pre-report-icon] will appear. Click it to see the compared report.
	
    ![][snapshot-comparison-merge-report-link]
    

[settings-comparison-merge]: ../images/snapshot-comparison/settings-comparison-merge.png
[snapshot-comparison-merge-form]: ../images/snapshot-comparison/snapshot-comparison-form.png
[history]: ../images/snapshot-comparison/snapshot-comparison-merge-history.png
[history-delete]: ../images/snapshot-comparison/snapshot-comparison-merge-history-delete.png
[snapshot-comparison-merge-button]: ../images/snapshot-comparison/snapshot-comparison-merge-button.png
[merge-create-snapshot]: ../images/snapshot-comparison/merge-create-snapshot.png
[snapshot-comparison-compare-pre-report-icon]: ../images/snapshot-comparison/snapshot-comparison-compare-pre-report-icon.png
[snapshot-comparison-merge-report-waiting]: ../images/snapshot-comparison/snapshot-comparison-merge-report-waiting.png
[snapshot-comparison-merge-report-link]: ../images/snapshot-comparison/snapshot-comparison-merge-report-link.png
[1]: ../administration/administration-baw-configuration.html