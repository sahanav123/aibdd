Feature: HomePage Functionality
  @story:CUC-9 @priority:high
  Background:

    Given the user is on the homepage
    And the homepage is fully loaded

  @ui
  Scenario: Display homepage elements - Happy Path
    When the user accesses the homepage
    Then the homepage should display the logo
    And the homepage should display the main navigation menu
    And the homepage should display a search bar
    And the homepage should display featured products

  @ui @negative
  Scenario: Display error message on inaccessible homepage
    Given the homepage is not accessible
    When the user tries to load the homepage
    Then an error message should be displayed to the user

  @boundary
  Scenario: Boundary test for search input on homepage
    When the user enters the maximum characters allowed in the search bar
    Then the search bar should accept the input
    And the entered characters should be visible without overflow

  @security
  Scenario: Security test for XSS vulnerability on homepage
    When the user inputs a script tag in the search bar
    Then the script tags should be sanitized
    And no malicious script should be executed on the homepage

  @performance
  Scenario: Homepage under load test
    When 1000 users access the homepage simultaneously
    Then the homepage should load within 2 seconds for all users
    And the server response time should not exceed 500 milliseconds