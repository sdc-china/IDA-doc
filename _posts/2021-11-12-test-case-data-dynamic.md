---
title: "Test Case data dynamic loading"
category: test
date: 2018-09-29 15:19:55
last_modified_at: 2021-11-12 16:26:00
order: 31
---

# Test Case data dynamic loading

We can use BAW services to integrate with external applications and load dynamic test data (for example unique ids generated from external systems), then use the loaded data as input parameters of the test case. An example is given below.

***   

## Create a dynamic test data loading toolkit and add service to fetch data from external systems

  1. Create a common tookit for loading any dynamic test data
  
  2. Implement a service flow that can fetch the dynamic test data and save the data in output variable 

     ![][toolkit_service_flow] 

## Update the process application to include the dynamic test data loading toolkit 

  1. Add dependency to the test data loading toolkit
 
  2. Suppose the process application has a process with input variable as follows:
    
     ![][processapp_process]
  
  
## Write the test case with dynamic test data input

  1. Write a test cases with below test steps in sequence.  
  
     ![][testcase_steps]{:height="70%" width="70%"}
  
  2. The first test step will start service flow in toolkit and save the output data into test case context with variable name **output**. You can use JSON Path to select the output data.
  
     ![][testcase_get_testdata]{:height="70%" width="70%"}
  
  3. The third test step launches process and uses the output data from previous step as input parameter's value.

     ![][testcase_use_testdata]{:height="70%" width="70%"}   


  4. The process will be launched with correct dynamic test data.

     ![][testcase_process_inspector]
  


    
[toolkit_service_flow]: ../images/test/toolkit_service_flow.png
[processapp_process]: ../images/test/processapp_process.png    
[testcase_steps]: ../images/test/testcase_steps.png   
[testcase_get_testdata]: ../images/test/testcase_get_testdata.png
[testcase_use_testdata]: ../images/test/testcase_use_testdata.png
[testcase_process_inspector]: ../images/test/testcase_process_inspector.png
