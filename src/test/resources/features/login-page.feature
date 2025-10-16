Feature: Login Page Functionality
  @story:CUC-55 @priority:high
  Background:

    Given the user is on the login page

  @happyPath
  Scenario: Successful login with valid credentials
    Given the user enters valid username and password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  @negative
  Scenario: Unsuccessful login with invalid credentials
    Given the user enters an invalid username or password
    When the user clicks the login button
    Then the user should see an error message stating 'Invalid username or password'

  @boundary
  Scenario: Boundary scenario for password length
    Given the user enters a password with the minimum required length
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  @security
  Scenario: Security scenario with SQL injection attempt
    Given the user enters a SQL injection string as the username
    When the user clicks the login button
    Then the user should see an error message and no access should be granted

  @performance
  Scenario: Performance scenario under load
    Given multiple users attempt to login simultaneously with valid credentials
    When the system processes these login requests
    Then the login process should complete within acceptable time limits for all users