---
title: "Test Case data binding"
category: test
date: 2018-09-29 15:17:55
last_modified_at: 2019-07-26 16:26:00
order: 30
---

# Test Case data binding
***   
## Create a csv test data file 

  1. Open the excel and edit data like below format. The first row is the key name of data.
    
     ![][testcase_file]   
  
  2. Save the excel file to the csv format on your local disk.  
  
  **Notes:**
     
   You must use **datasetName** and **dataset1** for the first column name and value for internal usage.

  
  **Notes:**

   If you are experiencing CSV content character error, you need to save CSV file as UTF-8 format.

   Here are steps for saving CSV file as UTF-8 in Notepad:    

   1. Open the CSV file with Notepad.  
   2. Navigate to File > Save As option. A screenshot of the menu is as shown below:  
     ![][csv-saveas]
   3. Next, select the location for the file. The Save As window appears as shown below: 
     ![][csv-utf-8]
   4. Select the Save as type option as All Files(*.*).  
   5. Specify the file name with .csv extension.  
   6. From Encoding drop-down list, select UTF-8 option.  
   7. Click Save to save the file.  


## Upload test case data 

  1. Click + button from **Test Data files** folder in the left menu sidebar.
 
  2. Choose the csv file you want to upload.
    
     ![][testcase_data_upload]
 
  3. After upload,new test case data files will appear on the left menu side bar.
  
  4. You can also click download icon to download it and check the content.
  
  
## Delete test case data  

  1. Click delete button to delete this test data.  
  
   **Notes:**
     
   If the test case data has already bound some test cases, you need to remove the data reference of these test cases, then remove this test data.   


## Bind data to the test case

  1. Click the test case name to see the detailed case step page.
  
  2. Click edit button to edit this test case.
  
  3. Bind the csv data file name from "Bind External File" selectbox.
  
     ![][testcase_data_binding]
     
     
## Bind data item to the case step parameter

  1. Edit the test case step which you want to use csv data.
  
  2. Choose the csv binding variable  from the selectbox value.
  
     ![][testcase_parameter_binding] 
  
  3. Click save button.  

## Selct rows of bind data to run test case.

  1. Click **Run** button on the right of case name, then you could selct the rows to run.
  
     ![][testcase_data_binding_select_rows]

  **Notes:**

  If you upload a csv file suffixed with "_\<YOUR BPM SERVER NAME\>.csv", you need not to change the bind csv file from the test case editor page when you run the test case with a different BPM server. The IDA will automatically select the corresponding csv file to run the test case. If the IDA does not find the corresponding csv file, it uses the binded csv file.

For example:  

1. The "HR_Open_New_Position/case1" bind a csv file named "sample_data.csv".
   ![][bindcsv]

2. If you want to run the test case with a different BPM server. The only you need to do is upload another csv file suffixed with "_\<YOUR BPM SERVER NAME\>.csv. It is very useful if you want to run the project with differents BPM servers in a pipeline. The IDA will select the corresponding csv file with the BPM server.

3. You could find \<YOUR BPM SERVER NAME\> from "Administration -> BPM Configuration"

   ![][bpm_server_name]


  


    
[testcase_file]: ../images/test/test_case_csv.PNG
[testcase_data_upload]: ../images/test/test_case_data_upload.PNG    
[testcase_data_binding]: ../images/test/test_case_data_binding.PNG   
[test_project_delete_button]: ../images/test/test_project_delete_button.PNG
[testcase_parameter_binding]: ../images/test/test_case_parameter_binding.PNG
[bindcsv]: ../images/test/bindcsv.png  
[bpm_server_name]: ../images/test/bpm_server_name.png 
[testcase_data_binding_select_rows]: ../images/test/testcase_data_binding_select_rows.png
[csv-saveas]: ../images/test/csv-saveas.png
[csv-utf-8]: ../images/test/csv-utf-8.png

