Feature: Home Page
  @story:CUC-44 @priority:medium
  Background:

    Given the user is on the home page

  @happyPath
  Scenario: Home Page is displayed correctly
    When the user opens the home page
    Then the header should be visible
    And the main navigation should be visible
    And the footer should be visible

  @negativePath
  Scenario: Handling non-existing elements
    When the user opens the home page
    And the user attempts to interact with a non-existing element
    Then an appropriate error message should be shown

  @performance
  Scenario: Home Page load performance
    When the user opens the home page
    Then the page should load within 2 seconds

  @boundary
  Scenario: Validating boundary layout on Home Page
    When the user opens the home page
    And the viewport size is set to maximum allowed dimensions
    Then all content should remain visible and well-aligned

  @security
  Scenario: Check for cross-site scripting vulnerabilities
    When the user inputs a script into the search box
    Then the input should be sanitized
    And the script should not be executed