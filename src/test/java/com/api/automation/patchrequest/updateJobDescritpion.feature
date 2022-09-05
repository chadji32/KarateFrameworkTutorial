Feature: To test the patch end point for updating the job description
  PATCH /normal/webapi/update/details

  Background: Create and Initialize base Url
    Given url 'http://localhost:9897'

  Scenario: To update the job description for newly added job entry
    # Create a new Job Entry
    # Using the patch request update the job description of newly added job entry
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def createdJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createdJobId)'}
    # Patch request
    * def jobDes = 'To develop adroid application and web application'
    Given path '/normal/webapi/update/details'
    And params {id:'#(createdJobId)', jobTitle: 'Software Engg - 2', jobDescription:'#(jobDes)'}
    And header Accept = 'application/json'
    And request {}
    And method patch
    And status 200
    And match response.jobDescription == jobDes

  Scenario: To update the job description for newly added job entry with non-exiting job id
    # Create a new Job Entry
    # Using the patch request update the job description of newly added job entry
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def createdJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createdJobId)'}
    # Patch request
    * def jobDes = 'To develop adroid application and web application'
    Given path '/normal/webapi/update/details'
    And params {id:'-1', jobTitle: 'Software Engg - 2', jobDescription:'#(jobDes)'}
    And header Accept = 'application/json'
    And request {}
    And method patch
    And status 404

  Scenario: To update the job description for newly added job entry without job title
    # Create a new Job Entry
    # Using the patch request update the job description of newly added job entry
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def createdJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createdJobId)'}
    # Patch request
    * def jobDes = 'To develop adroid application and web application'
    Given path '/normal/webapi/update/details'
    And params {id:'#(createdJobId)', jobDescription:'#(jobDes)'}
    And header Accept = 'application/json'
    And request {}
    And method patch
    And status 400
    And match response.message == "Required String parameter 'jobTitle' is not present"
