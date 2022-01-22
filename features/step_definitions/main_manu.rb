Given(/^I land on Home Screen$/) do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

When(/^I press on Menu icon$/) do
  element = find_element(accessibility_id: "Open navigation drawer")
  element.click
end

Then(/^I should see left side menu$/) do
  find_element(accessibility_id: "Close navigation drawer")
end

And(/^I press on My conversations Button$/) do

end

Then(/^I land on My conversations Screen$/) do

end