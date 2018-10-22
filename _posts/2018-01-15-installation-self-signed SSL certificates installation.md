---
layout: page
title: "Self-Signed SSL Certificates Installation"
category: installation
date: 2018-01-05 15:17:55
order: 7
---

  The Keter recorder plugin can't support website with self sign certification by default. In this case, a warning like this:
   
![][error]
   
   This warning will block the recording of test case. To resolve this problem, we need to make the browsers to accept self-signed certificate.    
   
### FireFox - Add a Security Exception

1. In FireFox, go to Tools -> Options.

    ![][tool]

2. Click the **Privaty & Security** tab,  then the **View Certificates** button.

    ![][security_tab]
    
3. Go to the **Services** tab and press the **Add Exception** button.
    
    ![][servers_tab]
    
4.  Enter the host and port in **Add Security Exception** dialog, press  **Get Certificate** button, check the box near the bottom **Permanently store this exception** and press **Confirm Security Exception** .

     ![][add_security]
     
    From this point on, FireFox won't show SSL-related errors. when visiting the website, it will like this:
    
    ![][success]
    
### Chrome - Visit in unsafe mode

Chrome browsers can save your data for a short time, and the warning page will not appear and block recording if you visit the testing website in unsafe mode before recording.

1. Click **ADVANCE** in warning page.

    ![][chrome_error]
    
2. Click **Proceed to 9.30.160.68(unsafe)**.

    ![][proceed]
     



   
   [error]: ../images/install/installation_self_signed_sertificates_error.png 
   [tool]: ../images/install/installation_self_signed_sertificates_tool.png 
   [security_tab]: ../images/install/installation_self_signed_sertificates_security_tab.png
   [servers_tab]: ../images/install/installation_self_signed_sertificates_servers_tab.png
   [add_security]: ../images/install/installation_self_signed_sertificates_add_security.png
   [success]: ../images/install/installation_self_signed_sertificates_success.png 
   [chrome_error]: ../images/install/installation_self_signed_sertificates_chrome_error.png
   [proceed]: ../images/install/installation_self_signed_sertificates_proceed.png
