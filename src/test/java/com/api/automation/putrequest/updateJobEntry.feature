Feature: To test the updation of Job entry in the test application
  Test the end point PUT /noral/webapi/update

  Background: Create and Initialize base Url
    Given url 'http://localhost:9897'

  Scenario: To update the Job Entry for exiting job in JSON format
    # Create a new Job Entry
    # Update the Job Entry using PUT request
    # Using jsonPath verify the updation of details in Job Entry
    Given path '/normal/webapi/add'
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def id = getRandomValue()
    And request {"jobId": '#(id)',"jobTitle":"Software Engg - 2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron","Subex"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
          "jobId": '#(id)',
          "jobTitle": "Software Engg - 3",
          "jobDescription": "To develop andriod application and Web application",
          "experience": [
              "Google",
              "Apple",
              "Mobile Iron"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle",
                      "Jenkins"
                  ]
              },
              {
                  "projectName": "Web App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle",
                      "Node Js"
                  ]
              }
          ]
      }
      """
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+ id +")].project")
    And print projectArray
    # And match projectArray[0] == '#[2]'

  Scenario: To update the Job Entry for exiting job in JSON format
    # Create a new Job Entry
    # Update the Job Entry using PUT request
    # Using jsonPath verify the updation of details in Job Entry
    Given path '/normal/webapi/add'
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def id = getRandomValue()
    And request {"jobId": '#(id)',"jobTitle":"Software Engg - 2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron","Subex"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
          "jobId": 55455,
          "jobTitle": "Software Engg - 3",
          "jobDescription": "To develop andriod application and Web application",
          "experience": [
              "Google",
              "Apple",
              "Mobile Iron"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle",
                      "Jenkins"
                  ]
              },
              {
                  "projectName": "Web App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle",
                      "Node Js"
                  ]
              }
          ]
      }
      """
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 404

  Scenario: To update the Job Entry for exiting job in JSON format by calling another feature file
    # <Gherkin keyword> <call> <read(<location of file>)>
    * def req = call read("../createJobEntry.feature")
    * def id = req.responseJobId
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
          "jobId":'#(id)',
          "jobTitle": "Software Engg - 3",
          "jobDescription": "To develop andriod application and Web application",
          "experience": [
              "Google",
              "Apple",
              "Mobile Iron"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle",
                      "Jenkins"
                  ]
              },
              {
                  "projectName": "Web App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle",
                      "Node Js"
                  ]
              }
          ]
      }
      """
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == '#(id)')].project")
    And print projectArray
    # And match projectArray[0] == '#[2]'

  Scenario: To update the Job Entry for exiting job in JSON format by calling another feature file
    # <Gherkin keyword> <call> <read(<location of file>)>
    # Given call read("../createJobEntry.feature")
    * def postRequest = call read("../createJobEntry.feature")
    And print "Calling Feature ==> ", postRequest.id
    And print "Calling Feature ==> ", postRequest.getRandomValue()
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
          "jobId":'#(postRequest.id)',
          "jobTitle": "Software Engg - 3",
          "jobDescription": "To develop andriod application and Web application",
          "experience": [
              "Google",
              "Apple",
              "Mobile Iron"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle",
                      "Jenkins"
                  ]
              },
              {
                  "projectName": "Web App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle",
                      "Node Js"
                  ]
              }
          ]
      }
      """
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+ postRequest.id +")].project")
    And print projectArray
    # And match projectArray[0] == '#[2]'

  Scenario: To update the Job Entry for exiting job in JSON format by calling another feature file with cariable
    # <Gherkin keyword> <call> <read(<location of file>)>
    # Given call read ("../createJobEntry.feature"){var1:value, var2:value}
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def id = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature"){_url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(id)'}
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
          "jobId":'#(id)',
          "jobTitle": "Software Engg - 3",
          "jobDescription": "To develop andriod application and Web application",
          "experience": [
              "Google",
              "Apple",
              "Mobile Iron"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle",
                      "Jenkins"
                  ]
              },
              {
                  "projectName": "Web App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle",
                      "Node Js"
                  ]
              }
          ]
      }
      """
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+ id +")].project")
    And print projectArray
    # And match projectArray[0] == '#[2]'
