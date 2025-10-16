Feature: Home Page
  @story:CUC-32 @priority:medium
  Background:

    Given the user is not logged in
    And the user navigates to the homepage URL

  @happyPath
  Scenario: Display homepage successfully
    Given the homepage loads
    Then the homepage should display the main navigation bar
    And the homepage should display featured content

  @negative
  Scenario: Homepage with no internet connection
    Given the user has no internet connection
    When the user tries to access the homepage
    Then an error message 'No Internet Connection' should be displayed

  @performance
  Scenario: Homepage load with slow internet connection
    Given the user has a slow internet connection
    When the user accesses the homepage
    Then the homepage should load within 10 seconds

  @boundary
  Scenario: Homepage with maximum browser tab open
    Given the user has 50 browser tabs open
    When the user navigates to the homepage
    Then the homepage should load without crashing

  @security
  Scenario: Check presence of security banner on homepage
    Given the homepage loads
    Then the security banner should be displayed at the top of the page