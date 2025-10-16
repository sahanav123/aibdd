Feature: Home Page
  @story:CUC-35 @priority:medium
  Background:

    Given the user is on the homepage

  @happyPath
  Scenario: Home Page displays correctly
    When the user opens the homepage
    Then the homepage should display the main navigation bar
    And the homepage should display the featured content section
    And the homepage should display the footer with contact information

  @negative
  Scenario: Homepage with missing elements
    When the homepage fails to load completely
    Then the user should see an error message displaying 'Some elements failed to load, please refresh or try again later.'

  @performance
  Scenario: Homepage loading performance
    When the user opens the homepage
    Then the homepage should fully load within 2 seconds

  @security
  Scenario: Restrict access to admin panel from homepage
    When the user tries to access the admin panel from the homepage
    Then the user should be redirected to the login page

  @security
  Scenario: Homepage with unauthorized attempted changes
    When the user attempts to modify homepage content without permission
    Then the user should see a 'Permission Denied' message