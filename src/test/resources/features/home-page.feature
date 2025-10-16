Feature: Home Page
  @story:CUC-39 @priority:medium
  Background:

    Given the user is on the login page
    And the user is logged in with valid credentials

  @happy-path
  Scenario: View Home Page for Authenticated User
    Given the user navigates to the home page
    When the home page is fully loaded
    Then the user should see a welcome message
    And the user should see primary navigation links

  @negative
  Scenario: Unauthorized Access to Home Page
    Given the user is not logged in
    When the user tries to access the home page directly
    Then the user should be redirected to the login page

  @performance
  Scenario: Performance of Home Page Load
    Given the user accesses the home page
    When the home page loads
    Then the page should load within 2 seconds

  @boundary
  Scenario: Home Page Content for Boundary Age
    Given the user is logged in with a birthdate making them exactly 18 years old today
    When the user navigates to the home page
    Then age-restricted content should be visible

  @security
  Scenario: Security - Access with Expired Session
    Given the user was previously logged in
    And the session has expired
    When the user attempts to access the home page
    Then the user should be redirected to the login page