Feature: Arrays Page Functionality
  @story:CUC-11 @priority:high
  Background:

    Given the user is on the Arrays Page
    And the page has loaded successfully
    And the user is logged in

  @happy_path
  Scenario: Display array elements
    Given an array with elements [1, 2, 3]
    When the user requests to display the array
    Then the array elements should be displayed as [1, 2, 3]

  @happy_path
  Scenario: Add new element to array
    Given an array with elements [1, 2, 3]
    When the user adds a new element 4 to the array
    Then the array should be updated to [1, 2, 3, 4]

  @negative
  Scenario: Remove element from array
    Given an array with elements [1, 2, 3]
    When the user attempts to remove an element 4 not present in the array
    Then the system should display an error message 'Element not found'

  @boundary
  Scenario: Array limit boundary
    Given an array can hold a maximum of 1000 elements
    When the user attempts to add the 1001st element
    Then the system should prevent the addition and display an 'Array limit reached' message

  @security
  Scenario: Unauthorized access attempt
    Given the user is not logged in
    When the user attempts to access the Arrays Page
    Then the system should redirect the user to the login page

  @performance
  Scenario: Load performance under heavy load
    Given multiple users are accessing the Arrays Page simultaneously
    When each user loads the page
    Then the page should load in under 3 seconds for each user