@home_screen
Feature: Tests for Home Screen functionality

  Background:
    Given I land on Home Screen

  @default
  Scenario: Default values on Home Screen is Foot and Centimeter
    When Left unit picker value should be "Foot"
    Then Right unit picker values should be "Centimeter"

  @default
  Scenario: Show all button should be enabled at launch
    When Show all button should be disabled
    And I type "1" on application keyboard
    Then Show all button should be enabled

  @outline
  @input
  @conversions
  Scenario Outline: Verify default conversion
    When I type "<target>" on application keyboard
    Then I should se result as "<result>"
    Examples:
    |target|result   |
    |1     |30.48    |
    |2     |60.96    |
    |3     |91.44    |
    |9     |274.32   |
    |1011  |30 815.28|

  @error
  Scenario: User able to add current conversion to Favorite list
    When I press on Add to Favorite icon
    And I press on Menu icon
    And I press on Favorite conversions
    Then I verify "Length" add to Favorite conversions list

  @error
  Scenario: User able to search by existing Conversion type
    When I press on Search icon
    And I type "Temperature" in search field
    And I press return button on soft keyboard
    And I see "Temperature" as a current unit converter
    And Left unit picker value should be "Celsius"
    Then Right unit picker values should be "Fahrenheit"

  Scenario Outline: User able to select values from datepickers
    When I select "<unit_type>" from "left" unit picker
    And I type "<amount>" on application keyboard
    Then I should se result as "<result>"
    Examples:
      | unit_type | amount   | result  |
      | Inch      | 1        | 2.54    |
      | Link      | 1        | 20.1168 |
      | Cable     | 1        | 18 520  |


  Scenario: User able to convert values
    When I press on Menu icon
    And I select "Volume" from menu
    And I select "Cup" from "right" unit picker
    And I type "1" on application keyboard
    Then I should se result as "15.1416"

  @wip
  Scenario: User able to switch values
    When Left unit picker value should be "Foot"
    And Right unit picker values should be "Centimeter"
    And I press on switch units button
    And Left unit picker value should be "Centimeter"
    Then Right unit picker values should be "Foot"
