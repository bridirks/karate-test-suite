//Theoretically you would be able to take the output of one http request and feed it directly into another
//This would require the output of the first to be in compliance with the input requirements of the second
Feature: Feature file for inserting the result of one call into another

  Background:
    * url baseUrl
    * header Accept = 'application/json' 
    * header Content-Type = 'application/json; charset=utf-8'
    * header api-key = apikey

  Scenario: Pulling data from one search resource
    Given path '/.../.../item'
    When method GET
    Then status 200
    And def data = response.variableColumnName

    # Inserting data from a single search resource into a batch search resource
    Given url baseUrl + "/.../.../.../"
    And header api-key = apikey 
    And request data
    When method POST
    Then status 200
