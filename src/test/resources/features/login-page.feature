Feature: User Login
  @story:CUC-65 @priority:high
  Background:

    Given a user navigates to the login page

  @happyPath
  Scenario: Successful login with valid credentials
    Given the user has a valid username and password
    When the user enters the valid username and password
    And clicks the login button
    Then the user should be redirected to the dashboard

  @negative
  Scenario: Login attempt with invalid credentials
    Given the user has an invalid username and/or password
    When the user enters invalid username and/or password
    And clicks the login button
    Then the user should see an error message

  @negative
  Scenario: Login attempt with empty fields
    Given the login fields are empty
    When the user clicks the login button
    Then the user should remain on the login page
    And an error message about required fields should be displayed

  @boundary
  Scenario: Boundary testing on password field
    Given the password field accepts maximum of 20 characters
    When the user enters a 20 characters long password
    And clicks the login button
    Then the system should process the request without errors

  @security
  Scenario: SQL injection attempt on login
    Given a user attempts to perform SQL injection with ' OR '1'='1''
    When the input is submitted
    Then the login should fail
    And an error message about invalid credentials should appear

  @performance
  Scenario: Performance test for concurrent logins
    Given multiple users attempt to login simultaneously
    When the system processes these simultaneous login requests
    Then the login operation should complete within an acceptable time frame for each user