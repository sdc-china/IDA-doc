---
title: "Search Workflow Projects"
category: search
date: 2018-07-01 15:17:55
last_modified_at: 2022-07-01 15:26:00
---

# Search Workflow Projects
***

## Setting up the Workflow project and perform search.

   1. Configure the workflow project using online form or upload a TWX file to search.

      **Use online configuration**, fill the below field values on the online tab.

      ![][search_online_form]
      
         |   Parameter   | Description    |
         | ------------- |----------------|
         | [Server][1]   |Select a BAW server|
         | Process App   |Select a process app on the selected BAW server|
         | Toolkit       |Select a toolkit on the selected BAW server|
         | Branch        |Select a branch of selected process app or toolkit|
         |Snapshot       |Select a snapshot|
         |Tip            |Check the tip snapshot|

      **Upload a TWX file**, choose the Offline tab.

      ![][search_offline_form]{:height="80%" width="80%"}

      You can choose or drop a TWX file.

   2. Enter keywords to search, example, variable name "tw.local.requisition" and click **Search** Button to search for the variable usage.

      ![][search_keyword]

   3. Expect it to take some time if it is the first time you search for a snapshot, as IDA needs to export and index the snapshot in data folder. After the first-time search, if you enter other keywords, it will take much less time.

   4. Search results are listed on page and can be filtered using Properties Fiter or Artifact Type Filter. Entries show WebPD location of the search results. 

      ![][search_results]

   5. Click to expand each search result entry to show the actual content of the search result. Keywords are highlighted in yellow in the result content.

      ![][search_results_content]
      
## Cleaning up the exported search folders.

You can clean up the exported and indexed search data folders on Clean Disk Cache page under Administrations.

   
   ![][search_folder_cleanup]

[search_online_form]: ../images/search/search_online_form.PNG
[search_offline_form]: ../images/search/search_offline_form.PNG
[search_keyword]: ../images/search/search_keyword.PNG
[search_results]: ../images/search/search_results.PNG
[search_results_content]: ../images/search/search_results_content.PNG
[search_folder_cleanup]: ../images/search/search_folder_cleanup.PNG

[1]: ../administration/administration-bpm-configuration.html