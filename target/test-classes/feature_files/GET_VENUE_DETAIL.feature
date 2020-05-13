Feature: GET test script

Background:
* def URL = 'https://licensing.services.dct.gov.ae'
* url URL


Scenario: Check 200 response code
#------request processed successfully------#
Given path 'api/v1.0/Venues/2'
And header Accept = 'application/json'
When method get
Then status 200




#/----------------------------------------------------------------------

Scenario: Check 404 response code by hitting wrong url
Given path '/api/v1.0/Venues/23'
And header Accept = 'application/json'
When method get
Then status 404



##/----------------------------------------------------------------------
#
Scenario: check 404 error message by passing wrong id

Given path 'api/v1.0/Venues/56'
And header Accept = 'application/json'
When method get
Then status 404
And match response == '"entity not found"'


Scenario: check 400 error message by passing wrong id

Given path 'api/v1.0/Venues/56WEWEWE'
And header Accept = 'application/json'
When method get
Then status 400
#And match response == '"entity not found"'


#
##/----------------------------------------------------------------------
#
#Scenario: validate response value of 200 response code
#Given path 'api/v1.0/Venues/56'
#And header Accept = 'application/json'
#When method get
#Then status 200
#* def response_val = read('classpath:response_VENUE_DETAIL.json')
#And match response == response_val
#
##/----------------------------------------------------------------------
#
#Scenario: validate response SCHEMA of 200 response code
#Given path 'api/v1.0/Venues/56'
#And header Accept = 'application/json'
#When method get
#Then status 200
#* def response_SCHEMA = read('classpath:SCHEMA_VENUE_DETAIL.json')
#And match response == response_SCHEMA
#
##/----------------------------------------------------------------------
#
#Scenario: check mandatory fields of 200 response
#Given path 'api/v1.0/Venues/56'
#And header Accept = 'application/json'
#When method get
#Then status 200
#
#* def schema = read('classpath:response_api_VENUE_DETAIL.json')
#
#And match $.id != ''
#And match $.name != ''
#
#And match $.owner.name != ''
#And match $.owner.type != ''
#
#And match $.media[0].url != ''
#And match $.media[0].type != ''
#And match $.media[0].primary != ''
#
#
#And match $.type != ''
#And match $.location != ''
#And match $.location.address.line1 != ''
#And match $.location.address.city != ''
#And match $.location.address.country != ''
#
#And match $.parking.type != ''
#And match $.parking.totalCapacity != ''
#
#And match $.contacts[0].contactType != ''
#And match $.contacts[0].social[0].name != ''
#And match $.contacts[0].social[0].url != ''
#
#And match $.visitingInfo[0].day != ''
#And match $.visitingInfo[0].openTime != ''
#And match $.visitingInfo[0].closeTime != ''
#
#
#And match $.functionPlace[0].name != ''
#And match $.functionPlace[0].type != ''
#
#And match $.accomodation.cost[0].minCost != ''
#And match $.accomodation.cost[0].maxCost != ''
#And match $.accomodation.cost[0].maxCost != ''
#
#And match $.pointsOfInterest[0].attraction != ''
#And match $.pointsOfInterest[0].distance != ''
#
##/----------------------------------------------------------------------
#
#Scenario: Check optional fields response
#Given path 'api/v1.0/Venues/56'
#Given url foo
#And header Accept = 'application/json'
#When method get
#Then status 200
#
#
#And match $[0].location.address.line1 == null
#
#And match $[0].location.address.line1 == null
#
#And match $[0].description == null
#And match $[0].group == null
#And match $[0]n.owner.licenseNo == null
#
#And match $[0].media[0].shortDescription == null
#And match $[0].media[0].size == null
#
#And match $[0].location.address.line2 == null
#And match $[0].location.address.regionCode == null
#
#And match $[0].location.latitude == null
#And match $[0].location.longitude == null
#And match $[0].pointsOfInterest[0].proximity == null
#
############################## Manual - Response as 500  #############################################
#	
@manual
Scenario: Check 500 response code
#------resource exist but input is wrong------#
Given path 'api/v1.0/Venues/2'
And header Accept = 'application/json'
When method get
Then status 500


@test
Scenario: testing GUI
  Given : driver








