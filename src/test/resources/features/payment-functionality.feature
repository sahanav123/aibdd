Feature: Payment Functionality
  @story:CUC-3
  Background:

    Given the user is logged into the e-commerce platform
    And the user has items in their shopping cart

  @happy-path @priority:high
  Scenario: Successful payment process
    Given the user proceeds to checkout
    And selects a valid payment method
    When the user confirms the payment
    Then the payment should be processed successfully
    And an order confirmation should be displayed

  @negative @priority:medium
  Scenario: Payment process fails with invalid credit card
    Given the user proceeds to checkout
    And selects a payment method with an invalid credit card
    When the user attempts to confirm the payment
    Then an error message should be displayed indicating payment failure

  @boundary @priority:medium
  Scenario: Boundary test with minimum order amount
    Given the user proceeds to checkout
    And the order total is at the minimum allowed amount
    When the user confirms the payment
    Then the payment should be processed successfully
    And an order confirmation should be displayed

  @performance @priority:low
  Scenario: Payment system handles concurrent transactions efficiently
    Given multiple users are attempting to checkout at the same time
    When the payments are being processed concurrently
    Then the system should handle the transactions efficiently without delay

  @security @priority:medium
  Scenario: Secure handling of sensitive payment information
    Given the user enters credit card details
    When the payment is being processed
    Then the sensitive credit card information should be securely encrypted