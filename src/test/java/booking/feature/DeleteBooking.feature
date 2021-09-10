Feature:
  Background:
    * def loginApi = callonce read('classpath:auth/feature/Login.feature')
    * def token = loginApi.response.token

    * def createBookingApi = callonce read('classpath:booking/feature/CreateBooking.feature')
    * def bookingId = createBookingApi.response.bookingid

    Given url apiUrl
    And header Cookie = 'token=' + token

  @regression
  Scenario:
    Given path 'booking', bookingId
    When method DELETE
    Then status 201
    And assert responseTime < 1200