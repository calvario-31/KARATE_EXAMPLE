Feature:
  Background:
    * def bodyJson = Java.type('booking.faker.DataGenerator').newBookingFakeData()
    * def responseSchema = read('classpath:booking/schema/newBooking.json')

    Given url apiUrl

  @smoke
  @regression
  Scenario:
    Given path 'booking'
    And request bodyJson
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema

