Feature: NewToursDemaout Login Scenario

  Background:

    Given def registerPage = call read 'Locator.json'
  # * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
#  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
   * configure driver = { type: 'safaridriver', showDriverLog: true }
#    * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  @loginApplication
  Scenario: Open NewTours Login Application
  and then Open Application and login
    Given driver 'http://newtours.demoaut.com/'
    And  waitUntil("document.readyState == 'complete'")
    And  input(registerPage.SingIn.userName, 'USerNameSelected')
    And  input(registerPage.SingIn.password, 'USer1')
    When submit().click(registerPage.SingIn.Login)
    And  waitUntil("document.readyState == 'complete'")
