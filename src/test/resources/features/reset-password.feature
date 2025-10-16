Feature: User Password Reset
  @story:CUC-47 @priority:high
  Background:

    Given a user exists with the email 'user@example.com'
    And the user is on the 'Forgot Password' page

  @positive
  Scenario: User successfully resets password
    Given the user enters the email 'user@example.com'
    When the user submits the reset password request
    Then the user should receive an email with password reset instructions
    And the email contains a valid password reset link
    When the user clicks on the password reset link
    And the user enters a new password 'ValidP@ssw0rd'
    And confirms the new password 'ValidP@ssw0rd'
    Then the user's password should be successfully reset
    And the user can log in with the new password

  @negative
  Scenario: User attempts password reset with non-existent email
    Given the user enters the email 'nonexistent@example.com'
    When the user submits the reset password request
    Then the user should see an error message stating 'Email not found'

  @boundary
  Scenario: User enters invalid email format
    Given the user enters an invalid email format 'invalid-email'
    When the user submits the reset password request
    Then the user should see an error message stating 'Invalid email format'

  @performance
  Scenario: User submits reset request multiple times in quick succession
    Given the user submits multiple reset password requests for the email 'user@example.com' very quickly
    Then the system should throttle requests and process a limited number of requests per minute

  @security
  Scenario: User attempts to use expired password reset link
    Given the user clicks on an expired password reset link
    When the user tries to reset the password
    Then the user should see an error message stating 'This link has expired'
    And the user should not be able to reset the password using this link