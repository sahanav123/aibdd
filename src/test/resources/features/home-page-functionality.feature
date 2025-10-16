Feature: Home Page Functionality
  @story:CUC-18 @priority:medium
  Background:

    Given the user navigates to the homepage
    And the homepage is fully loaded

  @happyPath
  Scenario: Display homepage for a valid user
    Given the user is logged in
    When the user visits the homepage
    Then the homepage should display the welcome message
    And the homepage should display the user's dashboard

  @negative
  Scenario: Access homepage without login
    Given the user is not logged in
    When the user attempts to access the homepage
    Then the user should be redirected to the login page

  @performance
  Scenario: Homepage loads under acceptable time
    Given the user navigates to the homepage
    When the homepage is requested
    Then the homepage should load within 2 seconds

  @boundary
  Scenario: Homepage responds to invalid input gracefully
    Given the user loads the homepage
    When the user enters invalid input in the search bar
    Then the homepage should display an error message
    And no crash should occur

  @security
  Scenario: Secure homepage load
    Given the user accesses the homepage
    When the connection is established
    Then the homepage should be served over HTTPS