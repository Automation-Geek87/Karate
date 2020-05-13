Feature: POST test script

Background:
* def URL = 'https://licensing.services.dctt.gov.ae'
* url URL

Scenario: Check 200 response code

Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
* def someJson = read('classpath:post.json')
Given request someJson
When method POST
Then status 200

#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------

Scenario: Check 404 response by hitting wrong URL
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
* def someJson = read('classpath:post.json')
Given request someJson
When method POST
Then status 404



Scenario: validate response SCHEMA of 200 response code
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
* def someJson = read('classpath:post.json')
Given request someJson
When method POST
Then status 200
* def response_val = read('classpath:SCHEMA_VENUE_DETAIL.json')
And match response == response_val


#-------------------------------------------------------------------------------
#
Scenario: validate response value of 200 response code
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method POST
Then status 200
* def response_val = read('classpath:response_VENUE_DETAIL.json')
And match response == response_val




Scenario: check mandatory fields of 200 response
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method POST
Then status 200

* def schema = read('classpath:response_api_VENUE_DETAIL.json')

And match $.id != ''
And match $.name != ''

And match $.owner.name != ''
And match $.owner.type != ''

And match $.media[0].url != ''
And match $.media[0].type != ''
And match $.media[0].primary != ''


And match $.type != ''
And match $.location != ''
And match $.location.address.line1 != ''
And match $.location.address.city != ''
And match $.location.address.country != ''

And match $.parking.type != ''
And match $.parking.totalCapacity != ''

And match $.contacts[0].contactType != ''
And match $.contacts[0].social[0].name != ''
And match $.contacts[0].social[0].url != ''

And match $.visitingInfo[0].day != ''
And match $.visitingInfo[0].openTime != ''
And match $.visitingInfo[0].closeTime != ''


And match $.functionPlace[0].name != ''
And match $.functionPlace[0].type != ''

And match $.accomodation.cost[0].minCost != ''
And match $.accomodation.cost[0].maxCost != ''
And match $.accomodation.cost[0].maxCost != ''

And match $.pointsOfInterest[0].attraction != ''
And match $.pointsOfInterest[0].distance != ''

#-------------------------------------------------------------------------------

Scenario: check optional fields response of 200
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method POST
Then status 200


And match $[0].location.address.line1 == null
And match $[0].description == null
And match $[0].group == null
And match $[0]n.owner.licenseNo == null

And match $[0].media[0].shortDescription == null
And match $[0].media[0].size == null

And match $[0].location.address.line2 == null
And match $[0].location.address.regionCode == null

And match $[0].location.latitude == null
And match $[0].location.longitude == null
And match $[0].pointsOfInterest[0].proximity == null


############################# Manual - Response as 500  #############################################

@manual
Scenario: Check 500 response by hitting wrong URL
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
* def someJson = read('classpath:post.json')
Given request someJson
When method POST
Then status 500











