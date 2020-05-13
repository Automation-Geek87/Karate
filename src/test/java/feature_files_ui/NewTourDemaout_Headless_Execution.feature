Feature: NewToursDemaout Application Class

  Background:
  Given def registerPage = call read 'Locator.json'
  # * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  * configure driver = { type: 'chrome', start: false, showDriverLog: true  }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
#    * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  @headless
  Scenario: Open NewTours Application
  and then Open Google  Application and sites and open the page
    Given driver 'http://newtours.demoaut.com/'
    When  submit().click(registerPage.HomeMenu.registerLink)
    And  waitUntil("document.readyState == 'complete'")
    And  input(registerPage.Register.firstName, 'USer1')
    And  input(registerPage.Register.Lastname, 'USer1')
    And  input(registerPage.Register.phone, 'USer1')
    And  input(registerPage.Register.userName, 'testing@gmail.com')
    And  input(registerPage.Register.email, 'USerNameSelected')
    And  input(registerPage.Register.password, 'USerNameSelected')
    And  input(registerPage.Register.confirmPassword, 'USerNameSelected')
    And  submit().click(registerPage.Register.Register)
    And  waitUntil("document.readyState == 'complete'")

