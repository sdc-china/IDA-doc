---
title: "Dynamic User Assignment"
category: test
date: 2018-03-27 15:17:55
last_modified_at: 2021-08-23 15:24:00
---

# Dynamic User Assignment

## Overview

IDA could select the right BAW user without modifying the test case when you want to run a test case with different BAW users on different servers. The key point is that the assignees are set with the same display name.

## BAW User Configuration

1. Go to "Administration -> BAW Configuration". Select the BPM 860 DEV Server and click "Edit BAW User" to add a new BAW User as below:

   ![][bpm_user_dev]{:width="60%"}

2. Go to "Administration -> BAW Configuration". Select the BPM 860 QA Server and click "Edit BAW User" to add a new BAW User as below:

   ![][bpm_user_qa]{:width="60%"}

3. Please make sure the two BAW users have the same display name "Tester".

4. Edit the case step and set the assignee:

   ![][bpm_user_assignee]{:width="60%"}

[bpm_user_dev]: ../images/test/bpm_user_dev.png
[bpm_user_qa]: ../images/test/bpm_user_qa.png
[bpm_user_assignee]: ../images/test/bpm_user_assignee.png

After that, IDA will choose the right BAW user when you run the test cases with the different BAW server.