Feature: HomePage
  @story:CUC-24 @priority:high
  Background:

    Given the user is on the homepage URL
    And the page is fully loaded

  @happy-path
  Scenario: User sees the main elements on the homepage
    Given the user visits the homepage
    When the page loads
    Then the user should see the main heading
    And the user should see the navigation menu
    And the user should see the footer section
    And the user should see the search bar

  @performance
  Scenario: Homepage elements load under heavy load
    Given the user visits the homepage under heavy load
    When the page loads
    Then the user should still see all main elements within 2 seconds

  @security
  Scenario: Security validation on homepage
    Given the user visits the homepage
    When inspecting the page elements
    Then sensitive information should not be exposed in the DOM

  @negative
  Scenario: User accesses homepage with an unsupported browser
    Given the user attempts to visit the homepage using an unsupported browser
    When the page attempts to load
    Then the user should see a message indicating the browser is unsupported

  @boundary
  Scenario: Verify homepage content on minimal screen size
    Given the user is on a mobile device with minimal screen size
    When the user visits the homepage
    Then all important content should adjust to fit the screen