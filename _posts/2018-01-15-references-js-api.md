---
layout: page
title: "Javascript API Reference"
category: references
date: 2018-11-15 15:17:55
order: 7
---

## OOTB Javascript API

| JS API     |      Parameters    |       Sample            |
|----------|:-------------:|:------|
| bta.util.getCoachView  |  JSON | var coachView = bta.util.getCoachView(this.jsonObject);<ul><li>controlId</li><li>section</li><li>label</li><li>elementId</li><li>elementCss</li></ul> |
| bta.util.getCoachViewByControlId |  String   | var tableCoachView = bta.util.getCoachViewByControlId(controlId); |
| bta.util.getElementText | Element |   var actualValue = bta.util.getElementText(textElement); |
| bta.util.hasClass | Element,String |   bta.util.hasClass(actualCell, "Output_Text") |
| bta.util.getBindingValue | Element |  var coachView = bta.util.getCoachView(this.jsonObject);<br>var bindingValue = bta.util.getBindingValue(coachView); |
| bta.util.setBindingValue | Element,String |      bta.util.setBindingValue(coachView, Number(value)); |
| bta.util.isEquals | expected, actual, message, regexp |    var msg=  bta.util.isEquals( expected, actual,"is equal", false); |
| bta.util.isContains | expected, actual, message |     var msg= bta.util.isEquals( expected, actual,message); |
| bta.util.isArrayEquals | expected, actual, message |     varmsg = bta.util.isArrayEquals(expected, actual, message); |
| bta.util.assertTrue | bool condition, message |  	var containExpectedValue = (actualValue.indexOf(expectedValue) != -1);<br>	return bta.util.assertTrue(containExpectedValue, errorMessage);|
| bta.util.assertFalse | bool condition, message |   var containExpectedValue = (actualValue.indexOf(expectedValue) != -1);<br>	return bta.util.assertTrue(containExpectedValue, errorMessage); |
|bta.util.getElementsVisibility | Element |  	var visibility = bta.util.getElementsVisibility(element);<br>	return bta.util.assertTrue((visibility!=="HIDDEN"), errorMessage); |
|bta.util.debug | String |  	var actualValue = bta.util.getElementText(outputControl);<br>	bta.util.debug("The output text value: " + actualValue); |
|bta.util.isBPMUICoachView | Element |  if (bta.util.isBPMUICoachView(coachView))<br> {//add your logic } |
|bta.util.isRespCoachView | Element |  if (bta.util.isRespCoachView(coachView))<br> {//add your logic } |

**Notes**    
Beside these OOTB JS API, user can also use standard BPM coach view JS API when writing the custom JS. e.g 
- var rows = tableCoachView.context.element.querySelectorAll("div.SPARKTable table.table tbody tr");     
