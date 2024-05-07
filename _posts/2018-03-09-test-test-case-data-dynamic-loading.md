---
title: "Test Case Data Dynamic Loading"
category: test
date: 2018-03-09 15:19:55
last_modified_at: 2021-11-12 16:26:00
---

# Test Case Data Dynamic Loading

We can use BAW services to integrate with external applications and load dynamic test data (for example, unique IDs generated from external systems), then use the loaded data as input parameters of the test case. An example is given below.

***   

## Create a dynamic test data loading toolkit and add a service to fetch data from external systems

  1. Create a common toolkit for loading any dynamic test data.
  
  2. Implement a service flow that can fetch the dynamic test data and save the data in an output variable. 

     ![][toolkit_service_flow] 

## Update the process application to include the dynamic test data loading toolkit 

  1. Add a dependency to the test data loading toolkit.
 
  2. Suppose the process application has a process with an input variable as follows:
    
     ![][processapp_process]
  
  
## Write the test case with dynamic test data input

  1. Write test cases with the following test steps in sequence.  
  
     ![][testcase_steps]{:width="60%"}
  
  2. The first test step will start the service flow in the toolkit and save the output data into the test case context with the variable name **output**. You can use JSON Path to select the output data.
  
     ![][testcase_get_testdata]{:width="60%"}
  
  3. The third test step launches the process and uses the output data from the previous step as the input parameter's value.

     ![][testcase_use_testdata]{:width="60%"}   


  4. The process will be launched with the correct dynamic test data.

     ![][testcase_process_inspector]
  


    
[toolkit_service_flow]: ../images/test/toolkit_service_flow.png
[processapp_process]: ../images/test/processapp_process.png    
[testcase_steps]: ../images/test/testcase_steps.png   
[testcase_get_testdata]: ../images/test/testcase_get_testdata.png
[testcase_use_testdata]: ../images/test/testcase_use_testdata.png
[testcase_process_inspector]: ../images/test/testcase_process_inspector.png