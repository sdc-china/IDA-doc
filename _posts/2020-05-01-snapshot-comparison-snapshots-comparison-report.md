---
title: "Snapshot Comparison Report"
category: snapshot-comparison
date: 2018-10-06 15:17:55
last_modified_at: 2019-07-29 15:26:00
order: 2
---

# Report Details

On the left is the old snapshot, and on the right is the new snapshot. The name of the snapshot and the time of creation are in front of the artifact changes.

![][snanshot-comparison-name-of-snapshot]


The changes of one artifact are in one panel:

![][snapshot-comparison-artifact-changes]

The artifact type and artifact name place on the panel header. In this case, **Process** is the artifact type, and **Standard HR Open New Position** is the artifact name.

All changes which belong to one block in Web PD will be grouped in one panel in IDA.

![][bpm-changes]

![][change-in-ida]

The left side of the semicolon is the path and the right side is the actual value.

The **plus sign** before the artifact type indicates that the artifact is added in the new snapshot.

The **minus sign** before the artifact type indicates that the artifact has been deleted in the new snapshot.


# Filter buttons

IDA provides two kinds of filter buttons: artifact type and properties. You can filter the report by them.


[bpm-changes]: ../images/snapshot-comparison/bpm-changes.png
[change-in-ida]: ../images/snapshot-comparison/change-in-ida.png
[snapshot-comparison-artifact-changes]: ../images/snapshot-comparison/snapshot-comparison-artifact-changes.png
[snapshot-comparison-report]: ../images/snapshot-comparison/snapshot-comparison-report.png
[snanshot-comparison-name-of-snapshot]: ../images/snapshot-comparison/snanshot-comparison-name-of-snapshot.png