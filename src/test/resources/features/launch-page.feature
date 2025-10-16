Feature: Launch Page Accessibility and Content
  @story:CUC-20 @priority:medium
  Background:

    Given the user is on the website homepage
    And the user is using a supported web browser

  @visual @happy-path
  Scenario: Verify launch page displays correctly
    Given the user navigates to the launch page
    When the page is fully loaded
    Then the page should match the baseline design
    And the main headline should be visible
    And the call to action button should be enabled

  @negative @browser
  Scenario: Verify launch page with unsupported browser
    Given the user navigates to the launch page using an unsupported browser
    Then the user should see a warning message about browser support
    And the main content should not be accessible

  @performance
  Scenario: Verify loading time of launch page
    Given the user navigates to the launch page
    When the page starts loading
    Then the page should load within 2 seconds

  @security
  Scenario: Verify launch page security headers
    Given the user is accessing the launch page
    When inspecting the HTTP response headers
    Then the security headers 'Content-Security-Policy', 'X-Content-Type-Options', and 'Strict-Transport-Security' should be present

  @boundary
  Scenario: Verify launch page displays with no content
    Given the launch page has no content
    When the user navigates to the launch page
    Then the user should see a message indicating maintenance
    And there should be no errors in the browser console