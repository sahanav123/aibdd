Feature: Login Page Functionality
  @story:CUC-19 @priority:high
  Background:

    Given the user is on the login page

  @happy @story:CUC-19
  Scenario: Successful login with valid credentials
    Given the user enters valid username and password
    When the user submits the login form
    Then the user is redirected to the dashboard

  @negative @story:CUC-19
  Scenario: Unsuccessful login with invalid credentials
    Given the user enters an invalid username or password
    When the user submits the login form
    Then an error message 'Invalid username or password' is displayed

  @boundary @story:CUC-19
  Scenario: Boundary test for username length
    Given the user enters a username of maximum allowed length
    And a valid password
    When the user submits the login form
    Then the user is redirected to the dashboard

  @boundary @story:CUC-19
  Scenario: Boundary test for password length
    Given the user enters a valid username
    And a password of maximum allowed length
    When the user submits the login form
    Then the user is redirected to the dashboard

  @security @story:CUC-19
  Scenario: SQL injection prevention on login
    Given the user enters a typical SQL injection string as the username
    And a typical SQL injection string as the password
    When the user submits the login form
    Then an error message 'Invalid username or password' is displayed
    And the user is not redirected to the dashboard

  @performance @story:CUC-19
  Scenario: Performance test for login under high load
    Given the login page is accessed by multiple users simultaneously
    When the user submits the login form with valid credentials
    Then the response time is within acceptable limits
    And the user is redirected to the dashboard