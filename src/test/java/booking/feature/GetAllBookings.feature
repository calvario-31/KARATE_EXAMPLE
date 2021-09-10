Feature:
  Background:
    * def responseSchema = read('classpath:booking/schema/bookingId.json')
    Given url apiUrl

  @regression
  Scenario:
    Given path 'booking'
    When method GET
    Then status 200
    And assert responseTime < 1200
    And match response == "#[]"
    And match each response == responseSchema