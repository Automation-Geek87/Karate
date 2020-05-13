Feature: browser automation 1

  Background:
  # * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
#    * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  @Google
  Scenario Outline: Open Google Application
  and then Open Google  Application and test it further the applications
    Given driver 'https://www.google.com'
    And waitUntil("document.readyState == 'complete'")
    And  input('input[name=q]', '<name>')
    When submit().click("//input[@name='btnK'][1]")
    And waitUntil("document.readyState == 'complete'")
    Then match value('.//input[@name='q'][1]') == '<name>'
    Examples:
      | read('google.csv') |