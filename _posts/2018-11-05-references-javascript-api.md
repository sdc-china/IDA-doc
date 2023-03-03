---
title: "Javascript API"
category: references
date: 2018-11-05 15:17:55
last_modified_at: 2019-07-29 16:44:00
---

# Javascript API
***

## OOTB Javascript API

| JS API |      Parameters    |       Comments            |       Sample            | Contains bta.util.callback()|
|----------|:-------------:|:------|
| bta.util.callback  | |Default callback for Javascript command |return bta.util.callback(); | true|  
| bta.util.putContext|key, value| add key,value into the memory| bta.util.putContext(key,value); | true |
| bta.util.putContexts|JSON| add key-value pairs into the memory| bta.util.putContexts({"key":"value","key2":"value2"}); | true|
| bta.util.assertTrue | condition(boolean), message(string)|Asserts that a condition is true. If it isn't it throws an error with the given message. | bta.util.assertTrue(true, "The condition is not true!"); | true|
| bta.util.assertFalse| condition(booelan), message(string)| Asserts that a condition is false. If it isn't it throws an error with the given message.|  bta.util.assertFalse(false, "The condition is not false!"); | true|
| bta.util.assertEquals | expected(string), actual(string), message(string) |Asserts that two objects are equal. If they are not, an error is thrown with the given message.|bta.util.assertEquals("The expected value", "The actual value", "error message"); |true|
| bta.util.assertFail  | message(string), retry(boolean, default is true) |Assert fail with the given message|  bta.util.assertFail("error message", true); | true|
| bta.util.getCoachView  |  JSON |Get the coach view object|var coachView = bta.util.getCoachView({controlId: "Coach Control ID", label: "Coach Label Text", elementId: "The element ID", elementCss: "The element CSS", xpath: "The element xpath" });| false|
| bta.util.debug | message |add debug info on the browser console | bta.util.debug("msg")  | false |  
| bta.util.getElement | JSON |Get the DOM element |  var element = bta.util.getElement({elementId: "", elementCss: "", xpath: ""}); |false|  
| bta.util.getElementText | DOM Element |Get the DOM element text|  var text = bta.util.getElementText(textElement); |false|  

**Notes**    
Beside these OOTB JS API, user can also use standard BPM coach view JS API when writing the custom JS. e.g
- var rows = tableCoachView.context.element.querySelectorAll("div.SPARKTable table.table tbody tr");     

Also you can reference internal variable.eg.    
${context.currentInstanceId}  //get currenct process instance ID .    
${context.url}  //get currenctTask URL .    


## IDA System variables

The following table lists all system variable names and JS comand could not use these as variable name.

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
