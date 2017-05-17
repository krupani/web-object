Feature: As a web-object author, I want to make sure
  conditional method around element presence and visibility work fine.

  Background:
    Given I am on web-object form page

  Scenario: Verify condition for delayed visibility and invisibility
    And I verify text is invisible
    When I follow toggle_visibility button
    Then I wait for text to become visible
    And I verify text is visible
    When I follow toggle_visibility button
    Then I wait for text to become invisible
    And I verify text is invisible

  Scenario: Verify condition for delayed presence and absence
    And I verify link is absent
    When I follow toggle_presence button
    Then I wait for link to be present
    And I verify link is present
    When I follow toggle_presence button
    Then I wait for link to be absent
    And I verify link is absent

  Scenario: Verify condition for delayed enabling and disabling
    And I verify text field is disabled
    When I follow toggle_enabling button
    Then I wait for text field to be enabled
    And I verify text field is enabled
    When I follow toggle_enabling button
    Then I wait for text field to be disabled
    And I verify text field is disabled

  Scenario: Verify conditions for delayed clickability
    And I verify desired button is not clickable
    When I follow delayed_clickability button
    Then I wait for desired button to be clickable
    And I verify desired button is now clickable