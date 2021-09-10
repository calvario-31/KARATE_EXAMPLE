Feature:
  Background:
    * def createBookingApi = callonce read('classpath:booking/feature/CreateBooking.feature')
    * def bookingId = createBookingApi.response.bookingid

    * def responseSchema = read('classpath:booking/schema/booking.json')

    Given url apiUrl

  @smoke
  @regression
  Scenario:
    Given path 'booking', bookingId
    When method GET
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema