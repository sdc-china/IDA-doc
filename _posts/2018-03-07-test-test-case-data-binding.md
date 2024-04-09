---
title: "Test Case Data Binding"
category: test
date: 2018-03-07 15:17:55
last_modified_at: 2023-09-15 15:43:00
---

# Test Case Data Binding
***

## Create a CSV Test Data File

1. Open the Excel and edit data in the format below. The first row is the key name of the data.

   ![][testcase_file]

2. Save the Excel file to the CSV format on your local disk.

**Notes:**

The first column name must be **datasetName**, IDA uses the first column values to define the dataset name for each row.

**Notes:**

If you are experiencing CSV content character error, you need to save the CSV file as UTF-8 format.

Here are the steps for saving a CSV file as UTF-8 in Notepad:

1. Open the CSV file with Notepad.
2. Navigate to File > Save As option. A screenshot of the menu is as shown below:
   ![][csv-saveas]
3. Next, select the location for the file. The Save As window appears as shown below:
   ![][csv-utf-8]
4. Select the Save as type option as All Files(*.*).
5. Specify the file name with .csv extension.
6. From the Encoding drop-down list, select the UTF-8 option.
7. Click Save to save the file.

## Upload Test Case Data

1. Click the + button from the **Test Data files** folder in the left menu sidebar.

2. Choose the CSV file you want to upload.

   ![][testcase_data_upload]

3. After upload, new test case data files will appear on the left menu sidebar.

4. You can also click the download icon to download it and check the content.

## Delete Test Case Data

1. Click the delete button to delete this test data.

**Notes:**

If the test case data has already been bound to some test cases, you need to remove the data reference from these test cases, then remove this test data.

## Bind Data to the Test Case

1. Click the test case name to see the detailed case step page.

2. Click the edit button to edit this test case.

3. Bind the CSV data file name from the "Bind External File" select box.

   ![][testcase_data_binding]{:width="80%"}

## Bind Data Item to the Case Step Parameter

1. Edit the test case step which you want to use CSV data.

2. Choose the CSV binding variable from the select box value.

   ![][testcase_parameter_binding]{:width="60%"}

3. Click the save button.

## Select Rows of Bound Data to Run Test Case

1. Click the **Run** button on the right of the case name, then you could select the rows to run.

   ![][testcase_data_binding_select_rows]{:width="90%"}

**Notes:**

If you upload a CSV file suffixed with "_\<YOUR BAW SERVER NAME\>.csv", you need not change the bound CSV file from the test case editor page when you run the test case with a different BAW server. The IDA will automatically select the corresponding CSV file to run the test case. If the IDA does not find the corresponding CSV file, it uses the bound CSV file.

For example:

1. The "Create_Position_Request_CSHS/case1" binds a CSV file named "sample_data.csv".
   ![][bindcsv]{:width="90%"}

2. If you want to run the test case with a different BAW server, the only thing you need to do is upload another CSV file suffixed with "_\<YOUR BAW SERVER NAME\>.csv". It is very useful if you want to run the project with different Workflow servers in a pipeline. The IDA will select the corresponding CSV file with the Workflow server.

3. You could find \<YOUR BAW SERVER NAME\> from "Administration -> BAW Configuration"

   ![][bpm_server_name]{:width="90%"}

[testcase_file]: ../images/test/test_case_csv.PNG
[testcase_data_upload]: ../images/test/test_case_data_upload.PNG
[testcase_data_binding]: ../images/test/test_case_data_binding.PNG
[test_project_delete_button]: ../images/test/test_project_delete_button.PNG
[testcase_parameter_binding]: ../images/test/test_case_parameter_binding.png
[bindcsv]: ../images/test/bindcsv.png
[bpm_server_name]: ../images/test/bpm_server_name.png
[testcase_data_binding_select_rows]: ../images/test/testcase_data_binding_select_rows.png
[csv-saveas]: ../images/test/csv-saveas.png
[csv-utf-8]: ../images/test/csv-utf-8.png