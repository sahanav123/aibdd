Feature: User Login
  @story:CUC-2 @priority:high
  Background:

    Given the login page is displayed

  @happy-path
  Scenario: User logs in with valid credentials
    Given the user has valid credentials
    When the user enters the valid username and password
    And clicks the login button
    Then the user should be redirected to the dashboard

  @negative
  Scenario: User attempts to log in with invalid credentials
    Given the user has invalid credentials
    When the user enters an invalid username or password
    And clicks the login button
    Then an error message should be displayed

  @boundary
  Scenario: User logs in with empty username or password
    Given the user has no username or password entered
    When the user clicks the login button
    Then a validation message should be displayed

  @security
  Scenario: Login action should be resilient to brute force attacks
    Given the user attempts to login with incorrect credentials repeatedly
    When the user exceeds the maximum number of allowed attempts
    Then the user's account should be temporarily locked

  @performance
  Scenario: Login process performance under heavy load
    Given the system is under heavy load with multiple users trying to log in
    When the user enters valid credentials
    Then the system should log in the user within acceptable time limits