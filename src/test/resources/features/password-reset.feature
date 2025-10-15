Feature: Password Reset Functionality
  @story:CUC-1 @priority:high
  Background:

    Given the user is on the password reset page
    And the user has a registered email address

  @happy_path
  Scenario: Successful password reset with valid email
    Given the user provides a valid email address
    When the user submits the password reset request
    Then the user should receive a password reset email

  @negative
  Scenario: Password reset with unregistered email
    Given the user provides an unregistered email address
    When the user submits the password reset request
    Then the user should see an error message about invalid email

  @boundary
  Scenario: Password reset with malformed email
    Given the user provides a malformed email address
    When the user submits the password reset request
    Then the user should see an error message about improper email format

  @security
  Scenario: Password reset brute force protection
    Given the user makes repeated unsuccessful password reset attempts
    When the attempts exceed the maximum allowed
    Then the user should be temporarily blocked from making further requests

  @performance
  Scenario: Password reset process performance
    Given the user submits the password reset request during peak traffic
    Then the password reset email should be sent within acceptable time