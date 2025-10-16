Feature: Process Payments on Payment Page
  @story:CUC-61 @priority:high
  Background:

    Given the user is on the payment page
    And the user is logged in
    And the shopping cart has items

  @happyPath
  Scenario: Successful payment with valid card details
    Given the user enters valid credit card details
    When the user submits the payment
    Then the payment is processed successfully
    And an order confirmation is displayed

  @negative
  Scenario: Payment with invalid card details
    Given the user enters invalid credit card details
    When the user submits the payment
    Then an error message is displayed indicating invalid card details
    And the payment is not processed

  @negative
  Scenario: Payment with expired card
    Given the user enters card details with an expired date
    When the user submits the payment
    Then an error message is displayed indicating the card is expired
    And the payment is not processed

  @boundary
  Scenario: Payment with edge case card expiry date
    Given the user enters card details with today's date as expiry
    When the user submits the payment
    Then the payment is processed successfully
    And an order confirmation is displayed

  @performance
  Scenario: Performance of payment processing
    Given the system is under typical load conditions
    When the user submits the payment
    Then the payment should be processed within 2 seconds

  @security
  Scenario: Security check for sensitive data
    Given the user is on the payment page
    When the page loads
    Then sensitive card details should not be visible or stored in the browser