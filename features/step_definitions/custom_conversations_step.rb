And(/^I press on Create your first conversion Button$/) do
  element = find_element(id: "btn_new_custom_conversion")
  element.click
end

And(/^I type "([^"]*)" as custom conversation name$/) do |value|
  wait_and_send_keys("edit_custom_conversion_category_name", value)
end

And(/^I press on New unit Button$/) do
  wait_and_click("btn_new_custom_unit")
end

And(/^I type "([^"]*)" as unit name$/) do |arg|
  wait_and_send_keys("edit_custom_conversion_unit_dtls_name", arg)
end

And(/^I type "([^"]*)" as unit symbol$/) do |arg|
  wait_and_send_keys("edit_custom_conversion_unit_dtls_symbol", arg)
end

And(/^I type "([^"]*)" as unit value$/) do |arg|
  wait_and_send_keys("edit_custom_conversion_unit_dtls_value", arg)
end

And(/^I press submit checkmark on Custom conversations screen$/) do
  element = find_element(id: "action_confirm_custom_unit")
  element.click
end

And(/^I press on OK button on Custom conversations screen$/) do
  wait_and_click("btn_custom_conversion_details_ok")
end

Then(/^I verify "([^"]*)" add to Custom conversions list$/) do |arg|
  find_element(xpath: "//android.widget.TextView[contains(@text,'#{arg}')]")
end
