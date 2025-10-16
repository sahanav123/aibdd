Feature: Payment Page Validation
  @story:CUC-61 @priority:high
  Background:

    Given the user is on the payment page
    And the payment form is visible

  @happy_path
  Scenario: Successful payment with valid details
    Given the user enters valid credit card information
    And the user enters a valid billing address
    When the user submits the payment form
    Then the payment should be processed successfully
    And a confirmation message should be displayed

  @negative
  Scenario: Payment failure with an expired credit card
    Given the user enters an expired credit card
    And the user enters a valid billing address
    When the user submits the payment form
    Then an error message for expired card should be displayed
    And the payment should not be processed

  @negative
  Scenario: Payment failure with invalid CVV number
    Given the user enters a valid credit card number
    And enters an invalid CVV number
    And the user enters a valid billing address
    When the user submits the payment form
    Then an error message for CVV should be displayed
    And the payment should not be processed

  @boundary
  Scenario: Boundary case with credit card expiry date
    Given the user enters a credit card expiring in the current month
    And the user enters a valid billing address
    When the user submits the payment form
    Then the payment should be processed successfully
    And a confirmation message should be displayed

  @security
  Scenario: Security test for payment page with SQL injection
    Given the user attempts SQL injection in the payment form fields
    When the malicious submission is attempted
    Then the payment form should provide an error message
    And the injection attempt should be logged

  @performance
  Scenario: Performance test under heavy load
    Given the payment page is accessed under simulated heavy load
    When multiple users submit valid payment information simultaneously
    Then the page should respond within acceptable time limits
    And payment should be processed successfully for each request