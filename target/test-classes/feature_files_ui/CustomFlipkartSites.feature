Feature: browser automation 1

  Background:
  # * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
#    * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  @Flipkart
  Scenario Outline: Open Flipkart Application
  and then Open Google  Application and test it further the applications
    Given driver 'https://www.flipkart.com'

    Examples:
      | read('google.csv') |