Feature: Practice Assertion The Karate Way

  Scenario: Simple assertion for number
    Given def num1 = 20
    And def num2 = 10
    Then assert num1+num2 == 30

    * print 'Hello world!'
    * print 'Hello world!' , num1
    * print 'Hello world!' + num1

    Scenario: Working with Simple Json
      * def myJson = {name: 'bar', num :[99,88,54]}
      * print 'Whole Json is '+myJson
      * print 'Then name is '+myJson.name
      * print 'The Second Number in the json is ',myJson.num[1]
      
      * assert myJson.name == 'bar'
      * assert myJson.num[2] == '54'
