Feature: GET test script

Background:
* def URL = 'https://licensing.services.dctt.gov.ae'
* url URL


Scenario: Check 200 response code

Given path 'api/v1.0/Venues'
When method get
Then status 200

#/----------------------------------------------------------------------

Scenario: Check 404 response code by hitting wrong url

Given path 'api/v1.0/V'
And header Accept = 'application/json'
When method get
Then status 404

#/----------------------------------------------------------------------

Scenario: validate response value of 200 response code
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 200
* def response_val = read('classpath:response_VENUE_LIST.json')
And match response[0] == response_val[0]

#/----------------------------------------------------------------------

Scenario: validate response SCHEMA of 200 response code
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 200
* def schema = read('classpath:SCHEMA_VENUE_LIST.json')
And match response[0] == schema[0]

#/----------------------------------------------------------------------

Scenario: check mandatory fields of 200 response
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 200
* def schema = read('classpath:response_api_VENUE_DETAIL.json')

And match $[0].id != ''

#name
And match $[0].name != ''
And match $[0].type != ''
And match $[0].location != ''

#line1
And match $[0].location.address.line1 != ''
And match $[0].location.address.city != ''
And match $[0].location.address.country != ''

#ownername
And match $[0].owner.name != ''
And match $[0].owner.type != ''

And match $[0].media[0].type != ''

#url
And match $[0].media[0].url != ''
And match $[0].media[0].primary != ''

And match $[0].parking.type != ''

#parking_total_capacity
And match $[0].parking.totalCapacity != ''

And match $[0].parking.details[0].vehicleType != ''

#parking_capacity
And match $[0].parking.details[0].capacity != ''

And match $[0].functionPlace[0].area.size != ''
And match $[0].functionPlace[0].area.unit != ''

And match $[0].functionPlace[0].seatingPlan[0].shape != ''


And match $[0].id != null
And match $[0].name != null
And match $[0].type != null
And match $[0].location != null

And match $[0].location.address.line1 != null
And match $[0].location.address.city != null
And match $[0].location.address.country != null

And match $[0].owner.name != null
And match $[0].owner.type != null

And match $[0].media[0].type != null
And match $[0].media[0].url != null
And match $[0].media[0].primary != null

And match $[0].parking.type != null
And match $[0].parking.totalCapacity != null

And match $[0].parking.details[0].vehicleType != null
And match $[0].parking.details[0].capacity != null

And match $[0].functionPlace[0].area.size != null
And match $[0].functionPlace[0].area.unit != null

And match $[0].functionPlace[0].seatingPlan[0].shape != null

#--------------------------------------------------------------------------------------------

Scenario: Check optional fields response of 200
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
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
Scenario: Check 500 response code
#------resource exist but input is wrong------#
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 500

