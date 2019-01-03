---
layout: page
title: "Pipeline step reference"
category: pipeline
date: 2018-01-05 15:17:55
order: 6
---
### Pipeline step reference


  |   Step Name        | Parameters                          | Description                                                             |
  | ---------------------- |-------------------------------------------------------------------------|                                          
  | Snapshot             |   Naming Pattern: the naming pattern for the created snapshot. | The Snapshot step is used to create a snpshot by specified naming pattern. This step is only available in BPM DEV environment.|
  | dateString             |   Key: key for save data string.<br>Days: the number of days from the current date that you want to convert to a string. Negative number of days means before today, while positive number of days means after today. <br>*e.g:* **-1** means generating string of the date of yesterday.<br>Format: Format of date.|Generate date string before/after number of days of today. If the key is not specified, then the default key is "DATE_STRING". You can use the date string by ${context.DATE_STRING}.|   
  | debug                  |  Log: log text will be shown in console.|Command for debug, recording of the case will stop at this step. During playback a message is written to console log.|     
  | putContext             |  Key: name of key.<br>Value : the name of value. |  Put a key-value pair to context.                                 | 
  | wait                   | Time: the seconds to be wait.  |   Wait for specify seconds.                                |     
  | randomString           |    Length : length of the generated random string.|Generate a specified length random string.                                |                                     
  | randomNumber           |    Length : length of the generated random string. |Generate a specified length random number.                                |   