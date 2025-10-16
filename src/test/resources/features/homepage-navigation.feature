Feature: Home Page Navigation
  @story:CUC-24 @priority:high
  Background:

    Given the user is on the homepage
    And the homepage is fully loaded

  @happyPath
  Scenario: Navigate to About Us Section
    When the user clicks on the 'About Us' link in the navigation bar
    Then the 'About Us' section should be displayed

  @negative
  Scenario: Invalid Page Link
    When the user clicks on an invalid page link
    Then an error message 'Page not found' should be displayed

  @performance
  Scenario: Navigation Performance
    When the user clicks on the 'Contact Us' link in the navigation bar
    Then the 'Contact Us' page should load within 2 seconds

  @boundary
  Scenario: Boundary Test for Navigation Links
    When the user rapidly clicks on the navigation links
    Then all corresponding pages should load correctly without any errors

  @security
  Scenario: Security: Unauthorized Access to Admin Page
    When the user attempts to access the admin page directly
    Then the user should be redirected to the login page
    And an error message 'Unauthorized access' should be displayed