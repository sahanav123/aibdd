Feature: User Password Reset
  @story:CUC-6
  Background:

    Given the application is running
    And the user is on the login page

  @priority:high
  Scenario: Successful password reset with valid email
    Given the user navigates to the password reset page
    When they enter a valid registered email
    And click the reset password button
    Then they should see a confirmation message that an email has been sent

  @priority:medium
  Scenario: Password reset with unregistered email
    Given the user navigates to the password reset page
    When they enter an unregistered email
    And click the reset password button
    Then they should see an error message indicating that the email is not found

  @priority:medium
  Scenario: Password reset with invalid email format
    Given the user navigates to the password reset page
    When they enter an email in an invalid format
    And click the reset password button
    Then they should see an error message about invalid email format

  @priority:low
  Scenario: Performance of password reset request
    Given the user navigates to the password reset page
    When they enter a valid registered email repeatedly 1000 times
    And click the reset password button each time
    Then the system should respond to each request in less than 2 seconds

  @priority:high
  Scenario: Security verification of password reset email link
    Given the user receives a password reset email
    When they click on the reset link
    Then the link should direct them to a secure password reset page with https