---
title: "Dynamic Assignee"
category: test
date: 2018-10-06 15:17:55
last_modified_at: 2019-10-25 15:24:00
order: 80
---

# Dynamic Assignee
***
If the assignee with same display name, then the IDA could select right bpm user when run the test case on different BPM Servers.


## Overview

Sometimes you may want to run a test case with different bpm users on different BPM servers. The IDA make it possiable that you need not modify the test case when run it with different bpm users.For example, there is a case step need the a bpm user named devTester on the BPM 860 DEV server and another bpm user named qaTester on the BPM 860 QA server, the IDA could select right bpm user when running the test case according the selected BPM server.


## BPM User Configuration

1. Go to "Administration -> BPM Configuration". Select BPM 860 DEV Server and click "Edit BPM User" to add a new BPM User as below:  

![][bpm_user_dev]

2. Go to "Administration -> BPM Configuration". Select BPM 860 QA Server and click "Edit BPM User" to add a new BPM User as below:  

![][bpm_user_qa]

3. Please make sure the two bpm users with the same display name "Tester".

4. Edit the case step and set the assignee:

![][bpm_user_assignee]

[bpm_user_dev]: ../images/test/bpm_user_dev.png  
[bpm_user_qa]: ../images/test/bpm_user_qa.png  
[bpm_user_assignee]: ../images/test/bpm_user_assignee.png


After that the IDA will choose the right bpm user when you run the test cases with the different BPM server.

