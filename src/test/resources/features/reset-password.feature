Feature: User can reset their password
  @story:CUC-28 @priority:high
  Background:

    Given the user navigates to the login page
    And the user clicks on the 'Forgot Password' link

  @happyPath
  Scenario: Successful password reset
    Given the user enters a valid email address
    When the user submits the reset password request
    Then the user receives a password reset email
    And the user follows the link in the email
    When the user enters a new valid password
    And the user confirms the new password
    Then the password is successfully reset
    And the user can log in with the new password

  @negative
  Scenario: Reset password with unregistered email
    Given the user enters an unregistered email address
    When the user submits the reset password request
    Then the user sees an error message indicating the email is not registered

  @negative
  Scenario: Reset password with invalid email format
    Given the user enters an invalid email format
    When the user submits the reset password request
    Then the user sees an error message indicating the email format is invalid

  @boundary
  Scenario: Password reset link expiration
    Given the user has received a password reset email
    And the password reset link is past its expiration time
    When the user attempts to use the expired link
    Then the user sees an error message indicating the link has expired

  @performance
  Scenario: Performance of password reset email delivery
    Given the user requests a password reset
    When the request is processed
    Then the password reset email should be delivered within an acceptable time frame

  @security
  Scenario: Security: repeated password reset requests
    Given the user requests a password reset multiple times in a short span
    Then the system should throttle the requests to prevent abuse