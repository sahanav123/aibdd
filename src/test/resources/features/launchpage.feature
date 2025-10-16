Feature: Launch Page Access and Response
  @story:CUC-59 @priority:high
  Background:

    Given the application is deployed
    And the launch page endpoint is '/launch'

  @happyPath
  Scenario: Happy path - Access launch page successfully
    Given a user with valid credentials
    When the user navigates to the launch page
    Then the launch page loads successfully
    And the status code is 200
    And the page title is 'Welcome to Launch Page'

  @negative
  Scenario: Negative - Access launch page without authentication
    Given a user without authentication
    When the user attempts to navigate to the launch page
    Then the system denies access
    And the status code is 401
    And an error message 'Unauthorized access' is displayed

  @boundary
  Scenario: Boundary - Access launch page with expired session
    Given a user with an expired session
    When the user navigates to the launch page
    Then the system redirects to the login page
    And the status code is 403
    And an error message 'Session expired. Please log in again.' is displayed

  @performance
  Scenario: Performance - Launch page response time under load
    Given 1000 users accessing the launch page concurrently
    When the requests are processed
    Then the response time is less than 2 seconds for each request

  @security
  Scenario: Security - Accessing launch page with XSS attempt
    Given a user attempts to access the launch page with a script injection
    When the launch page handles the request
    Then the system filters the script without executing it
    And the status code is 400
    And a message 'Bad request' is displayed