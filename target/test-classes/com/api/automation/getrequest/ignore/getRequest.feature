Feature: To test the get end point of the application
  To test different get end point gith different data formate supported by the application

  Background: Setup the Base Path
    Given url 'http://localhost:9897'
    And print '==========This is Background Keyword================'

  Scenario: To get all the data from application in JSON format
    #Given url 'http://localhost:9897/normal/webapi/all'
    #Base Path + Contex path
    Given path '/normal/webapi/all'
    When method get # Send the get request
    Then status 200 # the status code response should be 200

	@ignore
  Scenario: To get all the data from application in JSON format using path variable
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    #Base Path + Contex path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    
  Scenario: To get all the data from application in JSON format using path variable
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    #Base Path + Contex path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
