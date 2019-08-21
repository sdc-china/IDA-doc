---
title: "Test Smart Comparison"
category: test
date: 2018-10-03 15:17:55
last_modified_at: 2019-07-29 15:20:00
order: 59
---

# Test Smart Comparison - A new image base assertion
***
### How does smart comparison work

 Smart comparison is an image based assertion, which is a new and easy way for regression test assertion by using pixel-by-pixel comparison.

 Here are the steps:
  - Run and record your test case as usual.
  - Review screenshots and enable it as the base image if it's the expected result.
  - Run test case again and then the smart comparison engine will compare the new screenshot with the base image. The test step will be marked as failed with the report showing **Screenshot does not match the expected image in smart comparison** error if there's any difference after comparison.
    
### Enable Smart Comparison

   **Notes:**
  Before starting smart comparison, please make sure that the test case has already finished running with a report whose status shows as **Passed**. And be sure that there is at least one case step has the screenshot.

  1. Go to test case edit page.
   
  2. Click **Edit** button.
   
  3. Click **Smart Comparison** Button. You can see that all comparable case steps are listed on the left. Choose one and click, you could see its screenshot on the right.
   
  4. Click ![][toggle] in front of the case step to enable image comparison. The whole image will be compared by default. If comparing the whole image is not what you need, you can specify the area to compare by moving the mouse over the screenshot, then clicking, dragging to select the area you need to compare. Release the mouse, you can see the selected part is shown: 
  
      ![][cropped_image]
    
  5. If you want to unselect the selected area, click the other area. The confirm form will be shown, and click **OK**. It will switch back to the whole image comparison.
  
  6. Click **<<** button and you can go back to test case edit page. 
  
      ![][back_button]
  
  7. Click **Run** button and wait for report.
  
  8. The comparison result is shown in the report. If **MISMATCH**, the trace:
  
  
      ![][trace]
      
  9. Click the screenshot, the comparison area will be set with different background color, and the differences between the expected image has been set in smart comparison page and current screenshot will be highlighted in red line. Hover the mouse over the **Expected Screenshot** can get the expected screenshot :
  
  
      ![][test_result]   
      
      ![][expected_image]
      
      If there is nothing different, current screenshot will be shown and status is **Passed**. 
  
  10. Click ![][toggle_on] in front of the case step again to disable image comparison.
  
### Refresh new screenshots from the latest testing report

  Click **Refresh** button in Smart Comparison page can refresh new screenshots from the latest report, and also reset all saved comparison settings. 
  
  **Notes:**
  
  The **Refresh** button is only displayed when the status of latest report is **Passed** and there is at least one case step with screenshot in this test case.

  
[toggle]: ../images/test/test_smart_comparison_toggle.PNG
[cropped_image]: ../images/test/test_smart_comparison_cropped_image.PNG
[back_button]: ../images/test/test_smart_comparison_back_button.PNG
[trace]: ../images/test/test_smart_comparison_trace.png
[test_result]: ../images/test/test_smart_comparison_test_result.png
[expected_image]: ../images/test/test_smart_comparison_expected_image.png
[toggle_on]: ../images/test/test_smart_comparison_toggle_on.PNG

	
    