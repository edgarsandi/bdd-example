Feature: Telesales
    In order to Authenticate on Telesales
    As a client
    I need to be able send a request and get a success authentication


Scenario: Success Telesales Authentication POST
  	Given I set header "Content-Type" with value "application/json"
  	And I send a POST request to "/auth" with values:
          | username               | teste@teste.com.br  |
          | password               | 12345678            |
          | store                  | dafiti              |
  	And the response code should be 200
    When I send a POST request with Token on "telesales/auth"
    Then the response code should be 200
  	And the response should contain json:
      """
        {"token":"some information here"}
      """

Scenario: Invalid Authentication POST with invalid Token
  	Given I set header "Content-Type" with value "application/json"
  	And I send a POST request to "telesales/auth" with values:
          | username               | teste@teste.com.br  |
          | password               | 12345678            |
          | store                  | dafiti              |
  	And the response code should be 200
    When I send a POST request to "/auth" with values:
          | Token                  | ABC123teste         |
    Then the response code should be 400
  	And the response should contain json:
      """
        {"token":"some information here"}
      """

Scenario: Invalid Authentication POST with blank Token
  	Given I set header "Content-Type" with value "application/json"
  	And I send a POST request to "telesales/auth" with values:
          | username               | teste@teste.com.br  |
          | password               | 12345678            |
          | store                  | dafiti              |
  	And the response code should be 200
    When I send a POST request to "/auth" with values:
          | Token                  |                     |
    Then the response code should be 400
  	And the response should contain json:
      """
        {"token":"some information here"}
      """
