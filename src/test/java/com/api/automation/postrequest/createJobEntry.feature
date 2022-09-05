Feature: To create the Job entry in the application
  Use POST /normal/webapi/add to create job entry in the application

  Background: Create and Initialize base Url
    Given url 'http://localhost:9897'

  Scenario: To create the Job Entry in JSON fromat
    Given path '/normal/webapi/add'
    And request {"jobId":4,"jobTitle":"Software Engg - 2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron","Subex"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    And match response.jobTitle == "Software Engg - 2"

  Scenario: To create the Job Entry using XML requests body format
    Given path '/normal/webapi/add'
    And request <item><jobId>5</jobId><jobTitle>Software Engg - 2</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience><experience>Subex</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology><technology>Jenkins</technology></technology></project></project></item>
    And headers {Accept: 'application/json', Content-Type: 'application/xml'}
    When method post
    And status 201
    And print response
    And match response.jobId == 5

  Scenario: To create the Job Entry using XML requests body format
    Given path '/normal/webapi/add'
    And request <item><jobId>6</jobId><jobTitle>Software Engg - 2</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience><experience>Subex</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology><technology>Jenkins</technology></technology></project></project></item>
    And headers {Accept: 'application/xml', Content-Type: 'application/xml'}
    When method post
    And status 201
    And print response
    And match response/Job/jobId == '6'

  Scenario: To create the Job Entry in JSON fromat
    Given path '/normal/webapi/add'
    * def body = read("data/jobEntry.json")
    And request body
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    And match response.jobTitle == "Software Engg - 2"

  Scenario: To create the Job Entry using XML requests body format
    Given path '/normal/webapi/add'
    * def body = read("data/jobEntry.xml")
    And request body
    And headers {Accept: 'application/json', Content-Type: 'application/xml'}
    When method post
    And status 201
    And print response
    And match response.jobId == 5

  Scenario: To create the Job Entry in JSON fromat with embedded expression
    Given path '/normal/webapi/add'
    * def getJobId = function(){return Math.floor((100)*Math.random());}
    And request {"jobId": '#(getJobId())',"jobTitle":"Software Engg - 2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron","Subex"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    And match response.jobTitle == "Software Engg - 2"

  Scenario: To create the Job Entry using XML requests body format
    Given path '/normal/webapi/add' 
    * def getJobId = function(){return Math.floor((100)*Math.random());}
    * def jobId = getJobId()
    And request <item><jobId>#(jobId)</jobId><jobTitle>Software Engg - 2</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience><experience>Subex</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology><technology>Jenkins</technology></technology></project></project></item>
    And headers {Accept: 'application/json', Content-Type: 'application/xml'}
    When method post
    And status 201
    And print response
    And match response.jobId == '#(jobId)'
