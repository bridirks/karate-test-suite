//smoke tag to filter tests
@smoke
Feature: Feature file for giving examples of smoke tests

  Background:
    * url baseUrl
    * header Accept = 'application/json' 
    * header Content-Type = 'application/json; charset=utf-8'
    * header api-key = apikey

  Scenario: Testing a basic GET method with global url and given path with search variable in path
    Given path '/.../.../item'
    When method GET
    Then status 200
  
  @ignore
  Scenario: Ignoring a single scenario. (@ignore tag can be placed at the top of the feature file to ignore the entire file)
    Given path '/.../.../item'
    When method GET
    Then status 200

  Scenario: Testing a GET method with global url and given path with search variable in path
    Given path '/.../.../...'
    And param variableName = 'item'
    When method GET
    Then status 200
    
  Scenario: Testing a GET method with a required projection (projection = given-projection)
    Given path '/.../.../...'
    And param projection = 'given-projection'
    When method GET
    Then status 200

//karate likes using double quotes for url in POST requests to keep trailing '/'. path only accepts single quotes. Url has to be appended to change baseUrl from command line.
  Scenario: Testing a basic POST method with given global url, given path, and global batch search variables
    Given url baseUrl + "/.../.../.../"
    And request batchSeach
    When method POST
    Then status 200

  Scenario: Testing a POST method with given global url, given path, and given batch search variables
    Given url baseUrl + "/.../.../.../"
    And request ["item1","item2"]
    When method POST
    Then status 200
