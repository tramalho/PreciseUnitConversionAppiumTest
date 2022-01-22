Feature: As a user I want convert units

  Scenario: When I tap on menu icon, I should see left side menu
    Given I land on Home Screen
    When I press on Menu icon
    Then I should see left side menu

  @wip
  Scenario: I should be able to open my conversations Screen
    Given I land on Home Screen
    When I press on Menu icon
    And  I press on My conversations Button
    Then I land on My conversations Screen
