---
title: "Snapshot Merge Report"
category: snapshot-comparison
date: 2018-05-07 15:17:55
last_modified_at: 2024-05-27 13:00:00
---

# Snapshot Merge Report

On the left is the artifacts menu, the user can search and filter the changed artifacts. On the right is the artifact comparison result.

![][merge-report-overview]

## Menu

There are three types of changes: **Add**, **Update**, **Delete**.

If it is an add change, there will be a green **A**.

![][merge-report-menu-add]{:width="40%"}

If it is an update change, there will be a yellow **U**.

![][merge-report-menu-update]{:width="40%"}

If it is a delete change, there will be a red **D**.

![][merge-report-menu-delete]{:width="40%"}

IDA provides a filter button. The user can filter the artifacts by **Change Type/Artifact Type/Properties**.

![][merge-report-menu-filter]{:width="60%"}

The user can filter the artifact by **Editor**.

![][merge-report-menu-filter-user]{:width="60%"}

## Change History

Comparative historical results of an artifact of the same branch.

![][change-history-same-branch]

Comparative historical results of an artifact from different branches. The modification history of the old snapshot is at the top, and the modification history of the new snapshot is at the bottom.

![][change-history-different-branches]

## Artifact Merge Report

Click the item in the artifacts menu, and the artifact comparison report will change based on the clicked artifact.

![][merge-report-artifact-report]

On top of the report is the basic information. The title displays the type and name of this artifact, below is the tip snapshot and source snapshot information.

![][merge-report-artifact-report-top]

# Script Merge

In the latest version, IDA supports script merging in Service Flow/Human Service/Process.

## Script Editor

If the script can be merged, there will be three buttons on the panel on the right.

![][merge-report-script-all-buttons]

Click the ![][merge-report-script-left-arrow]{:width="5%"} icon, and the right line will overwrite the left line.

![][merge-report-script-left-arrow-click]

Click the ![][merge-report-script-overwrite]{:width="10%"} button, and the whole left script content will be overwritten by the right script content.

![][merge-report-script-overwrite-click]

Click the ![][merge-report-script-reload]{:width="10%"} button, and the left script content will be reloaded as the tip (original snapshot) version.

![][merge-report-script-reload-click]

Click the ![][merge-report-script-edit]{:width="7%"} button, and the Script Edit modal will show, allowing the user to edit the script.

![][merge-report-script-edit-click]{:width="60%"}

If pushed, there will be a button on the panel on the right.

![][merge-report-script-pushed-buttons]

Click the **Original Script** button, and the Original Script modal will show, allowing the user to check the original script.

![][merge-report-script-original-click]{:width="60%"}


## Undo All Changes

Click the **Undo All Changes** button, all the scripts changes will be reverted.

![][merge-report-script-undo-all-button]

## Commit And Undo

Click the ![][merge-report-artifact-report-commit]{:width="10%"} button, if the change type is **Update** and there are some scripts changes in the **Script Editor**, an alert window will show as below. Click **OK**, and all the changes in this artifact will be saved to local.

![][merge-report-artifact-report-push-alert]{:width="60%"}

Click the ![][merge-report-artifact-report-commit]{:width="10%"} button, if the change type is **Update** and there is no scripts changes in the **Script Editor**, an alert window will show as below. Click **OK**, the artifact will be overwritten and the changes will be saved to local.

![][merge-report-artifact-report-push-overwrite-alert]{:width="60%"}

Click the ![][merge-report-artifact-report-commit]{:width="10%"} button, if the change type is **Add**, an alert window will show as below. Click **OK**, the artifact will be added and the changes will be saved to local.

![][merge-report-artifact-report-push-add-alert]{:width="60%"}

Click the ![][merge-report-artifact-report-commit]{:width="10%"} button, if the change type is **Delete**, an alert window will show as below. Click **OK**, the artifact will be deleted and the changes will be saved to local.

![][merge-report-artifact-report-push-delete-alert]{:width="60%"}

After committed successfully, the ![][merge-report-artifact-report-undo]{:width="10%"} button will show. Click the ![][merge-report-artifact-report-undo]{:width="10%"} button, and an alert window will show as below. Click **OK**, and all the changes will be reverted.

![][merge-report-artifact-report-revert-alert]{:width="60%"}


## Merge

After completing the commit operations, click the name of the application and we can return to the commit details page. If you want to submit all commits in the **Artifacts Committed** tab page to the BAW server, click the ![][merge-report-artifact-report-merge]{:width="10%"} button, a confirm window will pop up, and you can modify the name and comments of the snapshot created after the merge is successfully completed.

![][merge-report-artifact-report-merge-details]

![][merge-report-artifact-report-merge-comments]

After the merge is completed, you can switch between the **Artifacts Merged** tab and the **Snapshots Created** tab to view the information.

![][merge-report-artifact-report-merge-details-merged]

![][merge-report-artifact-report-merge-details-history]


## Close And Reopen

Click the **Close** button to close the report. After the report is closed, commit and merge operations can no longer be performed.

![][merge-report-artifact-report-close]

![][merge-report-artifact-report-close-warning]

The closed report can be opened by clicking **Reopen** button.

![][merge-report-artifact-report-reopen]
    
    

[merge-report-overview]: ../images/snapshot-comparison/merge-report-overview.png
[merge-report-menu-add]: ../images/snapshot-comparison/merge-report-menu-add.png
[merge-report-menu-update]: ../images/snapshot-comparison/merge-report-menu-update.png
[merge-report-menu-delete]: ../images/snapshot-comparison/merge-report-menu-delete.png
[merge-report-menu-filter]: ../images/snapshot-comparison/merge-report-menu-filter.png
[merge-report-menu-filter-user]: ../images/snapshot-comparison/merge-report-menu-filter-user.png
[merge-report-artifact-report]: ../images/snapshot-comparison/merge-report-artifact-report.png
[merge-report-artifact-report-top]: ../images/snapshot-comparison/merge-report-artifact-report-top.png
[merge-report-artifact-report-commit]: ../images/snapshot-comparison/merge-report-artifact-report-commit.png
[merge-report-artifact-report-undo]: ../images/snapshot-comparison/merge-report-artifact-report-undo.png
[merge-report-artifact-report-push-alert]: ../images/snapshot-comparison/merge-report-artifact-report-push-alert.png
[merge-report-artifact-report-push-overwrite-alert]: ../images/snapshot-comparison/merge-report-artifact-report-push-overwrite-alert.png
[merge-report-artifact-report-revert-alert]: ../images/snapshot-comparison/merge-report-artifact-report-revert-alert.png
[merge-report-artifact-report-push-add-alert]: ../images/snapshot-comparison/merge-report-artifact-report-push-add-alert.png
[merge-report-artifact-report-push-delete-alert]: ../images/snapshot-comparison/merge-report-artifact-report-push-delete-alert.png
[merge-report-script-all-buttons]: ../images/snapshot-comparison/merge-report-script-all-buttons.png
[merge-report-script-left-arrow]: ../images/snapshot-comparison/merge-report-script-left-arrow.png
[merge-report-script-overwrite]: ../images/snapshot-comparison/merge-report-script-overwrite.png
[merge-report-script-reload]: ../images/snapshot-comparison/merge-report-script-reload.png
[merge-report-script-edit]: ../images/snapshot-comparison/merge-report-script-edit.png
[merge-report-script-left-arrow-click]: ../images/snapshot-comparison/merge-report-script-left-arrow-click.png
[merge-report-script-overwrite-click]: ../images/snapshot-comparison/merge-report-script-overwrite-click.png
[merge-report-script-reload-click]: ../images/snapshot-comparison/merge-report-script-reload-click.png
[merge-report-script-edit-click]: ../images/snapshot-comparison/merge-report-script-edit-click.png
[merge-report-script-original-click]: ../images/snapshot-comparison/merge-report-script-original-click.png
[merge-report-script-pushed-buttons]: ../images/snapshot-comparison/merge-report-script-pushed-buttons.png
[change-history-same-branch]: ../images/snapshot-comparison/change-history-same-branch.png
[change-history-different-branches]: ../images/snapshot-comparison/change-history-different-branches.png
[merge-report-script-undo-all-button]: ../images/snapshot-comparison/merge-report-script-undo-all-button.png
[merge-report-artifact-report-merge]: ../images/snapshot-comparison/merge-report-artifact-report-merge.png
[merge-report-artifact-report-close]: ../images/snapshot-comparison/merge-report-artifact-report-close.png
[merge-report-artifact-report-close-warning]: ../images/snapshot-comparison/merge-report-artifact-report-close-warning.png
[merge-report-artifact-report-reopen]: ../images/snapshot-comparison/merge-report-artifact-report-reopen.png
[merge-report-artifact-report-merge-comments]: ../images/snapshot-comparison/merge-report-artifact-report-merge-comments.png
[merge-report-artifact-report-merge-details]: ../images/snapshot-comparison/merge-report-artifact-report-merge-details.png
[merge-report-artifact-report-merge-details-merged]: ../images/snapshot-comparison/merge-report-artifact-report-merge-details-merged.png
[merge-report-artifact-report-merge-details-history]: ../images/snapshot-comparison/merge-report-artifact-report-merge-details-history.png