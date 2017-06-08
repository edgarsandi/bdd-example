Feature: Address
    In order to manage customers address on Service
    As a client
    I need to be able to send POST, GET and PUT requests

Scenario: Success address POST
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer/address" with values:
          | title             | Teste customer     |
          | first_name        | Endereço           |
          | last_name         | Teste Address      |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 200
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address POST with blank title
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer/address" with values:
          | title             |                    |
          | first_name        | Endereço           |
          | last_name         | Teste Address      |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 200
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address POST with blank first_name
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer/address" with values:
          | title             | Teste customer     |
          | first_name        |                    |
          | last_name         | Teste Address      |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 200
    And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address POST with blank last_name
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer/address" with values:
          | title             | Teste customer     |
          | first_name        | Endereço           |
          | last_name         |                    |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 200
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address POST with blank zip_code
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer/address" with values:
          | title             | Teste customer     |
          | first_name        | Endereço           |
          | last_name         | Teste Address      |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          |                    |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 200
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address POST with blank city
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer/address" with values:
          | title             | Teste customer     |
          | first_name        | Endereço           |
          | last_name         | Teste Address      |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              |                    |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 200
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address POST with blank state
    Given I set header "Content-Type" with value "application/json"
    When I send a POST request to "/customer/address" with values:
          | title             | Teste customer     |
          | first_name        | Endereço           |
          | last_name         | Teste Address      |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             |                    |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 200
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Success address PUT
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    When I send a PUT request with Token on "customer/address" with values:
          | title             | Teste customer     |
          | first_name        | Endereço           |
          | last_name         | Teste Address      |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 200
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address PUT with invalid Token
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200

    And I set header "Token" with value "Barier ABC123teste"
    When I send a PUT request to "customer/address" with values:
          | title             | Teste customer     |
          | first_name        | Endereço           |
          | last_name         | Teste Address      |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 400
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address PUT with blank Token
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    And I set header "Token" with value "Barier "
    When I send a PUT request to "customer/address" with values:
          | title             | Teste customer     |
          | first_name        | Endereço           |
          | last_name         | Teste Address      |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 400
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address PUT with blank title
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    When I send a PUT request with Token on "customer/address" with values:
          | title             |                    |
          | first_name        | Endereço           |
          | last_name         | Teste Address      |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 400
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address PUT with blank first_name
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    When I send a PUT request with Token on "customer/address" with values:
          | title             | teste customer     |
          | first_name        |                    |
          | last_name         | Teste Address      |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 400
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address PUT with blank laste_name
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    When I send a PUT request with Token on "customer/address" with values:
          | title             | teste customer     |
          | first_name        | Teste Address      |
          | last_name         |                    |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 400
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address PUT with blank zip_code
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    When I send a PUT request with Token on "customer/address" with values:
          | title             | teste customer     |
          | first_name        | Teste Address      |
          | last_name         | Teste ABC          |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          |                    |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 400
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address PUT with blank city
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    When I send a PUT request with Token on "customer/address" with values:
          | title             | teste customer     |
          | first_name        | Teste Address      |
          | last_name         | Teste ABC          |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              |                    |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 400
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address PUT with blank state
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    When I send a PUT request with Token on "customer/address" with values:
          | title             | teste customer     |
          | first_name        | Teste Address      |
          | last_name         | Teste ABC          |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             |                    |
          | phone             | (011)5555-2222     |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 400
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address PUT with blank phone
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    When I send a PUT request with Token on "customer/address" with values:
          | title             | teste customer     |
          | first_name        | Teste Address      |
          | last_name         | Teste ABC          |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             |                    |
          | phone2            | (011)98888-2222    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 400
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address PUT with blank phone2
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    When I send a PUT request with Token on "customer/address" with values:
          | title             | teste customer     |
          | first_name        | Teste Address      |
          | last_name         | Teste ABC          |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            |                    |
          | neighborhood      | Vila Teste         |
    Then the response code should be 400
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address PUT with blank neighborhood
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    When I send a PUT request with Token on "customer/address" with values:
          | title             | teste customer     |
          | first_name        | Teste Address      |
          | last_name         | Teste ABC          |
          | line1             | String teste1      |
          | line2             | String teste2      |
          | zip_code          | 04044020           |
          | city              | São Paulo          |
          | state             | São Paulo          |
          | phone             | (011)5555-2222     |
          | phone2            | (011)95555-2222    |
          | neighborhood      |                    |
    Then the response code should be 400
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Success address GET
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    When I send a PUT request with Token on "customer/address":
    Then the response code should be 200
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address GET with blank token
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    And I set header "Token" with value "Token "
    When I send a GET request to "customer/address":
    Then the response code should be 401
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address GET with invalid token
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200
    And I set header "Token" with value "Token ABC123teste"
    When I send a GET request to "customer/address":
    Then the response code should be 401
  	And the response should contain json:
      """
      {"token":"some information here"}
      """

Scenario: Invalid address GET without token
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "/customer/address" with values:
          | username          | teste@teste.com.br |
          | password          | 12345678           |
          | store             | dafiti             |
  	And the response code should be 200    
    When I send a GET request to "customer/address":
    Then the response code should be 401
  	And the response should contain json:
      """
      {"token":"some information here"}
      """
