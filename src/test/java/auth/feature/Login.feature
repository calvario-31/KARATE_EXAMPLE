Feature:
  Background:
    * def bodyJson = read('classpath:auth/json/credentials.json')
    Given url apiUrl

  @regression
  Scenario:
    Given path 'auth'
    And request bodyJson
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response.token == "#string"