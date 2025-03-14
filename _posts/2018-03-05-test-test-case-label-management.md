---
title: "Test Case Label Management"
category: test
date: 2018-03-05 17:17:55
last_modified_at: 2019-11-26 16:25:00
---

# Test Case Label Management

Users can add multiple labels to manage the test cases and use labels in a **Test** step of an IDA pipeline to [select test cases in pipeline execution][test-step-ref].

***

## Manage Labels of a Single Test Case

1. From the left-side menu bar, select a single test case under some test suite name.

2. Click the **Labels** icon next to the test case name, you can see an input field where you can add multiple labels to this test case. Press **Enter** to complete each label.
   ![][single-test-case-labels-edit]{:width="80%"}

3. As you enter texts in the input field, labels that have been added to IDA will pop up to support auto-completion.
   ![][single-test-case-labels-auto-complete]{:width="80%"}

4. Click **Done** to finish editing labels of this test case. The labels are shown under the test case name.
   ![][single-test-case-labels-done]{:width="80%"}

## Manage Labels of Multiple Test Cases

1. Click the test project name on the left-side menu bar, to view the list of all test cases. Test case labels are listed under the **Labels** column and can be used to filter test cases.
   ![][multi-test-case-labels-view]{:width="80%"}

2. Select multiple test cases to manage labels together and click the **Labels** button. You can see an input field where labels of the selected test cases are populated. Labels all test cases have are colored blue, whereas labels not all test cases have are colored grey.<br>
   
   ![][multi-test-case-labels-edit]{:width="80%"}

3. You can add or remove labels in the input field. New labels will apply to all of the selected test cases, whereas removed labels will only apply to test cases that have them. Note that new labels will also be colored blue.
   ![][multi-test-case-labels-add-remove]{:width="80%"}

4. As you enter texts in the input field, labels that have been added to IDA will pop up to support auto-completion.

5. Click **Save Labels** to finish editing labels of the selected test cases. The labels are shown under the **Labels** column.
   ![][multi-test-case-labels-done]{:width="80%"}


[single-test-case-labels-edit]: ../images/test/single-test-case-labels-edit.PNG
[single-test-case-labels-done]: ../images/test/single-test-case-labels-done.PNG
[single-test-case-labels-auto-complete]: ../images/test/single-test-case-labels-auto-complete.PNG
[multi-test-case-labels-view]: ../images/test/multi-test-case-labels-view.PNG
[multi-test-case-labels-edit]: ../images/test/multi-test-case-labels-edit.PNG
[multi-test-case-labels-add-remove]: ../images/test/multi-test-case-labels-add-remove.PNG
[multi-test-case-labels-done]: ../images/test/multi-test-case-labels-done.PNG
[test-step-ref]: ../pipeline/pipeline-pipeline-stage&step-reference.html#pipeline-step-reference