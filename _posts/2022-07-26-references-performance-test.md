---
title: "Performance Test"
category: references
date: 2022-08-07 10:00:00
last_modified_at: 2022-08-07 10:00:00
order: 16
---

# Performance Test
***

## Test objectives

The most frequently used modules by users are Testing and Pipeline, IDA needs to be able to handle continuous requests and provide the industry standard level of service in terms of response time and error rate. Average response time should be less than 2 seconds and error rate should be less than 1%.

We expect IDA to have the following capacity:

1. 2 core CPU, 4 GB memory (Concurrent Users 10)
2. 4 core CPU, 8 GB memory (Concurrent Users 20)
3. 8 core CPU, 16 GB memory (Concurrent Users 40)

## Test Scenario

This scenario is mainly tests the user's usage of Testing and Pipeline. 

User actions in the scenario:
1. Login
2. Save Project
3. Open Project Edit Form
4. Edit Project
5. Generate Cases
6. View Project Dashboard
7. Get Test Case Id
8. View Test Case
9. Edit Test Case
10. Get Project Config
11. Get Command Parameters
12. Get Command Catagory
13. Get Command Options
14. Save Case Step
15. Get Test Cases
16. Exit Edit Case
17. Update Check
18. Add Pipelines
19. View Pipelines Dashboard
20. View Pipeline List
22. Get pipeline Id
23. Run pipelines 

## Tests Result

Test duration: 1 hour;

System    | Total Requests  |Requests/s    | Response Min (ms)| Response Max (ms)| Response Mean (ms)  | Std Dev (ms)|%CPU  | %MEM        
     ----------|--------|---------|---------|---------|------|-----|-------|---------
     2 core CPU, 4 GB memory | 24521 | 6.578 | 268| 4538| 664| 507| 68.7%| 47.4%
     4 core CPU, 8 GB memory | 32326 | 8.59 | 279| 29919| 1477| 1776| 69.7%| 40.5%
     8 core CPU, 16 GB memory| 59101 | 15.59 | 284| 38860| 1694| 2486| 65.5%| 36.3%

## Tests Details


### 2 core CPU, 4 GB memory, Concurrent Users 10

  ![][performance-2-4-c-indi] 
 
  ![][performance-2-4-c-rtpot] 
  
  ![][performance-2-4-c-norps] 
    
  ![][performance-2-4-c-noreps] 

### 4 core CPU, 8 GB memory, Concurrent Users 20

  ![][performance-4-8-c-indi] 

  ![][performance-4-8-c-rtpot] 
  
  ![][performance-4-8-c-norps] 
    
  ![][performance-4-8-c-noreps] 

### 8 core CPU, 16 GB memory, Concurrent Users 40

  ![][performance-8-16-c-indi] 

  ![][performance-8-16-c-rtpot] 
  
  ![][performance-8-16-c-norps] 
    
  ![][performance-8-16-c-noreps] 




[performance-2-4-c-indi]: ../images/references/performance-2-4-c-indi.png
[performance-2-4-c-rtpot]: ../images/references/performance-2-4-c-rtpot.png
[performance-2-4-c-norps]: ../images/references/performance-2-4-c-norps.png
[performance-2-4-c-noreps]: ../images/references/performance-2-4-c-noreps.png
[performance-4-8-c-indi]: ../images/references/performance-4-8-c-indi.png
[performance-4-8-c-rtpot]: ../images/references/performance-4-8-c-rtpot.png
[performance-4-8-c-norps]: ../images/references/performance-4-8-c-norps.png
[performance-4-8-c-noreps]: ../images/references/performance-4-8-c-noreps.png
[performance-8-16-c-indi]: ../images/references/performance-8-16-c-indi.png
[performance-8-16-c-rtpot]: ../images/references/performance-8-16-c-rtpot.png
[performance-8-16-c-norps]: ../images/references/performance-8-16-c-norps.png
[performance-8-16-c-noreps]: ../images/references/performance-8-16-c-noreps.png

