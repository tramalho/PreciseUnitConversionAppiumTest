Feature: Tests for Home Screen functionality

  Scenario: Default values on Home Screen is Foot and Centimeter
    Given I land on Home Screen
    When Left unit picker value should be "Foot"
    Then Right unit picker values should be "Centimeter"

