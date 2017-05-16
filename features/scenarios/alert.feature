Feature: As a web-object author, I want to make sure
  conditional method around alerts work fine.

  Scenario: Verify condition for delayed alert
    Given I am on web-object form page
    When I follow delayed_alert button
    And I wait for alert to appear
    Then I verify n accept alert
