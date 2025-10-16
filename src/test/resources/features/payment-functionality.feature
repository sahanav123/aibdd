Feature: Payment Functionality
  @story:CUC-10
  Background:

    Given the user is logged into the application
    And the user has items in the cart

  @priority:high
  Scenario: Successful payment with valid credit card
    Given the user navigates to the checkout page
    When the user enters a valid credit card
    And the user confirms the payment
    Then the payment is processed successfully
    And a confirmation message is displayed

  @priority:medium
  Scenario: Payment fails with invalid credit card
    Given the user navigates to the checkout page
    When the user enters an invalid credit card
    Then an error message is displayed indicating payment failure

  @priority:medium
  Scenario: Payment with expired credit card
    Given the user navigates to the checkout page
    When the user enters an expired credit card
    Then an error message is displayed indicating the card is expired

  @priority:low
  Scenario: Boundary test with maximum allowable transaction value
    Given the user navigates to the checkout page
    And the cart total is exactly at the maximum allowable transaction value
    When the user enters valid payment details
    Then the payment is processed successfully
    And a confirmation message is displayed

  @priority:low
  Scenario: Payment page security validation
    Given the user is on the payment page
    When the user attempts to inspect or alter form fields
    Then security measures prevent data tampering

  @priority:low
  Scenario: Performance test for payment processing
    Given the user initiates a payment
    When the system processes a large number of concurrent payments
    Then the payment processing should complete within acceptable time limits