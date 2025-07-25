---
title: "Pipeline Email Notification"
category: pipeline
date: 2018-08-08 15:17:55
last_modified_at: 2024-03-25 16:53:00
---

# Pipeline Email Notification
***

## Pipeline Email Server Configuration

Refer to [Pipeline configuration](../administration/administration-settings-configuration.html#pipeline-configuration) to configure the IDA email server.

## Pipeline Email Notification Configuration

In the pipeline definition, there is an Email Notification section which allows users to configure pipeline email notifications when the pipeline build is pending, successful, or failed.

### On Success Email and On Failure Email Notification

Enable On Success/On Failure Email Notification. In the **To** field, enter a comma-separated list of recipients' emails. In the **Subject** and **Message** fields, enter email subject and message body templates which can use supported template parameters.

![][pipeline_email_notification_success_failure]

### On Pending Email Notification

Enable On Pending Email Notification. In the **To** field, recipients' emails will be generated based on approvers of the pending stage or resumers of the pending step. In the **Subject** and **Message** fields, enter email subject and message body templates which can use supported template parameters.

![][pipeline_email_notification_pending]

At least 1 of the pending stage approvers or pending step resumers must have an email configured in their user profile:

![][pipeline_email_notification_user_profile]

### Supported Email Template Parameters:

**${PIPELINE_NAME}**: current pipeline name
<br>
**${PIPELINE_ID}**: current pipeline ID
<br>
**${BUILD_ID}**: current build ID
<br>
**${BUILD_STATUS}**: current build status
<br>
**${BUILD_STATUS_DESCRIPTION}**: current build status description
<br>
**${BUILD_REPORT_URL}**: current build report URL
<br>
**${APP_NAME}**: current processApp name
<br>
**${APP_ACRONYM}**: current processApp acronym name
<br>
**${SNAPSHOT_NAME}**: current snapshot name
<br>
**${SNAPSHOT_ACRONYM}**: current snapshot acronym name
<br>
**${CURRENT_STAGE}**: current stage name
<br>
**${CURRENT_STEP}**: current step name
<br>
**${STAGE*i*_CHECKSTYLE_SCORE}**: checkstyle score from stage *i*, replace *i* with stage index, e.g. ${STAGE1_CHECKSTYLE_SCORE}
<br>
**${STAGE*i*_SERVER_NAME}**: configured server name on stage *i*, replace *i* with stage index, e.g. ${STAGE1_SERVER_NAME}
<br>


[pipeline_email_notification_success_failure]: ../images/pipeline/pipeline_email_notification_success_failure.png
[pipeline_email_notification_pending]: ../images/pipeline/pipeline_email_notification_pending.png
[pipeline_email_notification_user_profile]: ../images/pipeline/pipeline_email_notification_user_profile.png
