Feature: Spartans App Feature testing
# Use this ip address that has spartan app with no auth
# So we can just focus on writing feature file correctly
  Background:
    * url 'http://18.234.102.94:8000/'
#    * path '/api'

  Scenario: User should be able to call /api/hello to get greeting
    Given path '/api/hello'
    When method get
    Then status 200
    # checking content type header
    # use match rather than assert when you assert the part of response
    Then match header Content-Type == 'text/plain;charset=UTF-8'
    # checking the payload
    Then assert response == 'Hello from Sparta'


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

    ## Update the data with new body
    * def newPayload =
    """
     {
          "name":"Viginia",
          "gender":"Female",
          "phone":1234567890
     }
    """
    Given path '/api/spartans/' , newID
    And header Content-Type = 'application/json'
    And request newPayload
    When method put
    Then status 204

    ### Send another get request to make sure this worked


    ## Send a delete request to clean up this data
    Given path '/api/spartans/' , newID
    When method delete
    Then status 204

     ### Send another get request to make sure this worked