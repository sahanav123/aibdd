Feature: HomePage Functionality
  @story:CUC-5 @priority:high
  Background:

    Given the user is not logged in
    And the user is on the homepage

  @happy_path
  Scenario: User views the homepage when not logged in
    When the user opens the homepage
    Then the homepage should display the welcome message
    And the homepage should display the login and signup options

  @negative
  Scenario: User lands on the homepage with incorrect URL
    When the user enters an incorrect homepage URL
    Then the system should display a 404 error page

  @performance
  Scenario: Homepage performance under load
    Given the system experiences high traffic
    When the user opens the homepage
    Then the page should load within 2 seconds

  @boundary
  Scenario: Homepage with unsupported browser
    Given the user is using an unsupported browser
    When the user opens the homepage
    Then the system should display a browser support warning

  @security
  Scenario: Homepage secure component accessibility
    When the user checks for secure components on the homepage
    Then the secure components should be accessible only over HTTPS