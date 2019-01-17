---
layout: page
title: "Best Practices"
category: references
date: 2018-11-15 15:17:55
order: 8
---

### Long load time AJAX call
* As we know, the modern web application always load data by AJAX call. Sometime, it may needs a long time to get the AJAX call result. The automation test case become not stable in this case. It's because that, the test case run the test steps without waiting the AJAX call end.
* Normally, there is a loading indicator on the HTML to indicate a AJAX call is completed or not. We could resolve the problem by adding the **waitElement** command after the AJAX call test step. So that the system will wait a certain seconds until the loading indicator element becomes **visible/hidden/enabled/disable**. 

   ![][references-wait-element]


  [references-wait-element]: ../images/references/references-wait-element.png