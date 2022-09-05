Feature: To test the Get end point with Query Parameter
  GET /normal/webapi/find

  Background: Create and Initialize base Url
    Given url 'http://localhost:9897'

  Scenario: To get the data using Query Parameter
    # Create the Job Entry
    # Get the newly created Job Entry using Query Param
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def createdJobId = getRandomValue()
		* def createJob = call read("../../createJobEntryWithVariables.feature"){_url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createdJobId)'}
		# Send the Get request with query param
		Given path '/normal/webapi/find'
		# And param id = createdJobId 
		# And param jobTitle = 'Software Engg - 2'
		And params {id: '#(createdJobId)', jobTitle: 'Software Engg - 2'}
		And headers {Accept:'application/json'}
		When method get
		Then status 200
		And match response.jobId == createdJobId
		
	Scenario: To get the data using Query Parameter with Job not in the application 
    # Create the Job Entry
    # Get the newly created Job Entry using Query Param
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def createdJobId = getRandomValue()
		* def createJob = call read("../../createJobEntryWithVariables.feature"){_url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createdJobId)'}
		# Send the Get request with query param
		Given path '/normal/webapi/find'
		And param id = 84835
		And param jobTitle = 'Software Engg - 2'
		And headers {Accept:'application/json'}
		When method get
		Then status 404
