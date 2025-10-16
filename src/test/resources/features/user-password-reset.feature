Feature: User Password Reset
  @story:CUC-28 @priority:high
  Background:

    Given the user is on the password reset page

  @happyPath
  Scenario: User successfully resets password with valid email
    Given the user has entered a registered email
    When the user submits the reset password request
    Then the user should see a confirmation message to check their email

  @negative
  Scenario: User attempts to reset password with unregistered email
    Given the user has entered an unregistered email
    When the user submits the reset password request
    Then the user should see an error message indicating the email is not recognized

  @negative
  Scenario: User attempts to reset password with an empty email field
    Given the user has not entered an email
    When the user submits the reset password request
    Then the user should see an error message indicating the email field is required

  @boundary
  Scenario: User resets password with maximum length email
    Given the user has entered a registered email with maximum allowable characters
    When the user submits the reset password request
    Then the user should see a confirmation message to check their email

  @performance
  Scenario: System handles concurrent password reset requests
    Given multiple users are attempting to submit password reset requests simultaneously
    When the system processes the requests
    Then all users should receive the appropriate confirmation or error messages without delay

  @security
  Scenario: Prevent unauthorized access with unencrypted email data
    Given the reset password form is ready for submission
    When the user enters their email and submits the form
    Then the email data should be transmitted over a secure connection