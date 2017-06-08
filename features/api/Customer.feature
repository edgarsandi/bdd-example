Feature: Customer
    In order to manage customers on Service
    As a client
    I need to be able to send POST, GET and PUT requests

Scenario: Success customer POST
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 12345678           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 01/01/1980         |
          | tax_identification | 12345678910        |
    Then the response code should be 200
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid customer POST with invalid e-mail
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@             |
          | password           | 12345678           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 01/01/1980         |
          | tax_identification | 12345678910        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer POST with invalid password
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 78978978           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 01/01/1980         |
          | tax_identification | 12345678910        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer POST with invalid birthday
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 78978978           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 31/31/1980         |
          | tax_identification | 12345678910        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer POST with invalid tax identification
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 78978978           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 01/01/1980         |
          | tax_identification | 12312312312        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer POST with invalid birthdate
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 78978978           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 31/31/1980         |
          | tax_identification | 12312312312        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer POST with less than 10 years old birthdate
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 78978978           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 01/01/2010         |
          | tax_identification | 12312312312        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Success GET
    Given I set header "Content-Type" with value "application/json"
    When I send a GET request to "/customer"
    Then the response code should be 200
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer GET with invalid token
    Given I set header "Content-Type" with value "application/json"
    And I set header "Authorization" with value "Bearer AAAAABBBB"
    When I send a GET request to "/customer"
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer GET with blank token
    Given I set header "Content-Type" with value "application/json"
    And I set header "Authorization" with value "Bearer "
    When I send a GET request to "/customer"
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Success customer PUT
    Given I set header "Content-Type" with value "application/json"
    When I send a PUT request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 12345678           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 01/01/1980         |
          | tax_identification | 12345678910        |
    Then the response code should be 200
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid customer PUT with invalid e-mail
    Given I set header "Content-Type" with value "application/json"
    When I send a PUT request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@             |
          | password           | 12345678           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 01/01/1980         |
          | tax_identification | 12345678910        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer PUT with invalid password
    Given I set header "Content-Type" with value "application/json"
    When I send a PUT request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 78978978           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 01/01/1980         |
          | tax_identification | 12345678910        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer PUT with invalid birthday
    Given I set header "Content-Type" with value "application/json"
    When I send a PUT request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 78978978           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 31/31/1980         |
          | tax_identification | 12345678910        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer PUT with invalid tax identification
    Given I set header "Content-Type" with value "application/json"
    When I send a PUT request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 78978978           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 01/01/1980         |
          | tax_identification | 12312312312        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer PUT with invalid birthdate
    Given I set header "Content-Type" with value "application/json"
    When I send a PUT request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 78978978           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 31/31/1980         |
          | tax_identification | 12312312312        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """

Scenario: Invalid customer PUT with less than 10 years old birthdate
    Given I set header "Content-Type" with value "application/json"
    When I send a PUT request to "/customer" with values:
          | uuid               | UUID information   |
          | email              | teste@teste.com.br |
          | password           | 78978978           |
          | first_name         | teste              |
          | last_name          | abc abc            |
          | gender             | Masculino          |
          | birthdate          | 01/01/2010         |
          | tax_identification | 12312312312        |
    Then the response code should be 400
  	And the response should contain json:
    """
      {"code":400, "message":"String message"}
    """
