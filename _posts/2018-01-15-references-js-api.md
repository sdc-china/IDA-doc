---
layout: page
title: "Javascript API"
category: references
date: 2018-11-15 15:17:55
order: 5
---

## OOTB Javascript API

| JS API |      Parameters    |       Comments            |       Sample            |
|----------|:-------------:|:------|
| bta.util.getCoachView  |  JSON |Get the coach view object|var coachView = bta.util.getCoachView({controlId: "Coach Control ID", label: "Coach Label Text", elementId: "The element ID", elementCss: "The element CSS", xpath: "The element xpath" });|
| bta.util.getElementText | DOM Element |Get the DOM element text|  var text = bta.util.getElementText(textElement); |
| bta.util.assertTrue | condition(boolean), message(string)|Asserts that a condition is true. If it isn't it throws an error with the given message. | bta.util.assertTrue(true, "The condition is not true!"); |
| bta.util.assertFalse| condition(booelan), message(string)| Asserts that a condition is false. If it isn't it throws an error with the given message.|  bta.util.assertFalse(false, "The condition is not false!"); |
| bta.util.assertEquals | expected(string), actual(string), message(string) |Asserts that two objects are equal. If they are not, an error is thrown with the given message.|bta.util.assertEquals("The expected value", "The actual value", "The values aren't equal"); |
| bta.util.throwError (as know as "bta.util.assertFail") | message(string), retry(boolean, default is true) |Throw error with the given message|  bta.util.throwError("error message", true); |

**Notes**    
Beside these OOTB JS API, user can also use standard BPM coach view JS API when writing the custom JS. e.g 
- var rows = tableCoachView.context.element.querySelectorAll("div.SPARKTable table.table tbody tr");     
