---
title: "Known Limitation"
category: trouble-shooting
date: 2018-11-02 15:17:55
last_modified_at: 2020-09-27 16:50:00
order: 2
---

# Known Limitation
***
- The IDA plugin only supports Firefox and Chrome.
- The JS window.alert function can't be supported by IDA plugin, so we disable it in IDA plugin.
- IDA firefox plugin doesn't support self-sign certification very well, please use http protocol if you want to use IDA firefox plugin.
- BPM Deployment feature only supports Linux server via SSH (or install SSH server on Windows server).
- Complex parameters can not be passed to the human service.
- Global variables declared in Server Managed files .JS are flagged as "was used before" it was defined in checkstyle report.
- The file upload commands UI.file and UI.bpmFileUploader can't be replayed on IDA Plugin due to browser security issue, but these commands can work on Selenium Grid. So you can record the file upload commands by IDA Plugin, but replay them on Selenium Grid.
- The command UI.close is disabled in IDA plugin which may caused issue in plugin.
- The command UI.confirmOK and UI.confirmCancel aren't supported in IDA plugin.
- BP3 Richtext control replay not working if no value is binding for this control.   
- Some earlier firefox browser version(eg:60.9.0esr) is not automaticlly scrollable when replay the coach case in IDA plug-in, you should install latest firefox browser instead. 
- The BPMoC environment needs to login w3id. To login w3id, it will request a random access code by mobile or email, which can't be supported by IDA.As a workaround, we suggest to login the w3id test account on the vm of Selenium Server manually, so that the IDA can test the BPMoC application by using w3id.
- The window-size argument of selenium grid support for headless mode only.
