Feature:
  Background:
    * def loginApi = callonce read('classpath:auth/feature/Login.feature')
    * def token = loginApi.response.token

    * def createBookingApi = callonce read('classpath:booking/feature/CreateBooking.feature')
    * def bookingId = createBookingApi.response.bookingid

    * def bodyJson = Java.type('booking.faker.DataGenerator').newBookingFakeData()

    * def responseSchema = read('classpath:booking/schema/booking.json')

    Given url apiUrl
    And header Cookie = 'token=' + token

  @regression
  @smoke
  Scenario:
    Given path 'booking', bookingId
    And request bodyJson
    When method PUT
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema