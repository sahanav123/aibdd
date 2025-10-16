Feature: Home Page
  @story:CUC-50 @priority:medium
  Background:

    Given the user is on the homepage
    And the homepage is fully loaded

  @happy
  Scenario: Display homepage successfully
    Given the user accesses the homepage
    When the homepage is fully rendered
    Then the user should see the main navigation bar
    And the homepage title should be displayed
    And the homepage should load within 2 seconds

  @negative
  Scenario: Navigate with invalid URL parameter
    Given the user accesses the homepage with an invalid URL parameter
    Then the user should see a 404 error page
    And the error message 'Page not found' should be displayed

  @performance
  Scenario: Check homepage with slow network
    Given the user accesses the homepage on a slow network
    When the homepage is rendered
    Then the homepage should load within 5 seconds

  @security
  Scenario: Check secure homepage access
    Given the user accesses the homepage over https
    Then the connection should be secure
    And the browser should not display any mixed content warnings

  @boundary
  Scenario: Boundary test for homepage elements
    Given the user is on the homepage
    When the homepage loads
    Then all buttons should be accessible and clickable
    And all images should load completely
    And there should be no horizontal scroll on the page