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
Scenario: validate response of venue "Cultural Foundation" 
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 200
* def response_val = read('classpath:response_Cultural_test.json')
* def response_val_2 = read('classpath:response_Cultural_prod.json')
And match response_val == response_val_2

Scenario: validate response of venue "Al Qattara Arts Centre" 
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 200
* def response_val = read('classpath:Qattara_test.json')
* def response_val_2 = read('classpath:Qattara_prod.json')
And match response_val == response_val_2
#
Scenario: validate response of venue "Al Ain Oasis" 
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 200
* def response_val = read('classpath:Ain_test.json')
* def response_val_2 = read('classpath:Ain_prod.json')
And match response_val == response_val_2
#
Scenario: validate response of venue "Al Ain Palace Museum" 
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 200
* def response_val = read('classpath:Palace_test.json')
* def response_val_2 = read('classpath:Palace_prod.json')
And match response_val == response_val_2
#
Scenario: validate response of venue "Qasr Al Muwaiji" 
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 200
* def response_val = read('classpath:Muwaiji_test.json')
* def response_val_2 = read('classpath:Muwaiji_prod.json')
And match response_val == response_val_2
#
Scenario: validate response of venue "Al Jahili Fort" 
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 200
* def response_val = read('classpath:Jahili_test.json')
* def response_val_2 = read('classpath:Jahili_prod.json')
And match response_val == response_val_2

Scenario: validate response of venue "Manarat Al Saadiyat" 
Given path 'api/v1.0/Venues'
And header Accept = 'application/json'
When method get
Then status 200
* def response_val = read('classpath:Manarat_test.json')
* def response_val_2 = read('classpath:Manarat_prod.json')
And match response_val == response_val_2