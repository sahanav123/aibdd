Feature: User should be able to reset password
  @story:CUC-1 @priority:high
  Background:

    Given the user navigates to the login page
    And clicks on the 'Forgot Password?' link

  @happy
  Scenario: Successful password reset via email
    Given the user enters a registered email address
    When the user submits the reset password request
    Then the user should receive a password reset email
    And the email should contain a reset link

  @negative
  Scenario: Password reset with unregistered email
    Given the user enters an unregistered email address
    When the user submits the reset password request
    Then the user should see an error message indicating the email is not found

  @negative
  Scenario: Attempt to reset password with an invalid email format
    Given the user enters an email in an invalid format
    When the user submits the reset password request
    Then the user should see an error message indicating the email format is incorrect

  @boundary
  Scenario: Boundary test: Password reset request rate limiting
    Given the user initiates multiple reset requests in rapid succession
    When the user submits these requests
    Then the system should enforce a rate limit and display a message to try again later

  @security
  Scenario: Security: Invalid link used for password reset
    Given the user clicks on an expired reset password link
    When the user attempts to reset the password
    Then the user should see an error message indicating the link is no longer valid

  @performance
  Scenario: Performance: Multiple concurrent requests for password reset
    Given multiple users request password resets simultaneously
    When the system processes these requests
    Then the system should handle all requests successfully within acceptable response time