---
title: "Approve and Resume Pipeline Build"
category: pipeline
date: 2018-08-14 16:55:50
last_modified_at: 2024-03-28 19:15:50
---

# Approve and Resume Pipeline Build
***

## Pending Pipeline Builds
A pipeline build can be in one of the pending statuses:
1. Pending on a pipeline build stage.
2. Pending on a deployment build step.

Pipelines can also be configured to send email notifications when a build's status changes to pending. Refer to [Pipeline Email Notification](../pipeline/pipeline-pipeline-email-notification.html#on-pending-email-notification).

## Approval on Pipeline Build Stage

If a pipeline build is pending on a build stage, stage approvers can approve or reject the build.

1. Enable **Pre-stage Approval Required** and set **Approvers** on a pipeline stage.
 ![][pipeline-set-approver-on-stage]
2. When a pipeline build is pending on the build stage, one of the approvers can **approve** or **reject** this build by clicking the **...** button of this build.
 ![][pipeline-pending-for-approval]
3. If the approver approves the build stage, the build will continue to run.
 ![][pipeline-approve-build]
4. If the approver rejects the build stage, the build will be terminated.
 ![][pipeline-reject-build]


## Resume on Deployment Build Step

If a pipeline build is pending on a deployment build step due to a missing custom migration policy, pipeline deployers can create the migration policy on Workflow Center and then resume the build. Note that this feature is currently supported on BAW v22.x+.

1. Enable Migrate Instance by Custom Policy. For the **Migrate Instances** option in a **Deployment** step, if **Custom Policy** is selected, IDA will try to download the migration policy from Workflow Center. If the migration policy does not exist, IDA will **pause** the build until the migration policy is created on Workflow Center.
 ![][pipeline-migrate-instance-by-custom-policy]
2. If a pipeline build is pending on a deployment build step due to a missing migration policy, create the required migration policy from source to target snapshot on Workflow Center:
   1. Login to BAW Workflow Center, find the **target snapshot** of the process app according to the pending status message.
    ![][pipeline-pending-by-custom-policy]
    ![][pipeline-PC-find-target-snapshot]
   2. Click **Create migration policy**, then select the **source snapshot**, then click OK to complete. You may need to edit the migration policy to handle orphaned tokens.
    ![][pipeline-PC-create-policy]
    ![][pipeline-PC-select-source-snapshot]
    ![][pipeline-PC-complete-custom-policy]
3. After the custom policy is created on Workflow Center, any user in the pipeline deployer role can click **Resume**, and the build will continue to migrate instances. 
    ![][pipeline-resume-step]
    ![][pipeline-confirm-to-resume]
4. The build can also be **cancelled**. If cancelled, the build will be terminated.
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