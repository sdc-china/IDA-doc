---
title: "Pipeline Email Notification"
category: pipeline
date: 2018-08-08 15:17:55
last_modified_at: 2024-03-25 16:53:00
---

# Pipeline Email Notification
***

## Pipeline Email Server Configuration

 Refer to [Pipeline configuration](../administration/administration-settings-configuration.html#pipeline-configuration) to configure IDA email server.

## Pipeline Email Notification Configuration

  In pipeline definition, there is Email Notification section which allows users to configure pipeline email notification when pipeline build is pending, successful or failed.

### On Success Email and On Failure Email Notification

  Enable On Success/On Failure Email Notification. In the **To** field, enter a comma-separated list of recipients' emails. In the **Subject** and **Message** fields, enter email subject and message body templates which can use supported template parameters.

  ![][pipeline_email_notification_success_failure]

  
### On Pending Email Notification

  Enable On Pending Email Notification. In the **To** field, recipients' emails will be generated based on approvers of the pending stage or resumers of the pending step. In the **Subject** and **Message** fields, enter email subject and message body templates which can use supported template parameters.

  ![][pipeline_email_notification_pending]

  At least 1 of the pending stage approvers or pending step resumers must have email configured in user profile:

  ![][pipeline_email_notification_user_profile]


### Supported Email Template Parameters:

**${PIPELINE_NAME}**: current pipeline name
  <br>
  **${PIPELINE_ID}**: current pipeline ID
  <br>
  **${STAGE_NAME}**: current stage name
  <br>
  **${STEP_NAME}**: current step name
  <br>
  **${BUILD_ID}**: current build id
  <br>
  **${BUILD_REPORT_URL}**: current build report URL
  <br>
  **${APP_ACRONYM}**: current processApp acronym name
  <br>
  **${SNAPSHOT_ACRONYM}**: current snapshot acronym name
  <br>


[pipeline_email_notification_success_failure]: ../images/pipeline/pipeline_email_notification_success_failure.png
[pipeline_email_notification_pending]: ../images/pipeline/pipeline_email_notification_pending.png
[pipeline_email_notification_user_profile]: ../images/pipeline/pipeline_email_notification_user_profile.png
