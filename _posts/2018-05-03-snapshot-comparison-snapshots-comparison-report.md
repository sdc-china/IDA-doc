---
title: "Snapshot Comparison Report"
category: snapshot-comparison
date: 2018-05-03 15:17:55
last_modified_at: 2022-10-28 15:26:00
order: 2
---

# Snapshot Comparison Report Details

On the left is the old snapshot, and on the right is the new snapshot. The name of the snapshot and the time of creation are in front of the artifact changes.

![][snanshot-comparison-name-of-snapshot]

## Process Comparison
The changes of one artifact are in one panel:

![][snapshot-comparison-artifact-changes]

The artifact type and artifact name place on the panel header. In this case, **Process** is the artifact type, and **Standard HR Open New Position** is the artifact name.

All changes which belong to one block in Web PD will be grouped in one panel in IDA.

![][bpm-changes]

![][change-in-ida]

The left side of the semicolon is the path and the right side is the actual value.

The **plus sign** before the artifact type indicates that the artifact is added in the new snapshot.

The **minus sign** before the artifact type indicates that the artifact has been deleted in the new snapshot.

## Coach Comparison

The changes of each coach control are listed in a separate sub-panel under the Human Service. For example in this case, 5 coach controls are changed and listed in 5 sub-panels under Client-Side Human Service **Create Position Request CSHS**.

![][snapshot-comparison-coach-changes]

The sub-panel title specify the location of a coach control. For exmaple in this case, coach control labeled Position Request inside coach name Create position request is changed.

![][snapshot-comparison-coach-control-changes]

A new coach control is listed in a sub-panel with a green **plus sign** in the left. For example, control button Cancel is added in the Buttons section of control Position Request:

![][snapshot-comparison-coach-control-added-webpd]

![][snapshot-comparison-coach-control-added]

A removed coach control is listed in a sub-panel with a red **minus sign** in the left. For example, control Requisition CV in Section 2 of control Position Request is deleted:

![][snapshot-comparison-coach-control-deleted]

The configuration/position/event changes of a coach control are listed in content of the sub-panel. For example:

- The color configuration of control Position Request is updated from Primary to Default:

  ![][snapshot-comparison-coach-control-config-changes-webpd]

  ![][snapshot-comparison-coach-control-config-changes]

- The event scripts of control Requisition number placed in control Position Request is added: 

  ![][snapshot-comparison-coach-control-event-changes-webpd]

  ![][snapshot-comparison-coach-control-event-changes]

  Notice the green **plus sign** indicates newly added content.

- The poistioning of control Position CV placed in Section 2 of control Position Request is updated to 100:
 
  ![][snapshot-comparison-coach-control-positioning-changes-webpd]

  ![][snapshot-comparison-coach-control-positioning-changes]

## Service Comparison

The changes of each item on the service flow are listed in sub-panels.

  ![][snapshot-comparison-sf-changes]

For example, data mapping change of the service task item Service is listed as follows:

  ![][snapshot-comparison-sf-mapping-changes-webpd]
 
  ![][snapshot-comparison-sf-mapping-changes]

The script changes are listed in separate sub-panels, for example change of line 4 of the script item populateApprovalList is listed as follows:

  ![][snapshot-comparison-sf-script-changes-webpd]
 
  ![][snapshot-comparison-sf-script-changes]
  
And the addition of pre-excution script of the service task item Service is listed as follows:

  ![][snapshot-comparison-sf-prescript-changes-webpd]
 
  ![][snapshot-comparison-sf-prescript-changes]

Sequence flow change is also listed in a separate sub-panel. For example, the name of sequence flow is changed and listed as:

  ![][snapshot-comparison-sf-sequence-changes-webpd]
 
  ![][snapshot-comparison-sf-sequence-changes]


# Filter buttons

IDA provides two kinds of filter buttons: artifact type and properties. You can filter the report by them.


[bpm-changes]: ../images/snapshot-comparison/bpm-changes.png
[change-in-ida]: ../images/snapshot-comparison/change-in-ida.png
[snapshot-comparison-artifact-changes]: ../images/snapshot-comparison/snapshot-comparison-artifact-changes.png
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