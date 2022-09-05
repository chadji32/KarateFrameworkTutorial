@ignore
Feature: To test the get end point of the application
  To test different get end point gith different data formate supported by the application

  Scenario: To test the get end point with JSON data
    Given the application url 'www.google.com'
    And the contex path is '/getdata'
    When I send the get request
    Then status code shoulld be 200
    And the response frmt should be in JSON

  Scenario: To test the get end point with JSON data
    Given the application url 'www.google.com'
    And the contex path is '/getdata'
    When I send the get request
    Then status code shoulld be 200
    And the response frmt should be in JSON
