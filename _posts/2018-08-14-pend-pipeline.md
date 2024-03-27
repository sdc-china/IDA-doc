---
title: "Pend pipeline"
category: pipeline
date: 2018-08-14 16:55:50
last_modified_at: 2024-03-27 19:15:50
---

# Pend Pipeline
***

# Two Pending types
1. pending by approver on pipeline stage.
2. pending by custom policy on deployment step.


## Pending by approver on stage.

### Enable **Pre-stage Approval Required** and set **approver** on stage.

 ![][pipeline-set-approver-on-stage]

### Once run pipeline, build becomes pending status. 
The approver user can **approve** or **reject** this buile by click **...** button of this build.

 ![][pipeline-pending-for-approval]

### Approver can approve this stage of build, then build will run.

 ![][pipeline-approve-build]

### Or approver can reject this stage of build, then build will teminate.

 ![][pipeline-reject-build]


## Pending by custom policy on deployment step.

### Enable Migrate Instance by Custom Policy
For the **Migrate Instances** configuration in **deployment** step: <br>
If **Default Policy** is selected, IDA will use the default migration policy. <br>
If **Custom Policy** is selected, IDA will try to download the migration policy from Workflow Center. If the migration policy does not exist, IDA will **pause** the build until the migration policy is created on Workflow Center.

 ![][pipeline-migrate-instance-by-custom-policy]


### Create migration policy on Workflow Center
Login BAW PC workflow center, find **target snapshot** of the process app according the pending status.

 ![][pipeline-pending-by-custom-policy]

 ![][pipeline-PC-find-target-snapshot]

Click **create**, then select the **source snapshot**, then click OK to complete.

 ![][pipeline-PC-create-policy]

 ![][pipeline-PC-select-source-snapshot]

 ![][pipeline-PC-complete-custom-policy]

After custom policy created on Workflow Center, can **resume** build in IDA, once confirm the build will run.

 ![][pipeline-resume-step]

 ![][pipeline-confirm-to-resume]

The pending by custom policy build can also be **cancelled**, after confirm the build will **terminate**.

 ![][pipeline-cancel-pending-step-build]

 ![][pipeline-confirm-cancel-pending-build]

[pipeline-set-approver-on-stage]: ../images/pipeline/pipeline-set-approver-on-stage.png
[pipeline-pending-for-approval]: ../images/pipeline/pipeline-pending-for-approval.png
[pipeline-approve-build]: ../images/pipeline/pipeline-approve-build.png
[pipeline-reject-build]: ../images/pipeline/pipeline-reject-build.png
[pipeline-migrate-instance-by-custom-policy]: ../images/pipeline/pipeline-migrate-instance-by-custom-policy.png
[pipeline-pending-by-custom-policy]: ../images/pipeline/pipeline-pending-by-custom-policy.png
[pipeline-PC-find-target-snapshot]: ../images/pipeline/pipeline-PC-find-target-snapshot.png
[pipeline-PC-create-policy]: ../images/pipeline/pipeline-PC-create-policy.png
[pipeline-PC-select-source-snapshot]: ../images/pipeline/pipeline-PC-select-source-snapshot.png
[pipeline-PC-complete-custom-policy]: ../images/pipeline/pipeline-PC-complete-custom-policy.png
[pipeline-resume-step]: ../images/pipeline/pipeline-resume-step.png
[pipeline-confirm-to-resume]: ../images/pipeline/pipeline-confirm-to-resume.png
[pipeline-cancel-pending-step-build]: ../images/pipeline/pipeline-cancel-pending-step-build.png
[pipeline-confirm-cancel-pending-build]: ../images/pipeline/pipeline-confirm-cancel-pending-build.png












