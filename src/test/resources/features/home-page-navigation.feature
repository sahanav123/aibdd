Feature: Home Page Navigation
  @story:CUC-40 @priority:medium
  Background:

    Given a user is on the home page
    And the user is not logged in

  @navigation @happy-path
  Scenario: Navigate to the about page from the home page
    When the user clicks on the 'About' link
    Then the user should be redirected to the about page

  @navigation @boundary
  Scenario: Home page link exists on the about page
    Given the user is on the about page
    When the user clicks on the 'Home' link
    Then the user should be redirected back to the home page

  @navigation @negative
  Scenario: Attempt to access a non-existent page
    When the user tries to access a non-existent URL
    Then the user should see a 404 error page

  @performance
  Scenario: Home page should load within acceptable time
    When the user loads the home page
    Then the page should load within 2 seconds

  @security
  Scenario: Home page does not expose sensitive information
    When the user views the page source of the home page
    Then the page source should not contain sensitive information