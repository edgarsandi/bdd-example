Feature: Company
    In order to menage Company
    As a client
    I need to be able send a POST, PUT and GET requests

Scenario: Success Company POST
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
