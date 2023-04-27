---
title: "Snapshot Merge Report"
category: snapshot-comparison
date: 2018-05-07 15:17:55
last_modified_at: 2022-12-01 20:00:00
---

# Snapshot Merge Report

On the left is the artifacts menu, the user can search and filter the changed artifacts. On the right is the artifact compare result.

![][merge-report-overview]

## Menu

There are three types of change,  **Add**,  **Update**,  **Delete**.

If it is a add change, there will be a green **A**.

![][merge-report-menu-add]{:width="40%"}

If it is a update change, there will be a yellow **U**.

![][merge-report-menu-update]{:width="40%"}

If it is a delete change, there will be a red **D**.

![][merge-report-menu-delete]{:width="40%"}

IDA provides filter button. The user can filter the artifact by **Change Type/Artifact Type/Properties**.

![][merge-report-menu-filter]{:width="60%"}

## Artifact Comparison Report

Click the item in artifacts menu, the artifact comparison report will changed base on the clicked artifact.

![][merge-report-artifact-report]

On top of the report is the basic information. The title displays the type and name of this artifact, below is the tip snapshot and source snapshot information.  

![][merge-report-artifact-report-top]


# Script Merge

In latest version, the IDA support updated Script merge in Service Flow/Human Service/Process. 

## Script Editor

If the script can be merged, there will be three buttons on the panel right.

![][merge-report-script-all-buttons]

Click the ![][merge-report-script-left-arrow]{:width="5%"} icon, the right line will overwrite the left line.

![][merge-report-script-left-arrow-click]

Click the ![][merge-report-script-overwrite]{:width="10%"} button, the whole left script content will be overwritten by right script content.

![][merge-report-script-overwrite-click]

Click the ![][merge-report-script-reload]{:width="10%"} button, the left script content will be reloaded as the tip(original snapshot) version.

![][merge-report-script-reload-click]

Click the ![][merge-report-script-edit]{:width="7%"} button, the Script Edit modal will show, the user can edit the script.

![][merge-report-script-edit-click]{:width="60%"}

If pushed, there will be a button on the panel right.

![][merge-report-script-pushed-buttons]

Click the ![][merge-report-script-original]{:width="10%"} button, the Original Script modal will show, the user can check the original script.

![][merge-report-script-original-click]{:width="60%"}

## Push and Revert

Click the ![][merge-report-artifact-report-push]{:width="10%"} button, an alert window will show as below, click **OK** and all the changes in this artifact will pushed to the BAW server. 

![][merge-report-artifact-report-push-alert]{:width="60%"}

After pushed successfully, the ![][merge-report-artifact-report-revert]{:width="10%"} button will show. Click the ![][merge-report-artifact-report-revert]{:width="10%"} button, an alert window will show as below, click **OK** and all the changes will be reverted.

![][merge-report-artifact-report-revert-alert]{:width="60%"}



[merge-report-overview]: ../images/snapshot-comparison/merge-report-overview.png
[merge-report-menu-add]: ../images/snapshot-comparison/merge-report-menu-add.png
[merge-report-menu-update]: ../images/snapshot-comparison/merge-report-menu-update.png
[merge-report-menu-delete]: ../images/snapshot-comparison/merge-report-menu-delete.png
[merge-report-menu-filter]: ../images/snapshot-comparison/merge-report-menu-filter.png
[merge-report-artifact-report]: ../images/snapshot-comparison/merge-report-artifact-report.png
[merge-report-artifact-report-top]: ../images/snapshot-comparison/merge-report-artifact-report-top.png
[merge-report-artifact-report-push]: ../images/snapshot-comparison/merge-report-artifact-report-push.png
[merge-report-artifact-report-revert]: ../images/snapshot-comparison/merge-report-artifact-report-revert.png
[merge-report-artifact-report-push-alert]: ../images/snapshot-comparison/merge-report-artifact-report-push-alert.png
[merge-report-artifact-report-revert-alert]: ../images/snapshot-comparison/merge-report-artifact-report-revert-alert.png
[merge-report-script-all-buttons]: ../images/snapshot-comparison/merge-report-script-all-buttons.png
[merge-report-script-left-arrow]: ../images/snapshot-comparison/merge-report-script-left-arrow.png
[merge-report-script-overwrite]: ../images/snapshot-comparison/merge-report-script-overwrite.png
[merge-report-script-reload]: ../images/snapshot-comparison/merge-report-script-reload.png
[merge-report-script-edit]: ../images/snapshot-comparison/merge-report-script-edit.png
[merge-report-script-original]: ../images/snapshot-comparison/merge-report-script-original.png
[merge-report-script-left-arrow-click]: ../images/snapshot-comparison/merge-report-script-left-arrow-click.png
[merge-report-script-overwrite-click]: ../images/snapshot-comparison/merge-report-script-overwrite-click.png
[merge-report-script-reload-click]: ../images/snapshot-comparison/merge-report-script-reload-click.png
[merge-report-script-edit-click]: ../images/snapshot-comparison/merge-report-script-edit-click.png
[merge-report-script-original-click]: ../images/snapshot-comparison/merge-report-script-original-click.png
[merge-report-script-pushed-buttons]: ../images/snapshot-comparison/merge-report-script-pushed-buttons.png