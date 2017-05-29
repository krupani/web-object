Feature: As a web-object author, I want to make sure
  conditional method around titles work fine.

  Scenario: Verify condition for delayed alert
    Given I am on web-object form page
    When I follow delayed_title button
    And I wait for title to update
    Then I verify newly updated title

  Scenario: Verify condition for delayed alert
    Given I am on web-object form page
    When I follow delayed_title button
    And I wait for title to contain a sub string
    Then I verify newly updated title