Feature:
  Background:
    * def loginApi = callonce read('classpath:auth/feature/Login.feature')
    * def token = loginApi.response.token

    * def createBookingApi = callonce read('classpath:booking/feature/CreateBooking.feature')
    * def bookingId = createBookingApi.response.bookingid

    * def bodyJson = Java.type('booking.faker.DataGenerator').newPartialBookingData()

    * def responseSchema = read('classpath:booking/schema/booking.json')

    Given url apiUrl
    And header Cookie = 'token=' + token

  @regression
  Scenario:
    Given path 'booking', bookingId
    And request bodyJson
    When method PATCH
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema