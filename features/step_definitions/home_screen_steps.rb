When(/^Left unit picker value should be "([^"]*)"$/) do |arg|
  validate_selected_in_spinner("select_unit_spinner", arg, 0)
end

Then(/^Right unit picker values should be "([^"]*)"$/) do |arg|
  validate_selected_in_spinner("select_unit_spinner", arg, 1)
end

Then(/^Show all button should be (enabled|disabled)$/) do |state|

  result_boolean = find_with_wait("btn_show_all").enabled?

  expected_boolean = state == "enabled" ? true : false

  fail("Expected #{expected_boolean} returned: #{result_boolean}") if result_boolean != expected_boolean

end

When(/^I press on Clear button$/) do
  puts("Clear")
end

When(/^I type "([^"]*)" on application keyboard$/) do |arg|

  digits = arg.split("")

  element = find_with_wait("keypad")

  digits.each do |num|
    buttonElement = element.find_element(xpath: "//android.widget.Button[contains(@text,'#{num}')]")
    buttonElement.click
  end

end

Then(/^I should se result as "([^"]*)"$/) do |arg|
  value = find_with_wait("target_value").text

  if value != arg
    fail("Expected #{arg} returned: #{value}")
  end
end

And(/^I press on Add to Favorite icon$/) do
  element = find_element(id: "action_add_favorites")
  element.click
end

When(/^I press on Favorite conversions$/) do
  element = wait_and_find_text_by_x_path("Favorite conversions")
  element.click
end

Then(/^I verify "([^"]*)" add to Favorite conversions list$/) do |arg|
  find_element(xpath: "//android.widget.TextView[contains(@text,'#{arg}')]")
end

When(/^I press on Search icon$/) do
  wait_and_click("action_search")
end

And(/^I type "([^"]*)" in search field$/) do |arg|
  wait_and_send_keys("search_src_text", arg)
end

And(/^I press return button on soft keyboard$/) do
  Appium::TouchAction.new.tap(x: 0.99, y: 0.99, count: 1).perform
end

Then(/^I see "([^"]*)" as a current unit converter$/) do |arg|
  wait_and_find_text_by_id_and_x_path("action_bar", arg)
end