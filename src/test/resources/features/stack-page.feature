Feature: Stack Page Functionality
  @story:CUC-22 @priority:medium
  Background:

    Given the user is authenticated
    And the user is on the Stack Page

  @happy-path
  Scenario: Display stack elements
    When the user navigates to the Stack Page
    Then the stack elements should be displayed

  @happy-path
  Scenario: Add element to an empty stack
    Given the stack is empty
    When the user adds an element to the stack
    Then the stack should contain one element

  @happy-path
  Scenario: Remove element from a non-empty stack
    Given the stack has elements
    When the user removes an element from the stack
    Then the stack should have one less element

  @negative
  Scenario: Add element to a full stack
    Given the stack is full
    When the user attempts to add an element to the stack
    Then the user should see an error message indicating the stack is full

  @negative
  Scenario: Remove element from an empty stack
    Given the stack is empty
    When the user attempts to remove an element from the stack
    Then the user should see an error message indicating the stack is empty

  @boundary
  Scenario: Boundary test: Add element to stack limit
    Given the stack has one less than maximum capacity
    When the user adds an element to the stack
    Then the stack should reach its maximum capacity

  @boundary
  Scenario: Boundary test: Remove last element leaving stack empty
    Given the stack has only one element
    When the user removes an element from the stack
    Then the stack should be empty

  @performance
  Scenario: Performance test: Time to display elements in stack
    Given the stack has maximum capacity
    When the user views the Stack Page
    Then the elements should be displayed within 2 seconds

  @security
  Scenario: SQL Injection attempt on Stack Page
    When the user attempts SQL injection with "SELECT * FROM users" as input
    Then the system should prevent the injection and return an error