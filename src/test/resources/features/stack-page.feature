Feature: Stack Page Display and Interaction
  @stack-page @story:CUC-33 @priority:medium
  Background:

    Given the user is logged into the application
    And the user is on the dashboard page

  @happy-path @story:CUC-33
  Scenario: Display stack page correctly
    When the user navigates to the stack page
    Then the stack page is displayed
    And the stack items are listed correctly

  @negative @boundary @story:CUC-33
  Scenario: Empty stack page
    Given the stack has no items
    When the user navigates to the stack page
    Then the stack page displays a message 'No items in stack'

  @happy-path @story:CUC-33
  Scenario: Add item to stack
    Given the stack page is displayed
    When the user adds a valid item to the stack
    Then the stack page displays the new item in the list

  @happy-path @story:CUC-33
  Scenario: Remove item from stack
    Given the stack page is displayed
    And there is at least one item in the stack
    When the user removes an item from the stack
    Then the stack page no longer displays the removed item

  @negative @story:CUC-33
  Scenario: Add invalid item to stack
    Given the stack page is displayed
    When the user attempts to add an invalid item to the stack
    Then the stack page displays an error message 'Invalid item cannot be added'

  @performance @story:CUC-33
  Scenario: Performance of loading a large stack
    Given the stack contains a large number of items
    When the user navigates to the stack page
    Then the stack page loads within acceptable time limits

  @security @story:CUC-33
  Scenario: Security check on stack access
    When an unauthorized user attempts to access the stack page
    Then access is denied and an error message 'Access denied' is displayed