---
title: "Dynamic User Assignment"
category: test
date: 2018-10-06 15:17:55
last_modified_at: 2019-10-25 15:24:00
order: 80
---

# Dynamic User Assignment


## Overview
IDA could select the right BPM user without modifying the test case when you want to run a test case with different BPM users on different servers. The key point is that the assignee are set with same display name.


## BPM User Configuration

1. Go to "Administration -> BPM Configuration". Select BPM 860 DEV Server and click "Edit BPM User" to add a new BPM User as below:  

![][bpm_user_dev]

2. Go to "Administration -> BPM Configuration". Select BPM 860 QA Server and click "Edit BPM User" to add a new BPM User as below:  

![][bpm_user_qa]

3. Please make sure the two bpm users are with the same display name "Tester".

4. Edit the case step and set the assignee:

![][bpm_user_assignee]

[bpm_user_dev]: ../images/test/bpm_user_dev.png  
[bpm_user_qa]: ../images/test/bpm_user_qa.png  
[bpm_user_assignee]: ../images/test/bpm_user_assignee.png


After that the IDA will choose the right bpm user when you run the test cases with the different BPM server.

