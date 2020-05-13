Feature: NewToursDemaout Login Scenario

  Background:

  # * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
   * configure driver = { type: 'chrome', showDriverLog: true }
#   * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
#    * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  @customStepFiles
  Scenario: Open NewTours Feature file options
    and then Open Application and choose the flight options
    Given Launch Application in back-end
    When do login methond


