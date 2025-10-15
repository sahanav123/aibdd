Feature: User should be able to Login
  @story:CUC-2 @priority:high
  Background:

    Given the user is on the login page

  @happyPath
  Scenario: Successful login with valid credentials
    Given the user enters a valid username
    And the user enters a valid password
    When the user clicks the login button
    Then the user is redirected to the dashboard page

  @negative
  Scenario: Login failure with invalid password
    Given the user enters a valid username
    And the user enters an invalid password
    When the user clicks the login button
    Then an error message is displayed indicating invalid credentials

  @negative
  Scenario: Login failure with invalid username
    Given the user enters an invalid username
    And the user enters a valid password
    When the user clicks the login button
    Then an error message is displayed indicating invalid credentials

  @boundary
  Scenario: Login button disabled with empty fields
    Given the user leaves the username field empty
    And the user leaves the password field empty
    Then the login button is disabled

  @security @negative
  Scenario: Login attempt with SQL injection
    Given the user enters an SQL injection code as username
    And the user enters an SQL injection code as password
    When the user clicks the login button
    Then an error message is displayed indicating invalid credentials

  @performance
  Scenario: Login performance test
    Given the user has entered valid credentials
    When the user clicks the login button
    Then the login process completes within 2 seconds