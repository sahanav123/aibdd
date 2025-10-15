Feature: User Login
  @story:CUC-2 @priority:high
  Background:

    Given the user is on the login page

  @happyPath
  Scenario: Successful Login with Valid Credentials
    Given the user enters a valid email address
    And the user enters a valid password
    When the user clicks the login button
    Then the user should be redirected to the dashboard

  @negative
  Scenario: Login with Invalid Email
    Given the user enters an invalid email address
    And the user enters a valid password
    When the user clicks the login button
    Then the user should see an error message for invalid email

  @negative
  Scenario: Login with Invalid Password
    Given the user enters a valid email address
    And the user enters an invalid password
    When the user clicks the login button
    Then the user should see an error message for incorrect password

  @boundary
  Scenario: Login with Empty Email and Password
    Given the user does not enter an email address
    And the user does not enter a password
    When the user clicks the login button
    Then the user should see an error message for missing credentials

  @security
  Scenario: Login with SQL Injection Attempt
    Given the user enters an email address with SQL injection pattern
    And the user enters a valid password
    When the user clicks the login button
    Then the user should see an error message and not be logged in

  @performance
  Scenario: Multiple Login Attempts with Rate Limiting
    Given the user attempts to login with an invalid password repeatedly
    And the user repeats this more than 5 times in quick succession
    When the user tries to login again
    Then the user should receive a message stating account is temporarily locked