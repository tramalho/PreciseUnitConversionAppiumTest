@home_screen
Feature: Tests for Home Screen functionality

  @default
  Scenario: Default values on Home Screen is Foot and Centimeter
    Given I land on Home Screen
    When Left unit picker value should be "Foot"
    Then Right unit picker values should be "Centimeter"

  @default
  Scenario: Show all button should be enabled at launch
    Given I land on Home Screen
    Then Show all button should be disabled
    When I type "1" on application keyboard
    Then Show all button should be enabled

  @outline
  @input
  @conversions
  Scenario Outline: Verify default conversion
    Given I land on Home Screen
    When I type "<target>" on application keyboard
    Then I should se result as "<result>"
    Examples:
    |target|result   |
    |1     |30.48    |
    |2     |60.96    |
    |3     |91.44    |
    |9     |274.32   |
    |1011  |30 815.28|

  Scenario: User able to add current conversion to Favorite list
    Given I land on Home Screen
    When I press on Add to Favorite icon
    And I press on Menu icon
    And I press on Favorite conversions
    Then I verify "Length" add to Favorite conversions list

  Scenario: User able to search by existing Conversion type
    Given I land on Home Screen
    When I press on Search icon
    And I type "Temperature" in search field
    And I press return button on soft keyboard
    And I see "Temperature" as a current unit converter
    And Left unit picker value should be "Celsius"
    Then Right unit picker values should be "Fahrenheit"

  @wip
  Scenario Outline: User able to select values from datepickers
    Given I land on Home Screen
    And I select "<unit_type>" from "left" unit picker
    When I type "<amount>" on application keyboard
    Then I should se result as "<result>"
    Examples:
      | unit_type | amount   | result  |
      | Inch      | 1        | 2.54    |
      | Link      | 1        | 20.1168 |
      | Cable     | 1        | 18 520  |
