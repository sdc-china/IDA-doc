---
title: "Settings Configuration"
category: administration
date: 2018-10-24 15:17:55
last_modified_at: 2020-10-12 16:25:00
order: 15
---

# Settings configuration
***


## General configuration

You can runtime update log level in IDA, after that you can see the logs in real time based on the log level changes.

![][General]
Field | Description
--- | ---
Trace Level| The value of trace level, in default it have five levels (TRACE, DEBUG,WARN,INFO,ERROR).

## Set K8s Configuration

You can runtime update k8s configuration in IDA, after that you can use the new k8s server on Selenium Grid Configuration. Only test for Openshift 4.3.

  1. Click Administrator tab, then switch to Settings tab.
  2. Scroll down to K8s tab and fill out form according to below table:

     ![][administrator_k8s_setting]
    
     |   Field                | Description                                                         |
     | -------------------|---------------------------                                          |
     | Ingress Host|The subdomain to use for exposed routes. For openshift, it should be in the format of ```apps.<cluster_name>.<base_domain>```. The ```<cluster_name>``` and ```<base_domain>``` come from the installation config file.|  
     | Server Url| Cluster API address |
     | Namespace| The namespace/project that you want to use to create your containerized grid.|  
     | User Token| Token of service account.|

     Here is a sample:

     ![][administrator_k8s_setting_sample]

  3. How to create service account and get its token:

     After login openshift, run below commands.

     ```
     kubectl -n kube-system create serviceaccount ida-service-account
     kubectl create clusterrolebinding ida-clusterrolebinding --clusterrole=cluster-admin --serviceaccount=kube-system:ida-service-account
     TOKENNAME=`kubectl -n kube-system get serviceaccount/ida-service-account -o jsonpath='{.secrets[0].name}'`
     TOKEN=`kubectl -n kube-system get secret $TOKENNAME -o jsonpath='{.data.token}'| base64 --decode`
     kubectl config set-credentials ida-service-account --token=$TOKEN
     kubectl config set-context --current --user=ida-service-account
     ```

     Check if the current user is added successfully or not, and get the token for the newly added user:
     
     ```
     oc config view
     ```


**Notes:**
The settings values are saved in database so if you restart the server, the configurations are still valid.

[administrator_settings]: ../images/administrator/Administrator_settings.png
[administrator_k8s_setting]: ../images/administrator/administrator_k8s_setting.png
[administrator_k8s_setting_sample]: ../images/administrator/administrator_k8s_setting_sample.png
[General]: ../images/references/General.jpg
