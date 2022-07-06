@custom_conversions
Feature: User able to create and manage custom conversations

  Scenario: I should be able to open my conversations Screen
    Given I land on Home Screen
    When I press on Menu icon
    And I press on My conversations Button
    And I press on Create your first conversion Button
    And I type "Power" as custom conversation name
    And I press on New unit Button
    And I type "Horse Power" as unit name
    And I type "HP" as unit symbol
    And I type "1" as unit value
    And I press submit checkmark on Custom conversations screen
    And I press on New unit Button
    And I type "Mule Power" as unit name
    And I type "MP" as unit symbol
    And I type "0.5" as unit value
    And I press submit checkmark on Custom conversations screen
    And I press on OK button on Custom conversations screen
    Then I verify "Power" add to Custom conversions list

