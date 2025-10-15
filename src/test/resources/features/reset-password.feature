Feature: Reset Password
  @story:CUC-1 @priority:high
  Background:

    Given the user is on the login page
    And the user selects 'Forgot Password?' link

  @happyPath
  Scenario: Successfully reset password with valid email
    Given the user enters a valid email address
    When the user submits the reset password request
    Then the user should receive a password reset email

  @negative
  Scenario: Attempt to reset password with invalid email
    Given the user enters an invalid email address
    When the user submits the reset password request
    Then the user should see an error message indicating invalid email

  @boundary
  Scenario: Boundary test for email input length
    Given the user enters an email address with maximum allowed length
    When the user submits the reset password request
    Then the user should receive a password reset email

  @security
  Scenario: Prevent reset password request replay attacks
    Given the user enters a valid email address
    When the user submits multiple reset password requests in quick succession
    Then the system should only send one password reset email

  @performance
  Scenario: Performance of reset password email delivery
    Given the user enters a valid email address
    When the user submits the reset password request
    Then the password reset email should be delivered within 2 minutes