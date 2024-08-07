---
title: "JavaScript API"
category: references
date: 2018-11-05 15:17:55
last_modified_at: 2019-07-29 16:44:00
---

# JavaScript API
***

## OOTB JavaScript API

| JS API |      Parameters    |       Comments            |       Example            | Callback Command|
|----------|:-------------:|:------|:------|:------|
| bta.util.callback  | | Default callback for JavaScript command. A custom JavaScript command must return a callback command.  |return bta.util.callback(); | Yes|  
| bta.util.putContext|key, value| Add key-value into the memory| bta.util.putContext(key, value); | Yes |
| bta.util.putContexts|JSON| Add key-value pairs into the memory| bta.util.putContexts({"key":"value","key2":"value2"}); | Yes|
| bta.util.assertTrue | condition(boolean), message(string)|Asserts that a condition is true. If it isn't, it throws an error with the given message. | bta.util.assertTrue(true, "The condition is not true!"); | Yes|
| bta.util.assertFalse| condition(boolean), message(string)| Asserts that a condition is false. If it isn't, it throws an error with the given message.|  bta.util.assertFalse(false, "The condition is not false!"); | Yes|
| bta.util.assertEquals | expected(string), actual(string), message(string) |Asserts that two objects are equal. If they are not, an error is thrown with the given message.|bta.util.assertEquals("The expected value", "The actual value", "error message"); |Yes|
| bta.util.assertFail  | message(string), retry(boolean, default is true) |Assert failure with the given message|  bta.util.assertFail("error message", true); | Yes|
| bta.util.debug | message |Add debug info on the browser console | bta.util.debug("msg")  | No |  
| bta.util.getCoachView  |  JSON |Get the coach view object|var coachView = bta.util.getCoachView({controlId: "Coach Control ID", label: "Coach Label Text", elementId: "The element ID", elementCss: "The element CSS", xpath: "The element xpath" });| No|
| bta.util.getElement | JSON |Get the DOM element |  var element = bta.util.getElement({elementId: "The element ID", elementCss: "The element CSS", xpath: "The element xpath"}); |No|  
| bta.util.getElementText | DOM Element |Get the DOM element text|  var text = bta.util.getElementText(textElement); |No|  
| bta.util.getXpath | DOM Element |Get xpath of the DOM element|  var xpath = bta.util.getXpath(element); |No|  
| bta.util.fireEvent | element(DOM Element), eventType(string) |Fire event of the DOM element|  bta.util.fireEvent(element, "keyup"); |No|  

**Notes**
Besides these OOTB JS APIs, users can also use standard BPM coach view JS APIs when writing custom JavaScript. e.g.:
- var rows = tableCoachView.context.element.querySelectorAll("div.SPARKTable table.table tbody tr");     

You can also reference internal variables, e.g.:    
${context.currentInstanceId}  //get current process instance ID.    
${context.url}  //get current Task URL.    


## IDA System Variables

The following table lists all system variable names, and JS commands could not use these as variable names.

|----------|:-------------:|:------|
|instanceId|bpmUser|processConfig|bpmConfig
|engineConfig|parameters|taskName|toUser
|output|token|processName|businessDataAlias
|businessDataValue|instanceName|adHocActivityName|adHocName
|service|params|toolkitName|exception
|expectedOutput|variableName|jsonPath|apiName
|errorMessage|expectedValue|sql|maxRows
|dataSourceName|expectedRows|uca|key
|value|days|format|time
|length|templatePath|script|caseId
|serverHost|next|process|
