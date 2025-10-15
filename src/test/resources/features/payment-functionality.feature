Feature: Payment Functionality
  @story:CUC-3 @priority:high
  Background:

    Given the user is logged into the application
    And the user's account is active

  @happy_path
  Scenario: Successful payment with valid credit card
    Given the user is on the payment page
    When the user enters valid credit card details
    And the user submits the payment
    Then the payment should be processed successfully
    And the user receives a confirmation message

  @negative
  Scenario: Payment with expired credit card
    Given the user is on the payment page
    When the user enters an expired credit card
    And the user submits the payment
    Then the payment should be declined
    And the user sees an error message about card expiration

  @negative
  Scenario: Payment with insufficient funds
    Given the user is on the payment page
    When the user enters a credit card with insufficient funds
    And the user submits the payment
    Then the payment should be declined
    And the user sees an error message about insufficient funds

  @negative
  Scenario: Payment with incorrect card number format
    Given the user is on the payment page
    When the user enters a credit card number with an incorrect format
    And the user submits the payment
    Then the user sees an error message about the invalid card number format

  @boundary
  Scenario: Boundary test for maximum payment amount
    Given the user is on the payment page
    When the user enters the maximum allowed payment amount
    And the user submits the payment
    Then the payment should be processed successfully
    And the user receives a confirmation message

  @security
  Scenario: Attempt payment after session timeout
    Given the user was previously on the payment page
    And the session has timed out
    When the user attempts to submit a payment
    Then the user is redirected to the login page
    And the user sees a session timeout message

  @performance
  Scenario: Performance test for processing multiple payments
    Given the user initiates 1000 concurrent payment requests
    When the system processes these requests
    Then all payments should be processed within the threshold time
    And the system remains responsive