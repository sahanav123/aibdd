Feature: Reset Password
  @story:CUC-1 @priority:high
  Background:

    Given the user is on the login page
    And the user has a registered email address

  @happy @priority:high
  Scenario: User resets password with valid email
    Given the user navigates to the forgot password page
    When the user enters a valid registered email
    And the user submits the reset password request
    Then the user receives a password reset email

  @negative @priority:medium
  Scenario: User resets password with unregistered email
    Given the user navigates to the forgot password page
    When the user enters an unregistered email
    Then the user sees an error message indicating the email is not registered

  @boundary @priority:medium
  Scenario: User attempts to reset password with an empty email field
    Given the user navigates to the forgot password page
    When the user leaves the email field empty
    And the user submits the reset password request
    Then the user sees an error message indicating the email field is required

  @performance @priority:low
  Scenario: User resets password under heavy load
    Given the user navigates to the forgot password page during peak hours
    When the user submits a reset password request
    Then the system processes the request within acceptable time limits

  @security @priority:medium
  Scenario: User resets password using a potentially malicious email
    Given the user navigates to the forgot password page
    When the user enters an email with malicious content
    Then the system identifies and prevents the potential security threat