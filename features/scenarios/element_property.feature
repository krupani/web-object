Feature: As a web-object author, I want to make sure
  conditional method around element properties work fine.

  Background:
    Given I am on web-object form page

  Scenario: Verify condition for delayed attribute presence and absence
    Given I verify element attribute is absent
    When I follow toggle_attribute button
    Then I wait for attribute to be present
    And I verify element attribute is present
    When I follow toggle_attribute button
    Then I wait for attribute to be absent
    And I verify element attribute is absent

  Scenario: Verify condition for delayed attribute value presence and absence
    Given I verify element attribute value is set
    When I follow empty_attribute button
    Then I wait for attribute value to be empty
    And I verify element attribute value is empty
    When I follow empty_attribute button
    Then I wait for attribute value to be set
    And I verify element attribute value is set

  Scenario: Verify condition for attribute value to match expected value
    When I follow toggle_attribute button
    Then I wait for attribute to be match value
    And I verify element attribute is present

  Scenario: Verify condition for attribute value to contain expected text
    When I follow toggle_attribute button
    Then I wait for attribute to be contain value
    And I verify element attribute is present