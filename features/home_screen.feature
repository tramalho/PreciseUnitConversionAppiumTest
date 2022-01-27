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
    Then Show all button should be enabled
    When I press on Clear button
    Then Show all button should be disabled

  @outline
  @input
  @conversions
  Scenario Outline: Verify default conversion
    Given I land on Home Screen
    When I type "<target>" to target text field
    Then I should se result as "<result>"
    Examples:
    |target|result|
    |1     |12    |
    |2     |24    |
    |3     |36    |
    |9     |106   |

  Scenario: User able to add current conversion to Favorite list
    Given I land on Home Screen
    When I press on Add to Favorite icon
    And I press on Menu icon
    And I press on Favorite conversions
    Then I verify "Length" add to Favorite conversions list
  @wip
  Scenario: User able to search by existing Conversion type
    Given I land on Home Screen
    When I press on Search icon
    And I type "Temperature" in search field
    And I press return button on soft keyboard
    And I see "Temperature" as a current unit converter
    And Left unit picker value should be "Celsius"
    Then Right unit picker values should be "Fahrenheit"

