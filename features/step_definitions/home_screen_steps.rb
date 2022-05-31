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
    button_element = element.find_element(xpath: "//android.widget.Button[contains(@text,'#{num}')]")
    button_element.click
  end

end

Then(/^I should se result as "([^"]*)"$/) do |arg|
  value = find_with_wait("target_value").text

  if value != arg
    fail("Expected #{arg} returned: #{value}")
  end
end

And(/^I press on Add to Favorite icon$/) do
  wait_and_click("action_add_favorites")
end

When(/^I press on Favorite conversions$/) do
  element = find_with_wait_text_by_x_path("Favorite conversions")
  element.click
end

Then(/^I verify "([^"]*)" add to Favorite conversions list$/) do |arg|
  text_element = find_with_wait("favorites_item_hint").text

  if text_element != arg
    fail("Expected #{arg} returned: #{text_element}")
  end
end

When(/^I press on Search icon$/) do
  wait_and_click("action_search")
end

And(/^I type "([^"]*)" in search field$/) do |arg|
  wait_and_send_keys("search_src_text", "#{arg}\n")
end

And(/^I press return button on soft keyboard$/) do
  perform_with_wait(0.99, 0.99)
  wait_and_click_key_event(EnvUtils::KEYCODE_ENTER)
end

Then(/^I see "([^"]*)" as a current unit converter$/) do |arg|
  find_with_wait_text_by_id_and_x_path("action_bar", arg)
end

Given(/^I select "([^"]*)" from "([^"]*)" unit picker$/) do |value, picker|
  
  picker_index = 1

  if picker == "left"
    picker_index = 0
  end

  click_drop_down_menu("select_unit_spinner", picker_index, value)

end

And(/^I select "([^"]*)" from menu$/) do |value|
  element = find_with_wait_text_by_x_path(value)
  element.click
end