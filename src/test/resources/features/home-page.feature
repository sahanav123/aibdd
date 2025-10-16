Feature: Home Page
  @story:CUC-44 @priority:high
  Background:

    Given the user is on the homepage
    And the homepage is fully loaded

  @happy-path
  Scenario: Display homepage with all elements
    When the user views the homepage
    Then the homepage should display the logo at the top
    And the main navigation menu should be visible
    And a carousel of featured items should be displayed

  @negative
  Scenario: Homepage without styles loading
    When the homepage styles fail to load
    Then the page content should still be readable

  @performance @priority:medium
  Scenario: Load homepage with slow network
    Given the network speed is slow
    When the user accesses the homepage
    Then the homepage should load within 10 seconds

  @boundary @negative
  Scenario: Access homepage with no internet
    Given the user has no internet connection
    When trying to access the homepage
    Then the user should see an error message informing them of no connectivity

  @performance
  Scenario: Homepage load test under high traffic
    Given the homepage is accessed by 1000 users simultaneously
    When each user performs a simple action
    Then the homepage should respond without timeouts

  @security
  Scenario: Security: Homepage without user login
    When a user accesses the homepage without logging in
    Then the user should only see publicly available features