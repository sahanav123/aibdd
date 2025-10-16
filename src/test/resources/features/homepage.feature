Feature: Homepage Accessibility and Functionality
  @story:CUC-53 @priority:medium
  Background:

    Given the user is on the homepage

  @happyPath
  Scenario: Successful homepage load
    When the homepage is accessed
    Then the homepage loads within 2 seconds
    And the homepage displays the main navigation elements
    And the homepage displays promotional content

  @negative
  Scenario: Homepage load with missing elements
    When the homepage is accessed with a slow network
    Then the homepage displays an error message for missing main navigation elements

  @boundary
  Scenario: Homepage load with maximum elements
    When the homepage attempts to display 100 promotional items
    Then the homepage loads within 3 seconds
    And no content is truncated or missing

  @security
  Scenario: Unauthorized access to admin content
    Given the user is not logged in as an admin
    When the user attempts to access admin content through URL manipulation
    Then the user is redirected to the homepage
    And a notification displays access denied

  @performance
  Scenario: Homepage performance under load
    Given the homepage is accessed by 1000 concurrent users
    Then the homepage response time is under 5 seconds
    And the homepage remains stable without errors