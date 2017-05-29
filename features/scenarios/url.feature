Feature: As a web-object author, I want to make sure
  conditional method around urls work fine.

  Scenario: Verify condition for delayed alert
    Given I am on web-object form page
    When I follow delayed_url button
    And I wait for url to update
    Then I verify newly updated url

  Scenario: Verify condition for delayed alert
    Given I am on web-object form page
    When I follow delayed_url button
    And I wait for url to contain a sub string
    Then I verify newly updated url