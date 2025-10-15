Feature: Payment Functionality
  @story:CUC-3 @priority:high
  Background:

    Given the user is authenticated
    And the user is on the payment page

  @happyPath
  Scenario: Successful payment with valid data
    Given the user has valid payment details
    When the user submits the payment
    Then the payment is processed successfully
    And the user receives a confirmation message

  @negative
  Scenario: Payment failure with expired card
    Given the user has an expired card
    When the user submits the payment
    Then the payment is declined
    And the user receives an 'expired card' error message

  @boundary
  Scenario: Payment with minimum amount
    Given the user has valid payment details
    And the payment amount is at the minimum limit
    When the user submits the payment
    Then the payment is processed successfully
    And the user receives a confirmation message

  @boundary
  Scenario: Payment with maximum amount
    Given the user has valid payment details
    And the payment amount is at the maximum limit
    When the user submits the payment
    Then the payment is processed successfully
    And the user receives a confirmation message

  @negative
  Scenario: Payment with invalid payment details
    Given the user has invalid payment details
    When the user submits the payment
    Then the payment is declined
    And the user receives an 'invalid payment details' error message

  @security
  Scenario: Security enforcement on multiple quick payment attempts
    Given the user attempts to submit payment rapidly multiple times
    When the system detects suspicious activity
    Then a security challenge is triggered
    And the user is required to verify their identity

  @performance
  Scenario: High volume payment processing
    Given 1000 concurrent payment submissions
    When the payment processing server handles the load
    Then all payments are processed successfully within acceptable time limits
    And no system crashes occur