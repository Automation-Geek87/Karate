Feature: browser automation 1

  Background:
  # * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  #* configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  @GCA
  Scenario: Open GCA Application
  and then Open GCA Application and test it further the applications
    Given driver 'https://www.tamm.abudhabi/journeys/get-technical-education/'
    And waitUntil("document.readyState == 'complete'")
    And click("//div[text()='Get Career Advice']")
    And waitForUrl("https://www.tamm.abudhabi/journeys/get-technical-education/get-career-advice/")
    And waitFor("//div[@class='ui-lib-start-login']//button").click()
    And waitUntil("document.readyState == 'complete'")
    And waitFor("//input[@class='ui-lib-radio__input'][1]").click()
    And waitFor("//button[text()='Next']").click()
    And waitFor("//button[contains(.,'Cancel')]").click()
    And waitUntil("document.readyState == 'complete'")
    And waitForEnabled("//button[contains(@class,'ui-lib-button_small')]").click()

