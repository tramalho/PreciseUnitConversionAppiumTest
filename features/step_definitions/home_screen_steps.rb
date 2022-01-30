When(/^Left unit picker value should be "([^"]*)"$/) do |arg|
  text_element = wait_and_find_text_by_id("select_unit_spinner").text

  if text_element != arg
    fail("Expected #{arg} returned: #{text_element}")
  end
end

Then(/^Right unit picker values should be "([^"]*)"$/) do |arg|
  puts(arg)
end

Then(/^Show all button should be (enabled|disabled)$/) do |arg|
  puts(arg)
end

When(/^I press on Clear button$/) do
  puts("Clear")
end

When(/^I type "([^"]*)" to target text field$/) do |arg|
  puts(arg)
end

Then(/^I should se result as "([^"]*)"$/) do |arg|
  puts(arg)
end

And(/^I press on Add to Favorite icon$/) do
  element = find_element(id: "action_add_favorites")
  element.click
end

When(/^I press on Favorite conversions$/) do
  element = find_element(xpath: "//android.widget.TextView[contains(@text,'Favorite conversions')]")
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
  wait_and_find_text_by_x_path(arg)
end