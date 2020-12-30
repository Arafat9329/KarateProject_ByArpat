Feature: Spartans App Feature testing
  Background:
    * url 'http://18.234.102.94:8000/'


    Scenario: User should be able to call /api/hellop to get greeting
      Given path '/api/hello'
      When method get
      Then  status 200
      Then print response
      Then match header Content-Type == 'text/plain;charset=UTF-8'
      Then  assert response == 'Hello from Sparta'

  Scenario: Spartan Crud Operation
    * def payload =
    """
          {
          "name":"Tucky",
          "gender":"Male",
          "phone":1231231234
          }
    """
    Given path '/api/spartans/'
    And header Content-Type = 'application/json'
    And request payload
    When method post
    Then status 201
    Then response.success == 'A Spartan is Born!'
    # Keep going from here and test you can access the data you just added
    # send another GET request
    * def newID = response.data.id
    Given path '/api/spartans/' , newID
    When method get
    Then status 200
    Then match header Content-Type == 'application/json'
    ## Send a delete request to clean up this data
    Given path '/api/spartans/' , newID
    When method delete
    Then status 204