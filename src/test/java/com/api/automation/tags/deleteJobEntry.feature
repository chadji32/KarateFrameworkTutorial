Feature: To test the delete end point
  Delete /normal/webapi/remove/{id}

  Background: 
    Given url 'http://localhost:9897'

@Smoke @Regression
  Scenario: To delete the job entry from application using job id
    # Create a new Job entry
    # Delete the newly created job entry
    # Get request with query parameter and validate 404
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def createdJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createdJobId)'}
    # delete request
    Given path '/normal/webapi/remove/' + createdJobId
    And headers {Accept: 'application/json'}
    When method delete
    Then status 200
    # Get Request
    Given path '/normal/webapi/find'
    And params {id: '#(createdJobId)', jobTitle:'Software Engg - 2'}
    And header Accept = 'application/json'
    When method get
    Then status 404

  Scenario: To delete the job entry from application using job id and delete the job entry twice
    # Create a new Job entry
    # Delete the newly created job entry
    # Get request with query parameter and validate 404
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def createdJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createdJobId)'}
    # delete request
    Given path '/normal/webapi/remove/' + createdJobId
    And headers {Accept: 'application/json'}
    When method delete
    Then status 200
    # delete request
    Given path '/normal/webapi/remove/' + createdJobId
    And headers {Accept: 'application/json'}
    When method delete
    Then status 404

  Scenario: To demo request chaining
    # Craete a new job entry
    # Extract the job id and job title from the response of POST request
    # Send the path request, Value of query parameter will be set by, info extracted from previus request
    # Extract the job id and job title from the response of patch request
    # Get request with query parameter, value of query param is set by info extracted from responce of patch request
    # Add the validation on job description in the response of get request
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def createdJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createdJobId)'}
		* def jobId = createJob.responseJobId
		* def jobTitle = createJob.responseJobTitle
		
		# Patch request
		* def jobDec = 'To develop adroid application and web application'
		Given path '/normal/webapi/update/details'
		And params {id:'#(jobId)', jobTitle:'#(jobTitle)', jobDescription:'#(jobDec)'}
		And header Accept = 'application/json'
		And request {}
		And method patch 
		Then status 200
		* def jobId = response.jobId
		* def jobTitle = response.jobTitle
		
		# Get Request
		Given path '/normal/webapi/find'
		And params {id:'#(jobId)', jobTitle:'#(jobTitle)'}
		And header Accept = 'application/json'
		And method get 
		Then status 200
		Then match response.jobDescription == jobDec
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
    
    
    
    