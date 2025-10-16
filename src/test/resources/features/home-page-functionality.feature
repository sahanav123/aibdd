Feature: Home Page Functionality
  @story:CUC-18 @priority:high
  Background:

    Given the user is on the home page

  @happyPath
  Scenario: Display home page with default elements
    When the home page loads
    Then the user sees the navigation bar
    And the user sees the main header
    And the user sees the footer

  @negative @performance
  Scenario: Retry loading home page with network delay
    Given a slow network connection
    When the user attempts to load the home page
    Then the home page loads within 5 seconds

  @security
  Scenario: Access home page without authentication
    When a guest user accesses the home page
    Then the user sees the login prompt
    And the user does not see account-related sections

  @boundary
  Scenario: Home page elements on minimum screen size
    Given the user has a device with minimum screen size
    When the home page loads
    Then all elements are visible and proportionally scaled