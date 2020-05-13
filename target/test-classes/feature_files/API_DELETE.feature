Feature: DELETE test script

Background:
* def URL = 'https://licensing.services.dctt.gov.ae'
* url URL

Scenario: Check 204 response code 

Given path 'api/v1.0/Venues/56'
And header Accept = 'application/json'
When method DELETE
Then status 204

Scenario: Check 204 response VALUE
#------request processed successfully------#
Given path 'api/v1.0/Venues/56'
And header Accept = 'application/json'
When method DELETE
Then status 204
And match response == ''


Scenario: Check 404 response code by hitting wrong url
Given path 'ap'
And header Accept = 'application/json'
When method get
Then status 404

Scenario: Check 404 ERROR MESSAGE
Given path 'api/v1.0/Venues/ihji'
And header Accept = 'application/json'
When method DELETE
Then status 404
And match response == ''

Scenario: Check DELETE non existing id
Given path 'api/v1.0/Venues/56dwd'
And header Accept = 'application/json'
When method DELETE
Then status 404
And match response == '"The Venue record couldn\'t be found."'


Scenario: DELETE the already deleted Id
Given path 'api/v1.0/Venues/56ded'
And header Accept = 'application/json'
When method DELETE
Then status 404
And match response == '"The Venue record couldn\'t be found."'

############################# Manual - Response as 500  #############################################

@manual
Scenario: Check 500 response code
#------resource exist but input is wrong------#
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method DELETE
Then status 500














