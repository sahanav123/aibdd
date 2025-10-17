Feature: Login Page Functionality
  @story:CUC-65 @priority:high
  Background:

    Given the user is on the login page

  @happyPath
  Scenario: Successful login with valid credentials
    Given the user enters a valid username
    And the user enters a valid password
    When the user clicks the login button
    Then the user is redirected to the dashboard page
    And a welcome message is displayed

  @negative
  Scenario: Login attempt with invalid credentials
    Given the user enters an invalid username or password
    When the user clicks the login button
    Then an error message is displayed indicating invalid credentials
    And the login page is displayed again

  @boundary
  Scenario: Login attempt with empty username and password fields
    Given the user leaves the username field empty
    And the user leaves the password field empty
    When the user clicks the login button
    Then an error message is displayed indicating required fields
    And the login page is displayed again

  @security
  Scenario: SQL injection attempt on login form
    Given the user enters a SQL injection string as the username
    And the user enters a random password
    When the user clicks the login button
    Then an error message is displayed indicating invalid credentials
    And the application is not compromised

  @performance
  Scenario: Login under high load conditions
    Given the system is experiencing high load
    And the user enters a valid username and password
    When the user clicks the login button
    Then the user is redirected to the dashboard page within acceptable response time