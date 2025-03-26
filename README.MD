<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/USEPA/ccte-api-karate/tree/main/images">
    <img src="images/karate.jpg" alt="Logo" width="500" height="200">
  </a>
  
<h1 align="center">Computational Toxicology and Exposure Data APIs</h1>
<h3 align="center">Performance Testing with Karate Framework</h3>
</div>
<br>

Karate framework follows the Cucumber style of writing the program which follows the BDD approach. The syntax is easy to understand by non-programmers. And this framework is the only API testing tool that has combined API Automation and performance testing into a single standalone tool.
<br>
We will be using Karate to perform Smoke, Regression, CORS, and Security tests on the CCTE APIs. All feature files are labeled with the appropriate Tags in order to more easily reference in Git Actions and Command Line. (differring from the previous use of directories for smaller tests). Existing test files are present for use on personal machines and will not be used in automation.
<br>
<h3 align="center">Smoke Testing</h3>

Feature files labeled `Smoke` are designed to validate individual features in each API. They call on available features and return the HTTP Response status code. The typical expected response is status 200 or OK status.
<br>
<h3 align="center">Regression Testing</h3>

Feature files labeled `Regression` are being  split between two categories referred to in a sub-tag.<br>
`variables` - designed to validate the responses of individual features in each API. They call on available features and verify that the responses contain the correct labels. Labels vary depending on the variables contained in the data being requested. This is not to be confused with data validation, we are only checking that the responses contain the correct variables. The content of those variables is being ignored.<br>
`data` - the design is similar to variable, but this time the requests are looking for specific responses to a search. These tests will only work on their pre-set search item.
<br>
<h3 align="center">CORS Testing</h3>

These tests are designed to verify that the Origin of the requests are permitted to access the APIs. Cross-Origin Resource Sharing (CORS) is an HTTP-header based mechanism that allows a server to indicate any origins (domain, scheme, or port) other than its own from which a browser should permit loading resources. CORS also relies on a mechanism by which browsers make a "preflight" request to the server hosting the cross-origin resource, in order to check that the server will permit the actual request. In that preflight, the browser sends headers that indicate the HTTP method and headers that will be used in the actual request. Feature files containing CORS tests have been given the tag `cors`
<br>
<h3 align="center">Security Testing</h3>

These tests are designed to ensure proper acceptance of API keys necessary to access API features. Data should only be pulled if the API keys are accepted and return an error if they are not. I have used Github's `Secret` feature to reference my own API key and attempted pushing a fake key (listed in plain text) to test for failure. The `API_KEY` can be found in the karate-config file under the variable `apikey`. The use of `Secret` is only for potential automation with actions in the future. Otherwise, it would have been left blank. Feature files containing Security tests have been given the tag `security`
<br>
<h2 align="center">Running a Test on Personal Machine</h2>
1. Download the entire project as a zip (this will contain a copy of the standalone jar file)<br>
2. Extract files to the location of your choice<br>
3. Open the command prompt<br>
4. Navigate to the directory that contains the project folder (ccte-api-karate) and run desired test file (smoke, regression, cors, or security)

  ```sh
  "Navigate to ccte-api-karate folder"
  ./run-smoke
  ```
5. Results will be viewable in a dashboard by selecting the url given at the end of a test run<br><br>
**Note: if you are running this project on Windows, you will need to add '.bat' to the end of all of the test files in order to run them from command line**

<h2 align="center">Running a Test in Git Actions</h2>
1. Navigate to the Actions tab in the ccte-api-karate repository<br>
2. Under `Workflows` select Karate<br>
3. Highlighted in blue is the message `This workflow has a workflow_dispatch event trigger.` To the right of this message is a drop-down menu labeled `Run Workflow`.<br>
4. Optional: Select desired environment<br>
5. Required: Select the desired test type from the drop-down menu.<br>
6. Required: Select the desired API from the drop-down menu.<br>
(if the cors or security test types are selected, the matching option under API Selection needs to be selected) <br>
7. Select `Run Workflow`<br>
8. Results will be viewable in an artifact folder after the tests have completed. These results will not be formatted unless you unzip the artifact folder<br>
<h3 align="center">Optional - to View Full Dashboard</h3> 
1. Download the karate project<br>
2. Download the artifact and extract the contents into the 'target' folder of the downloaded karate project<br>
3. Select 'karate-summary.html' from the karate-reports folder to open in browser
