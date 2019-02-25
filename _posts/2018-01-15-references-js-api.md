---
layout: page
title: "Javascript API"
category: references
date: 2018-11-15 15:17:55
order: 3
---

## OOTB Javascript API

| JS API |      Parameters    |       Comments            |       Sample            |
|----------|:-------------:|:------|
| bta.util.callback  | |Default callback for Javascript command |return bta.util.callback(); |       
| bta.util.debug | message |add debug info on the browser console | bta.util.debug("msg")  |   
| bta.util.putContext|key, value| add key,value into the memory| bta.util.putContext(key,value); | 
| bta.util.getCoachView  |  JSON |Get the coach view object|var coachView = bta.util.getCoachView({controlId: "Coach Control ID", label: "Coach Label Text", elementId: "The element ID", elementCss: "The element CSS", xpath: "The element xpath" });|
| bta.util.getElementText | DOM Element |Get the DOM element text|  var text = bta.util.getElementText(textElement); |
| bta.util.assertTrue | condition(boolean), message(string)|Asserts that a condition is true. If it isn't it throws an error with the given message. | bta.util.assertTrue(true, "The condition is not true!"); |
| bta.util.assertFalse| condition(booelan), message(string)| Asserts that a condition is false. If it isn't it throws an error with the given message.|  bta.util.assertFalse(false, "The condition is not false!"); |
| bta.util.assertEquals | expected(string), actual(string), message(string) |Asserts that two objects are equal. If they are not, an error is thrown with the given message.|bta.util.assertEquals("The expected value", "The actual value", "error message"); |
| bta.util.throwError  | message(string), retry(boolean, default is true) |Throw error with the given message|  bta.util.throwError("error message", true); |    

**Notes**    
Beside these OOTB JS API, user can also use standard BPM coach view JS API when writing the custom JS. e.g 
- var rows = tableCoachView.context.element.querySelectorAll("div.SPARKTable table.table tbody tr");      


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

