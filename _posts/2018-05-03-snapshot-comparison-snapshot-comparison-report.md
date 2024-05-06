---
title: "Snapshot Comparison Report"
category: snapshot-comparison
date: 2018-05-03 15:17:55
last_modified_at: 2022-10-28 15:26:00
---

# Snapshot Comparison Report

On the left is the old snapshot, and on the right is the new snapshot. The name of the snapshot and the time of creation are in front of the artifact changes.

![][snanshot-comparison-name-of-snapshot]

## Menu

There are three types of changes: **Add**, **Update**, **Delete**.

If it is an add change, there will be a green **A**.

![][merge-report-menu-add]{:width="40%"}

If it is an update change, there will be a yellow **U**.

![][merge-report-menu-update]{:width="40%"}

If it is a delete change, there will be a red **D**.

![][merge-report-menu-delete]{:width="40%"}

IDA provides a filter button. The user can filter the artifact by **Change Type/Artifact Type/Properties**.

![][merge-report-menu-filter]{:width="60%"}

## Change History

Comparative historical results of an artifact of the same branch.

![][change-history-same-branch]

Comparative historical results of an artifact from different branches. The modification history of the old snapshot is at the top, and the modification history of the new snapshot is at the bottom.

![][change-history-different-branches]

## Process Comparison
The changes of one artifact are in one panel:

![][snapshot-comparison-artifact-changes]

The artifact type and artifact name are placed on the panel header. In this case, **Process** is the artifact type, and **Standard HR Open New Position** is the artifact name.

All changes which belong to one block in Web PD will be grouped in one panel in IDA.

![][bpm-changes]

![][change-in-ida]

The left side of the semicolon is the path, and the right side is the actual value.

The **plus sign** before the artifact type indicates that the artifact is added in the new snapshot.

The **minus sign** before the artifact type indicates that the artifact has been deleted in the new snapshot.

## Coach Comparison

The changes of each coach control are listed in separate sub-panels under the Human Service. For example, in this case, 4 coach controls are changed and listed in 4 sub-panels under the Client-Side Human Service **Create Position Request CSHS**.

![][snapshot-comparison-coach-changes]

The sub-panel title specifies the location of a coach control. For example, in this case, the coach control labeled Position Request inside the coach name "Create position request" is changed.

![][snapshot-comparison-coach-control-changes]

A new coach control is listed in a sub-panel with a green **plus sign** on the left. For example, the control button Cancel is added in the Buttons section of the control Position Request:

![][snapshot-comparison-coach-control-added-webpd]

![][snapshot-comparison-coach-control-added]

A removed coach control is listed in a sub-panel with a red **minus sign** on the left. For example, the control Requisition CV in Section 2 of the control Position Request is deleted:

![][snapshot-comparison-coach-control-deleted]

The configuration/position/event changes of a coach control are listed in the content of the sub-panel. For example:

- The color configuration of the control Position Request is updated from Primary to Default:

  ![][snapshot-comparison-coach-control-config-changes-webpd]

  ![][snapshot-comparison-coach-control-config-changes]

- The event scripts of the control Requisition Number placed in the control Position Request are added:

  ![][snapshot-comparison-coach-control-event-changes-webpd]

  ![][snapshot-comparison-coach-control-event-changes]

  Notice the green **plus sign** indicates newly added content.

- The positioning of the control Position CV placed in Section 2 of the control Position Request is updated to 100:

  ![][snapshot-comparison-coach-control-positioning-changes-webpd]

  ![][snapshot-comparison-coach-control-positioning-changes]

## Service Comparison

The changes of each item on the service flow are listed in sub-panels.

  ![][snapshot-comparison-sf-changes]

For example, the data mapping change of the service task item Service is listed as follows:

  ![][snapshot-comparison-sf-mapping-changes-webpd]

  ![][snapshot-comparison-sf-mapping-changes]

The script changes are listed in separate sub-panels. For example, the change of line 4 of the script item populateApprovalList is listed as follows:

  ![][snapshot-comparison-sf-script-changes-webpd]

  ![][snapshot-comparison-sf-script-changes]

The addition of the pre-execution script of the service task item Service is listed as follows:

  ![][snapshot-comparison-sf-prescript-changes-webpd]

  ![][snapshot-comparison-sf-prescript-changes]

The sequence flow change is also listed in a separate sub-panel. For example, the name of the sequence flow is changed and listed as:

  ![][snapshot-comparison-sf-sequence-changes-webpd]

  ![][snapshot-comparison-sf-sequence-changes]

[bpm-changes]: ../images/snapshot-comparison/bpm-changes.png
[change-in-ida]: ../images/snapshot-comparison/change-in-ida.png
[snapshot-comparison-artifact-changes]: ../images/snapshot-comparison/snapshot-comparison-artifact-changes.png
[merge-report-menu-add]: ../images/snapshot-comparison/merge-report-menu-add.png
[merge-report-menu-update]: ../images/snapshot-comparison/merge-report-menu-update.png
[merge-report-menu-delete]: ../images/snapshot-comparison/merge-report-menu-delete.png
[merge-report-menu-filter]: ../images/snapshot-comparison/merge-report-menu-filter.png
[snapshot-comparison-report]: ../images/snapshot-comparison/snapshot-comparison-report.png
[snanshot-comparison-name-of-snapshot]: ../images/snapshot-comparison/snanshot-comparison-name-of-snapshot.png
[snapshot-comparison-coach-changes]: ../images/snapshot-comparison/snapshot-comparison-coach-changes.png
[snapshot-comparison-coach-control-changes]: ../images/snapshot-comparison/snapshot-comparison-coach-control-changes.png
[snapshot-comparison-coach-control-config-changes]: ../images/snapshot-comparison/snapshot-comparison-coach-control-config-changes.png
[snapshot-comparison-coach-control-config-changes-webpd]: ../images/snapshot-comparison/snapshot-comparison-coach-control-config-changes-webpd.png
[snapshot-comparison-coach-control-event-changes]: ../images/snapshot-comparison/snapshot-comparison-coach-control-event-changes.png
[snapshot-comparison-coach-control-event-changes-webpd]: ../images/snapshot-comparison/snapshot-comparison-coach-control-event-changes-webpd.png
[snapshot-comparison-coach-control-positioning-changes]: ../images/snapshot-comparison/snapshot-comparison-coach-control-positioning-changes.png
[snapshot-comparison-coach-control-positioning-changes-webpd]: ../images/snapshot-comparison/snapshot-comparison-coach-control-positioning-changes-webpd.png
[snapshot-comparison-coach-control-added]: ../images/snapshot-comparison/snapshot-comparison-coach-control-added.png
[snapshot-comparison-coach-control-added-webpd]: ../images/snapshot-comparison/snapshot-comparison-coach-control-added-webpd.png
[snapshot-comparison-coach-control-deleted]: ../images/snapshot-comparison/snapshot-comparison-coach-control-deleted.png
[snapshot-comparison-sf-changes]: ../images/snapshot-comparison/snapshot-comparison-sf-changes.png
[snapshot-comparison-sf-script-changes]: ../images/snapshot-comparison/snapshot-comparison-sf-script-changes.png
[snapshot-comparison-sf-script-changes-webpd]: ../images/snapshot-comparison/snapshot-comparison-sf-script-changes-webpd.png
[snapshot-comparison-sf-prescript-changes]: ../images/snapshot-comparison/snapshot-comparison-sf-prescript-changes.png
[snapshot-comparison-sf-prescript-changes-webpd]: ../images/snapshot-comparison/snapshot-comparison-sf-prescript-changes-webpd.png
[snapshot-comparison-sf-sequence-changes]: ../images/snapshot-comparison/snapshot-comparison-sf-sequence-changes.png
[snapshot-comparison-sf-sequence-changes-webpd]: ../images/snapshot-comparison/snapshot-comparison-sf-sequence-changes-webpd.png
[snapshot-comparison-sf-mapping-changes]: ../images/snapshot-comparison/snapshot-comparison-sf-mapping-changes.png
[snapshot-comparison-sf-mapping-changes-webpd]: ../images/snapshot-comparison/snapshot-comparison-sf-mapping-changes-webpd.png
[change-history-same-branch]: ../images/snapshot-comparison/change-history-same-branch.png
[change-history-different-branches]: ../images/snapshot-comparison/change-history-different-branches.png