Feature: User Login
  @story:CUC-29 @priority:high
  Background:

    Given the user is on the login page

  @happy_path
  Scenario: Successful login with valid credentials
    Given the user enters a valid username
    And the user enters a valid password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  @negative
  Scenario: Login attempt with invalid username
    Given the user enters an invalid username
    And the user enters a valid password
    When the user clicks the login button
    Then an error message should be displayed indicating invalid credentials

  @negative
  Scenario: Login attempt with invalid password
    Given the user enters a valid username
    And the user enters an invalid password
    When the user clicks the login button
    Then an error message should be displayed indicating invalid credentials

  @negative
  Scenario: Login attempt with empty username and password
    Given the user leaves the username field empty
    And the user leaves the password field empty
    When the user clicks the login button
    Then an error message should be displayed indicating both fields are required

  @boundary
  Scenario: Boundary test for password length
    Given the user enters a valid username
    And the user enters a password with the minimum character limit
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  @boundary
  Scenario: Password attempt with more than maximum length
    Given the user enters a valid username
    And the user enters a password that exceeds the maximum character limit
    When the user clicks the login button
    Then an error message should be displayed indicating password length limit exceeded

  @performance
  Scenario: Simultaneous login attempts on multiple devices
    Given the user attempts to log in on multiple devices simultaneously
    When the user enters valid credentials on all devices
    Then the system should handle the logins and maintain account integrity

  @security
  Scenario: SQL injection attempt in the login form
    Given the user enters a SQL command as a username
    And the user enters a SQL command as a password
    When the user clicks the login button
    Then the system should prevent login and show a generic error message