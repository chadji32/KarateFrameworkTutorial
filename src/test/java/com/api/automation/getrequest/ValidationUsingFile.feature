Feature: To valid teh GET end point
  To validate the get end point response

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: To get the data in JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    # Create a variable to store the data from external file
    * def actualResponse = read("../JsonResponse.json")
    And print "File ==> ", actualResponse
    # And match response == actualResponse
    
  Scenario: To get the data in xml format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    # Create the variable
    * def actualResponse = read("../XMLResponse.json")
    And print "Xml Response ==> ", actualResponse
    # And match response == actualResponse
    
