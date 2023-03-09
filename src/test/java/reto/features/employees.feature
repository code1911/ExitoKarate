Feature: Test employees api

  Background:
    * call read('classpath:reto/features/karate-config.js')
    * url UrlBase

  Scenario: Get all employee data
    * def responseEmployees = read('classpath:reto/features/responseAllEmployees.json')
    Given path 'employees'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    * match $ == responseEmployees

  @GetEmployeeID
  Scenario: Get a single employee data
    * def responseEmployeesID = read('classpath:reto/features/responseEmployeeID.json')
    * def idFind = 12
    Given path 'employee/'+ idFind
    #And param id = idFind
    And header Accept = 'application/json'
    When method GET
    Then status 200
    * match $ == responseEmployeesID

  Scenario: Create new record in database
    * call read('classpath:reto/features/newEmployee.js')
    * def requestNewEmployee = read('classpath:reto/features/requestNewEmployee.json')
    * def responseNewEmployee = read('classpath:reto/features/responseNewEmployee.json')
    Given path 'create'
    And header Accept = 'application/json'
    And request requestNewEmployee
    When method POST
    Then status 200
    * match $ == responseNewEmployee


  Scenario: Update an employee record
    * def requestUpdateEmployee = read('classpath:reto/features/requestUpdateEmployee.json')
    Given path 'update/' + 12
    And header Accept = 'application/json'
    #And  param id = 12
    And request requestUpdateEmployee
    When method PUT
    Then status 200
    * def responseUpdate = $
    Given path 'employee/' + 12
    #And param id = 12
    When method GET
    Then status 200
    * match $ == responseUpdate

  Scenario: Delete an employee record
    * def responseDeleteEmployee = read('classpath:reto/features/responseDeleteEmployee.json')
    Given path 'delete/' + 12
    And header Accept = 'application/json'
    #And param id = 12
    When method DELETE
    Then status 200
    * match $ == responseDeleteEmployee
