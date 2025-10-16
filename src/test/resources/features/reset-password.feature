Feature: Password Reset Functionality
  @story:CUC-6 @priority:high
  Background:

    Given the user navigates to the login page
    And the user selects the 'Forgot Password' option

  @happy-path
  Scenario: Successful password reset request
    Given the user enters a registered email address
    When the user submits the password reset request
    Then the user should receive a password reset email

  @negative
  Scenario: Unsuccessful password reset with unregistered email
    Given the user enters an unregistered email address
    When the user submits the password reset request
    Then the user should see an error message indicating the email is not recognized

  @negative
  Scenario: Unsuccessful password reset with invalid email format
    Given the user enters an email address with invalid format
    When the user submits the password reset request
    Then the user should see an error message indicating invalid email format

  @boundary
  Scenario: Boundary test for email length in password reset
    Given the user enters an email address at the maximum allowable length
    When the user submits the password reset request
    Then the user should receive a password reset email

  @security
  Scenario: Security test for repeated password reset requests
    Given the user enters a registered email address
    When the user submits the password reset request multiple times within a short period
    Then the system should limit the password reset emails sent to prevent abuse

  @performance
  Scenario: Performance test for high load password reset requests
    Given a simulated scenario of multiple users requesting password resets simultaneously
    When the system processes these password reset requests
    Then the system should maintain acceptable response times and not crash