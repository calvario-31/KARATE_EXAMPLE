Feature:
  Background:
    Given url apiUrl

  @ignore
  Scenario:
    Given path 'ping'
    When method GET
    Then status 201
    And assert responseTime < 1200