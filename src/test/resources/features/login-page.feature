Feature: Login Page Functionality
  @story:CUC-25 @priority:high
  Background:

    Given the user is on the login page

  @happyPath
  Scenario: Successful login with valid credentials
    When the user enters valid username and password
    And the user clicks the login button
    Then the user should be redirected to the dashboard page

  @negative
  Scenario: Login attempt with invalid username
    When the user enters an invalid username and a valid password
    And the user clicks the login button
    Then an error message should be displayed indicating invalid login credentials

  @negative
  Scenario: Login attempt with invalid password
    When the user enters a valid username and an invalid password
    And the user clicks the login button
    Then an error message should be displayed indicating invalid login credentials

  @negative
  Scenario: Login form with empty fields
    When the user leaves the username and password fields empty
    And the user clicks the login button
    Then an error message should ask the user to fill in all required fields

  @boundary
  Scenario: Boundary test for password length
    When the user enters a valid username and a password with minimal required length
    And the user clicks the login button
    Then the user should be redirected to the dashboard page

  @security
  Scenario: SQL injection attempt in username
    When the user enters a SQL injection string in the username field and a valid password
    And the user clicks the login button
    Then an error message should be displayed indicating invalid login credentials

  @performance
  Scenario: Load test for login functionality
    When 1000 users attempt to log in simultaneously with valid credentials
    Then the login response time should be within acceptable limits