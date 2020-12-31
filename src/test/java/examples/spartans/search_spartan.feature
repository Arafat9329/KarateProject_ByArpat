Feature: Searching Spartan by name and gender
  Background:
    * url 'http://18.234.102.94:8000/'
  Scenario: User should be able to search
    Given path '/api/spartans/search'
    And param nameContains = 'a'
    And param gender = 'Female'
    When method get
    Then status 200

    * match each response.content[*].gender == 'Female'
    * def responseToLowerCase = karate.lowerCase(response)
    * match each responseToLowerCase.content[*].name contains "a"

