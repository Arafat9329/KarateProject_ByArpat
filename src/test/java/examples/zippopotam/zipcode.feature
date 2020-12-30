Feature: Users should be able to search city info by zipcode
  examples url api.zippopotam.us/us/22030
  Background:
    * url 'https://api.zippopotam.us'

  Scenario: Get city info using zipcode
    Given path 'us/22030'
    When method get
    Then status 200