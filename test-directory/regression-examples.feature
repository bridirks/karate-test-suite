@regression
Feature: Feature file for giving examples of regression tests

  Background:
    * url ccte
    * header Accept = 'application/json' 
    * header Content-Type = 'application/json; charset=utf-8'
    * header x-api-key = apikey

//these scenarios will only check to see if expected variableNames/columns are present (checks for incomplete data)
  @variables
  Scenario: Validating the response of a GET method with global url and given path with search variable in path
    Given path '/.../.../item'
    When method GET
    Then status 200
    And match response == {variableName1: '#present', variableName2: '#present', variableName3: '#present', variableName4: '#present'}

//this scenario will only match the first response
  @variables
  Scenario: Validating the response of a POST method with given global url, given path, and global batch search variables
    Given url baseUrl + "/.../.../"
    And request batchSeach
    When method POST
    Then status 200
    And match response[0] == {variableName1: '#present', variableName2: '#present', variableName3: '#present', variableName4: '#present'}

//this scenario will check that a response does not contain a specific variable
  @variables
  Scenario: Validating the response of a GET method with global url and given path with search variable in path
    Given path '/.../.../item'
    When method GET
    Then status 200
    And match response !contains {variableName: '#present'}


    
 //these scenarios will actually search the response for a specific expected output (checks for missing data)
  @data
  Scenario: Validating the response of a GET method with global url and given path with search variable in path
    Given path '/.../.../item'
    When method GET
    Then status 200
    And match response == {"variableName1": "item1", "variableName2": "item2", "variableName3": "item3", "variableName4": "item4"}

//this scenario will only match the first response
  @data
  Scenario: Validating the response of a POST method with given global url, given path, and global batch search variables
    Given url baseUrl + "/.../.../"
    And request batchSeach
    When method POST
    Then status 200
    And match response[0] == {"variableName1": "item1", "variableName2": "item2", "variableName3": "item3", "variableName4": "item4"}

//this scenario will check a specific variable for NULL values
  @data
  Scenario: Validating the response of a GET method with global url and given path with search variable in path
    Given path '/.../.../item'
    When method GET
    Then status 200
    And match response == "variableName": null}
