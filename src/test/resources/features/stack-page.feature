Feature: Stack Page
  @story:CUC-30 @priority:medium
  Background:

    Given a user is logged into the application
    And the Stack Page is loaded

  @positive
  Scenario: Display items on stack page
    Given items to display exist
    When the user views the Stack Page
    Then the items are displayed

  @negative
  Scenario: Handle no items to display
    Given no items exist to display
    When the user views the Stack Page
    Then a message indicating no items are available is shown

  @boundary
  Scenario: Display maximum number of items
    Given the maximum number of items to display are available
    When the user views the Stack Page
    Then the maximum number of items are displayed

  @negative
  Scenario: Prevent stack overflow with excessive items
    Given more than the maximum number of items to display are available
    When the user views the Stack Page
    Then the system does not crash
    And a message indicating only a limited number of items can be displayed is shown

  @security
  Scenario: Access stack page with valid session
    Given a valid session exists
    When the user tries to access the Stack Page
    Then the Stack Page is accessible

  @security
  Scenario: Access stack page with invalid session
    Given an invalid session exists
    When the user tries to access the Stack Page
    Then the user is redirected to the login page

  @performance
  Scenario: Load stack page under heavy load
    Given a high number of concurrent users accessing the Stack Page
    When the Stack Page is loaded
    Then the page response time is within acceptable limits