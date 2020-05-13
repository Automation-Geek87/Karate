Feature: GET test script

Background:
* def URL = 'https://licensing.services.dct.gov.ae'
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
#
##/----------------------------------------------------------------------
#
Scenario: validate response of venue list in prod & test
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 200
* def response_val = read('classpath:VENUE_LIST_PROD_AR.json')
* def response_val_2 = read('classpath:VENUE_LIST_TEST_AR.json')
And match response_val == response_val_2

