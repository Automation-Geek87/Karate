Feature: NewToursDemaout Login Scenario

  Background:
   Given call read('NewTourDemaoutSignIn.feature')

  # * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
    * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
#    * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  @findflight
  Scenario: Open NewTours Feature file options
  and then Open Application and choose the flight options
    Given waitUntil("document.readyState == 'complete'")
    When submit().click("//a[contains(.,'Flights')]")
    And waitUntil("document.readyState == 'complete'")
    And select("select[name='fromPort']", 'London')
    And select("select[name='passCount']", '2')
    And select("select[name='airline']", 'Blue Skies Airlines')
    When submit().click("//input[@name='findFlights']")


