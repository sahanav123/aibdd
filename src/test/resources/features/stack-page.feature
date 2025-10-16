Feature: Stack Page Functionality
  @story:CUC-45 @priority:medium
  Background:

    Given the user is logged in
    And the user navigates to the stack page

  @happyPath
  Scenario: User views stack elements
    Given the stack page is loaded
    When the user views the stack elements
    Then the stack elements are displayed in the correct order

  @happyPath
  Scenario: User adds an element to the stack
    Given the stack has elements
    When the user adds a new element
    Then the stack displays the new element on top

  @happyPath
  Scenario: User removes an element from the stack
    Given the stack has elements
    When the user removes the top element
    Then the stack no longer displays the removed element

  @negative
  Scenario: User adds an element to a full stack
    Given the stack is full
    When the user attempts to add a new element
    Then an error message 'Stack Overflow' is displayed

  @negative
  Scenario: User removes an element from an empty stack
    Given the stack is empty
    When the user attempts to remove an element
    Then an error message 'Stack Underflow' is displayed

  @performance
  Scenario: Performance of adding multiple elements
    Given the stack is initialized
    When the user adds 1000 elements consecutively
    Then the stack should handle the operations within 2 seconds

  @security
  Scenario: Security check for unauthorized access
    Given a user is not logged in
    When the user attempts to navigate to the stack page
    Then the user is redirected to the login page