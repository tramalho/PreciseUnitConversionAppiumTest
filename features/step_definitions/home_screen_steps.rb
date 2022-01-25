When(/^Left unit picker value should be "([^"]*)"$/) do |arg|
  puts(arg)
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