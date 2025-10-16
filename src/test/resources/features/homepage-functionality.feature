Feature: HomePage Functionality
  @story:CUC-9 @priority:high
  Background:

    Given the user is on the HomePage

  @happyPath
  Scenario: Display homepage successfully
    When the user navigates to the HomePage
    Then the HomePage should display the main content
    And the navigation bar should be visible
    And the footer should be visible

  @negative
  Scenario: Fail to display homepage with server error
    When the server returns an error
    Then the HomePage should display an error message
    And the main content should not be displayed

  @boundary
  Scenario: Display homepage with no navigation bar as boundary case
    When the user navigates to the HomePage and the navigation bar is disabled
    Then the HomePage should display the main content
    And the navigation bar should not be visible

  @performance
  Scenario: Check homepage load time for performance
    When the user navigates to the HomePage
    Then the HomePage should load within 2 seconds

  @security
  Scenario: Ensure security by checking user data is not exposed
    When the user is on the HomePage
    Then no sensitive user data should be visible in the page source