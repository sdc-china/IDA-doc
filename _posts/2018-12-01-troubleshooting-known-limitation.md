---
title: "Known Limitations"
category: troubleshooting
date: 2018-12-01 15:17:55
last_modified_at: 2023-03-23 16:50:00
---

# Known Limitations
***

- The IDA plugin only supports Firefox and Chrome.
- The JavaScript window.alert function cannot be supported by the IDA plugin, so it is disabled in the IDA plugin.
- The BAW Deployment feature only supports Linux servers via SSH (or install an SSH server on a Windows server).
- Complex parameters cannot be passed to the human service.
- Global variables declared in Server-Managed files (.JS) are flagged as "was used before it was defined" in the checkstyle report.
- The file upload commands UI.file and UI.bpmFileUploader cannot be replayed on the IDA Plugin due to browser security issues, but these commands can work on the Selenium Grid. So you can record the file upload commands by the IDA Plugin, but replay them on the Selenium Grid.
- The command UI.close is disabled in the IDA plugin, which may cause issues in the plugin.
- The commands UI.confirmOK and UI.confirmCancel are not supported in the IDA plugin.
- BP3 Richtext control replay is not working if no value is bound for this control.
- Some earlier Firefox browser versions (e.g., 60.9.0esr) are not automatically scrollable when replaying the coach case in the IDA plug-in. Please install the latest Firefox browser instead.
- If the BPMoC environment integrates with the client's own SSO platform, and it also enables multiple factor authentication (MFA), then IDA cannot support it.
- The window-size argument of the Selenium Grid supports headless mode only.
- Snapshot merge only supports updated Script sections in Service Flow/Human Service/Process.
- Snapshot comparison may show diff results as deletion + addition if an item in Process/Service is renamed, as the item's ID is a UUID which cannot be relied upon to identify the item.
- If IDA and BAW are in different time zones, some display results will be inaccurate. The affected functions include Cleanup Unnamed Snapshots and Create Snapshot in the Merge To function.