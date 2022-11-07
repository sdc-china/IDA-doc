---
title: "Write a Java command"
category: test
date: 2018-03-17 15:17:55
last_modified_at: 2019-07-29 15:19:00
order: 58
---

# Write a Java command
***

## Software Prerequisites

* [Eclipse IDE](https://www.eclipse.org/downloads/)
* [Maven](https://maven.apache.org/download.cgi)

## Prerequisite

  Make sure you have installed **Eclipse IDE** and **Maven** in your local environment.

## Java command customization

Import CustomJavaCommand Java project

1. Unzip the file **workspace/custom-java-command.zip** in release package.

   ![][test_java_command_zip]

2. Import the project **CustomJavaCommand** into **Eclipse**.

   ![][test_import_java_command]

3. Perform **Maven Update** to load all dependency libraries.

   ![][test_maven_update]

Write custom Java command

1. Create a Java class **MyJavaCommand** under the source folder **src/main/java**.

	```
	public class MyJavaCommand {

	}
	```

2. Add annotations **@CustomCommand** and **@Parameter** on the class, so that the IDA can recognize the Java command. And add private variables based on the parameter definition.

	**@CustomCommand**
	*  **name** : The name showing on the test command selection box.
	*  **verbalization** : The text showing on the test case detail table.
	*  **description** : The text showing on the add/update command dialog.
	*  **takeScreenshot** : Indicate whether it will take screenshot after command execution.

	**@Parameter**
	*  **name** : The name getting the parameter from Java code.
	*  **displayName** : The name showing on the add/update command dialog.
	*  **type** : The control type shows on the add/update command dialog. It supports four kinds of types: text, textarea, combo and checkbox.
   *  **source**: It can be used to configure a list of possible values of the parameter. You can configure a list of possible values of the parameter, separated by comma.

	```
	import org.slf4j.Logger;
	import org.slf4j.LoggerFactory;
	import com.ibm.cte.sdc.bpm.testing.command.annotation.CustomCommand;
	import com.ibm.cte.sdc.bpm.testing.command.annotation.Parameter;

	@CustomCommand(name = "myJavaCommand", verbalization = "Hello {{Parameters.message}}", description = "execute my java command", takeScreenshot = true)
	@Parameter(name = "message", displayName = "Message", type = "text")
	@Parameter(name = "value", displayName = "Value", type = "text", source = "val1, val2, val3")
	public class MyJavaCommand {

	  private static final Logger logger = LoggerFactory.getLogger(MyJavaCommand.class);

	  private String message;
	  private String value;

	}
	```

3. Extend the Java command from class **com.ibm.cte.sdc.bpm.testing.command.BaseCommand**, and override the constructor method and the method **execute** and **parseArgs** from parent class as below:

	```
	  public MyJavaCommand(TestDriver driver) {
	    super(driver);
	  }

	  @Override
	  public Map<String, Object> execute(Map<String, Object> args) throws Exception {
	    if (!parseArgs(args)) {
	      logger.error("Can not execute MyJavaCommand due to invalid args {}", args);
	      this.assertFail("Args invalid", false);
	    }

	    //TODO add your execution logic

	    return this.result;
	  }

	  @Override
	  protected boolean parseArgs(Map<String, Object> args) {
	    super.parseArgs(args);
	    this.message = (String) args.get("message");
	    this.value = (String) args.get("value");
	    boolean valid = true;
	    if (StringUtils.isBlank(message)) {
	      logger.error("Wrong args with message {}", message);
	      valid = false;
	    }
	    return valid;
	  }
	```
4. By overriding the **parseArgs** method, you could read the inputs from a **Map** object and assign the value to the pre-defined private variables. You could also add your own validation logic in the method, and it will be returned as  **false** if the arguments is invalid.

5. By overriding the **execute** method, you could add your own execution content. An example of **execute** method as below:

	```
	  @Override
	  public Map<String, Object> execute(Map<String, Object> args) throws Exception {
	    if (!parseArgs(args)) {
	      logger.error("Can not execute MyJavaCommand due to invalid args {}", args);
	      this.assertFail("Args invalid", false);
	    }

	    // The driver object can handle the Browser UI, eg: open a url
	    this.driver.open("about:blank");

	    // Invoke BAW Server REST API.
	    TeamworksAPI client = getTeamworksAPI();
	    client.getSystemDetails();

	    // Put variable into context, so that the variable can be used in other commands.
	    // We need to use the variable by the format ${context.JAVA_COMMAND_VARIABLE}
	    this.result.put("JAVA_COMMAND_VARIABLE", this.value);
	    // Log
	    logger.info("Hello {}", message);

	    return this.result;
	  }
	```

	* **this.driver**: It is the object can handle browser UI.
	* **this.getTeamworksAPI()**: This method returns an object that can invoke the BAW server REST API.
	* **this.result**: The result of the Java command, and the values in the result will pass to the following test commands in a test case.


6. Below is a completed example of Java command, you could also find it in the package **com.ibm.cte.sdc.bpm.testing.command.customized.MyJavaCommand**

	```
	package com.ibm.cte.sdc.bpm.testing.command.customized;


	import java.util.Map;

	import org.slf4j.Logger;
	import org.slf4j.LoggerFactory;

	import com.ibm.cte.sdc.bpm.testing.command.BaseCommand;
	import com.ibm.cte.sdc.bpm.testing.command.annotation.CustomCommand;
	import com.ibm.cte.sdc.bpm.testing.command.annotation.Parameter;
	import com.ibm.cte.sdc.bpm.testing.driver.TestDriver;
	import com.ibm.websphere.bpm.api.TeamworksAPI;
	import com.ibm.websphere.bpm.util.StringUtils;

	@CustomCommand(name = "myJavaCommand", verbalization = "Hello {{Parameters.message}}", description = "execute my java command", takeScreenshot = true)
	@Parameter(name = "message", displayName = "Message", type = "text")
	@Parameter(name = "value", displayName = "Value", type = "text")
	public class MyJavaCommand extends BaseCommand {

	  private static final Logger logger = LoggerFactory.getLogger(MyJavaCommand.class);

	  private String message;
	  private String value;

	  public MyJavaCommand(TestDriver driver) {
	    super(driver);
	  }

	  @Override
	  public Map<String, Object> execute(Map<String, Object> args) throws Exception {
	    if (!parseArgs(args)) {
	      logger.error("Can not execute MyJavaCommand due to invalid args {}", args);
	      this.assertFail("Args invalid", false);
	    }

	    // The driver object can handle the Browser UI, eg: open a url
	    this.driver.open("about:blank");

	    // Invoke BAW Server REST API.
	    TeamworksAPI client = getTeamworksAPI();
	    client.getSystemDetails();

	    // Put variable into context, so that the variable can be used in other commands.
	    // We need to use the variable by the format ${context.JAVA_COMMAND_VARIABLE}
	    this.result.put("JAVA_COMMAND_VARIABLE", this.value);
	    // Log
	    logger.info("Hello {}", message);

	    return this.result;
	  }

	  @Override
	  protected boolean parseArgs(Map<String, Object> args) {
	    super.parseArgs(args);
	    this.message = (String) args.get("message");
	    this.value = (String) args.get("value");
	    boolean valid = true;
	    if (StringUtils.isBlank(message)) {
	      logger.error("Wrong args with message {}", message);
	      valid = false;
	    }
	    return valid;
	  }
	}
	```

Unit test custom Java command
1. Configure **test.properties** under **src/test/resources**.

	* **selenium_hub_url**: It's the selenium grid hub url. If you don't have selenium grid, then you can set up one by the [link][selenium_grid_url].
	* **selenium_hub_browser**: The browser type, the value could be **iexplore**, **firefox** or **chrome**, please make sure the selenium hub can support the configured browser type.
	* **bpm_server_url**: The BAW server URL
	* **bpm_server_user_name**: The BAW REST call user name
	* **bpm_server_password**: The BAW REST call password

2. Write unit test class under the source folder **src/test/java**, an example as below:

	```
	package com.ibm.cte.sdc.bpm.testing.command.customized;

	import static org.junit.Assert.assertEquals;

	import java.util.Map;

	import org.junit.After;
	import org.junit.Before;
	import org.junit.Test;

	import com.ibm.cte.sdc.bpm.testing.command.CommandTestBase;

	public class MyJavaCommandTest extends CommandTestBase {
	  private MyJavaCommand myJavaCommand;

	  @Before
	  public void setUp() {
	    super.setUp();
	    myJavaCommand = new MyJavaCommand(driver);
	  }

	  @After
	  public void tearDown() {
	    super.tearDown();
	  }

	  @Test
	  public void execute() throws Exception {
	    this.args.put("message", "world");
	    this.args.put("value", "my value");
	    Map<String, Object> result = myJavaCommand.execute(this.args);
	    String output = (String) result.get("JAVA_COMMAND_VARIABLE");
	    assertEquals("my value", output);
	  }
	}
	```

3. Run the class as **JUnit Test**

   ![][test_unit_test_java_command]


Package custom Java command

1. Once all unit test cases are passed, then you could package the Java command by right clicking the project and choose **Run As** -> **Maven build...**.

   ![][test_maven_build]

2. In the Maven build configuration page, enter **package** in the textbox **Goals**, then click **Run** button.

   ![][test_maven_package]

3. You could find the Jar file at the path **target/custom-java-command-1.0.jar**, this is the jar we will upload to IDA application.

- Notes: If you use any java lib which are not existed in as-is IDA.war/lib folder, you need copy it to lib folder and repack the IDA web so that the customer java command jar could find reference in class loader.

Upload custom Java command in IDA

1. Open the page in **Administration** -> **Custom Java Command**.

   ![][test_upload_java_command_1]

2. Click **Upload** button, choose the file **custom-java-command-1.0.jar** and upload it.

   ![][test_upload_java_command_2]

3. You could see the Java command shows in the table.

   ![][test_upload_java_command_3]


Use custom Java command in IDA test case

1. Edit your test case, and open the add/update command dialog. You will see the Java command showing under the **Custom** category.

   ![][test_insert_java_command]

2. The parameters defined by Java annotation are also showed on the command dialog. If you have configured the list of possible values of the parameter, you can select from the parameter dropdown list.

   ![][test_java_command_parameter]

  [test_java_command_zip]: ../images/test/test_java_command_zip.png
  [test_import_java_command]: ../images/test/test_import_java_command.png
  [test_maven_update]: ../images/test/test_maven_update.png
  [test_my_java_command]: ../images/test/test_my_java_command.png
  [test_unit_test_java_command]: ../images/test/test_unit_test_java_command.png
  [test_maven_build]: ../images/test/test_maven_build.png
  [test_maven_package]: ../images/test/test_maven_package.png
  [test_java_command_jar]: ../images/test/test_java_command_jar.png
  [selenium_grid_url]: ../installation/installlation-post-installation.html
  [test_upload_java_command_1]: ../images/test/test_upload_java_command_1.png
  [test_upload_java_command_2]: ../images/test/test_upload_java_command_2.png
  [test_upload_java_command_3]: ../images/test/test_upload_java_command_3.png
  [test_insert_java_command]: ../images/test/test_insert_java_command.png
  [test_java_command_parameter]: ../images/test/test_java_command_parameter.png
