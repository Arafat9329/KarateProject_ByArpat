Feature:  Searching Movie from open DB

  Background:
    * url 'http://www.omdbapi.com/'
    * param apiKey = 'e65640d1'

  Scenario: Search for single movie
#    Given param apiKey = 'e65640d1'
    And param t = 'Wonder Woman : 1984'
    When method get
    Then  status 200

    * match response.Year == '2020'
    * match response.Runtime == '151 min'
    * match response.Rated == 'PG-13'
    * match response.Director == 'Patty Jenkins'


  Scenario Outline: Search for multiple movie
#      Given param apiKey = 'e65640d1'
    Given param t = '<movie_name>'
    When method get
    Then  status 200
  * match response.Year == '<year>'
    Examples:
      | movie_name        |year|
      | Life is beautiful |1997|
      | The Godfather     |1972|
      | HEAT              |1995|
      | God mother        |1915|