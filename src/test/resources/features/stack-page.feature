Feature: Stack Page Functionality
  @story:CUC-12 @priority:high
  Background:

    Given the user is on the stack page

  @happyPath
  Scenario: Display stack page successfully
    When the user navigates to the stack page
    Then the stack page should be displayed
    And the page title should be 'Stack Page'

  @negative
  Scenario: Handle missing stack elements
    Given there are no elements in the stack
    When the user requests the top element
    Then an error message should be displayed
    And the message should be 'Stack is empty'

  @boundary
  Scenario: Boundary test for stack size limit
    Given the stack size limit is 1000
    When the user inserts 1000 elements into the stack
    Then the stack should contain 1000 elements
    When the user attempts to add one more element
    Then an error message should be displayed
    And the message should be 'Stack overflow'

  @performance
  Scenario: Stack page load performance
    When the user navigates to the stack page
    Then the stack page should load within 2 seconds

  @security
  Scenario: Prevent unauthorized access to stack page
    Given the user is not authenticated
    When the user attempts to access the stack page
    Then the user should be redirected to the login page
    And a message 'Please log in to continue' should be displayed