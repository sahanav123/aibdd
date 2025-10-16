Feature: View and Interact with the Array Page
  @story:CUC-21 @priority:high
  Background:

    Given the user is on the homepage
    And the user navigates to the Array Page

  @happy_path
  Scenario: View Array Page
    When the user views the Array Page
    Then the array content should be visible
    And the page title should be 'Array Page'

  @negative
  Scenario: Attempt to Access Array Page without Authorization
    Given the user is not logged in
    When the user attempts to access the Array Page
    Then the user should be redirected to the login page
    And a notification with 'Please log in to access this page' should be displayed

  @performance
  Scenario: Verify Array Page Load Performance
    When the user views the Array Page
    Then the page should load within 2 seconds

  @boundary
  Scenario: Boundary Test with Maximum Array Size
    Given the array is populated with the maximum allowable items
    When the user views the Array Page
    Then all items should be displayed correctly
    And the page should remain responsive

  @security
  Scenario: Security Test for Script Injection
    Given a user attempts to inject a script in the array input
    When the user submits the script
    Then the page should prevent script execution
    And display an error message indicating invalid input