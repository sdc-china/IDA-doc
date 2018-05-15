---
layout: page
title: "Test Case data binding"
category: test
date: 2018-01-05 15:17:55
order: 3
---
    
### Create a csv test data file 

  1. Open the excel and edit data like below format.The first column is the key name of data.
    
     ![][testcase_file]   
  
  2. Save the excel file to the csv format on your local disk.  
  
  **Notes:**
     
   You must use **datasetName** and **dataset1** for the first column name and value for  internal usage.
  

  
### Upload test case data 

  1. Click + button from **Test Data files** folder in the left menu sidebar.
 
  2. Choose the csv file you want to upload.
    
     ![][testcase_data_upload]
 
  3. After upload,new test case data files appears on the left menu side bar.
  
  4. You can also click download icon to download it and check the content.
  
  
### Delete test case data  

  1. Click ![][test_project_delete_button] button to delete this test data.  
  
   **Notes:**
     
   If the test case data has already binded some test cases,you need to remove the data reference of these test cases,then remove this test data.   


### Bind data to the test case

  1. Click the test case name to see detail case step page.
  
  2. Click edit button to edit this test case.
  
  3. Choose the csv data file name you want to bind from "Bind External File" selectbox.
  
     ![][testcase_data_binding]
     
     
### Bind data item to the case step parameter

  1. Choose the test case step you want to bind csv data.
  
  2. Choose the selectbox value you want to bind and click the save button.   
  
   ![][testcase_parameter_binding] 
   
      
    
[testcase_file]: ../images/test/test_case_csv.PNG
[testcase_data_upload]: ../images/test/test_case_data_upload.PNG    
[testcase_data_binding]: ../images/test/test_case_data_binding.PNG   
[test_project_delete_button]: ../images/test/test_project_delete_button.PNG
[testcase_parameter_binding]: ../images/test/test_case_parameter_binding.PNG

