Feature: Authenticate
    In order to Authenticate on Service
    As a client
    I need to be able send a request and get a success authentication


Scenario: Success Authentication POST - Dafiti store
  	Given I set header "Content-Type" with value "application/json"
  	When I send a POST request to "/auth" with values:
          | username               | teste@teste.com.br  |
          | password               | 12345678            |
          | store                  | dafiti              |
  	Then the response code should be 200
  	And the response should contain json:
      """
        {"token":"some information here"}
      """

Scenario: Success Authentication POST - Tricae store
  	Given I set header "Content-Type" with value "application/json"
  	When I send a POST request to "/auth" with values:
          | username               | teste@teste.com.br  |
          | password               | 12345678            |
          | store                  | tricae              |
  	Then the response code should be 200
  	And the response should contain json:
      """
        {"token":"some information here"}
      """

Scenario: Success Authentication POST - Kanui store
  	Given I set header "Content-Type" with value "application/json"
  	When I send a POST request to "/auth" with values:
          | username               | teste@teste.com.br  |
          | password               | 12345678            |
          | store                  | kanui               |
  	Then the response code should be 200
  	And the response should contain json:
      """
        {"token":"some information here"}
      """

Scenario: Invalid POST with invalid user
  	Given I set header "Content-Type" with value "application/json"
  	When I send a POST request to "/auth" with values:
          | username               | teste@              |
          | password               | 12345678            |
          | store                  | dafiti              |
  	Then the response code should be 400
  	And the response should contain json:
      """
        {"code":400, "message":"String message"}
      """

Scenario: Invalid POST with invalid passord
  	Given I set header "Content-Type" with value "application/json"
  	When I send a POST request to "/auth" with values:
          | username               | teste@teste.com.br  |
          | password               | 78978978            |
          | store                  | dafiti              |
  	Then the response code should be 400
  	And the response should contain json:
      """
        {"code":400, "message":"String message"}
      """

Scenario: Invalid POST with invalid store
  	Given I set header "Content-Type" with value "application/json"
  	When I send a POST request to "/auth" with values:
          | username               | teste@teste.com.br  |
          | password               | 12345678            |
          | store                  | Teste1              |
  	Then the response code should be 400
  	And the response should contain json:
      """
        {"code":400, "message":"String message"}
      """

Scenario: Invalid POST with blank user
  	Given I set header "Content-Type" with value "application/json"
  	When I send a POST request to "/auth" with values:
          | username               |                     |
          | password               | 12345678            |
          | store                  | Teste1              |
  	Then the response code should be 400
  	And the response should contain json:
      """
        {"code":400, "message":"String message"}
      """

Scenario: Invalid POST with blank password
  	Given I set header "Content-Type" with value "application/json"
  	When I send a POST request to "/auth" with values:
          | username               | teste@teste.com.br  |
          | password               |                     |
          | store                  | Teste1              |
  	Then the response code should be 400
  	And the response should contain json:
      """
        {"code":400, "message":"String message"}
      """

Scenario: Invalid POST with blank store
  	Given I set header "Content-Type" with value "application/json"
  	When I send a POST request to "/auth" with values:
          | username               | teste@teste.com.br  |
          | password               | 12345678            |
          | store                  |                     |
  	Then the response code should be 400
  	And the response should contain json:
      """
        {"code":400, "message":"String message"}
      """
