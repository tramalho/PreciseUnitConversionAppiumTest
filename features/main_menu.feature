@main_menu
Feature: As a user I want convert units

  Background:
    Given I land on Home Screen

  Scenario: When I tap on menu icon, I should see left side menu
    When I press on Menu icon
    Then I should see left side menu

  Scenario: I should be able to open my conversations Screen
    When I press on Menu icon
    And  I press on My conversations Button
    Then I land on My conversations Screen
