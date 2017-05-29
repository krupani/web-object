Feature: As a web-object author, I want to make sure
  conditional method around element properties work fine.

  Background:
    Given I am on web-object form page

  Scenario: Verify condition for delayed text presence and absence
    And I verify text is absent
    When I follow toggle_presence button
    Then I wait for text to be present
    And I verify text is present

  Scenario: Verify condition for delayed text presence inside element
    And I verify text is absent inside element
    When I follow toggle_presence button
    Then I wait for text to be present inside element
    And I verify text is present inside element

  Scenario: Verify condition for delayed text presence inside element
    And I verify text is absent inside element
    When I follow toggle_presence button
    Then I wait for text to be included inside element
    And I verify text is included inside element

  Scenario: Verify condition for delayed text presence inside element using alias method
    And I verify text is absent inside element
    When I follow toggle_presence button
    Then I wait for text to be contained inside element
    And I verify text is included inside element
