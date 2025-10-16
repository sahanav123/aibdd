Feature: Stack Page Functionality
  @story:CUC-60 @priority:medium
  Background:

    Given the user is authenticated
    And the user is on the stack page

  @happyPath
  Scenario: Successful stack creation
    When the user creates a new stack with valid parameters
    Then the stack is successfully created
    And the stack appears in the stack list

  @negative
  Scenario: Stack creation fails with invalid parameters
    When the user tries to create a stack with invalid parameters
    Then an error message is displayed
    And the stack is not created

  @boundary
  Scenario: Stack creation with maximum allowed parameters
    When the user creates a stack with the maximum allowed parameters
    Then the stack is successfully created
    And it appears in the stack list

  @negative
  Scenario: Stack creation fails due to duplicate stack name
    Given there is an existing stack named 'example-stack'
    When the user tries to create another stack with the name 'example-stack'
    Then an error message is displayed indicating the stack name is already in use

  @performance
  Scenario: Verify stack creation performance
    When the user creates multiple stacks sequentially
    Then each stack is created within acceptable time limits

  @security
  Scenario: Security: Unauthorized stack creation attempt
    Given the user is not authenticated
    When the user attempts to create a stack
    Then the user is denied access
    And a security alert is logged