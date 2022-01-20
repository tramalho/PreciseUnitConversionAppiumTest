Feature: Tests for Home Screen functionality

  Scenario: Default values on Home Screen is Foot and Centimeter
    Given I land on Home Screen
    When Left unit picker value should be "Foot"
    Then Right unit picker values should be "Centimeter"

  Scenario: Show all button should be enabled at launch
    Given I land on Home Screen
    Then Show all button should be enabled
    When I press on Clear button
    Then Show all button should be disabled
