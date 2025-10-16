Feature: Login Page Functionality
  @story:CUC-19 @priority:high
  Background:

    Given the application is running
    And the login page is displayed

  @happy-path
  Scenario: Successful login with valid credentials
    Given a user with valid credentials
    When the user enters the username and password
    And clicks the login button
    Then the user is redirected to the dashboard

  @negative
  Scenario: Failed login with invalid credentials
    Given a user with invalid credentials
    When the user enters the username and password
    And clicks the login button
    Then an error message 'Invalid username or password' is displayed

  @negative
  Scenario: Login attempt with empty fields
    Given the username and password fields are empty
    When the user clicks the login button
    Then an error message 'Username and password cannot be empty' is displayed

  @boundary
  Scenario: Successful login with username at boundary length
    Given a user with a valid username having maximum allowed characters
    And a valid password
    When the user enters the username and password
    And clicks the login button
    Then the user is redirected to the dashboard

  @security
  Scenario: SQL Injection attempt on login
    Given a user attempts a SQL injection in the username or password field
    When the user clicks the login button
    Then the injection is not executed
    And an error message 'Invalid username or password' is displayed

  @performance
  Scenario: Login under stress
    Given multiple users attempt to login simultaneously
    When the system processes login requests
    Then all users are processed within acceptable time limits
    And the system remains stable