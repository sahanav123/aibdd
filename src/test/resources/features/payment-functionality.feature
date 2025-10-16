Feature: Payment Functionality
  @story:CUC-10 @priority:high
  Background:

    Given the user is logged into the application
    And the user navigates to the payment page
    And the user has items in the cart ready for checkout

  @happy-path @priority:high
  Scenario: Successful payment with valid credit card
    Given the user enters valid credit card information
    When the user submits the payment
    Then the payment should be processed successfully
    And the user should receive a confirmation message

  @negative @priority:medium
  Scenario: Payment with invalid credit card number
    Given the user enters an invalid credit card number
    When the user submits the payment
    Then an error message should be displayed indicating the card number is invalid

  @negative @priority:medium
  Scenario: Payment with expired credit card
    Given the user enters a credit card with an expired date
    When the user submits the payment
    Then an error message should be displayed indicating the card is expired

  @boundary @priority:high
  Scenario: Successful payment with boundary amount
    Given the user enters a valid credit card and a purchase amount at the maximum limit
    When the user submits the payment
    Then the payment should be processed successfully
    And the user should receive a confirmation message

  @negative @priority:medium
  Scenario: Payment attempt with missing CVV
    Given the user enters a valid credit card number but omits the CVV
    When the user submits the payment
    Then an error message should be displayed indicating the CVV is required

  @performance @priority:low
  Scenario: Simultaneous payment submissions
    Given multiple payment processes are initiated simultaneously
    When the system processes the payments
    Then each payment should be processed correctly without any errors or duplication

  @security @priority:high
  Scenario: Payment attempt after session timeout
    Given the user session has timed out
    When the user tries to submit a payment
    Then the user should be redirected to the login page
    And the payment should not be processed