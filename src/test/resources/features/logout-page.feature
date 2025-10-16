Feature: Logout Page Functionality
  @story:CUC-62 @priority:medium
  Background:

    Given the user is authenticated
    And the user is on the dashboard page

  @happy_path
  Scenario: Successful Logout
    Given the user is on the logout page
    When the user clicks the logout button
    Then the user should be redirected to the login page
    And the user session should be invalidated

  @negative
  Scenario: Logout With Active Session
    Given the user has an active session
    When the user tries to access a restricted page after logout
    Then the user should be redirected to the login page

  @boundary
  Scenario: Boundary Test for Session Timeout on Logout
    Given the user session is about to expire
    When the user clicks logout just before session expiration
    Then the user should be successfully logged out
    And should not face session expiry warning

  @security
  Scenario: Security Test for CSRF on Logout
    Given the user is on the logout page
    When a CSRF token is manipulated or missing
    Then the logout request should be rejected
    And an error message should be displayed

  @performance
  Scenario: Performance Test for Logout Under Load
    Given multiple users are logged in simultaneously
    When all users attempt to logout at the same time
    Then the system should handle the logout requests efficiently
    And the response time should be within acceptable limits