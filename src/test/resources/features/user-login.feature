Feature: User Login
  @story:CUC-2 @priority:high
  Background:

    Given the application is running
    And the user is on the login page

  @happyPath
  Scenario: Successful login with valid credentials
    Given the user has a valid username and password
    When the user enters the valid username and password
    And the user clicks the login button
    Then the user should be redirected to the dashboard

  @negative
  Scenario: Unsuccessful login with invalid credentials
    Given the user has an invalid username or password
    When the user enters the invalid username or password
    And the user clicks the login button
    Then the user should see an error message indicating login failure

  @negative
  Scenario: Login attempt with empty fields
    Given the user leaves the username and password fields empty
    When the user clicks the login button
    Then the user should see a warning message indicating that fields cannot be empty

  @boundary
  Scenario: Boundary test for maximum password length
    Given the user enters a password exactly at the maximum allowed length
    When the user enters a valid username
    And the user clicks the login button
    Then the user should be redirected to the dashboard

  @boundary
  Scenario: Boundary test for password exceeding maximum length
    Given the user enters a password exceeding the maximum allowed length
    When the user enters a valid username
    And the user clicks the login button
    Then the user should see an error message indicating password too long

  @security
  Scenario: Security test for SQL injection attempt
    Given the user enters a malicious SQL query as username or password
    When the user clicks the login button
    Then the system should prevent the login and log a security alert

  @performance
  Scenario: Performance test under high load
    Given the system is under a simulated high load
    When users attempt to login simultaneously
    Then the system should maintain a specified response time